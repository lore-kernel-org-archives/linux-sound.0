From: Bill Nottingham <notting@redhat.com>
Date: Tue, 16 Feb 1999 01:34:24 +0000
Subject: Re: help set up AWE64G isapnp?
Message-Id: <marc-linux-sound-91915418908506@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91915418808497@msgid-missing>
In-Reply-To: <marc-linux-sound-91915418808497@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Josh Steiner (jsteiner@antioch-college.edu) said: 
> Script started on Mon Feb 15 20:10:26 1999
> [root@bw66 .netscape]# modprobe -a sound
> /lib/modules/2.2.1/misc/sb.o: too many values for dma (max 1)

Replace the 'dma=1,5' in /etc/conf.modules with
'dma=1 dma16=5'.

Bill
