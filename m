From: Alex Natalsson <harmoniesworlds@gmail.com>
Date: Tue, 12 Jul 2022 13:05:31 +0000
Subject: Re: Sound not working after commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-Id: <CADs9LoOOLYXm=dmGswrAcSoQ0NaRXz1ify=H=vq+Onh8v+hizg@mail.gmail.com>
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
 <87fsj6r84u.wl-tiwai@suse.de>
In-Reply-To: <87fsj6r84u.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, linux-sound@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>

> +               if (!snd_soc_dpcm_get_substream(be, stream))
> +                       continue;
> +
And this good works for me too and kernel not oopsing)
