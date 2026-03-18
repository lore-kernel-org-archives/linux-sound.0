Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A22264A9
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 02:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799522; cv=pass; b=CbuKYj1eG9O+jTw+EV7TsVJ0a1EI3UADL+vlV+3EmABJ+vJCoi4keugcrYFNeTvtwFhZIE8kwOwqF7Z73rAKFVzQ7L4BH+Xgo7ZUFJAXtIYurzfPA2M+m6D46BIbMt+FqWDvCtuJ3919cXNOonu+ZSrzgdjpuRipMBqaZ2pr3IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799522; c=relaxed/simple;
	bh=FxJQIvrlYKZuo4Fzo8QwvheQhD+M0e0Qga0NyGzQkeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmFutFuTnsSDGGV3RWqeG/HRU2Rdc1Q5+edKfbQj/fyE++xvzkghVF7HV5YzR4CdwKGhXzpMnuwzGtHUgWJdaA9smj4akCzySg8UPcf0gXDZG8ankXydF/b+3smNDAuibDUshW0JGAZL1FDLoyH5k9M69+LA6Tg3hQSrodYJs1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBj+RuDE; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBj+RuDE"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c73c990a96dso2417670a12.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773799519; cv=none;
        d=google.com; s=arc-20240605;
        b=Ex328XovHW9bg0gYhovqJFNFcBoVrfJKjIU4fvU+t+JvgG1ngrjAa6xUx7LZg9U1b3
         xuoZ+abrG/KKtCW/4XAJ78JtkdrzMi1L9v4h4y6g0zRCqPGhQDdw/AeSprF74o45nY2m
         TNJpFhY1NtDIVZdEYK+7RTuZ+yZc0kpyxCdOFYSn2NS7WqwfsnCipUl9SmtDDQAFQosG
         IaslEEdUJ+n4Kk0uxaHQXRX5JIfcaAEG0jYHphtB0BJCHuoBJuuRe52ImFtETuS4dnD9
         ihTg/P+1tyQRj7yfhy2Y0MCrnZgKk7GLhrqSHiiFupHfYtGBusg18lJhSvYkZn0Rd+ng
         /bwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D1wB6+zAGFpj1W03t8MmVUIMr+nkYASdjIRRgXFoE9E=;
        fh=FxLemtuUaZki/6Im0zRvO8/a1osUOwGgpEOsSnm9Un8=;
        b=irGwHjp+pW5n3TGYuG+cX6dAcJWiWjUfIZTvEJzLqpRdBZylDkKLZn2SAXR29nJVRt
         3ant3Fzm9pYIOeCoefeyKcvCPjlq3EqgpegBS8hsQsrjhVZvuyeABxlthFTD+FNwhoUl
         9ESI/FowDAgpkTgx7g15UxrY5NgZ0lProzQw4bUZFD9QMs1EBOWbE7Uif/laGFzIvAaE
         PsP0tOZ8QXkRwIc7OfGAT7ErRL8+cfLJzALNm8qYCql0jaKPNWl+rMH9etyacdCHgGvv
         yfnxyd355B9hYQ5mUzrmNF2h4jnRzRcqAMVy5+nH3FuTUjO4RR59Ym3Ui2dBfVqvhNT5
         NVAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773799519; x=1774404319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1wB6+zAGFpj1W03t8MmVUIMr+nkYASdjIRRgXFoE9E=;
        b=eBj+RuDEKXnY1s0lUzdp3V6lTMD2t9IpvmKENB98S6spZYlfT547cY86v2+/ENHHNP
         NjU7ZXZWzWcki5+wQW6UPzD3qCfSDxzu0nmoq6ZiQR+R2dqdQA11KEbmu4hcBfObBuk7
         zbXAsDlCFWbIa9I0x+bnMadq4941aQtTS/yVavcatPDnADV9roFBXuyygnlLROwt2jug
         vMUDiPWR20NgSA68LlPGvVSAjybQcvbdcXkuBrorNfTxcdPaTesQzEHfj0quN6Hz0obV
         QwX16CaW5XOmnnkqgJ3n0BxAEomLbpzSBrpdUwA9MzDqgROCdmoL35YkYtkxQid+aWQw
         h1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773799519; x=1774404319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1wB6+zAGFpj1W03t8MmVUIMr+nkYASdjIRRgXFoE9E=;
        b=TnDjmQoNgVpRtYLUR0y3IrYSJfNHRWmstBwJMT2207CMWsTxGIGTni7IqE02TvoX0G
         P3rcvSBz28K5QZWpJRvuMp5jIeL/FIL96vW+mInZVEQWotPz74CX+tpwCHmDJvcUorgG
         89dcn3lIQUAkNmzUnK9l72d6GFUtewUtGAxkS1PuFN+3UkmIFYsExTsS44ZniQPjtEGz
         TuZeK/yaaZg+x+iKWd0ppZp54PvSRdPG78Gp1ojUiEdqO4r58BGP7S4JubcAwnQol8vc
         0i3oYtY6O0qc5+BKV8kr05ePq1MQSuQXWYUaRKt3H28df95n3rzqDRKPYYJMjOIRdxgd
         HxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3/NouBX66fKxYhRDGDjrEHrD+2rVNxOQBIDGDCFyzB2lMniBAUSQILwuTyyecvVKcpGnYRbt7cGBwAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvaASKiI/CgC+pMX4WWUkkpfBWdClBNMgWj9M8Qr3vyiiVx4G
	FIzAZ+cMjYStzefKVwHb5OMYuzlWO7EtfThXBi3yw0mEyMJFTtIamN2EEVmSOEwB1slVxZoA2QR
	88L/R3g8s6C7lmqghTkbwXENQBDGIFGw=
X-Gm-Gg: ATEYQzx1/R1xzOwg0EktMkUeO79hNJ4QlXdyOtjr2cJ0NQ/SKMMrFgKUDSK80KPrBON
	MvrDaeAb4Savu/v8CXSunk3+QoKigoW/6Itcg0e5d/iT7ahPMIem1u1n02VB856uvPaCl6g4Wr4
	ou1qfUgf4hc2rZ5HilKiP5//KE4cKj6F1SpeVfMt7kA52oe4DHt4jbbMTAS3SzxOEORDAkke9ln
	z/yl0fygzxRZ0nQajLALdJncsWaOZTzHxxF/r0cvcsO4Nm1CgJsxGZyygVvv0Rw6yTN6zhXT7Rx
	lzJeKlA=
X-Received: by 2002:a17:903:11cf:b0:2b0:62dd:3a87 with SMTP id
 d9443c01a7336-2b06e324a06mr17262005ad.10.1773799519214; Tue, 17 Mar 2026
 19:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317033952.462209-1-shengjiu.wang@nxp.com>
 <20260317033952.462209-3-shengjiu.wang@nxp.com> <af97f536-be17-4173-83d4-3f3f052514ee@sirena.org.uk>
 <87bjgmhwx2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjgmhwx2.wl-kuninori.morimoto.gx@renesas.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 18 Mar 2026 10:05:03 +0800
X-Gm-Features: AaiRm52hjGtIdLNQBDSTqu6_8eG30K_xRwaWvL9A7B_PsebpXGMBIagVsIxKVq8
Message-ID: <CAA+D8APicAkEfRRbWFCUgZ1UK7bLV67iuh-Yf0s5LkN-_Rv22Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl: imx-card: initialize playback_only and capture_only
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alexander.stein@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 7:18=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> > > Fix uninitialized variable playback_only and capture_only because
> > > graph_util_parse_link_direction() may not write them.
> >
> > > @@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data=
 *data)
> > >     struct snd_soc_dai_link *link;
> > >     struct dai_link_data *link_data;
> > >     struct of_phandle_args args;
> > > -   bool playback_only, capture_only;
> > > +   bool playback_only =3D false, capture_only =3D false;
> >
> > Don't we need to initalise these once per link rather than once for the
> > whole function, otherwise if they are initialised one time then any
> > subsequent links will inherit the new value?
>
> Ah, yes indeed. It is called under for_each loop.
> So we need is...
>
> ------- 8< ------- 8< ------- 8< ------- 8< ------- 8< ------- 8< -------
> diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> index 05b4e971a3661..a4518fefad690 100644
> --- a/sound/soc/fsl/imx-card.c
> +++ b/sound/soc/fsl/imx-card.c
> @@ -710,6 +710,8 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
>                         link->ops =3D &imx_aif_ops;
>                 }
>
> +               playback_only =3D false;
> +               capture_only  =3D false;
>                 graph_util_parse_link_direction(np, &playback_only, &capt=
ure_only);
>                 link->playback_only =3D playback_only;
>                 link->capture_only =3D capture_only;

This one may be better.  thanks.
I will update it.

best regards
shengjiu wang
>
>
>
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
>
