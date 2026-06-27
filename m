Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0331990A7
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553845; cv=pass; b=AxQ1uEpe/7m+0k/rIZXtv1LDoBEmjfXBVWiXpam3n9P8IzCDK2FO6Ny6kZL0XX6D6wKGV8pCE0HDk/TeC6OQ+mHWMye1n6oGiGgu4Pq2l91TEItaUkEEYWo6v1snu7TZGoIqk9FZxsN+humi0hEOkylMk+UteY/Wocdu2U//SUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553845; c=relaxed/simple;
	bh=hME/qbAWxNKH+RRiKD6tgYF/Qxg68RqOdtZkGoM7bbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMhVAa5Xv9PwElLZKW6IcbvhgQPj89Moq5KvjqWLixKpMkiJtq8OKZmEqKcn6Ln8Uiq7/lecPS5Tng9RJZ3aD2Yy34mftBkoqSy+j3M2f9JovlWMaghZokvB/IQslRX1t8ghJn7QfShqBrd4wuFJMdrTu+jZLM9MXIurIMC7C2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7QlYQNG; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7QlYQNG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8d00e782d3so701744a12.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 02:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553844; cv=none;
        d=google.com; s=arc-20260327;
        b=hMuWof2RxDvfBqoYHpFksO/7QLrwNZyjPlQ9pfhe9yKuCFKInjrSuER8cgzj7vp+bk
         GjErdtQOFpmCZCC9cclIlUJRTnKD4zZgvkXwBxsAYICLuG/KJdiD2knETro/RLL206z+
         gT6IJ8+UXvWNxY0mqnnvTVLL2Ux7zD7rpppFJ8H6pBsODr0GH9Hni9P07U0m+3tBL1jV
         4FS7jM0ZP/G3VtYCMhk8JKL2SH11pgr/S034Ov1ic8nu+C3MaiqTFnB04yjoX74X6X/e
         IHLHrrisnu+hkEqX/AAs7O+agvuuLMa5TGVMofZTQe68GMgF3lwQMBRotcUywE5L5BM8
         rVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        fh=fPsaLa2cDwPD9ewpHOSo91XQPusfUIKk3XKoa5pioJc=;
        b=jW+mZ9m5VwWpYdYMjBe5pGcOVJMbm3qwVNZHJ5MQtVycplkhmS8Unbe17tl5sZjLMT
         ymb7HFheiNVnziW4qgR5MJjlvwtpUcCj0NCfFi5GlH5JL0fDX5A34P8zfncXc1HrH0HL
         7fy75Kr1O+NDOcsHKBJLu2pSmsGnt8rKBsBHWwsjUA/JgOq0+kRs2HpFGvoH6NKAe3Tw
         rTa5P9dd5Li081HEw6yMVPFR8xlE+AWuCQNRmHUEuNsZxn789WcOzUZjTEWOyac5GAfp
         siLdjTsYdJ6FXbJ04TGl+FDab3SxZeIB+8ndQcARHFlW1QMhNpxYYc04QwQZND8Vp/1S
         knoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553844; x=1783158644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        b=O7QlYQNGoyHrQHkfEZHNM2+PTPDJDosDm1RNDidjozlZ31aqPBEAw4Fv6mOUZk7Uu6
         3nQztnfwe09x+GEMvulV4Kjjh1cs9h+r1DXnfo2Ky67Yq4g/yHFDFgozcltYx+GBflm2
         EV93YCPktsQ0chPyEJo+SyjgX7t9NZcAHP/wULR4ImcH80BJq5gIsGY8YeTqz9iH5LnC
         xvFvHfMCSMMhZ6tcEcyT6cAPrLwKk04mo2XnR3rXzc9cyfeRIQDs8HTs/UGLCmsBni5H
         7iRBtzOBe55JHD6p6P7C8cx2ETR8M/NGlDzjUoRjx3uCAAqJ9KdwdO5IVz9O9kpgBGO9
         EKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553844; x=1783158644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        b=Bg13hDv3BO4Ao4jPHG+MG5G5NK5976h+t7jcNwcNC+o9ME6+uuknKuw89qB74lGYjs
         60NrjD4Enl6bxt49lc2yuGpe+rnOWHC01meEQv3BzdN5dPIRVMyuXIkxPhUArCJ5mj9E
         GQHWcP3TukNxHCpU6Kj7/OpR6v92xE2YHu/M6S3RV3ctY84gt3tvWJywGuMJbAyvnBoo
         87BNimpmn9grKbqojBEDVDTYm+Ehk9iStdwldi7zasMZYcVC4Jw6W5oJjxeY5eIrT0DC
         D4kYbiaV/E4g5PLaHf2qo+uz39/kdRQghvpqdD+IqQ6HOj8qjsmMpg4tcqYQno/j+6Nj
         iPVA==
X-Forwarded-Encrypted: i=1; AHgh+RrakZM/z96UC2OBCgob6TX0tSlfNF4dR7ASdeoOrPCqh1Cb3BANLGH0vIWN+yRJ4Mcm3abrR60lzAdOZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbCaBQ4txSFiVoxiwhezZ18q4iiYrwUD3btM/iNxjrxZMjB6G
	OvzfRBr/i3QQcVbAu4DrdcthlCD0B2O3U9oFnOp1YdxwbiSQ6dwSQ7GYxSuKPe3RFJfXzXMpM+o
	Cazpc10qm0MpIf7T5C3jS34f3BjJl5dA=
X-Gm-Gg: AfdE7ckIQHcgWxY8ahhdRvOr3i3MEQD146hL+PnTlxrcwHgV9gEFWNwunHRPFvJuhMj
	cfxiJSP3iX22hupRbIwYgbVDhKFJfWbqfWmjophgNX90OKTi4XGKke1dQx+5vxE0puUtttgZT1J
	3THBB7sUb4m6yl8lLB8G23NhPGPTqLSuWwGjacMoKes7fUb3vVkjiIVK9A6ZlwHfpEWkfXWiOlg
	VxkHEmRe67+K+rLYJaK15+WlSq4Xz2ChA3Dosb6TVVmzbPFDqzwJvO/aIji/i6M7u1IM5ufIwmc
	s7E/UOhV044xpkg3F57XFBIrdx+TnkJ1Fb5+mpk2obKBs9X42684rqHB4NWh+Q==
X-Received: by 2002:a05:6a00:94d5:b0:845:ddc9:2717 with SMTP id
 d2e1a72fcca58-845ddc97bd7mr1049159b3a.4.1782553843902; Sat, 27 Jun 2026
 02:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com> <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
In-Reply-To: <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 27 Jun 2026 16:50:31 +0700
X-Gm-Features: AVVi8Cd_wdrnWNlCE3sFhO5Ei165WoKyvN2rXVN0sU7ML0KMoWVobNpNmXuVrxo
Message-ID: <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com>
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 7:57=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> > > ---
> > > -     if (!jack)
> > > -             goto done;
> > > +     if (!jack) {
> > > +             regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SEN=
SE_AND_CLAMP_AUTOCONTROL,
> > > +                                CS42L43_JACKDET_MODE_MASK |
> > > +                                CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK=
 |
> > > +                                CS42L43_HSBIAS_SENSE_TRIP_MASK, auto=
control);
> > > +             regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> > > +                                CS42L43_RING_SENSE_EN_MASK, pdncntl)=
;
> > > +             dev_dbg(priv->dev, "Successfully configured accessory d=
etect\n");
> > > +
> > > +             return 0;
> >
> > I really don't like this duplicating of code blocks, it takes us
> > to a situation we always need to remember to update both blocks
> > in sync which feels like it makes reviewing future patches very
> > error prone.
> >
>
> Hi Charles,
>
> I understand your concern about duplicating the code.
>
> My reasoning is that duplicating this block once lets us eliminate 12
> `goto` labels,
> which I think makes the overall flow easier to follow. To me, that's a
> reasonable trade-off.
>
> If you have a cleaner approach that avoids both the duplicated block
> and the 12 `goto` labels,
> I'd be happy to adopt it.
>
> Best regards,
> Phuc

Hi Charles,

I'll factor the duplicated code into a helper and use it from both
paths in v2, for example:

static void cs42l43_apply_accdet_config(struct cs42l43_codec *priv,
                    unsigned int autocontrol, unsigned int pdncntl)
{
    struct cs42l43 *cs42l43 =3D priv->core;

    regmap_update_bits(cs42l43->regmap,
CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
               CS42L43_JACKDET_MODE_MASK |
CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
               CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
    regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
               CS42L43_RING_SENSE_EN_MASK, pdncntl);

    dev_dbg(priv->dev, "Successfully configured accessory detect\n");
}

Then both paths can simply call cs42l43_apply_accdet_config(),
avoiding the duplicated code.
Does that address your concern?

Best regards,
Phuc
