From: Dan Boger <dan@giccs.georgetown.edu>
Date: Thu, 11 Mar 1999 18:21:38 +0000
Subject: Re: solo-1 chip
Message-Id: <marc-linux-sound-92117683624896@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92066824429576@msgid-missing>
In-Reply-To: <marc-linux-sound-92066824429576@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 11 Mar 1999 01:10:13 -0500 Bill Nottingham <notting@redhat.com> wrote
 concerning 'Re: solo-1 chip':
> 
> To get native ESS Solo support ATM, you'd either have to use the
> 2.2.*-ac patches (ftp.linux.org.uk:/pub/linux/alan/2.2), or ALSA
> (http://alsa.jcu.cz/)

Great!  So I download the alsa driver install it.  But when I try to
modprobe it says that the device is already in use.  I look at
proc/modules, it did load a bunch of stuff, but still no sound.  Do I
need to edit my /etc/conf.modules for options?  The solo1 isn't
mentioned in any of the documents - how do I know the name of the
options?

Thanks,

  Dan
