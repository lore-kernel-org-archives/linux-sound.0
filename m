Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4E3043A2
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 01:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737960; cv=pass; b=uZK8VyFWqA0FJWeSMom867LTQToFOZ4BS2mdfI42wTWk52T7mXEv1E7VBpwyHtrPylHAMHqRsr3mCN94Kpn6DgyJR4q4UZAPOiZzo1qDD8lMAhFkk6dj9+SjJCYtBm2ffA1hJl+SoNGPeB6py4Qc3imdu8vKfZU9jk+vnzHGKzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737960; c=relaxed/simple;
	bh=fMWES3pEV3esIMGppPpcAB+xXRHTjsaan83wbju+n2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMddp4OTa2sy4mhP1va+RcC0H5VOlJqCqglnteqlm0tXjuysCNd75BtqqXH17VN+0/PCENytJ1IQc0Eqtj4U55uwHe5VftPx4z1/0NEJLaKEfLpLYHvgSq+4w4olMb1U7lbaLNQ/I5fp5PrErCANc77F1F40SliUI/bhCo4FxdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1/bZmiu; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1/bZmiu"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso1253234a91.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737958; cv=none;
        d=google.com; s=arc-20240605;
        b=f0WKUEhJhIpQL9L+/9mcGZ+qdp72FBzyH6crJB5NjwekWJ8fVHqU7mo8oKXsc1xF4u
         ZTbh5EfRWG2Dzxy9bPqqwL2vILIeQp86A5vkH2sJ6iHaK2Hn+RgVCKPGUYBmZn80lsA3
         8Q4YrEHf5P/uhYcPF2I5vRrNvlCR6jnI8DgpxAB2NTaJALm66gTdiMWogTtqNTquV5Yz
         DfIQOs3dtKEi5SbDuY4KrFoBP8eFBwZE8pC559q1f2DF80dgdh51LECi0zq2YCDMzlK5
         iWc7Cobhkh9NbC99WY7ispMhgT+ebmKIuz6M3N4FzntGuSpwz6JbezWpR3BTOGvOCnsV
         Eg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        fh=RAQL5GcFs1IY7kG5jaw7KTjoZ3heOn96fXi06ABajDw=;
        b=avArK7uX4TI5zIkAaQHeC1Fe+hbHtIDYaWFfu+rgNOOqjgUkyg4TislFybMjMcxSpB
         zbRSV5wldNQ8k/YpGZ9tkFW8V7lLDawNh7BowcdawxO5G8oT5uQsYVPtGw2AoJoqoNEV
         empi2PO2mF8huHGBGhIPCZLptboechVBMLI4XvfYjAX2LYJm41Iufb3WVjR6xX+k5iQw
         4RWylZhdj1uCOow58n7r2bPK0ZJQP41k20GnHQEbsCb/qZOVTm6BuUIVJmpYIa2hVmJ2
         +lKCnWA5fI7K8YRGf6fF0LSnW2l7dkEyMGLuG5rHOHJYC9oiCfcSWobm+H6CkxAZDo2i
         XAuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737958; x=1770342758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=C1/bZmiuEzUWb4LYvk54v/XL7RR3JHo7/gC+oAygchAbTXUBbjsKX3e6nAMRGEj33J
         5EiRjfwsfTEiERAiVKelxEp5fpjSpTD62r1mBmf9mubQvRkw93YDgxqY2fwEj1hxFgzG
         TPi3jwPi5qd1d2CyZ7McjEaAoSU1gJ5DJDj6DMLw+ZhB3cqZsk8ATWLim0Kc/tM1hmE0
         FofGpu3gSi7VzEL2Bs05bApzOwT02z9G4wwbM6lx4qd+bNGgUyV/+M8kPn6w2k4yUCRf
         amfnb9/shuXHoRXuts0rfTMHryY4FoQgLP7NQyYr1HuyiRBdb8yOWEDZhxe3oAaXu42/
         NlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737958; x=1770342758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=gJm0pxCFeWvbMDP6moHsd/D+anIyoY+/KZpOB8eGDE8V2JP/qh7gUo7d0bR8PcgHB+
         rn3oJYpuXI+WKab7mtTLlsJGMLPMykt9iaAgRebylTjeuzPNGI4qX4m6eeiZCMzvNS1W
         A4AwpnZs0M4FogFBAVgZ4hHTopaAjTb1PI3r8G6YSxRk8jgHbiyIE4KZxNHCNu7rbb41
         9TrSzNuHAf0RBJ1dT03V4fQA6EkBo5WxwY5PiYVibZZ7jqF9TctqrJ0bi9/qibqUcqHi
         WzsPoFG9M7N7071nbXIwkuywnQ2eEfjFlfXn+rAJ8wU51CRTg4zz4nsCSF5R/rngs3rm
         Eggg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkFGm8kQzTmE2++zmZLMLHzRQW4oE9ZoWo/xDgCvm2+ZhVlktw6BjDnob9f0ySmQXpWdIq0wVpvm5xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/5vDMbd3QurxGl/jFbEtPl0cvBM9gC5heg83PhDTKOPOjeXf
	vgfR+VsD8WYfm7gIu0dYPfaFNMZwaPUu1OiiKfLTNfMeGYAU3LnU6DWxqo2LIM5CkB0EHgH6A5e
	bBduVu7LaIGHTWuJYBbl0Qg3gbaS8HKs=
X-Gm-Gg: AZuq6aLyUHf0klpKHaTCeSE047ML8MnlCqC8bXPgdL7gCkjOYE2iUA3F0BCGnsQkba+
	SFr2iab7eX54aLi96z2OZbR6FwRP4E1TEMfW7w8IEkzJvUh92+kO4Qdk5eSPvt8qkYOTI20vmJq
	uV2GiZDOYxK2z4QFa8DARyRl7VOkSkrIREe1YBJDNiEQ3AgVMdgNpt517D2ZH9vWIy9FDJktwZa
	tNmLTgDYfLr6XKAXXDdMqf1dccU3YIvN0IfmcvZrFv+zpMEglb6yvsRLo2mtnjkjo/Ypp8=
X-Received: by 2002:a17:90b:1c0e:b0:340:8d99:49d4 with SMTP id
 98e67ed59e1d1-354299f24a8mr4236387a91.1.1769737957855; Thu, 29 Jan 2026
 17:52:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:52:26 +0800
X-Gm-Features: AZwV_QiF2cDrLfRKNnjCIo-qh5cZKFulc8s1nwm3YFRDiF2SntZx7QwlcKkdk5I
Message-ID: <CAA+D8AM2d8m2eZnenH7gqOEUO1dLifFSNgizRRXwOiLX2vVdTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 1:09=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:53PM +0800, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.=
c
> > index 7dacc06b2f02..b8fe242d53db 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component=
 *component,
> >  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
> >                               struct snd_soc_pcm_runtime *rtd)
> >  {
> > -     struct snd_card *card =3D rtd->card->snd_card;
> > +     struct device *dev =3D component->dev;
> > +     struct fsl_asrc *asrc =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc_pair *pair;
> >       struct snd_pcm *pcm =3D rtd->pcm;
> > +     struct dma_chan *chan;
> >       int ret;
> >
> > -     ret =3D dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32))=
;
> > -     if (ret) {
> > -             dev_err(card->dev, "failed to set DMA mask\n");
> > -             return ret;
> > +     pair =3D kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL=
);
>
> prefer use size_add(sizeof(*pair), asrc->pair_priv_size), which did
> overflow check.

Ok, will update it.

>
> > +     if (!pair)
> > +             return -ENOMEM;
> > +
> > +     pair->asrc =3D asrc;
> > +     pair->private =3D (void *)pair + sizeof(struct fsl_asrc_pair);
> > +
> > +     /* Request a dummy pair, which will be released later.
> > +      * Request pair function needs channel num as input, for this
> > +      * dummy pair, we just request "1" channel temporarily.
> > +      */
> > +     ret =3D asrc->request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             goto req_pair_err;
> >       }
> >
> > -     return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> > -                                         card->dev, FSL_ASRC_DMABUF_SI=
ZE);
> > +     /* Request a dummy dma channel, which will be released later. */
> > +     chan =3D asrc->get_dma_channel(pair, IN);
>
> Is it possible get real dma chan from fsl_asrc?

This is real dma chan, may be I should remove "dummy".

>
> > +     if (!chan) {
> > +             dev_err(dev, "failed to get dma channel\n");
> > +             ret =3D -EINVAL;
> > +             goto dma_chan_err;
> > +     }
> > +
> > +     ret =3D snd_pcm_set_fixed_buffer_all(pcm,
> > +                                        SNDRV_DMA_TYPE_DEV,
> > +                                        chan->device->dev,
> > +                                        FSL_ASRC_DMABUF_SIZE);
>
> Here you assume chan->device->dev never change when it did DMA transfer.

Yes, this refers to the generic code in ALSA.

best regards
Shengjiu Wang

>
> Frank
> > +
> > +     dma_release_channel(chan);
> > +
> > +dma_chan_err:
> > +     asrc->release_pair(pair);
> > +
> > +req_pair_err:
> > +     kfree(pair);
> > +
> > +     return ret;
> >  }
> >
> >  struct snd_soc_component_driver fsl_asrc_component =3D {
> > --
> > 2.34.1
> >
