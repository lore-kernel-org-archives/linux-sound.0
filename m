Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76531D279F;
	Fri, 13 Sep 2024 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726192939; cv=none; b=HoUms8kS8Ffu1WG94XfBdHnfoWe3P/q8rRLNPuOrohQ8STgmRumiZW/P7ynpviXBlX5DCMlMRryTRdgybviwOEecZQHX/yFFkQePLB9K0es05cK1AduZgnF/t4jA5ec1/I9BiNwZ2M17Hpx31F4Pv7ZybFTeQYeh+vbKWlfVNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726192939; c=relaxed/simple;
	bh=Cz5zX1I9CzyGjxg/hnDfG1D8skWYZ4tTNIVZ5IfjHiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1TdT1Ur6eKhPR4Rtt6HUZ7JYWEyvHMAtFTwx0/SKmUjpnTJd7gMnu5g+TNFqYBb9t/klSPcOpXB/zCQLvi9KiiBly8BcFFVDRLo+EtDLVNhYqw/XACp3bcfHf88U1yYQDXBJjnjtL+5mMFW+nqKfrIHZ5HhFpPvIeOpQycuEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfitY7kH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfitY7kH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d2daa2262so38065366b.1;
        Thu, 12 Sep 2024 19:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726192936; x=1726797736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za1VrBBRwn+rfA8pvyhHB+W1qLi3Bv4s93LHwXChOXM=;
        b=PfitY7kHEuL+hLS4mISTxH/02KGZVKLVxJ9l8g/DRZdeZbZ2vfRLSuHqT4KowclWBK
         hGO7MQA5t51YvwQD24ZAuqRHqFxvW+cOxu4ImHx8p9heAozzaNmYesuLby16PlBxmjTG
         nwLpjWIdzxPAkr5HwEah4OSU57wFQHFibszGflRsCRZHA5NdrbPnLQ6rf1NKkktfCAAA
         mlmpBilq3Ck8N6TSCvUbfYmX4K1xgZXS6acqMQpO/3F9Z+RLxDyva+7S/LKu8qYEux3q
         BiJ/fsM4a2NdKMPRHdsIcz6yNomn/Ow2tBnHOnNbWKmVDzVCSpmI7GkhPtpMKOuwsLnK
         SEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726192936; x=1726797736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za1VrBBRwn+rfA8pvyhHB+W1qLi3Bv4s93LHwXChOXM=;
        b=LJvMzGDuYvib0LzhPMcu93yFXyj8sqLD68Lk3Yty1garfPBkqkdou/d5SBl5h+c1Uu
         wjC4bI80/dSFc8/uL6eCdb/GJssko87uyonyT/HZysl7HokjOXnaG2HMk9q+MUKmBVuR
         HzW4A2uAOsfL/5LRJ0AK8r/QBNPIEZJh9eud9E32XU5+1Yov5Q+r8OOcJ+FpLT8Nq7I7
         PJYUE9uR8kaXuoK9ZCFGaqPce3+TuOaXLZ7REBYeC2sXQ2tllNs4UVLa4Tx8EBsJwKEt
         GnOsDj0/1QJ86QRDfps2LyPZKecjoNUzERL4YMtAu5/XumCHw6n0Smx2GNz0rw5H0RMB
         l/YA==
X-Forwarded-Encrypted: i=1; AJvYcCUcm4upLzig8oOtEXBMCtVDHMMpoy3H51bKdhMrRp5VXFukPNTwiS9/TxIp+DubVIsfV8NnvepdzPkT@vger.kernel.org, AJvYcCWwvtixQrUPc+mIabdHQXfTj0QxRu4xDXUqLutKSsQ+3T/KOFZPb0VoUOktlttD/AwI1wdT03q30X7ebiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6h2GadP3RtddSY3dMg1my+wcNyNxOH1+8v03FwsBbC5wknoOw
	R7/n1wcWFk7vbuQwn9Ppwga13eRBSLZp9njOueaHOSx/gVrCOku2GFyUh+4JNtMgOdSdmAnI9V6
	ayY17tPFmyXOdrZfprKSiHG+WVqUshQjwh1W8dg==
X-Google-Smtp-Source: AGHT+IGmaOVz9eWZVBmnkUFctSYHbKgcUw492jRbUuzTOMojrpripRNj32SgNyGp+C1Af+8TAqbpm3AcRWf/z4hTLp4=
X-Received: by 2002:a17:906:c109:b0:a86:7a84:abb7 with SMTP id
 a640c23a62f3a-a9047ca076emr61223666b.20.1726192935634; Thu, 12 Sep 2024
 19:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
 <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
In-Reply-To: <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 13 Sep 2024 08:02:02 +0600
Message-ID: <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
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

On Thu, Sep 5, 2024 at 8:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:02:15PM +0800, Binbin Zhou wrote:
>
> This looks like it was based on some *extremely* old code and needs
> quite a few updates to bring it up to modern standards.
>
> > + * Author: Mark Brown <will@everset-semi.com>
>
> Oh?
>
> > +/*
> > + * es8323 register cache
> > + * We can't read the es8323 register space when we
> > + * are using 2 wire for device control, so we cache them instead.
> > + */
> > +static u16 es8323_reg[] =3D {
> > +     0x06, 0x1C, 0xC3, 0xFC, /*  0 */
> > +     0xC0, 0x00, 0x00, 0x7C, /*  4 */
>
> There's a bunch of regmap reimplementation in the driver, the cache and
> I/O code all looks totally generic.  Just use regmap.

Sorry, I don't really understand this point.
Do you mean to use regmap_read()/regmap_write() instead of
snd_soc_component_read()/snd_soc_component_write()?

If so, are there any rules for using snd_soc_component_xxx()?
>
> > +static const struct soc_enum es8323_enum[] =3D {
> > +     SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 3, 7, ARRAY_SIZE(es832=
3_line_texts),
> > +                           es8323_line_texts, es8323_line_values),   /=
* LLINE */
> > +     SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 0, 7, ARRAY_SIZE(es832=
3_line_texts),
> > +                           es8323_line_texts, es8323_line_values),   /=
* RLINE */
>
> Use named variables for the enums rather than putting them into an array
> that's not otherwise used...

OK, I will use macro like SOC_ENUM_SINGLE_DECL() to define them.
>
> > +static const struct snd_kcontrol_new es8323_snd_controls[] =3D {
> > +     SOC_ENUM("3D Mode", es8323_enum[4]),
> > +     SOC_ENUM("ALC Capture Function", es8323_enum[5]),
>
> ...it's *vastly* more readable and maintainable.
>
> > +     SOC_SINGLE("Capture Mute", ES8323_ADC_MUTE, 2, 1, 0),
>
> On/off switches should end in Switch, see control-names.rst.
>
> > +     /* gModify.Cmmt Implement when suspend/startup */
> > +     SND_SOC_DAPM_DAC("Right DAC", "Right Playback", SND_SOC_NOPM, 6, =
1),
>
> gModify.Cmmt?
>
> > +/*
> > + * Note that this should be called from init rather than from hw_param=
s.
> > + */
> > +static int es8323_set_dai_sysclk(struct snd_soc_dai *codec_dai,
> > +                              int clk_id, unsigned int freq, int dir)
>
> Why?
>
> > +     /* set master/slave audio interface */
> > +     switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +     case SND_SOC_DAIFMT_CBM_CFM:    /* MASTER MODE */
> > +             iface |=3D 0x80;
> > +             break;
> > +     case SND_SOC_DAIFMT_CBS_CFS:    /* SLAVE MODE */
>
> Please use the modern naming with _CBP_CFP and so on.

Get. SND_SOC_DAIFMT_BC_FP/SND_SOC_DAIFMT_BC_FC will be used.
>
> > +static int es8323_mute(struct snd_soc_dai *dai, int mute,  int stream)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct es8323_priv *es8323 =3D snd_soc_component_get_drvdata(comp=
onent);
> > +
> > +     if (mute) {
> > +             es8323_set_gpio(ES8323_CODEC_SET_SPK,
> > +                             !es8323->spk_gpio_level, es8323->spk_ctl_=
gpio);
> > +             usleep_range(2000, 3000);
> > +             snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06)=
;
> > +     } else {
> > +             snd_soc_component_write(component, ES8323_DAC_MUTE, 0x02)=
;
> > +             usleep_range(2000, 3000);
> > +             if (!es8323->hp_inserted)
> > +                     es8323_set_gpio(ES8323_CODEC_SET_SPK,
> > +                                     es8323->spk_gpio_level, es8323->s=
pk_ctl_gpio);
>
> This appears to be controlling the speaker based on jack detection.
> Unless there is some hardware restriction this should be done via DAPM
> and the user allowed to manage when the speaker is used depending on
> their use case.

In this version of the patch, I plan to remove the jack related
functions, and I will add them later.
>
> > +static int es8323_suspend(struct snd_soc_component *component)
> > +{
> > +     snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06);
> > +     snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_LOUT2_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_ROUT2_VOL, 0x00);
>
> This will overwrite user settings when suspending, the controls should
> be unaffected by suspend.  If the device needs this then use cache
> bypass to do the writes during suspend and resync the cache on resume.

regcache_cache_only() and regcache_sync() will be used.
>
> > +     snd_soc_component_write(component, ES8323_CONTROL1, 0x06);
> > +     snd_soc_component_write(component, ES8323_CONTROL2, 0x58);
> > +     usleep_range(18000, 20000);
>
> Use fsleep().
>
> > +static void es8323_init_component_regs(struct snd_soc_component *compo=
nent)
> > +{
>
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL1, 0x88);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL2, 0xF0);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL3, 0x02);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL4, 0x0C);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL5, 0x02);
> > +     snd_soc_component_write(component, ES8323_LADC_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_RADC_VOL, 0x00);
>
> User visible controls should use the chip defaults as standard,
> userspace can configure what it needs and this avoids us worrying about
> individual use cases in the driver.
>
> > +static int es8323_resume(struct snd_soc_component *component)
> > +{
> > +     es8323_init_component_regs(component);
> > +     /* open dac output */
> > +     snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
> > +
> > +     return 0;
> > +}
>
> This doesn't restore any user settings.
>
> > +static int es8323_i2c_probe(struct i2c_client *i2c)
> > +{
> > +     struct es8323_priv *es8323;
> > +     struct i2c_adapter *adapter =3D to_i2c_adapter(i2c->dev.parent);
> > +
> > +     if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
> > +             dev_warn(&adapter->dev,
> > +                      "I2C-Adapter doesn't support I2C_FUNC_I2C\n");
> > +             return -EIO;
> > +     }
>
> Does the device really need this?  It seems to be doing very basic I/O
> which should be SMBus compatible.  In any case when you move to regmap
> this should be redundant.

Emm, I will drop it.

Thanks.
Binbin
