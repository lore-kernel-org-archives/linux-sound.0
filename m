From: Greg KH <greg@kroah.com>
Date: Fri, 18 May 2018 13:12:59 +0000
Subject: Re: sound: latency and synchronization measurements
Message-Id: <20180518131259.GB10497@kroah.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+hFFYqz2gtVnEZVyMjAO3fe4f5EtZeFO4tvO-2W-6sv7g@mail.gmail.com>
In-Reply-To: <CAHhAz+hFFYqz2gtVnEZVyMjAO3fe4f5EtZeFO4tvO-2W-6sv7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

On Fri, May 18, 2018 at 06:07:29PM +0530, Muni Sekhar wrote:
> [ Please keep me in CC as I'm not subscribed to the list]
> 
> Hi All,
> 
> I am trying to characterize the audio synchronization between two
> systems. There is a mechanism to route audio between two systems, we
> run ‘aplay’ at one system and ‘arecord’ in other system.
> 
> We need to measure the time difference when audio sample is out at one
> port and arriving at another port in different system.
> 
> I plan to add printk’s in “struct snd_pcm_ops” call backs, but does
> these call backs tells when it received first and last audio
> frames\samples?
> 
> Or else please suggest any other best method.

First off you need a "shared timer/clock" between the two systems in
order to have a chance to determine what actually happens here.  Good
luck with that!  :)

Also, there's been tons of research in this area over the years, please
look into that, odds are these problems have been solved already.  I
know of several commercial devices that already handle this just fine.

best of luck!

greg k-h
