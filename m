Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A552D130B
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040987; cv=none; b=UzLAqUgOuwYI8u+YVl1UxdJVMZAcSEzKAkkmrBnpSMjS5a3zhRd7KBMOiLi44269KGMdJGqyRCYxZ++6ULrhG2Tw7FBMgAJjpLn1m0BHhhMU0hFyDCKRi2kRz7ET5hgnJ0xAvvmpEIxBDx9oZVGn4wPTWJHlV5GQzDqts4sq+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040987; c=relaxed/simple;
	bh=SGrk8/R9L0MEahgXSmzffJq3ChEW+Yrh4pnr9HdOfEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvADPtM+8NeL0WOeC0e2tb6YoMVzimvVKxvT779JuLwYhz7O6Ch1bIn35mtcF/P/zbEbMP0r60U4FQ7U7WSKOZfEVkY5dqMxTUqnjFKh8G1bnaIVi96UnEOTDsomIa/OR8gmYp80B7J8g63XIf27+dMOAN9p/lJabyYy4R//XnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4Cti/uw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4Cti/uw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso2051592a12.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 22:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766040984; x=1766645784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
        b=L4Cti/uwhW29ef+/ZrfxmX5Knk0LTZeuJDGMifl+tWMPwDR7F9yzwGDow3FQLPb9w+
         I0M5EdmuvFNuVfBz7Jmpmtr5c5EUjV8KtRQyxxqkVbQSsKrtfhJ1g9TGTrjHwv8zpWW7
         k4TsIND9fdeOsofv6ep+4ZuLRu/I2zQHtUjpv4jUNK1CtKhUAf1XKOIgkU7ibDQmDndz
         4GG1ao9pu0C2J+78XF6SLgCCRwDfCntlx/L1Las07++G/WddufedVbmFjWGNWxHoFtfW
         zlt97kN675/x7iqODlcjtrWieuAZrTMLlcpaLsfikGkSmuWN4hjhHUROOTogiPt2QitW
         uU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766040984; x=1766645784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
        b=qw+bNcagEyDQ192GJe8Hxetbu88tMvn9ia6arXJohaVl+l2c1tUOq4fXSvnUvEH4G2
         H+ci3MTjgqcbRV4Z1z/Dyv+m31s1NDuYDAxNK1AHnBdqPD4wUfigAoZ70D23L4xdLgTJ
         rbfq2JG8/tgmrAeCEuYLnKgbCEQWk9v3NirnB/bv+nFvMTthdFOflJbZgNjTZN8fm+lA
         yP2Jm8ahNwX5SVDiA4DLESAknI32CyIvZhYQzDTcVg7A7w8DWX3aL7qqnRxk6prSNnn4
         8Eagt/dZDvuUSGPAI59+4MVz94xc+imLJNU+wXHFcZCZyfWrcKvLXoQNgtYyCA1Kx41W
         vp2A==
X-Forwarded-Encrypted: i=1; AJvYcCW1iPsg8VpiXawRccRiOfFQlFjC4T3Hl5TrE1pqoigpMvu3p0Ey7kiGjOT6sqrDFLhdoFcfj/5uTZdlrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxY/ZigvdyywqrKH1x5KZqXB+1oqR+TI6FuzV4fk5Oa1u14GBU
	f7dcbU9QKjyJIsJWDV1ZQRUYLBNgSh4yoVskJWy+n3RJbCqIDPuZcyzvJgaCx2qiW6TCMc3ujiX
	iQ+MRaRnfAVhj19W4pU3aFut+0X/TOOc=
X-Gm-Gg: AY/fxX7io3pf6QNXyIMp/ajY7v9e0PJhokZYaldx1anz+y35JxnzxvNRIGLKBUiWj2W
	3YqFLnekWN5Csm35JFHj4s4MeNnOS5FvD5CN4MR//Cvi+VGipSkvGKRDjchHdkkU1ychwZP4evR
	q8pl29UHY1bdloQuF4fu00VgxpyKdwHjeObiuU3Yk+Fh3JYSiXgkZbLeYJMM3g0M16uCPGRg0TP
	eOyTCwY2hI8JtNkpdZyH51a45DJ+l00OmvGhXxeCr5q5cwWZ0vBWm3xgQk0Utcv/ZJQDEBaCvbf
	uZdSaw==
X-Google-Smtp-Source: AGHT+IHFwImRsm9W5Y58Yz5apb/espxQpExd3T9QEzf75EiWN/wCtlShDmcuZN7IAzuiQTmvNW7xlDPfmw1gINRTuvU=
X-Received: by 2002:a17:907:3f9f:b0:b76:3d56:f666 with SMTP id
 a640c23a62f3a-b80205ed2bdmr185161166b.26.1766040983515; Wed, 17 Dec 2025
 22:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216071656.648412-1-chancel.liu@nxp.com>
In-Reply-To: <20251216071656.648412-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Dec 2025 14:56:07 +0800
X-Gm-Features: AQt7F2p6BPzhm3Mw9s2b1rAKAfmA3zbdy7Nz3msDjejXjz_TkGWdEggdG6FTAGM
Message-ID: <CAA+D8APq+6E49pSuKs0yZ9F5+SaxQaSq5shsxSFztLROhyLCpw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Use of_property_present() for
 non-boolean properties
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:18=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> Otherwise there'll be kernel warning:
> [   29.018081] OF: /sound-wm8962: Read of boolean property 'hp-det-gpios'=
 with a value.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index 2c7eb0baa0f3..70a6159430ed 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -1045,8 +1045,8 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>          * The notifier is initialized in snd_soc_card_jack_new(), then
>          * snd_soc_jack_notifier_register can be called.
>          */
> -       if (of_property_read_bool(np, "hp-det-gpios") ||
> -           of_property_read_bool(np, "hp-det-gpio") /* deprecated */) {
> +       if (of_property_present(np, "hp-det-gpios") ||
> +           of_property_present(np, "hp-det-gpio") /* deprecated */) {
>                 ret =3D simple_util_init_jack(&priv->card, &priv->hp_jack=
,
>                                             1, NULL, "Headphone Jack");
>                 if (ret)
> @@ -1055,8 +1055,8 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>                 snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_j=
ack_nb);
>         }
>
> -       if (of_property_read_bool(np, "mic-det-gpios") ||
> -           of_property_read_bool(np, "mic-det-gpio") /* deprecated */) {
> +       if (of_property_present(np, "mic-det-gpios") ||
> +           of_property_present(np, "mic-det-gpio") /* deprecated */) {
>                 ret =3D simple_util_init_jack(&priv->card, &priv->mic_jac=
k,
>                                             0, NULL, "Mic Jack");
>                 if (ret)
> --
> 2.50.1
>
