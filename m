From: Gerd Bavendiek <bav@rw.sni.de>
Date: Fri, 22 Jan 1999 07:53:24 +0000
Subject: Re: Crystal CS4235 with 2.2.0-pre7
Message-Id: <marc-linux-sound-91700939126173@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91669060300940@msgid-missing>
In-Reply-To: <marc-linux-sound-91669060300940@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I'm glad that with the help of Moc Liamtoh, who suggested swapping DMA,
and Mike Haller, who provided me with a fix to the recent ad1848.c I'm 
now able to playback and record with my Crystal CS4235 and Linux
2.2.0-pre7. 

My defines in .config (those which are not set are not shown)
#
# Sound
#
CONFIG_SOUND=y
CONFIG_SOUND_OSS=y
CONFIG_SOUND_PSS=m
CONFIG_SOUND_CS4232=y
CONFIG_CS4232_BASES4
CONFIG_CS4232_IRQ=5
CONFIG_CS4232_DMA=1
CONFIG_CS4232_DMA2=0
CONFIG_CS4232_MPU_BASE:8
CONFIG_CS4232_MPU_IRQ=9

Mike's changes are as follows:

momo:/usr/src/linux/drivers/sound> diff ad1848.c.org ad1848.c     
1812c1812,1813
<               if (devc->model != MD_1848 && devc->model != MD_C930)
---
>               if (devc->model != MD_1848 && devc->model != MD_C930  && devc->model !> MD_4235)

Thanks a lot !

Kind regards

Gerd
