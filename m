From: Sriram Periyasamy <sriram.oqensourz@gmail.com>
Date: Thu, 22 Mar 2018 16:59:30 +0000
Subject: Re: [alsa-devel] pulseaudio\aplay\arecord
Message-Id: <20180322165839.fjlj3zqgpydkikxx@sriram-VirtualBox>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+j+pZtaYrHGqJXxqS4DgEzNCsAgORvd4+1Kj55D2Oh03g@mail.gmail.com>
In-Reply-To: <CAHhAz+j+pZtaYrHGqJXxqS4DgEzNCsAgORvd4+1Kj55D2Oh03g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org

On Tue, Mar 20, 2018 at 06:42:04PM +0530, Muni Sekhar wrote:
> [ Please keep me in CC as I'm not subscribed to the list]
> 
> Hi All,
> 
> 
> 
> We are using the Ubuntu 16.04.3 LTS (4.4.0-28-generic) kernel. I’ve a
> sound card hardware which supports analog loopback. During analog
> loopback test, aplay fails with
> “aplay: pcm_write:1940: write error: Input/output error”.
> 
> In our system, I noticed that once the sound driver is loaded,
> PulseAudio daemon autospawns and taking over control of the sound
> device. Does the ‘pulseaudio’ causes ‘aplay’ failure?

No, it doesn't in your scenario. Until pulseaudio opens the device
and writes samples to it, you can use aplay. You may have to debug
the data flow in your loopback device to fix your issue.

> 
> Can we use aplay\arecord if already pulseaudio daemon is running?

Yes, you can use until any sound application triggers pulseaudio to
start using the device.

Thanks,
Sriram.
> 
> 
> 
> -- 
> Thanks,
> Sekhar
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel

-- 
