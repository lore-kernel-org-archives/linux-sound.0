From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 25 Jun 2018 15:08:59 +0000
Subject: Re: [alsa-devel] first and last audio sample timestamp
Message-Id: <s5h36xazywk.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CAPY=qRT-AvUiLFLTx7MzMzreLkWK8Fk06egUMCJsVJ7VwgziuA@mail.gmail.com>
 <s5hbmbzylx6.wl-tiwai@suse.de>
 <CAPY=qRSp7XO+swhPZy56zVPd5eBTh2PhXOfSyySsrhW-T1PnzA@mail.gmail.com>
 <s5h7emmzzly.wl-tiwai@suse.de>
 <CAPY=qRSoxCDSWG7wyExP8t5USkrCFiYDyd3i28PR_tpbiJZp4Q@mail.gmail.com>
In-Reply-To: <CAPY=qRSoxCDSWG7wyExP8t5USkrCFiYDyd3i28PR_tpbiJZp4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On Mon, 25 Jun 2018 16:58:26 +0200,
Subhashini Rao Beerisetty wrote:
> 
> On Mon, Jun 25, 2018 at 8:23 PM, Takashi Iwai <tiwai@suse.de> wrote:
> 
> > On Mon, 25 Jun 2018 16:50:20 +0200,
> > Subhashini Rao Beerisetty wrote:
> > >
> > > On Mon, Jun 25, 2018 at 8:04 PM, Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > > On Fri, 22 Jun 2018 16:00:10 +0200,
> > > > Subhashini Rao Beerisetty wrote:
> > > > >
> > > > > [ Please keep me in CC as I'm not subscribed to the list]
> > > > >
> > > > > Hi All,
> > > > >
> > > > >
> > > > >
> > > > > Hello all,
> > > > >
> > > > >
> > > > > I’m using aplay and arecord utilities for playback and capture. I
> > need to
> > > > > capture the timestamps for the first and last audio samples that
> > arrive
> > > > at
> > > > > the driver level.
> > > > >
> > > > > For this I’m capturing the CLOCK_MONOTONIC_RAW timestamp at the
> > > > > .trigger(for playback & capture) callback in SNDRV_PCM_TRIGGER_START
> > > > case
> > > > > – is it the correct timestamp for the first audio sample arrived at
> > the
> > > > > driver level?
> > > > >
> > > > > Similarly does .trigger callbacks SNDRV_PCM_TRIGGER_STOP gives the
> > last
> > > > > audio sample timestamp?
> > > >
> > > > No, it's the timestamp upon calling the trigger callback.
> > > > It has nothing to do directly with the first or the last sample.
> > > > (But usually the start trigger is the time of the first sample for
> > > >  capture, though.)
> > > >
> > >
> > > Okay then if start trigger is the time of the first sample for capture,
> > > then is stop trigger is for last sample?
> >
> > No, it's not necessarily the last sample.  It's the just time you stop
> > the stream.  The stop might happen some time after the last sample got
> > received.  The accuracy in that regard pretty much depends on the
> > hardware and the driver implementation.
> >
> Thanks for the clarification. What about for playback scenario?

A similar situation.  The timestamp at stop trigger is the time you
stopped the stream, and it's not about the "last" sample time.

BTW, for the accurate timestamping, check
Documentation/sound/design/timestamping.rst.


Takashi


> 
> 
> >
> >
> > Takashi
> >
> > > For example, i'm printing the
> > > timestamp as given below. Similarly in which call back I can use the
> > > getrawmonotonic()
> > > for playback case.
> > >
> > > static int snd_mychip_capture_trigger(struct snd_pcm_substream
> > *substream,
> > > int cmd)
> > >
> > > {
> > >
> > >     struct timespec ts;
> > >
> > >
> > >
> > >     switch(cmd) {
> > >
> > >         case SNDRV_PCM_TRIGGER_START:
> > >
> > >             getrawmonotonic(&ts);
> > >
> > >             printk("1st audio sample received time:
> > > [%.6lu:%.9lu]\n",ts.tv_sec, ts.tv_nsec);
> > >
> > >             break;
> > >
> > >         case SNDRV_PCM_TRIGGER_STOP:
> > >
> > >             getrawmonotonic(&ts);
> > >
> > >             printk("Last audio sample received time:
> > > [%.6lu:%.9lu]\n",ts.tv_sec, ts.tv_nsec);
> > >
> > >             break;
> > >
> > >     }
> > >
> > >
> > >
> > > }
> > >
> > >
> > > >
> > > >
> > > > Takashi
> > > >
> >
> [2  <text/html; UTF-8 (quoted-printable)>]
> 
