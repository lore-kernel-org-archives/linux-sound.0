From: William Salvino <ws@his.com>
Date: Fri, 02 Apr 1999 00:33:38 +0000
Subject: Real Player
Message-Id: <marc-linux-sound-92301376901427@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I recently upgraded from RedHat 5.1 to RedHat 5.2. The Real Player
application has ceased to function returning the error message "General
Error."

I installed and had working rvplayer from the Official RedHat 5.1
installation cd-rom. The rpm rvplayer-5.0.1.i386.rpm is on this disk in
the rpm subdirectory. The Official RedHat 5.2 cd-rom contains *no* rpm
for the Real Player application. Does this mean that the Real Player is
not supported by the current release of RedHat 5.2? Is Real Player
broken with respect to the off the shelf out of the box Official Red Hat
5.2 distribution?

I tried the patch at http://www.i2k.com/~jeffd/rpopen but it did not
work with my version of the Real Player which is 5.0.0.35. I have been
told that I need version 5.0.0.45 or version 5.0.0.55 to make this patch
work but I have not found them; If anyone knows where I can find these
versions of the Real Player please let me know. I have installed, setup,
and configured, applied above patch to and subsequently uninstalled three
separate Real Player packages:the one on the Official RedHat 5.1 installation
disk, the ELF package onthe  Real download site, and a Real Player package
from the Rufus ftp site in the contrib i386 area.

There is a document at the Real site which appears when the knowledge
base there is searched for "linux." The URL of the document is
http://service2.real.com/solutions/RAP01014.HTM -which I could access
with Netscape but not with IE. The substance of this article:

"Customers with the RealPlayer 5.0 for Linux on a system with the newer
Linux 2.1 or 2.2 kernels will experience a "General error. An error
occurred: Error 1; audio write: Errno" error message. The current Linux
2.1, and 2.2 kernels contain a modification to the audio device that
crashes the 5.0 Linux player."

Is there an authoritative explanation from RedHat somewhere which
details the problems and solutions for the Real Player?

If I am asking these questions on the wrong list please advise me to which
list I should post these questions.

TIA

Sincerely,
Bill Salvino
e-mail: ws@his.com
