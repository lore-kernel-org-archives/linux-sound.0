From: Gerd Bavendiek <bav@rw.sni.de>
Date: Tue, 19 Jan 1999 07:57:14 +0000
Subject: Re: Crystal CS4235 with 2.2.0-pre7
Message-Id: <marc-linux-sound-91673302320038@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91669060300940@msgid-missing>
In-Reply-To: <marc-linux-sound-91669060300940@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

moc liamtoh writes:
 > i have the same chip (aopen MB) and i had problems too, (i use the 
 > 2.0.36) but i got it to werk by swapping the dma's so that i had 534, 
 > irq 5, dma=1 and dma2=0 and that, oddly enough, seemed to work...and not 
 > that bad either...altough i have on board video also and when i was 
 > trying to use that it would get very bad sound....
 > 

I followed your suggestion. 
cat /usr/lib/xemacs-20.4/etc/sounds/im_so_happy.au > /dev/audio
works !

Thanks a lot so far.

After plugging a microphone I tried

dd if=/dev/audio of=qqq bs=8k count

Playing back that file just gives silence. Did you try that too ?

Kind regards

Gerd
