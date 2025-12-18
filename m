Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2A2D6621
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040942; cv=none; b=QpViMipN6pMXg14p0PkIyfZVEu971lj/Jf5y9wjflyHPVqPEezpQ2gEOr0lyzNWIOM4/qJJLqbrfltw+KBW8QRBsMFHOFI4DxXn+DlyK952QsQdzBVTY7J6rAOmaU7nrzL/7jy01NabuvxQNoq3GKkWlygIAUechCUR21hJW6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040942; c=relaxed/simple;
	bh=YIE1EOmCRHtMO/kPVORCgGNrT4RrzT4iZdUll5UYyKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/NZmhBvgyvxlNXjTX3YJ9RQwwfMwd3Wds+mtnIIflw4KXNyWiJKtzvRJSST6FDtX1xbrPMSHfwdUoNdeoCD72wXRSKZ73+033i2ErLgzH1s8sJoQqVh6ALZOGxcYRfLOV/Uc33s6m7tRep6Piejbip3hgflcWX44nW5X4oWYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j25sI1AZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j25sI1AZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7a02592efaso38129366b.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 22:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766040939; x=1766645739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrVE2KcGXBi0Atmn8mFR85kpZV1jO4gtfgfLILXctrE=;
        b=j25sI1AZu2Psjl5HF9vgQ3/pDUjpCE8fiIS8pFT6H+yE+95/6z5BQbfTRlvY446YlH
         S7vanz41TToYzPf5o12Y4vz1dqHschexPo5Af6Ug8hq5ji9+ep7fwEV6Tz/r/N6AfDid
         Q5v21Ppmh2VRDdO17RnMjH1ameHlRd15hjMUjuvhxGHW2PD586+ZBqIR4hbpcLW7uUwj
         wJb8iBTwmvRU+QsJgJ0BQSKh01ZRfXU+7wTRe8CJ22MqJWA7r1lB1HRxltOyiMTAa4eh
         fohCIEjM56iqgk5aoTGQvUOcUsA6ci9Mr6FAQPW80/FAigGgfYUMN66cxtkhWxnl4RSi
         weuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766040939; x=1766645739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QrVE2KcGXBi0Atmn8mFR85kpZV1jO4gtfgfLILXctrE=;
        b=XL/tXHMBerEgw+7LqdV+Decw0teNnmpGP6UOV0FXwrnPTddb0THrBfaVF/BdDMBbjT
         g16tjgPqVxe09gn9Yo90FIqQzfZzJbQMvT9MiurJRpJT71TIPknDhWj9lb5m/7ywYYrG
         zCrVj9Z/8NxVUHN4FhhpSdJPx2z21xkGdNB39JnsPet41W4xOLoHoDBsleAMeUYSRbdO
         voxJTCtF82rpncUnTbmHv19MRH5nPhcnv3guObiNeKp9sPxOVzrdvAUtCaRNmi1xrDI3
         OOUJ7pSfeVZowGPGAGJOpXiW4QYcAncvTucx8BvzoCDsZbfeoRmkXgLu4DDYm7+6Rr4k
         J9nw==
X-Forwarded-Encrypted: i=1; AJvYcCVBjJvnANk/awzNq9kcCd1eUoTZQJSgWievlbOqcOpXa3X+yaSJ/f2xhsK2WyzBSCw6pnOkH8x0bNZWxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPW7T1UFtOYDy+YCIyA4erzvwj/TNoV8Wfh7BbPs6ftKFng3f
	woQGF4bfBcGbnpveZfS6x5ngBwM4pqy4OqLeQPM8xV6y82uUMt8QCeUWCYkZkzX67zWlsIAw9BI
	cCptnM4IKX4ZqgS2sls+JosyQlWSddQQ=
X-Gm-Gg: AY/fxX6En2LRUkjAI7beVhf3Zj9qYJ+Fx5mJpHiMD0fY537QBUdWUb+NhkBcJUAfLe5
	s9UBW8LoZNF8+Ll0Phh3ApZIl9k6b6TV4zPiytyg+NP+yizK+L3aSkUaTFVg1afVRWftfczi3BQ
	drsXWtj5LfjLiVHA3yxcUpJTF7ZZShzX05i2BBbMisBQueuq99MJiuoroImfQXX7PZAftZjI2Ey
	gssXG9zChepi+EcypNQQOFqZta79PA0JB1kjqZGN/vt9NHwaXC/482Z4Yg68uQCcMkcGTA=
X-Google-Smtp-Source: AGHT+IFVtv3SN7EhG9yj2zoF3CpDy9wfUrXmSKZEO64lRC9GjDK1c1PjO8dPKUA6ldDWoTTkudxxn5ZUjz9/pHO0ALM=
X-Received: by 2002:a17:907:7fa2:b0:b72:a899:169f with SMTP id
 a640c23a62f3a-b7d235c8368mr2164552066b.4.1766040938417; Wed, 17 Dec 2025
 22:55:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Dec 2025 14:55:20 +0800
X-Gm-Features: AQt7F2qzuMCgg_s91NKhEOxMP9BqcCaEF3579ygcC2BtXPNDjH8HY_EZGntRn4Q
Message-ID: <CAA+D8AMd-4qwYEBQ-JC1D88MRCj9ogeVspN+w-87P8-MWP4FmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: provide regmap names
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:50=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '30cc0000.xcvr' already exists in 'regmap'
> Fix this by adding a name for the non-core regmap configurations.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 06434b2c9a0fb..a268fb81a2f86 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1323,6 +1323,7 @@ static const struct reg_default fsl_xcvr_phy_reg_de=
faults[] =3D {
>  };
>
>  static const struct regmap_config fsl_xcvr_regmap_phy_cfg =3D {
> +       .name =3D "phy",
>         .reg_bits =3D 8,
>         .reg_stride =3D 4,
>         .val_bits =3D 32,
> @@ -1335,6 +1336,7 @@ static const struct regmap_config fsl_xcvr_regmap_p=
hy_cfg =3D {
>  };
>
>  static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg =3D {
> +       .name =3D "pllv0",
>         .reg_bits =3D 8,
>         .reg_stride =3D 4,
>         .val_bits =3D 32,
> @@ -1345,6 +1347,7 @@ static const struct regmap_config fsl_xcvr_regmap_p=
llv0_cfg =3D {
>  };
>
>  static const struct regmap_config fsl_xcvr_regmap_pllv1_cfg =3D {
> +       .name =3D "pllv1",
>         .reg_bits =3D 8,
>         .reg_stride =3D 4,
>         .val_bits =3D 32,
> --
> 2.43.0
>
