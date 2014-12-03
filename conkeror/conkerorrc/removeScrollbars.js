// This method will only disable top-level scrollbars, but it is known
// to have several problems, namely that it breaks automatic scrolling
// during isearch and also breaks functionality of mouse scroll
// wheels. There is a partial fix for these problems, detailed below.

// To disable scrollbars by this method, put the following in your rc:

function disable_scrollbars (buffer) {
    buffer.top_frame.scrollbars.visible = false;
}
add_hook("create_buffer_late_hook", disable_scrollbars);

// The problem with isearch failing to scroll can be worked around by
// the following additional code. It turns scrollbars back on for the
// duration of the isearch session. Care has been taken to write the
// code in a way that shouldn't break things with repeated evaluation,
// but if you read it carefully you will see why there would otherwise
// be that risk.

var old_isearch_start = (old_isearch_start || isearch_start);
isearch_start = function (window, direction) {
    window.buffers.current.browser.contentWindow.scrollbars.visible = true;
    old_isearch_start(window, direction);
};

var old_isearch_session_destroy = (old_isearch_session_destroy ||
                                   isearch_session.prototype.destroy);
isearch_session.prototype.destroy = function () {
    this.minibuffer.window.buffers.current.browser.contentWindow.scrollbars.visible = false;
    old_isearch_session_destroy.call(this);
};
