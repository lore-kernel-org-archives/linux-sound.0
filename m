From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 12 Jul 2022 09:29:53 +0000
Subject: Re: Sound not working after commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-Id: <87fsj6r84u.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
 <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
 <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
 <CADs9LoOJu-NYxPhDL+N+xBtocPNw2y0nRHbSaO-NmGO284GPfA@mail.gmail.com>
 <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
In-Reply-To: <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, Alex Natalsson <harmoniesworlds@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>

On Mon, 11 Jul 2022 16:33:14 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 7/9/22 06:19, Alex Natalsson wrote:
> >>> +       if (!fe_substream) {
> >>> +               dev_err(fe->dev, "%s: fe_substream not initialized\n",
> >>> __func__);
> >>> +               return -EINVAL;
> >>> +       }
> >>> +       if (!be_substream) {
> >>> +               dev_err(be->dev, "%s: be_substream not initialized\n",
> >>> __func__);
> >>> +               return -EINVAL;
> >>> +       }
> >>> +
> > 
> > Will be this in upstream or needing bugzilla reporting message?
> I created a patch based on this, see
> https://github.com/thesofproject/linux/pull/3735
> 
> I am not sure however if this is the 'right' fix. There was a comment
> from Peter Ujfalusi that a BE substream may be initialized later, but if
> that's the case then the atomicity check that was introduced is done in
> the wrong location.
> 
> Takashi, we could use your guidance here.

I guess that the check of fe_substream there is superfluous.  It must
be never NULL.  And, in principle, passing the invalid BE to this
function itself sounds already wrong.  That said, if any check is
needed, it should be done beforehand at choosing the right BE.

A fix like below might work instead?  (Totally untested)


thanks,

Takashi

-- 8< --
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1318,6 +1318,9 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
+		if (!snd_soc_dpcm_get_substream(be, stream))
+			continue;
+
 		for_each_rtd_dais(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
 
