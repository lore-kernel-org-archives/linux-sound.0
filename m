Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED362D595D
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246650; cv=pass; b=cNQlkqWhGqL2Flai3i3VkLRcbVZ9DDZkYVANQv/qSW0SQ9949gWXd5KrMS+GmXbjMNqUIGWd2EPhfb9tMtlV/WnSKq8g72LRp+VkIJEACwF5OhvbBzUzWcrtROo7psydjDiHncmxsb4wjFXvRbDWkj2xAo5K/EBJ/WWyjAfkE7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246650; c=relaxed/simple;
	bh=woA76R/zthBQbfC1VYBOosax5tbPAH9jY/O9XtXN6jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9t8FyPP1VRIdOFR1Tq/WUutfZlU94J+MSU+EdEpTBzUJP1aAzblJGPNb9u8gavowJeRJ4lKXYcdBxMTFa4mui4afSffPKpQ9t+KaexsKxo8jxyg2DcZz7Ek0FnxY96HzwYkRgUi6NNVLlARtCzlMNqjQYZE/AyUFCmVvH+kSpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgXVQagF; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgXVQagF"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a46657a9fso1259561fa.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 09:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773246647; cv=none;
        d=google.com; s=arc-20240605;
        b=e88uGBNI0OrT4RyRk9siBfCQPb+Nb/Xo+wRV+Q6WdyCe+1nbmlcVjW44HqmsqzML5l
         Z5SCC9you17CoA3wXVeMc0R2hzJQj3w1dSGhqVwCuGTcj5DhvEENZKswyLQCKLo5C5Gp
         QfUnqAHNz9ouLJwNTqh3rP5EBggP9qX78yyUPVdKds4FnqbitSY7FX7JeCJQEz1dLfym
         qEsTdZDlv3+lM1j42aa4GFYuImRAp/qs8kBnp+MWIT0dfdO/RUNid7Pzrq2bYn2lXqH8
         WrcwNpr+vVE748Fi7mAhTaH6EPO8qQSNMnbSbZFRrN1ECQNtSc69K0KGhuIvT1C2zJRi
         3seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dot4zTa3PMnGQX7NybErwcRiPk9Qg7i1fx2G3TBPUrs=;
        fh=dDzKZbeQPwDDJI4j1y2Zrftx33CzgoMLzyEmqTxQoRM=;
        b=AVkbKsL9Shwp7DVljYkyvRP8tQi/AQBrTEiFNsyI2RtSPt4BmpIORFeMU6+qV1+jri
         s4sZTuAXvLyX1bQ7xeLftEIV0SuQYlubx5ZQyV6JubIVt6mUCAx9/aCaHzfzycFPOxO8
         H7jFp6oSzqMvG3J/Xvn7RcRmlHvWtLcMABXXh9UH+sFA4ivvSN5v53Hiv6rwgtaUIAlo
         WXX4KYLAaD2Hu40DT10dSh204xdoZ+slSVbq3ZIDY4OHO3vhnlC2Ifui6EgDLOIto/gw
         nfL2zlTJUEwQFYMMnMlfWHIgIb4eqeUTbz4qqcaKdKG/OAjXTrydLv608oMz3iu4kFxv
         kEog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773246647; x=1773851447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dot4zTa3PMnGQX7NybErwcRiPk9Qg7i1fx2G3TBPUrs=;
        b=fgXVQagF4BMWf0h/31b9RO9O30b5Gq2bx01X+GB14DZV0TEjvfZMQBupXhtNStAZnS
         xIaSVdBv6Ch8FyJdjS81jRgulWk+TtyIrHw47TjX6nEX5QoAcogrEBSGtsQHGiz63hK1
         GGOC7yOfE3TK8wnoZyWVKpdKcsOTnwNsncQzVxiusSStRKITNyZHPXlK9T3URkxYYX0f
         ZUMogPkNpwuY49u2fg08Bd2EXVkb1+cpeGNoELDd4B7UV9nM+SeZhLkRiPaUD910dZLR
         Ql4u0xaF84FE/JkqQak3CvhYTPLi/n4kvuHpKwKERTYh2eokymziEUVfhAOd/7LK/QwZ
         8lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246647; x=1773851447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dot4zTa3PMnGQX7NybErwcRiPk9Qg7i1fx2G3TBPUrs=;
        b=PQgQE/jlYp9oPOR4Advutnco32b1fSagmSbOkdu/UcN/52w5aDli0UNOt0G3CpqM5X
         /+0oJaTed/AJxF8AXj2J9BFsf3bhHNpwWedTBZ5tp5tVRFyKC2S9R3tuuobZI+zBA5/Q
         q/NSoiKPvtR2jO3hunBY/Q0tE6dKAP5ixhhUMQVex3812LJ//CF/DDvq2qKNdtI9jtjT
         O9Mrx8PWj6dao0pCvcLSHRb5XgkXpMMe89ax2vi9toJBEO/a2guX+GK5dVuzlFSCOnBJ
         y9YQZFMNONUSn/bbEaxZcjHpgbCjjmhONyeIvLJk2lqumUbI9Z5TJjYctM8/Xziisr2T
         AkLw==
X-Forwarded-Encrypted: i=1; AJvYcCWzGn5Oj7BrDqavaVylZf3Jvn47ttxtFCdq/U+sN6AaoJih+tc4dD+8+qzT9xKmX16s5cMdRfS5PSsDWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVOzGFIW4uGtX7S87loohTKRzkhGJmqz0EJ77C0MGIloYfb8s
	OuNhbljdkpW7dKYtkTdqDxy1hCSkLoHlK8XnsaKQZTJlBTekX1D80ydBU1kyh8HqvTVAE2sAgXO
	XTyf1N9n7ZiOnVgiMBWF7933cr3O3w8w=
X-Gm-Gg: ATEYQzzIB80MrEZ1xaffOhhZOHdi729K9Pfq9DutMs7XueBSsSJodvBDmr/IqbkI7Ku
	ZyvHxFEdsY2500w82GkbQBo8Ngg9Lfl5AAubmu18PBQAPuLCFgzNycCx5cDIZ3/5qC2M7PnsaSx
	pbMmCoB8nxaI//UQH34OFch2K4pkJISKrfWYVy0jtptgSIy7v9b6yMimRR/+4ii81fwE8MXq549
	yt7SWnX7w3TMFYI30r1kpPYEcS3hidaFZwnsTcDN81rF2vqqjEFW/TJFPMCdt2mb9RzSNTYqWQu
	ayhaaYEIXF7imCZSCauFSYwkD7lRGpaJHJjFMS9bFNE1n8+IInWMmFuGYJlnP5wOWCVQ
X-Received: by 2002:a05:651c:1592:b0:388:ff9:2cea with SMTP id
 38308e7fff4ca-38a67e7b656mr11232521fa.37.1773246646545; Wed, 11 Mar 2026
 09:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
 <20260310-aw88166-fw-v1-2-2777563bb673@gmail.com> <20260311-glittering-elastic-deer-a2fa58@quoll>
In-Reply-To: <20260311-glittering-elastic-deer-a2fa58@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Mar 2026 11:30:34 -0500
X-Gm-Features: AaiRm51mfBNwnGfsxvCM51IBlOwc607hTXghLXE4HEW0nfH4QMCv7NmTEcbx5hA
Message-ID: <CALHNRZ-KxT0B1zpPD1N7ba6185cqh6q-z-WMxbpU68FRuGJXEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: aw88166: Support device specific firmware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Weidong Wang <wangweidong.a@awinic.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 10, 2026 at 11:43:05PM -0500, Aaron Kling wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This driver currently loads firmware from a hardcoded path. Support
> > loading device specific firmware when provided by the boot firmware.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
>
> There is no such tag.

What do you mean? This tag is used all [0] over [1] the kernel [2].
How else is one supposed to indicate that that notable changes have
been made since the original author touched it?

> Also, incomplete DCO chain.

Ack, will fix. And somehow b4 didn't catch it, huh. Pretty sure I've
seen it catch this elsewhere, though.

> > ---
> >  sound/soc/codecs/aw88166.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
> > index daee4de9e3b01fb335975a65456cc79575533d7e..52d33a2f7cb12877138ea50=
83ad42e2777f8d323 100644
> > --- a/sound/soc/codecs/aw88166.c
> > +++ b/sound/soc/codecs/aw88166.c
> > @@ -1574,18 +1574,22 @@ static int aw88166_dev_init(struct aw88166 *aw8=
8166, struct aw_container *aw_cfg
> >  static int aw88166_request_firmware_file(struct aw88166 *aw88166)
> >  {
> >       const struct firmware *cont =3D NULL;
> > +     const char *fw_name;
> >       int ret;
> >
> >       aw88166->aw_pa->fw_status =3D AW88166_DEV_FW_FAILED;
> >
> > -     ret =3D request_firmware(&cont, AW88166_ACF_FILE, aw88166->aw_pa-=
>dev);
> > +     if (device_property_read_string(aw88166->aw_pa->dev, "firmware-na=
me", &fw_name) < 0)
> > +             fw_name =3D AW88166_ACF_FILE;
> > +
> > +     ret =3D request_firmware(&cont, fw_name, aw88166->aw_pa->dev);
> >       if (ret) {
> > -             dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", AW=
88166_ACF_FILE);
> > +             dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", fw=
_name);
> >               return ret;
> >       }
> >
> >       dev_dbg(aw88166->aw_pa->dev, "loaded %s - size: %zu\n",
> > -                     AW88166_ACF_FILE, cont ? cont->size : 0);
> > +                     fw_name, cont ? cont->size : 0);
> >
> >       aw88166->aw_cfg =3D devm_kzalloc(aw88166->aw_pa->dev,
> >                       struct_size(aw88166->aw_cfg, data, cont->size), G=
FP_KERNEL);
> > @@ -1599,7 +1603,7 @@ static int aw88166_request_firmware_file(struct a=
w88166 *aw88166)
> >
> >       ret =3D aw88395_dev_load_acf_check(aw88166->aw_pa, aw88166->aw_cf=
g);
> >       if (ret) {
> > -             dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", AW881=
66_ACF_FILE);
> > +             dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", fw_na=
me);
> >               return ret;
> >       }
> >
> > @@ -1802,9 +1806,16 @@ static const struct i2c_device_id aw88166_i2c_id=
[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, aw88166_i2c_id);
> >
> > +static const struct of_device_id aw88166_of_match[] =3D {
> > +     { .compatible =3D "awinic,aw88166" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, aw88166_of_match);
>
> This looks like an unrelated change.

Without this, I don't think the driver will read from the dt node at
all. Since this change requires doing so, I figured it was related
enough. But I can split that if desired.

Aaron

[0] https://lore.kernel.org/all/20220107160636.6555-3-ckeepax@opensource.ci=
rrus.com/
[1] https://lore.kernel.org/all/20260115164203.811470351@linuxfoundation.or=
g/
[2] https://lore.kernel.org/all/f7e05205fd33d9e510ec1295e0cc8cfdf395cb89.17=
56237895.git.osandov@osandov.com/
