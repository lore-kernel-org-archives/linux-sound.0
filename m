Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435453F7A8C
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537101; cv=pass; b=ApNSXd6E8UWQ7l87jDA4xtzrAgiGLF42IrvEN0xnuzAYxlx8S3RF1QjsI7WrrUO3XpQ6QaE0PGWu4vc5/c3L29XzrckKlW0K0FaLmrwSfZiS16Zu6wbbs0EVsL5qVIlKrIGW8GSvSq9u4lMy14mUEQZNhVRyKvaera09DjbrZfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537101; c=relaxed/simple;
	bh=qen78l6/y6sJoCnzxW/EuqNTnsOUTtEg/3QQyPLNxXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcm8bzXKgTm1Dw4Kv55lLpaKqfw3sYbXeIhgjz8BiXLCcz2krcaaPEQIxkfcKBQxXQeNqQbez2VccAeW8yFuhtsx2pIvGSu2TVSSMbalVgzDYgoAO4I1JE7cRa6dDDsN8YLGsAFxDyUPz0zFiqglD/KJ2K8G0m+tYKmA0e6cVfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=AsojTbTU; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="AsojTbTU"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso138531066b.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 07:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774537098; cv=none;
        d=google.com; s=arc-20240605;
        b=HEr6enVz0yqG34zM9DxDGWxM0rgf//ZMaI/Dh5bu1/2gdnBNdDf0NDh0HLrsCsXqhe
         otUCY6hwFABFK5jZqpX8nmKIMtej3LNfoQ15lnBvoC2kKkx/dfPQj8TElbDS6Yxf1ZMV
         M1jsoGExaSbU+KqeqF/r7uREI4qvqKandqp45oe/DpZu0qt6YVrYG9C1iQIH0h13EywB
         5FBNZ02zU+baRb1UTtVKjWTrHrQih7Ri49t9MDGjGgPObFJpkGiYYWsseAIZweaI22ks
         rqt36FifwJmfQSkED3a7gfbnSOuqZ9tb5jCqop3hfWrgdlLa+C6Ok2lJUtVYM2E//TCp
         komQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=;
        fh=HREUUm+cCXiID4xfJAtxXxEt5EPyzCNFFBB33C9IO8o=;
        b=ErKopq79NBqwGztQqTP4God/u39xHgP9nPaU+KHvkD1iqrn7xg5chUjlgSrmvo/B4j
         ASkljuQVJyzFqJyrNexmNrBOpSK7Sp23cM+7AfO+eJhg0u0/FiJK/6PTWXPTrsgPT9Jc
         HyZFtEEgGtRyQWX8vtvGIDGxjQbg0a+TwTOyaYpuyIbKmaCQ3wTNd8RVDCbDsxB2JJX3
         1syf8vpc+wRQZpsY5UAYy4aZpZyxjRM3S++9Olv25aCagGnPC2QZ69bxx3UAatpNQPjA
         EuzCBTT3Cr51y0WX/3P2CG9ZJLsgPBKpNvHmBBmDKLP7a+F6mSed2DK/PvIeMGj6ehaL
         WYUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774537098; x=1775141898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=;
        b=AsojTbTUHpstdFQI7NDgrqcjf1RFU6/oSnk3CXs/8LGACqEtgAJ2MW3qnsKluZ/8+S
         0ucZNy23+6OyoToFo2KQfIrwq0SUrEQVZbCmb0YI4kN+AHuYZ4b22SdH6F8v1rZfwSpx
         KISreh+sC8DpfUfd4rxNqkYh6ds9Un6G4mTTXZyblshSyR9I0eQHED+bB2TnKyUjhKsa
         KbDKFipImrqQrYzH0ArGKuh0Tz1B76T4TKE3/kxaTHuVC5VYWLvBrZChJv9ByNS0RX4b
         QS+XPBAVpSD/v1o/YhA3jTZjrYkk7m2uLaE7Op5WG9KhHwmj8exb4PzBsKaQDfHkMAIS
         EoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537098; x=1775141898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=;
        b=P17qt8VGgnYW5mX6o8y4z0E8OE6qszD8rQGjt29YWWXlzjocnNMPN45gHrVkC2NIHr
         obZNPpUZSCXsq+tugFZK/Yi+tMCIG47NNn/T1PAVvLp63GDurpgkudDaOBCcLap/6Y3F
         S+YKpeY18ZTPUE+hJgAcoGcMleIouZ4wT7P9IYZ+VcsjOa6hPUZvVAMTEs+OqNKJMiTm
         bLuk1DRY4hBJwihny4PlYfWPxWODdehiQ0BM28BhwmMkY5OAfBEitmyo2fXKl+XrXr66
         u60BKZdC9/Pe5uSDHWWlttHS1XdlW2fbaAQ/R0xlV6qKWvSk9kaOn2g3EhWlvBvLsPLV
         WAXw==
X-Forwarded-Encrypted: i=1; AJvYcCXuTepsIpcwoJh2sKQJ5Yzoc1bTcqoEigb3X1AHFBcKLvLZ++EwGpFgijzWq4ooKmMfyHeWFoSLTWsEOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgwz9h0yylvcPCTS54UvKShlcayUjacsNE8oiEyX+DZaQb+2YJ
	/eZ4d7sBjMpax9MtOqBCfthfTaI0M79vK7okyyfgim5O8b8QrGgA8Rqp/dzq8XLBLa7WCczNLc3
	Iz2BZX4btIuVbapn1k16JINaEJtbn0ejh3ZliEW5jcg==
X-Gm-Gg: ATEYQzyouX8GbE+56d+WusUz106ekUlw2hlHtd+RPfxMjGzMNG18yodHdL5pyRTIT4J
	SxDwgPjZ9u+TvyegOmMqqoJSNvVTSuCOtujV6oWDY6P3m1EtZ1SzKA+/QTJbO9bNnyB6B36VJqb
	ZR7TtpmudbBtBwofevqKZ6DLe/+myyuildYXyo5hhMKdYuGoGDECEr2Erxp3BSdVv4Ap7ik0lQh
	lJRsHu5ezFOI5sQ+1JsBEhPAm21wJwlc1cXlp4NQeoUZjtm1QHOMYQsIFlUqoX1aklvLxthRdW5
	CfuNalo=
X-Received: by 2002:a17:907:1ddf:b0:b98:4104:1f83 with SMTP id
 a640c23a62f3a-b9b34713aa7mr71321766b.19.1774537098508; Thu, 26 Mar 2026
 07:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net> <14828456.uLZWGnKmhe@workhorse>
In-Reply-To: <14828456.uLZWGnKmhe@workhorse>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Mar 2026 18:58:07 +0400
X-Gm-Features: AQROBzADiNamIvMkTjLneuBvCLIAqiBkToo-n1En-MLhpXfCGuUuqWIWcusA_qc
Message-ID: <CAKTNdwEpQssNuuvHG7v-wXcwhVSUcg+o5B2jM88JQAuChcWWxw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 11:56=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 18 March 2026 15:50:25 Central European Standard Time Alexe=
y Charkov wrote:
> > Currently the slot width in non-TDM mode is always kept at the POR valu=
e
> > of 32 bits, regardless of the sample width, which doesn't work well for
> > some codecs such as NAU8822.
> >
> > Set the slot width according to the sample width in non-TDM mode, which
> > is what other CPU DAI drivers do.
> >
> > Tested on the following RK3576 configurations:
> > - SAI2 + NAU8822 (codec as the clock master), custom board
> > - SAI1 + ES8388 (codec as the clock master), RK3576 EVB1
> > - SAI2 + RT5616 (SAI as the clock master), FriendlyElec NanoPi M5
> >
> > NAU8822 didn't work prior to this patch but works after the patch. Othe=
r
> > two configurations work both before and after the patch.
> >
> > Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) =
driver")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  sound/soc/rockchip/rockchip_sai.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/roc=
kchip_sai.c
> > index 1bf614dbdf4d..ed393e5034a4 100644
> > --- a/sound/soc/rockchip/rockchip_sai.c
> > +++ b/sound/soc/rockchip/rockchip_sai.c
> > @@ -628,6 +628,10 @@ static int rockchip_sai_hw_params(struct snd_pcm_s=
ubstream *substream,
> >
> >       regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_C=
SR_MASK, val);
> >
> > +     if (!sai->is_tdm)
> > +             regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> > +                                SAI_XCR_SBW(params_physical_width(para=
ms)));
> > +
> >       regmap_read(sai->regmap, reg, &val);
> >
> >       slot_width =3D SAI_XCR_SBW_V(val);
> >
> > ---
> > base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> > change-id: 20260318-sai-slot-width-378eed5c22cd
> >
> > Best regards,
> >
>
> Thanks for the patch! Looking at where else this reg mask is used, I
> got curious about `rockchip_sai_set_tdm_slot`. It seems to reset
> SAI_XCR_SBW back to 32 when something calls it with 0 slots. Do we
> have to adjust this as well there?

Hmm, from what I'm understanding set_tdm_slot is called before
hw_params - e.g. the Freescale SAI driver doesn't even program the
slot width to the hardware from set_tdm_slot and only updates the
requested value in its internal data structure - to be then written
out when hw_params runs. So I believe it should work as-is, although I
haven't seen any TDM users of the Rockchip SAI in the wild to verify
:)

> I think what we're running into here is the difference between I2S
> normal mode, and I2S justified mode. In justified modes, it'd be
> normal to have a slot bit width of 32 but a valid data width of, say,
> 16. In that case, VDJ would specify whether something is left or right
> justified as far as I can tell.
>
> So basically I'm wondering if we've accidentally been sending
> I2S left-justified data all along when using SND_SOC_DAIFMT_I2S,
> and whether we should only be setting this in SND_SOC_DAIFMT_I2S.

Isn't the difference between SND_SOC_DAIFMT_I2S vs.
SND_SOC_DAIFMT_LEFT_J just about clock timings / edges? I thought both
can have slot width >=3D sample width, but I could be wrong (not an
audio guru here).

> Either way, I can give this a
>
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> for ES8388 on my ROCK 4D (with my enablement patches for it there
> on top that I need to get back around to).

Thanks a lot!

Best regards,
Alexey
