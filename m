Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CA361668
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217484; cv=pass; b=MPlu7n44UQ0KmfR0moeFMAMcTYRYUypeWTG/IMrnbhhNBQTKhdzHd06Q1kvWO0hKTUB3IcSlzpABf9Tj6HZNsvON+fZA/y1aTQhSsCOmxtQyb8pC/tCwW1jdzvh8GlTpD0S7Z/ckYK0TXITzPZYFR0xojvpoHrq8IdC8fKyumyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217484; c=relaxed/simple;
	bh=scPK4yjYP4NWGll9kC6f2iAZmla21828RYNudpqos6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D76z5suQvFObGH2M0rWciH4GUQPZPYG4NOAdB7auWOwWX7sOBU80aAOKbL0blSCF3VXuYSXmbWWUNBTPp00hPqfZpZbHydyr3WetVjVFV9bXp+yORuKV9bE87QxqsErjjUE8EWGMdi+PkgTXAVX1XqxHm9juIk3vMmlZS/IGYrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDSwEkls; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDSwEkls"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b886fc047d5so2251958666b.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217481; cv=none;
        d=google.com; s=arc-20240605;
        b=HC2H2Bn4/lLAfXbeQdof3PW0TyEVNoBtei45XUNqBDHwQQA3J0rzxWvul+kfObbUB/
         oSDmdW+lvVmS9qMzhcQQBBFp4MTTUJN+LxVtfZFfUlq9BIUmOJlzf27XfmRhJDlI16K7
         8f9gwAsI6yMqQZKegMQdz7nww5gays9sde2Zg8sb84cceJjrojBGui4hbzL4AY7aEM3C
         bJG64U5dKIukbe38WlxNVTsXrJM6clO2mCacDqG5dWOvjvx9bXDZEBYDtj6RMrCZyIQP
         lLALiK7jqOnPWF+HsqrPz0/wquJK45G6b4hj6/a+dbmX+MRmFg2E6L5GDnjUXkHaYYDA
         cQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4fUIKT70fHKjIeW/Y2M1Qjyk+SDVrLGJimnzobQywU=;
        fh=YbCSmRBQkvbi+CIA2t2CSw0js+XaH4hDYXN3GfLeOSw=;
        b=exzG0vtoKuwjAKEVoebtqKdeYrXVfKAnErcC64xIcy1yZ4NIc2xRqREHw09dCyziE+
         Cp8bh3Pm1/I9Z5HeqByHX/BLOKJiYPTEKQ+lA+UFld7Ts6rDJfMk+9KVCb20BpjgXvgh
         7fSjv6uWjjjn3eB/Ecij07/8+m7Tg7TlPuv+gSO/AtRz0NF+Zikcj9l37B4NO9Kry3Bn
         5P5SOYO4qVlfFWBd8WH9ywci0QRWNyf1MVzIO6Hb4tHcgacQe6mEv3QVl8J0KgZGR21N
         nqJoBaFFR+F+ylBZIeiuiqpYpu0Hf1WykqCWaslB0ScmXEhBL7zKMdfRmThfU8OH1OT6
         nCJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773217481; x=1773822281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4fUIKT70fHKjIeW/Y2M1Qjyk+SDVrLGJimnzobQywU=;
        b=CDSwEkls1XLJQUozoMLbCWxVNsuoKes0cprYUo5w2rHcWPTjmpsiP1WVzlyMrdtiYR
         5Dm37yNw0T/LaFfVbFBUixxiZUAFuY3lyWARueyndvI7BEMo5ASzYnoeEJ5M/jkBDry2
         UK1ByB+WLPo+BzpDQQAKWke9NQgAU14ARIuJYvQgmlT6is+73Uw72CBdoZAAsWqJereG
         cZA9k2tkkxWVzJwZwZnuTEWsnpaEKswXi5lFeo4pQEyrlmHXlRYhf3yIDctiM3rL6jmk
         rHBy3HF2DjNKvas/bp1Nk9FlU8KVTBhuHxPzU6jNeVsWQQIZ4ddqytj3ApLOPUeRlGAz
         L2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217481; x=1773822281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4fUIKT70fHKjIeW/Y2M1Qjyk+SDVrLGJimnzobQywU=;
        b=trjsWUqg6LHftfI2NCtiLSWrTK8har7XFv7ClsfWu2dGlEd8FeXCr9eGgEyOVHv0Nt
         HiFw6l/75B31+0OMJ3HV9xfizFb/gMP+rCRdJ5pnPx8XvbjHH7x5ohhu78qn7gyYKcw1
         1qU1sVle8vX8ygiU+J6tUsN5yyZHAzbhgOtHUfcifLlBcKAqro0Z6R6/jaJBDk3BP1PF
         ffsty8BsNZq4oVVz2m0roYgA3htnsvoZlPn7xkvrJ6FuXOTOG5nDRKPijHffmC4sfMSH
         KmJgQHq2mr3kaS4CGTA4Y3G2I7E3/Pv7kPRwP20Ulo11wVSPS3BkvWvVjrXRbAIek+uq
         RqcA==
X-Forwarded-Encrypted: i=1; AJvYcCUov+0ee4o55rHM47WhqeratfEV+H2lEiieChMv7b0uA8piSjvgS/rPTQ55DUyOufIUJEOtM6IUv07jaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYScki+H7tBgDh1Ay2QGihkSY2sAtAIqigUQ08iouUIvc7bztn
	+uBt8iphuTAW7uPpNkby6Q90jNqKSMn6aMOBJwfrMSLiYXlBBA5sYI5hmMfTUqKYa4eL2Y7JEXs
	uW3XRl/sT58YnJYp4NwFmT4DvtTllBB8=
X-Gm-Gg: ATEYQzzeQaeiEKZT3t5GMBZSINjFoHFadkvkxMkxjMFoeVMCheKSRrFtOZAjXaSHnx1
	gej5qQMFPxo1EjMxXaKpX8Qef4shZoVvbLbxO6lD6c84YUda59rGr7reLbFEFB499fXVLXP2ozt
	ySTdZjuEpTfmWThGgky6LYQkZyvZfsUZ9qkJR9HD8taozAYbdgdeLqtlVBj+QB2ZRG5G6Y5l2zT
	CPFavD0KX4EpU/9M2uN6Hj/KS2/wR/PEqozp+6YRlwMN5Eb8qEhleqwrB6WbCvns1wXiUDwRipd
	aK0yegY=
X-Received: by 2002:a17:907:9811:b0:b96:e796:135f with SMTP id
 a640c23a62f3a-b972e5fbea0mr88285066b.47.1773217480467; Wed, 11 Mar 2026
 01:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <ee177cd356803dd24d630c7502d850f52e3f63d8.1773107475.git.zhoubinbin@loongson.cn>
 <CAAhV-H6ssXnyYuT06y0wgBXwPbtOUx2J7G75mr8wW5cpOrpw4A@mail.gmail.com>
In-Reply-To: <CAAhV-H6ssXnyYuT06y0wgBXwPbtOUx2J7G75mr8wW5cpOrpw4A@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 16:24:27 +0800
X-Gm-Features: AaiRm53u20tjJzQiI_nxXmdhOB4tbHo9XnHkfurHurJMbazgAtLqTBkfpelBYfc
Message-ID: <CAMpQs4JjB+MA+zbU5T0q7Z1mSZ5B9p-uvLNeNzEFadr8R=1sGQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: loongson: Add `internal` to the names of
 internal DMA variables
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:56=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Wed, Mar 11, 2026 at 2:37=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The DMA controller used in Loongson I2S is divided into internal
> > exclusive DMA and external shared DMA (APBDMA). Add the `internal`
> > dentifier to internal DMA variable names to better distinguish them fro=
m
> > external shared DMA.
> >
> > No functional change intended.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_dma.c     | 84 +++++++++++++--------------
> >  sound/soc/loongson/loongson_dma.h     |  4 +-
> >  sound/soc/loongson/loongson_i2s.h     |  6 +-
> >  sound/soc/loongson/loongson_i2s_pci.c |  5 +-
> >  4 files changed, 49 insertions(+), 50 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loo=
ngson_dma.c
> > index f26b2951bc9c..07a084cebdc0 100644
> > --- a/sound/soc/loongson/loongson_dma.c
> > +++ b/sound/soc/loongson/loongson_dma.c
> > @@ -14,6 +14,7 @@
> >  #include <sound/soc.h>
> >  #include <sound/pcm.h>
> >  #include <sound/pcm_params.h>
> > +
> >  #include "loongson_i2s.h"
> >
> >  /* DMA dma_order Register */
> > @@ -29,7 +30,7 @@
> >  /*
> >   * DMA registers descriptor.
> >   */
> > -struct loongson_dma_desc {
> > +struct loongson_internal_dma_desc {
> Can we use idma (internal dma) and edma (external) for short?

Emm...
Using `idma`/`edma` seems more concise. I'll also add some comments.
>
> Huacai
>
> >         u32 order;              /* Next descriptor address register */
> >         u32 saddr;              /* Source address register */
> >         u32 daddr;              /* Device address register */
> > @@ -44,17 +45,17 @@ struct loongson_dma_desc {
> >  } __packed;
> >
> >  struct loongson_runtime_data {
> > -       struct loongson_dma_data *dma_data;
> > +       struct loongson_internal_dma_data *dma_data;
> >
> > -       struct loongson_dma_desc *dma_desc_arr;
> > +       struct loongson_internal_dma_desc *dma_desc_arr;
> >         dma_addr_t dma_desc_arr_phy;
> >         int dma_desc_arr_size;
> >
> > -       struct loongson_dma_desc *dma_pos_desc;
> > +       struct loongson_internal_dma_desc *dma_pos_desc;
> >         dma_addr_t dma_pos_desc_phy;
> >  };
> >
> > -static const struct snd_pcm_hardware ls_pcm_hardware =3D {
> > +static const struct snd_pcm_hardware loongson_internal_dma_hardware =
=3D {
> >         .info =3D SNDRV_PCM_INFO_MMAP |
> >                 SNDRV_PCM_INFO_INTERLEAVED |
> >                 SNDRV_PCM_INFO_MMAP_VALID |
> > @@ -67,12 +68,11 @@ static const struct snd_pcm_hardware ls_pcm_hardwar=
e =3D {
> >         .period_bytes_min =3D 128,
> >         .period_bytes_max =3D 128 * 1024,
> >         .periods_min =3D 1,
> > -       .periods_max =3D PAGE_SIZE / sizeof(struct loongson_dma_desc),
> > +       .periods_max =3D PAGE_SIZE / sizeof(struct loongson_internal_dm=
a_desc),
> >         .buffer_bytes_max =3D 1024 * 1024,
> >  };
> >
> > -static struct
> > -loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
> > +static struct loongson_internal_dma_desc *dma_desc_save(struct loongso=
n_runtime_data *prtd)
> >  {
> >         void __iomem *order_reg =3D prtd->dma_data->order_addr;
> >         u64 val;
> > @@ -88,8 +88,8 @@ loongson_dma_desc *dma_desc_save(struct loongson_runt=
ime_data *prtd)
> >         return prtd->dma_pos_desc;
> >  }
> >
> > -static int loongson_pcm_trigger(struct snd_soc_component *component,
> > -                               struct snd_pcm_substream *substream, in=
t cmd)
> > +static int loongson_internal_dma_pcm_trigger(struct snd_soc_component =
*component,
> > +                                            struct snd_pcm_substream *=
substream, int cmd)
> >  {
> >         struct loongson_runtime_data *prtd =3D substream->runtime->priv=
ate_data;
> >         struct device *dev =3D substream->pcm->card->dev;
> > @@ -131,9 +131,9 @@ static int loongson_pcm_trigger(struct snd_soc_comp=
onent *component,
> >         return 0;
> >  }
> >
> > -static int loongson_pcm_hw_params(struct snd_soc_component *component,
> > -                                 struct snd_pcm_substream *substream,
> > -                                 struct snd_pcm_hw_params *params)
> > +static int loongson_internal_dma_pcm_hw_params(struct snd_soc_componen=
t *component,
> > +                                              struct snd_pcm_substream=
 *substream,
> > +                                              struct snd_pcm_hw_params=
 *params)
> >  {
> >         struct snd_pcm_runtime *runtime =3D substream->runtime;
> >         struct device *dev =3D substream->pcm->card->dev;
> > @@ -141,7 +141,7 @@ static int loongson_pcm_hw_params(struct snd_soc_co=
mponent *component,
> >         size_t buf_len =3D params_buffer_bytes(params);
> >         size_t period_len =3D params_period_bytes(params);
> >         dma_addr_t order_addr, mem_addr;
> > -       struct loongson_dma_desc *desc;
> > +       struct loongson_internal_dma_desc *desc;
> >         u32 num_periods;
> >         int i;
> >
> > @@ -195,12 +195,12 @@ static int loongson_pcm_hw_params(struct snd_soc_=
component *component,
> >  }
> >
> >  static snd_pcm_uframes_t
> > -loongson_pcm_pointer(struct snd_soc_component *component,
> > -                    struct snd_pcm_substream *substream)
> > +loongson_internal_dma_pcm_pointer(struct snd_soc_component *component,
> > +                                 struct snd_pcm_substream *substream)
> >  {
> >         struct snd_pcm_runtime *runtime =3D substream->runtime;
> >         struct loongson_runtime_data *prtd =3D runtime->private_data;
> > -       struct loongson_dma_desc *desc;
> > +       struct loongson_internal_dma_desc *desc;
> >         snd_pcm_uframes_t x;
> >         u64 addr;
> >
> > @@ -213,7 +213,7 @@ loongson_pcm_pointer(struct snd_soc_component *comp=
onent,
> >         return x;
> >  }
> >
> > -static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
> > +static irqreturn_t loongson_internal_dma_pcm_dma_irq(int irq, void *de=
vid)
> >  {
> >         struct snd_pcm_substream *substream =3D devid;
> >
> > @@ -221,14 +221,14 @@ static irqreturn_t loongson_pcm_dma_irq(int irq, =
void *devid)
> >         return IRQ_HANDLED;
> >  }
> >
> > -static int loongson_pcm_open(struct snd_soc_component *component,
> > -                            struct snd_pcm_substream *substream)
> > +static int loongson_internal_dma_pcm_open(struct snd_soc_component *co=
mponent,
> > +                                         struct snd_pcm_substream *sub=
stream)
> >  {
> >         struct snd_pcm_runtime *runtime =3D substream->runtime;
> >         struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(su=
bstream);
> >         struct snd_card *card =3D substream->pcm->card;
> >         struct loongson_runtime_data *prtd;
> > -       struct loongson_dma_data *dma_data;
> > +       struct loongson_internal_dma_data *dma_data;
> >
> >         /*
> >          * For mysterious reasons (and despite what the manual says)
> > @@ -241,7 +241,7 @@ static int loongson_pcm_open(struct snd_soc_compone=
nt *component,
> >                                    SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128=
);
> >         snd_pcm_hw_constraint_integer(substream->runtime,
> >                                       SNDRV_PCM_HW_PARAM_PERIODS);
> > -       snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
> > +       snd_soc_set_runtime_hwparams(substream, &loongson_internal_dma_=
hardware);
> >
> >         prtd =3D kzalloc_obj(*prtd);
> >         if (!prtd)
> > @@ -277,8 +277,8 @@ static int loongson_pcm_open(struct snd_soc_compone=
nt *component,
> >         return -ENOMEM;
> >  }
> >
> > -static int loongson_pcm_close(struct snd_soc_component *component,
> > -                             struct snd_pcm_substream *substream)
> > +static int loongson_internal_dma_pcm_close(struct snd_soc_component *c=
omponent,
> > +                                          struct snd_pcm_substream *su=
bstream)
> >  {
> >         struct snd_card *card =3D substream->pcm->card;
> >         struct loongson_runtime_data *prtd =3D substream->runtime->priv=
ate_data;
> > @@ -293,21 +293,21 @@ static int loongson_pcm_close(struct snd_soc_comp=
onent *component,
> >         return 0;
> >  }
> >
> > -static int loongson_pcm_mmap(struct snd_soc_component *component,
> > -                            struct snd_pcm_substream *substream,
> > -                            struct vm_area_struct *vma)
> > +static int loongson_internal_dma_pcm_mmap(struct snd_soc_component *co=
mponent,
> > +                                         struct snd_pcm_substream *sub=
stream,
> > +                                         struct vm_area_struct *vma)
> >  {
> >         return remap_pfn_range(vma, vma->vm_start,
> > -                       substream->dma_buffer.addr >> PAGE_SHIFT,
> > -                       vma->vm_end - vma->vm_start, vma->vm_page_prot)=
;
> > +                              substream->dma_buffer.addr >> PAGE_SHIFT=
,
> > +                              vma->vm_end - vma->vm_start, vma->vm_pag=
e_prot);
> >  }
> >
> > -static int loongson_pcm_new(struct snd_soc_component *component,
> > -                           struct snd_soc_pcm_runtime *rtd)
> > +static int loongson_internal_dma_pcm_new(struct snd_soc_component *com=
ponent,
> > +                                        struct snd_soc_pcm_runtime *rt=
d)
> >  {
> >         struct snd_card *card =3D rtd->card->snd_card;
> >         struct snd_pcm_substream *substream;
> > -       struct loongson_dma_data *dma_data;
> > +       struct loongson_internal_dma_data *dma_data;
> >         unsigned int i;
> >         int ret;
> >
> > @@ -319,7 +319,7 @@ static int loongson_pcm_new(struct snd_soc_componen=
t *component,
> >                 dma_data =3D snd_soc_dai_get_dma_data(snd_soc_rtd_to_cp=
u(rtd, 0),
> >                                                     substream);
> >                 ret =3D devm_request_irq(card->dev, dma_data->irq,
> > -                                      loongson_pcm_dma_irq,
> > +                                      loongson_internal_dma_pcm_dma_ir=
q,
> >                                        IRQF_TRIGGER_HIGH, LS_I2S_DRVNAM=
E,
> >                                        substream);
> >                 if (ret < 0) {
> > @@ -330,16 +330,16 @@ static int loongson_pcm_new(struct snd_soc_compon=
ent *component,
> >
> >         return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DE=
V,
> >                                             card->dev,
> > -                                           ls_pcm_hardware.buffer_byte=
s_max);
> > +                                           loongson_internal_dma_hardw=
are.buffer_bytes_max);
> >  }
> >
> > -const struct snd_soc_component_driver loongson_i2s_component =3D {
> > +const struct snd_soc_component_driver loongson_i2s_internal_dma_compon=
ent =3D {
> >         .name           =3D LS_I2S_DRVNAME,
> > -       .open           =3D loongson_pcm_open,
> > -       .close          =3D loongson_pcm_close,
> > -       .hw_params      =3D loongson_pcm_hw_params,
> > -       .trigger        =3D loongson_pcm_trigger,
> > -       .pointer        =3D loongson_pcm_pointer,
> > -       .mmap           =3D loongson_pcm_mmap,
> > -       .pcm_construct  =3D loongson_pcm_new,
> > +       .open           =3D loongson_internal_dma_pcm_open,
> > +       .close          =3D loongson_internal_dma_pcm_close,
> > +       .hw_params      =3D loongson_internal_dma_pcm_hw_params,
> > +       .trigger        =3D loongson_internal_dma_pcm_trigger,
> > +       .pointer        =3D loongson_internal_dma_pcm_pointer,
> > +       .mmap           =3D loongson_internal_dma_pcm_mmap,
> > +       .pcm_construct  =3D loongson_internal_dma_pcm_new,
> >  };
> > diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loo=
ngson_dma.h
> > index 073ee8c0c046..8795fd7874bb 100644
> > --- a/sound/soc/loongson/loongson_dma.h
> > +++ b/sound/soc/loongson/loongson_dma.h
> > @@ -9,8 +9,6 @@
> >  #ifndef _LOONGSON_DMA_H
> >  #define _LOONGSON_DMA_H
> >
> > -#include <sound/soc.h>
> > -
> > -extern const struct snd_soc_component_driver loongson_i2s_component;
> > +extern const struct snd_soc_component_driver loongson_i2s_internal_dma=
_component;
> >
> >  #endif
> > diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loo=
ngson_i2s.h
> > index e73ffa954ec9..5f773bbd24c5 100644
> > --- a/sound/soc/loongson/loongson_i2s.h
> > +++ b/sound/soc/loongson/loongson_i2s.h
> > @@ -42,7 +42,7 @@
> >
> >  #define LS_I2S_DRVNAME         "loongson-i2s"
> >
> > -struct loongson_dma_data {
> > +struct loongson_internal_dma_data {
> >         dma_addr_t dev_addr;            /* device physical address for =
DMA */
> >         void __iomem *order_addr;       /* DMA order register */
> >         int irq;                        /* DMA irq */
> > @@ -52,11 +52,11 @@ struct loongson_i2s {
> >         struct device *dev;
> >         union {
> >                 struct snd_dmaengine_dai_dma_data playback_dma_data;
> > -               struct loongson_dma_data tx_dma_data;
> > +               struct loongson_internal_dma_data tx_dma_data;
> >         };
> >         union {
> >                 struct snd_dmaengine_dai_dma_data capture_dma_data;
> > -               struct loongson_dma_data rx_dma_data;
> > +               struct loongson_internal_dma_data rx_dma_data;
> >         };
> >         struct regmap *regmap;
> >         void __iomem *reg_base;
> > diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson=
/loongson_i2s_pci.c
> > index dea1e4ebee29..9120432bbe64 100644
> > --- a/sound/soc/loongson/loongson_i2s_pci.c
> > +++ b/sound/soc/loongson/loongson_i2s_pci.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/pci.h>
> >  #include <sound/soc.h>
> > +
> >  #include "loongson_i2s.h"
> >  #include "loongson_dma.h"
> >
> > @@ -22,7 +23,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pde=
v,
> >                                   const struct pci_device_id *pid)
> >  {
> >         const struct fwnode_handle *fwnode =3D pdev->dev.fwnode;
> > -       struct loongson_dma_data *tx_data, *rx_data;
> > +       struct loongson_internal_dma_data *tx_data, *rx_data;
> >         struct device *dev =3D &pdev->dev;
> >         struct loongson_i2s *i2s;
> >         int ret;
> > @@ -79,7 +80,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pde=
v,
> >                 udelay(200);
> >         }
> >
> > -       ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_comp=
onent,
> > +       ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_inte=
rnal_dma_component,
> >                                               &loongson_i2s_dai, 1);
> >         if (ret)
> >                 return dev_err_probe(dev, ret, "register DAI failed\n")=
;
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
