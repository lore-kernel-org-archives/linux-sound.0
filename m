From: Dave Mielke <dave@mielke.cc>
Date: Sun, 02 Apr 2000 02:12:59 +0000
Subject: Re: close()ing audio device always yields 'Interrupted system call'
Message-Id: <marc-linux-sound-95464176708884@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95464148708818@msgid-missing>
In-Reply-To: <marc-linux-sound-95464148708818@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Britton on April 1, 2000, at 17:08]

>Even if I SYNC or RESET the device before closing.  

The close() is taking a significant amount of time, and your program is
receiving a signal during that interval.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
