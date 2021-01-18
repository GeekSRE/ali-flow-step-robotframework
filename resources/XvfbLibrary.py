from pyvirtualdisplay import Display


class XvfbLibrary(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    _display = None

    def start_virtual_display(self, width=1024, height=768):
        if self._display is not None:
            return
        self._display = Display(size=(int(width), int(height)))
        self._display.start()

    def stop_virtual_display(self):
        if self._display is None:
            return
        self._display.stop()
        self._display = None
