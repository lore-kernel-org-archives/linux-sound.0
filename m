From: William Chen <wlchen@bbti.com.cn>
Date: Thu, 15 Apr 1999 03:30:46 +0000
Subject: noise and how to share /dev/audio?
Message-Id: <marc-linux-sound-92415152818899@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

1.When I play wav or mp3 files, it will give me
some chachacha noise, but when i downsample
from 44KHz to 11Khz, the noise disappears.

I used Redhat 5.1 & creative oem 16bit sbpro.
Cyrix Gx 166 and 16M mem.

2.how to let a remote program to give the sound
to local /dev/audio or local win95 sb driver?

3.after i play the sound to
/dev/audio, netaudio -b </dev/audio tell me
it is locked?

4. is netaudio ported to win95?

5. can i let the sound apps such as mpg123 redirect the sound
output?

btw, pls cc to wlchen@bbti.com.cn
Thanks,

-- 
William Chen - Compiler ToolChain (ILP Now)              BBTI (HSA-CDC)
wlchen@bbti.com.cn                  file://CC21/~WilliamChen/index.html
"A man without an education,many of us believe,is an unfortunate victim
of adverse circumstances deprived of one of the greatest twenty-century
opportunities."
