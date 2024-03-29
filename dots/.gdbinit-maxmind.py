#!/usr/bin/env python
import splitmind
(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="Main")
  .right(display="backtrace", size="20%")
  .above(of="main", display="disasm", size="65%", banner="top")
  .show("code", on="disasm", banner="none")
  .right(display="stack", size="75%")
  .above(display="legend", size="25")
  .show("regs", on="legend")
  .below(of="backtrace", cmd="ipython", size="30%")
).build(nobanner=True)
end
