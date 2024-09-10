Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F617DFF1;
	Tue, 10 Sep 2024 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953834; cv=none; b=VkeW6IiBzfsyz1uAWSg0JBJW70IRgpFeLsvXZ9EXw3zfN0lgrxSJhzYafrz8wn298VdqnFrkywKuxG5L/y0kA0ST9O/NzLt6PtE6WGw5APgpQnQxNhoP+ykrFPAX5oyhg6n3t+pmllGGkwoISZgnw2nXgY25mZu/MSYTC77Sj2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953834; c=relaxed/simple;
	bh=uL94oOPhR2uwajOdSxBzXW91Gbt1fLjYjFku5Rxlpd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/7sxfkRBK+2NxKOFxLskyJgMvjBLKzrZoW54SLIFdBluJ58mWR0Cx85MGv3oDbQsQ97t9YYfH1Ca4PlEO99WRinVO00i03BYqaS/h/pfIhh5BHUDtA/IVlrLL1CM/Le2Lc/8bB/qNYFd0pV/XXoJhW1xuJ5abnoEFVawThbfQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWFcvIuJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWFcvIuJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c3ca32971cso658290a12.0;
        Tue, 10 Sep 2024 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725953830; x=1726558630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvWiuTWFvMPcDlEcoADtQiBJ85qEz5AdFMmQSQGM8Uo=;
        b=IWFcvIuJNjWWlO7N3Pvijb/qMsIzi1LKipo2H4e0rAEgX59WRU29qC/+qohQCGuoS2
         rF/8uRp67VsSRDlasJpgK3uhPwoDtvLSVBLKszAND1EkyJV0rqc2Pq9+g1JCFOLfxPOI
         FysiifLDp2va/vBRt7jSEHN3GVIeUcehOQlSAEBFGfJDBl/Q5Aa06efxHY/fQ07z3+in
         hGJ5j49iMCQwOO8GUWSREGh61stuo+OdrdbO00o+ztyaavu8s2sxeQpTnI7iBqvSMH7W
         LTutCz8qbeWi9aWWWXUpPdyYBfw5nMdLbxXfFaPfD7EZLOAGIO/bfLQXNvjkbKnTG7sw
         7jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725953830; x=1726558630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvWiuTWFvMPcDlEcoADtQiBJ85qEz5AdFMmQSQGM8Uo=;
        b=NhtZliNjaBcPL28k1llh3NNiopWyZ5IepdnG0tWqIvycvTihzGAI+s+Dqw57UcNxEb
         QIdxcYKZOd4fXkB3YsA+EMFXptS5ofknbvVlEU09juazi7tQ697JE8jxaoJ5nskq6MrE
         D3/CmCiMP2O25wbuxxbJW/Ks59L8BNDKBQmElTbtr3RCWstEeZYSalb0nEoRzWd7WYpl
         xVDaGpNayN7PhB+pVvI2/tINdbfE5vjZ4day/R0f1P2cIOmSQlcB/HaskWpm5yt6SYUa
         CekFlLmhRAzN3oD1Pp07o9M+erN1mIWYtB30vY/lYErY/EilchPsQSbpexjqNkfT3m3M
         H6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV1HARxApycZMWkALbCajYQqJ1+BLdsCfuhZyTB52CzVUhu3ruschXm48pNBNf/g8clqSFjSIXVqUVQ+08=@vger.kernel.org, AJvYcCWegr0TxQv99nGtpnzb84RtA0k3IoeGHnyBS7akaz4ZfrQfpZ+UKZd4ClLdSjBYaH2nFj8HYUEl5q8n@vger.kernel.org
X-Gm-Message-State: AOJu0YwriAhd7+qGOfgz/tNvMTegSzAubgMW9OnWUVPKUBTKB6dSGjNo
	z6SX5mfUbi2h9AJFTv2zAFyhwnJBDuLsQFn06ijv1JNGY0O3qEVliaG25sbz9LRwg+kBDgGsybL
	+MLmyuImvkRH273nrUiEDVbJ5oSY=
X-Google-Smtp-Source: AGHT+IEnQh/fa4IE7ZagE7qLvLFgvwd1HWUxsftYL8OPLg+rC+19mM7cwdluLYSIUMKePWXEWmJvrz5j90iPF0Zctmg=
X-Received: by 2002:a17:906:db07:b0:a86:9776:ef40 with SMTP id
 a640c23a62f3a-a8a88667b5bmr1249364066b.36.1725953830116; Tue, 10 Sep 2024
 00:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin@loongson.cn>
 <eaeb0113-785c-4a41-b093-b352122b20ca@sirena.org.uk>
In-Reply-To: <eaeb0113-785c-4a41-b093-b352122b20ca@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 10 Sep 2024 13:36:57 +0600
Message-ID: <CAMpQs4LAsQhfrFnh_ABr4NqLbSMW532xyh991sLp9QsiwB2XsQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: codecs: Add uda1342 codec driver
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your detailed review.

On Thu, Sep 5, 2024 at 8:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:02:53PM +0800, Binbin Zhou wrote:
>
> > The UDA1342 is an NXP audio codec, support 2x Stereo audio ADC (4x PGA
> > mic inputs), stereo audio DAC, with basic audio processing.
>
> This looks basically fine overall, there's some issues below but they're
> mostly fairly small and stylistic rather than anything major.
>
> > --- /dev/null
> > +++ b/sound/soc/codecs/uda1342.c
> > @@ -0,0 +1,397 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * uda1342.c  --  UDA1342 ALSA SoC Codec driver
>
> Please keep the entire comment a C++ one so things look more
> intentional.
>
> > +static int uda1342_mute(struct snd_soc_dai *dai, int mute, int directi=
on)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct uda1342_priv *uda1342 =3D snd_soc_component_get_drvdata(co=
mponent);
> > +     unsigned int mask;
> > +     unsigned int val =3D 0;
> > +
> > +     dev_info(&uda1342->i2c->dev, "mute: %d\n", mute);
>
> This is far too noisy to be logged and will DoS the logs, please just
> remove it.

OK, I will drop it.
>
> > +
> > +     /* Master mute */
> > +     mask =3D BIT(5);
> > +     val =3D mute ? mask : 0;
>
> Please use normal conditional statements to improve legibility.

OK, the code as following:

if (mute)
                val =3D mask;
>
> > +static void uda1342_shutdown(struct snd_pcm_substream *substream,
> > +                          struct snd_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct uda1342_priv *uda1342 =3D snd_soc_component_get_drvdata(co=
mponent);
> > +
> > +     if (uda1342->master_substream =3D=3D substream)
> > +             uda1342->master_substream =3D uda1342->slave_substream;
>
> Please avoid using master/slave terminology, we've tended to go for
> provider/consumer in ASoC.

OK, I see, I will  rename it.
>
> > +static int uda1342_hw_params(struct snd_pcm_substream *substream,
> > +                          struct snd_pcm_hw_params *params, struct snd=
_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct uda1342_priv *uda1342 =3D snd_soc_component_get_drvdata(co=
mponent);
> > +     struct device *dev =3D &uda1342->i2c->dev;
> > +     unsigned int hw_params =3D 0;
> > +
> > +     if (substream =3D=3D uda1342->slave_substream) {
> > +             dev_info(dev, "ignoring hw_params for slave substream\n")=
;
> > +             return 0;
> > +     }
>
> This is also too noisy, it should be _dbg() at most.

OK, I will drop it.
>
> > +     /* codec supports only full slave mode */
> > +     if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) !=3D SND_SOC_DAIFMT_CBS_CF=
S) {
> > +             dev_err(dev, "unsupported slave mode.\n");
> > +             return -EINVAL;
> > +     }
>
> Use the more modern _CBC_CFC.

OK, it should be replaced by SND_SOC_DAIFMT_BC_FC.
>
> > +     /*
> > +      * We can't setup DAI format here as it depends on the word bit n=
um,
> > +      * so let's just store the value for later
> > +      */
> > +     uda1342->dai_fmt =3D fmt;
>
> No need to even store it if only one value is supported.

Emm, I will put the fmt setting here from the hw_param function.
Also, the dai_fmt could be dropped.
>
> > +static int uda1342_set_bias_level(struct snd_soc_component *component,
> > +                               enum snd_soc_bias_level level)
> > +{
> > +     switch (level) {
> > +     case SND_SOC_BIAS_ON:
> > +             break;
> > +     case SND_SOC_BIAS_PREPARE:
> > +             break;
> > +     case SND_SOC_BIAS_STANDBY:
> > +             break;
> > +     case SND_SOC_BIAS_OFF:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
>
> This does nothing so it can just be removed.

I will drop it.
>
> > +static const struct soc_enum uda1342_mixer_enum[] =3D {
> > +     SOC_ENUM_SINGLE(0x10, 3, 0x04, uda1342_deemph),
> > +     SOC_ENUM_SINGLE(0x10, 0, 0x04, uda1342_mixmode),
> > +};
>
> This doesn't seem to be referenced anywhere so can be removed, or should
> be added to the controls or DAPM?

I will drop it.
>
> > +static int uda1342_soc_probe(struct snd_soc_component *component)
> > +{
> > +     struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(=
component);
> > +
> > +     snd_soc_add_component_controls(component, uda1342_snd_controls,
> > +                                    ARRAY_SIZE(uda1342_snd_controls));
> > +     snd_soc_dapm_new_controls(dapm, uda1342_dapm_widgets,
> > +                               ARRAY_SIZE(uda1342_dapm_widgets));
> > +     snd_soc_dapm_add_routes(dapm, uda1342_dapm_routes,
> > +                             ARRAY_SIZE(uda1342_dapm_routes));
>
> You can point to these arrays from the component struct and have the
> core register them for you.

OK, I will do it.

Thanks.
Binbin
>
> > +static const struct regmap_config uda1342_regmap =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 16,
> > +     .max_register =3D 0x21,
> > +     .reg_defaults =3D uda1342_reg_defaults,
> > +     .num_reg_defaults =3D ARRAY_SIZE(uda1342_reg_defaults),
> > +     .cache_type =3D REGCACHE_RBTREE,
>
> In general _MAPLE is preferred for new things unless you have a specific
> reason to use _RBTREE, it uses a more modern data structure and should
> generally do better.
