From: Britton <fsblk@aurora.uaf.edu>
Date: Sun, 02 Apr 2000 02:08:19 +0000
Subject: close()ing audio device always yields 'Interrupted system call' why?
Message-Id: <marc-linux-sound-95464148708818@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Even if I SYNC or RESET the device before closing.  The program I am
working on always writes the correct amount of data to it's data file, and
never moves less than a full (possibly dual channel) sample of data at a
time.  This return value doesn't appear to be documented in the
close() man page.  Anyone have any idea what might be causing this?

I am running 2.2.14.

Britton Kerin
__
GNU GPL: "The Source will be with you... always."
