From: Dave Mielke <dave@mielke.cc>
Date: Mon, 01 May 2000 01:14:46 +0000
Subject: Re: wav rates
Message-Id: <marc-linux-sound-95714404304543@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95714288704119@msgid-missing>
In-Reply-To: <marc-linux-sound-95714288704119@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Joe T. on April 30, 2000, at 17:54]

>I recorded the wav using sox:
>sox -t ossdsp -w -s /dev/audio -r 44100 -c 2 blah.wav
...
>using sox, the file is actually 44192, not 44100.. 

Try putting -r 44100 before /dev/audio as well so that that's how /dev/audio
will be opened. Then sox won't need to do any conversion.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
