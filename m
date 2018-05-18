From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 18 May 2018 14:23:06 +0000
Subject: Re: sound: latency and synchronization measurements
Message-Id: <CAHhAz+gPGEt_e+Arz-DgyFP+Be5T9bvnvsDKc0ghKZa7JvwCYQ@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+hFFYqz2gtVnEZVyMjAO3fe4f5EtZeFO4tvO-2W-6sv7g@mail.gmail.com>
 <CA+wdrgkeeCKpJgyA6bOOap+cqKgo4UrfukQyqQ+WuhDXsnBL0g@mail.gmail.com>
In-Reply-To: <CA+wdrgkeeCKpJgyA6bOOap+cqKgo4UrfukQyqQ+WuhDXsnBL0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Aris Aris <father.aris@gmail.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

On Fri, May 18, 2018 at 6:53 PM, Aris Aris <father.aris@gmail.com> wrote:
> Hi,
>
> You could try bitbanging any availiable peripheral(i.e gpio) from each
> system at the callbacks and have a logic analyzer measuring and reporting
> time delay.
Thank you very much Aris for this information.
I am fairly new to sound sub system, I’m glad if you can point me on
the callbacks.

Does the sound driver will be notified aplay\arecord open via
“snd_xxx_open(struct snd_pcm_substeam *substream)” callback?
Which callbacks of sound driver will tell when it received first and
last audio frames\samples?


>
> Best regards,
>
> Aris
>
> On Fri, May 18, 2018 at 3:37 PM, Muni Sekhar <munisekharrms@gmail.com>
> wrote:
>>
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
>>
>>
>> --
>> Thanks,
>> Sekhar
>>
>> _______________________________________________
>> Kernelnewbies mailing list
>> Kernelnewbies@kernelnewbies.org
>> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>
>



-- 
Thanks,
Sekhar
