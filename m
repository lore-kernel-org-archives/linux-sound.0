From: Dave Mielke <dave@mielke.cc>
Date: Sat, 29 Apr 2000 22:27:01 +0000
Subject: Re: Getting good sound input
Message-Id: <marc-linux-sound-95704760925645@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95703433918558@msgid-missing>
In-Reply-To: <marc-linux-sound-95703433918558@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Joe T. on April 29, 2000, at 11:32]

Hi:

>When i record from the input port, i get nothing.

Use "aumix -q" to see which of your input channels are set to "P" (play only)
and and which are set to "R" (play and record). If an input channel is set to
"P", then you'll hear it out of the speakers, but you won't be able to record
from it. If it's set to "R", then you'll be able to do both.

My guess is that your "line in" is set to "P". You can change it with a command
like "aumix -l R" (case is significant).

>When i record from the mic port, it sounds horrid.

The default in Linux is to use 8-bit sound, which intorduces a lot of low-level
distortion because the granularity is just too low. Using basic commands like
"cat" or "cp" will most definitely use the default, so they're not the best way
to go. Use a command which lets you specify the sample size, and use at least
16 bits.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
