From: Dave Mielke <dave@mielke.cc>
Date: Wed, 24 May 2000 12:33:06 +0000
Subject: Re: OSS/Free /dev/audio full duplex sound format.
Message-Id: <marc-linux-sound-95917190001072@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95903210912907@msgid-missing>
In-Reply-To: <marc-linux-sound-95903210912907@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Jeff Garzik on May 23, 2000, at 14:09]

>An easy answer might then be "don't do that".  :)

Not an option. :-)

>Are you checking DSP_CAP_DUPLEX?

SNDCTL_DSP_GETCAPS returns 00003101. Since DSP_CAP_DUPLEX is 0X100, this
capability would appear to be available. I even called ioctl with
SNDCTL_DSP_SETDUPLEX first, and that did not return an error.

>Are you following the OSS guide at
>http://www.opensound.com/pguide/oss.pdf ?  

As you can see from the above, yes I have.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
