Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82098451056
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515296; cv=none; b=Qv1TiBi2fFj25xzXqML5RImUpzP19s6/CyY6BtgurwGip7CX//yS8UhUF0MFMXO3L8QIW/qH4rG4Vwv83yRrlTYxjo8dwF+IHmTGxcKLTlcaritbbJ1iOSLN63mVVAIwDVjAHwm+uQNtBNGjg7ytpGPHwMiVgi11Ua+Eeuds2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515296; c=relaxed/simple;
	bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7uTgLMcX8zRWHiXBzVUMMK9Ou8ZLGQtPhrz6JjeyfdC6QMi7v1QdMDrow0l+pj5dJc8J5E9zCWJgYBCu90Onk9mQNbEQSc3QhBEsi1LyzBKJm1EWgor5Zo1R4JGwNv1ogcSoDdku3br43v5rO/+3T/lXS2agab/9nomWF1JTEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPchiDIQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPchiDIQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69532288224so1295374a12.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515293; x=1784120093; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=OPchiDIQUJypNYvQDZ5Emw1SPIjZMHfIfJz/4WNNtBw34u0DgXs097IcHrO/tft+pL
         5RkEn3HDA70TDl/nqQl5u5I6LbTRBPldanvHaX7C7u4VtoIRT2IjscdYeYVzwxqEtFC9
         8zNLW4Xk/H9tKCf6NQvOInnKR/0wkVgN75Iqx934PbZbl/9eL8wGP7Ow+KidHDW+uaa3
         WGFVUAxJa+hSHN7veFSM9/zOKXazGzNQd2EXwur8xbp2nFLePZheZnMkxfVVxEpfURil
         tOf1SXcjX0Gdu3aeDuF7dEPD/dELQ5kN0RvxrNi0R0XfUU7PypMXR3sP3DdwGKQwobSb
         qEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515293; x=1784120093;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=Th1cZwtnTR7uBq6EwAT4OQYikUV0nxucy1KxLob5Zssip9ME2c8Lh+a03GRCfZUZX5
         wyBV4Orgv/g4YKny9FbeqmlSN6uUrjgqC4C03r8OSteyggr/42odZuFPm+50JLmcns5f
         RKCbOher3P9ibEu2QhHADbMSIJKhgF2e5JggWPQQH2/IrAdMgdEE4+U8EcsqNH06PE8h
         iWHuX4CWoR2wASma4oC8B0w585C8P2eGVsLYPDa5qnp4fK+ZCwL2S4PTITQu+6mzKDck
         viJiWXb32btlgJBYQagCMOEtPwhPr24jdjNT8I4pL/Q4/w41ztmRRF1ddYK8WRAc571x
         bibQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqsngd7eFnetX3cttwoYcTyUVskXB4TNsyk3KGSfSSPBBRyMtaicWmHk5KDxtG9yERP/hRFqE+AgrNrkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+AONK90OQh9YEfKXlHkcvvrY9d++ssZ587t/LJ/nz2515BnFb
	GBb8zhtSVy8j+OiPQcdIica/vNI8U0jOLH75i7eQoOhe9qdPBj7s4YT5xcqFniYxxSo=
X-Gm-Gg: AfdE7cn7+8zqEAaB09vDrSVTz3weUfEYS5IGST1OgMuoD42WcpQ2Cd0vACA7VA3ppmb
	CCxdxJ1mW+99HpiPEc6Jt7cO0/t+CihzIccb1IRYvcwp4YxDy7ihVwuwTqvV4BtzSoHmN4/31wX
	uAX5nQlUlLVsX9byYkQxbvSTfcRMa6HkvryOstXAbP71bGK+FVUG99L5gMXsAABrZEmWMZhZ3nM
	ndiFXINxAea2mHGulP76a5NT1eKFI4PkbmeAHJyF1mxnKrRyU8yD05adaBRpyoD1JBAo+juR1dl
	xF9vUQPtzojbtqF/7eQgRUAKdP33FBmbUmZ0o3xthCFNM0i2ZfpFCFNo3SW8C89Zbh7NCbVnXFP
	Grt/3135O4Mfk4yvtk0FR6YD+zoKsZ5VZ/Hp1iEyxYtSPsMYMbrbbDk3hR1T+eQokS79MiVq++x
	YL8hiQkwWMY+GxvC3IYbQ=
X-Received: by 2002:a05:6402:1906:b0:698:b60b:aac2 with SMTP id 4fb4d7f45d1cf-69ab4453d30mr1054344a12.4.1783515292855;
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa613d4e2sm2000319a12.24.2026.07.08.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <4a5a09fd68fe45939bdcec4a3c5a781d664eb34c.camel@linaro.org>
Subject: Re: [PATCH v2 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Michael Hennerich
 <michael.hennerich@analog.com>,  Chen-Yu Tsai <wens@kernel.org>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Andreas
 Werner	 <andreas.werner@men.de>, Samuel Kayode <samkay014@gmail.com>,
 Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, 	mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jul 2026 13:55:06 +0100
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-08 at 13:15 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759
