From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 18 May 2018 14:35:46 +0000
Subject: Re: sound: latency and synchronization measurements
Message-Id: <CAHhAz+gm80xM700urQqxR1k16sAvgOT2sPOQGpnzw4NaOwhA7g@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+hFFYqz2gtVnEZVyMjAO3fe4f5EtZeFO4tvO-2W-6sv7g@mail.gmail.com>
 <20180518131259.GB10497@kroah.com>
In-Reply-To: <20180518131259.GB10497@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <greg@kroah.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

On Fri, May 18, 2018 at 6:42 PM, Greg KH <greg@kroah.com> wrote:
> On Fri, May 18, 2018 at 06:07:29PM +0530, Muni Sekhar wrote:
>> [ Please keep me in CC as I'm not subscribed to the list]
>>
>> Hi All,
>>
>> I am trying to characterize the audio synchronization between two
>> systems. There is a mechanism to route audio between two systems, we
>> run ‘aplay’ at one system and ‘arecord’ in other system.
>>
>> We need to measure the time difference when audio sample is out at one
>> port and arriving at another port in different system.
>>
>> I plan to add printk’s in “struct snd_pcm_ops” call backs, but does
>> these call backs tells when it received first and last audio
>> frames\samples?
>>
>> Or else please suggest any other best method.
>
> First off you need a "shared timer/clock" between the two systems in
> order to have a chance to determine what actually happens here.  Good
> luck with that!  :)
Yes, we do have the shared clock.

>
> Also, there's been tons of research in this area over the years, please
> look into that, odds are these problems have been solved already.  I
> know of several commercial devices that already handle this just fine.
>
Can you point me some information on this.


> best of luck!
>
> greg k-h



-- 
Thanks,
Sekhar
