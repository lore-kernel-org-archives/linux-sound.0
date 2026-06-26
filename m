Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5313EFFB4
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478649; cv=pass; b=NdT2OpuNEaYUqSlxUzWv9wGiZD93kNB34jQxkszitNq1CBfahGTO5tRvxA5TjIXvjB9Y5eI7YmmEUUWEjfj+cmSgppwnUdfH6FXsbW1zyG35s+j7+AxDUqkD0QKMuPGa2YT21v704sOWlQLFJ56qcIpPSAvU3S1+qDvILG47hxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478649; c=relaxed/simple;
	bh=8sC/X8kFjJJJ17yx82agnNOpLpbjIzUNwznUcxru8No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWIQ/EPO83O9JvfSTACuWtdMGR3hu7rUTvZ4MDWWlIeStoz2bjvqD1bsnI2Eac+k60HqWZ/J0tbq8Rp3acQfg9bmbAy8x3Mwjf2ose2roepQllu9aQD3o8L7+LigU3ien86CVwqCDvrmZ+D25zKtfF8S3dfHF6fKlLydqMzDHck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAKSwYL6; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAKSwYL6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84538597e1fso427490b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478647; cv=none;
        d=google.com; s=arc-20260327;
        b=o0d0xlIpbA0O597bBwI2z4C3zEjnLp0I3dKoW1vr007V+B2N0R93H7MbLY0E5hS3zk
         moT6MzlkXW6fGCTN3dZTwgmKEX2UWfIJ0xtruYNxmEVMXYKue0K7hgH0jRtO5Tnv9+K+
         QnoGGhZw8KJQVQcmJHevd2BCLV3bhTUzpqvUuEDbfNbdWlWnhssprzBeZY9IlTP1taLE
         1tGKIlvoPggUxGC4zhluCoVdJ/6alqAshdrQGBDCEE7leL9tlpkeZ4q1L64XVYJpK2We
         w4YBNXBdIOakMJ4uGoK06F+mnznec4s6k6LKexsHwvK6hYHX7hhl2alxcm66DKkGtj13
         J4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        fh=70pU1lorGMBZ3Gh3/A0By85fnNfc1Q31ZHt6MlpH07k=;
        b=KIugjM4ZBJUe+v5uJj25WdOKCerBLnGkxWpNJSfUosZNYGm8i7NHD/IRbkhn1SEZLD
         RPJ7HwRFdTdOiC/fPBO6D3x2SgIpe+bG2BsxsyFYCGeGOK4PYZoSwcJiq+SMfOFqlC04
         zYzDf8sG2UMpdS6jiU5uJZ9/jIIghS1g1bZb5D+VW65yymyX5410crFP9wgu2/y29CID
         RztCF5WdjKaclJWtinE7MGpADV3VZEV4TWtsIw4v9eIk0Bzm8tTMmrteVFKPP7ykUTLx
         p+LbVYR08OzKEnEqCOwhKeSercr/MNjlFPsytx6HUZoUhQp3Ydc/B0dGc8OdJleLwjhp
         iCyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782478647; x=1783083447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        b=GAKSwYL6uTC44Cb9l28DyaknThaLuHSXT9OXbpcanPwVgvwlsES7c7SjFJ0zAUAsiX
         MsCOQGe5ZGMy9yjuq7SbxorYkY85Ag0/u7+B+Nb67g5aGGfjUyhtb2lCyG+0lQ6hLHje
         rk27NXCsaKo6Zw2keOaqZryHNrtdKdq1dfuIw43sB5CgYgUgEilG4Yv1WLdG80h2hgSw
         ROaDWTXPTvUBSdGDLI99vogtVkAhVmSgZ50UG5bX2CY56asMACtN+s6dtbyaFAqRj9sw
         y8LQOhcT80NAwL93xisL3Szrvt3pljuaWfrr+H3A7QsZwiqamj8bO11hL0RwXR9/QlLp
         LopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478647; x=1783083447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        b=g5TvvFiAMZB+pDBUI8PMuQ7BeWBVINICzavEc/Nzf3G/7M3qeSv95iQS2zGUJyLJ88
         5eTkmEM1RvkG6ZGEJ3vd3qIlpRSeYD/GlrlozDw+/S7MHM5fryHZaKAU7gvqfhVZNaKc
         wnDKOmyqwZ0A/y/z3pjqELgjdf9R4XDWngR20qbvucLnreg5xELW4Vx2jJvVeyCC3tyU
         qxQuKYY1KsEHkBOu2/ngXDeyZF4cuDSiAMIk2jAbl6qmOwFOqctdrw2L2QjvjS/rtsrX
         Kc+AJ2P51HrzR6nOnlmtlU+wGGQFD/8tVsl8EGaw4nY1zpFONwLJdAVysIpYkq4F8qH2
         b+ng==
X-Forwarded-Encrypted: i=1; AFNElJ9j2d8QKYzhj0/W4ARYqeB63Y4POWljxvR5mlrcQxQWdYkUPPGDH18bwdiay2M1CJzmcPVRQq9rp5p71A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuuLkn9eI5PObYqM/yuNEEB5sD/skPmK+kJ50vcZquPjfV1JM
	umGZgzse6E+gVseSPYWP6ollhgSYL0u0S8+cDJw9uYj40mf4V6GgAveyUid+/dUslXclUrkTI/i
	8FFdtjw/4cjKeDZAuauagFjQiaTgsMx0=
X-Gm-Gg: AfdE7ck+H2MHLtWmz+mAA3uZByv7iaIo4PokMzjs2w3SdiYN42AdJxKJDV+jZmenxeY
	PkZA313f40hne5Y5fqNcQ7GEsyGLSwdmqcPeR+UNKXi5s/p/MiCILH0mQcbx64pLmD9SfEJYGvL
	us6S9O92CJyhItEoCzcOSI4xHb1+gE37CdKufVKfJQAudaCswEuJJbDCJIe0LDjux6ghEZQdOa1
	4InmXzxvZpWkvF80mgXI5OLZu3lUjm/bxoQpbdLDW21vp1aLvPaqxW14AlrAfyaZBzSnLN3SB5V
	VWXHXzXPjUtGGcULUc3mUKZRCkshrO29mPd4NXBPH4HSXRgAhtPaZm+NU4S+
X-Received: by 2002:a05:6a00:390b:b0:845:6252:f69b with SMTP id
 d2e1a72fcca58-845b3b09722mr8163064b3a.46.1782478647492; Fri, 26 Jun 2026
 05:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
In-Reply-To: <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 19:57:15 +0700
X-Gm-Features: AVVi8Cf6eb5dnLbYsqjVNTri5x3c-YQFHB_0iF60ES0iQWHt02WjGfax8ERd-Y8
Message-ID: <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
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

> > ---
> > -     if (!jack)
> > -             goto done;
> > +     if (!jack) {
> > +             regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
> > +                                CS42L43_JACKDET_MODE_MASK |
> > +                                CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
> > +                                CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
> > +             regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> > +                                CS42L43_RING_SENSE_EN_MASK, pdncntl);
> > +             dev_dbg(priv->dev, "Successfully configured accessory detect\n");
> > +
> > +             return 0;
>
> I really don't like this duplicating of code blocks, it takes us
> to a situation we always need to remember to update both blocks
> in sync which feels like it makes reviewing future patches very
> error prone.
>

Hi Charles,

I understand your concern about duplicating the code.

My reasoning is that duplicating this block once lets us eliminate 12
`goto` labels,
which I think makes the overall flow easier to follow. To me, that's a
reasonable trade-off.

If you have a cleaner approach that avoids both the duplicated block
and the 12 `goto` labels,
I'd be happy to adopt it.

Best regards,
Phuc
