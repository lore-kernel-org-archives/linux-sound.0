Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDA04DA9AE
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351782; cv=pass; b=M9vC10srpYs5Idi1RuBOM+8CpPFM0DaxkE1YxF5/kq2HiYslb8NyZhDp1udNLf6U8LMoP3JgoRR7PCg0OSZzZYfXCJ/1g4be4FFyElfQChQmmZCCK1QDW4ki3meeqTc4r0ysv9+w8tGjUA7h2IP1xjBiD2ZUIUAyAdMx4P7NSWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351782; c=relaxed/simple;
	bh=/Yq6ssAxz6CKB1eGF9+G1y7JmSA8F7XGVo2zPJmQTSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoPpHkKQ+6V//CiK3nnRX4wwCM8Q3/Zl9FtldcDx4z9GAhHLWEBL+LsTBRRDtGah+3qjQqIWHfRRmZe4tU2Dwki0cBM1HQSNAE88bxK+vgNnt0xrMNnKGIFrKaNfPLAP1BRKncorN4cx4Xzmpj2XQ79XcOeFScRdfomxuPYl3eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaRw+Bmk; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaRw+Bmk"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso395493e87.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351778; cv=none;
        d=google.com; s=arc-20260327;
        b=YP8xhnpRZHDzQ4J5IZtlPaQ8RFRzQBcd2FbRbImqabC5mE3hTDCHydISL8PCTGILWD
         Ug+xZVYVYpiAk3cPCo3vvnRNpoOddLBNcjaAFBzFMZF0wIlNcnEpWnQa/dwaszUcIEk+
         2p1sGHe9wX+83OtigKFYD1yH5xWEZnhVlLU7KuG0VPvtTieB3STY8lZwVZrQBEdskQSc
         q+f5f6Thw2rV0b1U96cF9I+7KzCSY6pnBWmgeyaF+qAkFyE9fs/EWnbR+jd4vfI6OzZp
         n4C0QghAnWnd5nMHtl7YV1heBEtTNJyAep4GNxJZzZ6VHsNra1k24RiNxqf1sROaaAt0
         W+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddY66CtkaA0M8CqEHigGklMrMThtuWK6zHOkSid4+qs=;
        fh=inV055bW3CdGaqah6pFAHyv/on94oaX0HdVvPvboU+g=;
        b=OZhU5Eg8CYd5y37ZADieHDnvv6yxX/hz/gdrwxd0/VJfMGSI0rp49rZNJchbyW5LUW
         9ykTIDNp5eQ+WMscwSRwoAazgjFMVPC5/ATHpR+7WoCFXgbcOgOd2yYChOhqfgN5RjpJ
         35TRZ6uzXGEdyuVMA22kmf0etvtnLMycJGP/twlcX2PvNdtUWAHe0Fs5yDU1Jw79vtiC
         PbyjYjRJcMhF5zUStfjbU26yIl3YwncxyDI/LaXnUYiY8ggX8R7wFWw5WcA/YvHYSmnT
         1z8NwDyH5M3dNRvMHxp9PVV7A9D4Xm+rreo1jjEjZadKLd2cD46+l0kpaciyCdlThw6t
         bAFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351778; x=1790956578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ddY66CtkaA0M8CqEHigGklMrMThtuWK6zHOkSid4+qs=;
        b=iaRw+Bmk71MVrDd+X3vilG2kyZZZTM+2y1RXIWboNkF0GtfE1mVnC7AxKGvUU1r4a8
         ZC3VS+Kpzb7+GtEq5wHjU0+BzbDLDAo8MGnTt7V+ZHFhXmHc+I2spwm3yG017LSKkIEu
         mY8tdJxXU5qVB0730uFHz6yERVSxcQAdMqfDnk43r/OvOraPl6JgyjjfV5ieXeANjHei
         0I0WrXErCAc8QLyjEIsJTOQ1wBor1kG5qRGFjUj4Dl9MXX/zjstbsDq2AaLnP1oUOW0p
         pQvshuwVqVtax9aY+9a1KjCR42U5tV3bI7/FBvr1Q8u59s6ejc0Fkm3dDAJLPXQ8QobW
         bBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351778; x=1790956578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddY66CtkaA0M8CqEHigGklMrMThtuWK6zHOkSid4+qs=;
        b=qjhRpbJZN9PN2K7b6QdWTLR6braczv3UuBhPBx7tlMfLnvNYtQjF6LHm5jxrvPFBCW
         HEQzzyI/aJCoVj0xZnqP5NBv3nIKXzTKm24HSDRtDZe8HvgrSV2THDKHvBURdzXGBz/j
         FA0zViGFMUgfj+5SekpzVS4nxzPnUsdzIeytkUePhLAYzev3V+txnGNdf1kn77ZvdSJT
         khymZ/01L/XrmUq47+Vw0IPtRAd8fAcvR1dQ96wVUOs0a4WT1+UQdHtxi7VLl1SlG+7U
         L7BICfEUE69pwqZ5nJMTBk1FdhvB6yIFgczJ5hRqSbpbgJX3npuKUdFDK+nsYkavyGUT
         X0sA==
X-Forwarded-Encrypted: i=1; AKwUvBzp+Lk0bIrcj9uujNyDfq+/elXWJRS4vawUJnflm3/hJaCWfpb4vhIeJgU7pLt875Is3CwuyIUWeff7mQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kOmBuwUkVtAHPcIvng0COg82ykm0NHcIT7iO2cK8BY7iK/cq8K
	NSSM3X0hvE0wtoXHv7twp1YnVlwT3wihRf32dgvuyt9PfVNVzQkm1Rp1wGddWFdIGM5GgwxDBut
	yQ0GRKiVsJySN1w0nB3oaMtsL8KPb1tc=
X-Gm-Gg: AYBFou04Mt+WZU9yey5j1NZo06AFL0gffEzmpRzMBHOMButghsa/7mZLblONg7aHYcP
	3LB5CUU+JAadI5yyUHICXlEuIAisUXVNgA1Fr7OHYy+BErNHOb2o+8ghnld9hRwGIhHTxkHWtDu
	vBR1qUQuq8uc1O7T8EGFWEwTZMMcLv9ETg6AWAiOo66ubuaweJVgDWCTjQ+Zlv9KhI/eFOitGlJ
	qrsoZJJV31JQoGUcE+AO+IfP/TEYew9F/fyuZhbThrYGvGrKwpaVm5zq/IxmZwlC+kV9fLUNzrc
	FyXR+2MN9c/mmKgLoz+biRO7H0AP3lPKke7lWZnim1y0AwbriernSK/cvJXFn+xTonicI3EkwpG
	Gd+3hO5L5HPaYBdr4CBF71g4L108Am7E7R4wzgF5w4n0=
X-Received: by 2002:a05:6512:378e:10b0:5b8:de9f:85bc with SMTP id
 2adb3069b0e04-5b8df0a5e33mr1500287e87.9.1790351777608; Fri, 25 Sep 2026
 08:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-1-11f74cb5fe28@gmail.com> <93d91d10-3d3c-4dae-bd5a-62a2f71458a0@sirena.org.uk>
In-Reply-To: <93d91d10-3d3c-4dae-bd5a-62a2f71458a0@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:56:05 -0500
X-Gm-Features: AclHuK-xI-6RJNKg4PG1csgl4tm5pZqrGjZAi2VlASaIfgtQu10tpFDPMugV-lg
Message-ID: <CALHNRZ-qO4p6Fa_4te5085Lv35_FftvSB4XDBQVhtoRNmXJhtw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: codecs: aw88166: support changing sample rate
 and bit width
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:00=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:29AM -0500, Aaron Kling via B4 Relay wrote:
>
> > The aw88166 driver only worked with 32-bit 48kHz streams so far due to
> > the lack of a proper PLL initialization sequence. Fix by selecting all
> > the necessary PLL settings based on what was passed to us by the
> > hw_params/set_fmt ops. This replaces the strange downstream routine
> > that tries two divider modes in sequence.
>
> > -     ret =3D regmap_read(aw_dev->regmap, AW88166_PLLCTRL2_REG, &reg_va=
l);
> > +     /* PLL divider must be used for 8/16/32 kHz modes */
> > +     ret =3D regmap_update_bits(aw_dev->regmap, AW88166_PLLCTRL1_REG,
> > +                     ~AW88166_CCO_MUX_MASK, aw88166->cco_mux_value);
>
> We seem to just completely drop all reference to PLLCTRL2 and switch
> over to PLLCTRL1, I'm going to guess that this means that something that
> used to work now no longer works...

To be honest, I only understand the audio handling at a high level.
This was copied from the aw88261 change almost entirely as-is, as
mentioned in the cover letter. I did some spot checks of the data
sheet to make sure changed addresses were the same and what I checked
did match the 88261 changes. But for the hardware specific stuff, I
unfortunately don't know. What I can say is that after this change,
the AYN Odin3 aw88166 firmware blob from the stock android image works
as-is, where-as before it required some binary patches to start a
stream. Implying that the firmware defaults to settings that didn't
match what the os was using.

> > +static int aw88166_hw_params(struct snd_pcm_substream *substream,
> > +     struct snd_pcm_hw_params *params,
> > +     struct snd_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct aw88166 *aw88166 =3D snd_soc_component_get_drvdata(compone=
nt);
> > +
> > +     case 32:
> > +             aw88166->bck_value =3D AW88166_I2SBCK_64FS_VALUE;
> > +             break;
> > +     default:
> > +             dev_err(aw88166->aw_pa->dev, "unsupported physical bit wi=
dth %d\n",
> > +                     params_physical_width(params));
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
>
> This doesn't touch the hardware, it just writes state so if hw_params()
> is called while things are powered up nothing is going to take effect
> until the next stream.

Mmm. As mentioned above, this copies another change, so if it's wrong,
there's more places that need fixed. If there's a better way to handle
this, I can certainly update this patch.

Aaron
