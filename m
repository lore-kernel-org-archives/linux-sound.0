Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1649CF54
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968446; cv=pass; b=Y7BUUKmbqWtL/r57+7DsZ5G8yUlz54Z+CJAYpBrK8D6UrCyWUCtQoNelf8RkQepMgWz8m4pv1uTyoGevVilW6aOQde/6+Sctbz/jiJrONo7a1SJMupBNNlsPhxSVTmUd42ARZ9L6TLrheA6A9zGwJXaZ46s/aYX4NAEoY3wDnJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968446; c=relaxed/simple;
	bh=tLFxslh9baVvXmIpYm9o+POl3faCnXysDmFb2JzF7bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LG/gTRE+vqL6fS4+HC+ZibIqmOo5DtXiC1cZqEGc8U+EWn9cPYYaintjzpROTUa1oXRcez5kGify7DnqC8wGiUZOVRxlZ8RaFbT5WgxI3YYtlc4coiVxb0XOu6ccW7qlgZJcyr4t5xP10zSP4RbjWgaK3KWRwE2W3VidKdFbUu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn4pgo0x; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn4pgo0x"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-141395927feso7304200c88.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791968443; cv=none;
        d=google.com; s=arc-20260327;
        b=ln6aCSkdnVzsoMDYiKyKDnvOBS9nfXnwFlP/zUlj0nJCDJFjICOdKfTDoWxjGDTDJJ
         KgcFj8emiGdERwugMFyDt/PXXURsK9OFzfqpfOnaQgALBM+shNh1waIcBc/iGC4vFzUj
         tC1KVhI2aR4o9bV7kxUxGUKudQDlLkpOYGbWqpZC4EmUFAzP30TlpXKUzQYjiG55wYup
         62MS4yGed+KnmTlIf9gPQHEWoBA3AZszNgX6Dbkb/ft7QiSQrz7lAPuJ2cym3Xo/fLmm
         kq/l9K/FvQJDlrI5EfereZVOmSmX5zcYd65AZ7flEMvdqnNQi/ha2EkJRbBqlQF9hZhL
         fFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        fh=ANG+y5/pUZ44zJ3zQQq0xoVPXmUd2GfAnFIHHS98pDM=;
        b=pBXHgF0hWTAM7v47n989QmZw92GviZMDHy1MDfN2RzX/Jl1TdatYFr+ii0ViUlvFRb
         picOUeangrVADcAEaAnQdUhvJU9qftrMdb24zqU0YEuCD4cDidFxsWJCsdO2jYjRuDKH
         QTRNEzgWiYOrUyfdDKC3s0WEVnnrO4XSaVwKU5B6E84eXulSMgMjrilwNIfj6UjvMNXw
         0N1DNhu+fbCqrotrEqieXk/g1fEI10yel2bb0zr6VBpT+rBoGjz6yTAjj7zqOY4TwyVL
         UtHkHL86KIBgENhdaF4/5J8b0MNSB1RQrDlrfT3QcmKhFaww0EQQW2N8bJmdilLAAs6H
         8VNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968443; x=1792573243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=dn4pgo0xHtSUKgUFKsL31ZRID9HudJwxvdKau/+p/4ayiXhPQ5paiDSZP6t/9jjHmc
         d/omFrVGUKCMKwvlIRp+nZ9mCceUM5c+IEu/cwSf0bU68i4yYHzZWIoP1xyFsz4G6oTV
         0R26qzCL3fJZk1t+lYLX1uvBMP7iiOfhd7pbPP0/sBBWh1onTAtNtf3tEUoz+xYImUwQ
         15R179ZvljmfPR77ebjef1Ll3pd9j+RR4Q7oa7GNfl3aBBAWWCpI4V7H8CBn6KtGEX/O
         hvM/MRYJkOIL1rHYPV/0Fd4sUJBDm9c8AFWYrkbAenpJM4AhFqRIybzKVnCN4yi+3MKH
         FLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968443; x=1792573243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=cgKfCYKqhwr3q+Dxin64wWzxMmKTpraONrFCafD/tLsnX+CYIPO6ZwxhYOXfh0A6QG
         C448OWHbEKocE2DHhYFCNycMZnK2cG/lQnw86m5Ri6c0BBA53TPVf/U2t9pE5HEFqGxX
         VWDeaFW+ELudCEAdoxbLn0MBZvJYYDLjfd3LhiraXVVbYKYlAkRxI7PJkNBJp7fh77sR
         a6Kb4EZ4Y+NDyHPrgPA2L07RGIisqVVZRX+cfO7omZre4MDVtujxq7Ll/sA7fgq8Mgje
         V6EwqBcN7G3NdLjdqW/r0PIygo1pRsijB++Re8pIm0M00KJ7FIJbz6vmnQpC704ATprW
         OYew==
X-Forwarded-Encrypted: i=1; AKwUvBxkp+7AaM+gRwjTJd5fut0Veghm9Ztn6odxNiCi2kwgaxcvo2tBm94Pwj35WF69pgTECdCwN+NdTyHSpA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxJEYtxOs7cnWpZ2TkspBYb96CHAjxyM5X4zYYO874eY5UUhjj
	gqtydVYO1NRNkvPW3sKU/x/zdR60qo+fuLiKNP5Y7H88HTIMI9uEaR6B+Rl+fanmlNVbM5i5rWX
	0SMz1Wil4cfh8IUKEfSQwWXl2wExsNts=
X-Gm-Gg: AYBFou38cG2vbgg4IUjeX3bZ4YRlVKwXVcQ3kWNsCp+tUnAXKs5AZ8oaQuqqHUlEV3x
	QCeJJwvpKOkyVppUOF1qf5URUIEYYgfouaTZzfznY+fsMBuSmSUMIMcNsi9CfxPKmSt+0OT/uTs
	qKRpcPkJLQ9wRav1IuMAsiNVOYIkuBgqfnpTAD5oWpBMovEKrkKtvx07GUtmRV7eJYo3Ji+9VHP
	T4ytlyxDeF84G06lUfTAJKWK+6jraZddF9+2jt3l8dNAYQskZF2AIk73I9QK+BfXkkwxaAcJ3ys
	RzKyzffBz3tgPr/P5N/mhHxHEeWIE2MUV7HCeJ1TUgCC9+JX2RyOx1IraXQQufQmbzjTMYGd9G/
	x97chDBHsju8E
X-Received: by 2002:a05:693c:8819:10b0:35e:7bfd:4613 with SMTP id
 5a478bee46e88-35e7bfd4881mr73051eec.40.1791968443288; Wed, 14 Oct 2026
 02:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk> <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
 <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
In-Reply-To: <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:00:31 +0300
X-Gm-Features: AclHuK_kokY8VK1sVn_A_0bMv0Bn9Zibgf0bMX5rADMwX9GRUM7_tx62sAWh914
Message-ID: <CAPVz0n2L_4ik6nS_eQY-tQqtdLqgHofumZUU7wJjzbLGVft8kQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:56:03PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:52 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Please make the entire comment a C++ one so things look more intentional.
>

May you please be more specific how the title comment should look?
Just to be sure we are on the same page here.

>
> > > > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > > > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > > > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > > > +};
>
> > > There's no Line Out or FM Radio widgets, you should get errors during
> > > probe.
>
> > These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
> > used by LG Optimus 2X P990 (star) for FM Radio.
>
> Those are reasons why someone might want to create Line Out or FM Radio
> for a system, but the fact remains that the machine driver uses those
> widgets without creating them.

Ohh, you are right. There is a missing asoc_machine fragment that adds

SND_SOC_DAPM_LINE("Line Out", NULL),
SND_SOC_DAPM_INPUT("FM Radio"),

If these are all required changes and you are ok with picking this
patch, may I reload it without delays?
