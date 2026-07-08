Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F32466B73
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515491; cv=none; b=E2WED8D56uNFC+wDB/jCKAo3tYbcMnt7h9QCHa1vtuOCXJ4Kr++SCUOw1KXhgpqD+u3IGoUW3cTX5mvT6HwUb+zTEZU+eQ5BrtBoWi4gmFLvNoRlQ3yXNQEkMe+k47o6bR+Lqf5kkYHh6C/5dI9YjhGyh+EwWA9GPUfTIJb9kdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515491; c=relaxed/simple;
	bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cnf7qGLTFwl8YqkHdrf62Hn4XAUSp7Vkh3TgOcTtDbCGJoHXNoXlMlb+0a1wMiWpAcdjfwqzeBZKe7pSFT2gplIZL0dLmp/Jr6slmJUPmSSSW6uWHhiK15jPVVBFoSfNckHJgPagXvtZHxuTnrEi8kmOMWqOEXpTUF+BT3eA5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMJWEhS4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMJWEhS4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ba5b151dso87888866b.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515487; x=1784120287; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=aMJWEhS4hQz1H78nOyA4aawahdqLtwzDKdyM9k+8prM+a+FvTJyLchShLI/gayPTia
         DwFamIt6cP+fzDDd362zi2MfX1MuzwsNTV4T4y6EHoQv2MiZU51A1UBUD0FMSajWFUZW
         1PwkKCpxi6ZeW6PR9jXfYS582dtdMDjSV4pVOD1C2C/KsCYrVCb8xbAdWzkDamPJ5WoB
         ZXs39ipPyJllMbovc3IykcZOuI3sw3ko7syGXBA777S6bPntiR4OEomiodtdGhy8Dts0
         +UmqM8ONnyrMKPW/xRHNsJJb612O8E/8Yg001NY+WyV14saQEBIQzzpLKb9pTkNMgXZW
         C26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515487; x=1784120287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=hIaiE58o3pumSW0m//flpPMv839irH5xmP+SCpC+Dk5zSW4IS69q3V9Qtw+Z/zapFy
         Ds/oRBMevGaE7v+hxz1Vuik/KKePt2cvLrGjVppttnBWMrBiscog2dNqfpZRMj14PDhQ
         82Cv5UdmdiAegpr3osUBEIXcAnGgi0UDPEzWdY10xUZARbnqumhUKe1n0mIaRwRVVoJx
         1ckrjK4yOTU7Kp5kBhf6NTTpeuhv9P6pjicF+LzLlfLGc5MTCdlvgE2azZ/wR1FRTONn
         Kg7NogEST2Qn50p1LBrHFcCi3ZqftIO0ven+IBhSl2kzDJREqvGqwOqt914kppWgLWKo
         plWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG/l1CgLSbSO8wGAfbtRoeMF7enBYYAWxihl+qYQUjH4NfXQLhHYvi8LXlI76qszF4cJ1ocKkbYwKsig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+MM2RM1rSkHHnd73ig1fX8rrYqyvXmCZj0b1dV0O7Z6fp9kJ
	+Zt97p2hP/Cnx/SvEJwNycY6deH4FyIlMo4uRpgp/0m0abxCx4dttJmOsD26JMqs2jQ=
X-Gm-Gg: AfdE7clW6GHJFObOT/1KYDrh4+AGYcS9CpnHGnvTE55z8eq3wOFT5tA+G0a1i9H54X9
	chmiep6WyxQFlHAatpwj6xPh0sPXMydTv2gRry/9ARGMQXXnMC/2U73HxJ3E5w1BLDdif3qZTQc
	oKUkZGhRqrQL6gR9JkfOVbz2+1sW+P+IxPtw3/3AMN9OB08CkDuLhpoFi+A85ZFwIffA99djUTc
	3zOHRpT+Cc5mLUpYfDIUqaRcgRi9BL/xCeN8G2wwPIH50YDN4IC96ZjxgWpweGsC/wu79CPa1I8
	sTVSBxkqll9IEHX0XLsSC5r+zrTwnPG8HVqU82V1JLEdQ8A/Wew3Z94fush72h4RRP4oNjdfLeB
	W7Qg+AZysgwcmiKOx6U8ng3FYHCMGojqorPQFZVuuy4tks+RFGfxp6df8NwDR/+VsIecRWQrZeT
	Zxe2QwPkSCtjDQkgoZ3Sg=
X-Received: by 2002:a17:907:7211:b0:c12:4597:601f with SMTP id a640c23a62f3a-c15ce131902mr120160066b.53.1783515486648;
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84c636sm324005266b.22.2026.07.08.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Message-ID: <eed86cadd335597d7c7a4278a9a09706913ba6a3.camel@linaro.org>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>, Florian
 Fainelli	 <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list	 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald	 <rf@opensource.cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>,  Krzysztof Kozlowski	 <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>,  Sven Peter <sven@kernel.org>, Janne
 Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli	 <luca.ceresoli@bootlin.com>, Saravanan Sekar
 <sravanhome@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=	
 <j.neuschaefer@gmx.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Matti
 Vaittinen	 <mazziesaccount@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang	 <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>,  Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm	 <magnus.damm@gmail.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, 	linux-rpi-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, 	linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, 	linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
Date: Wed, 08 Jul 2026 13:58:20 +0100
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
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
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
> =C2=A0- no comma after the list terminator;
> =C2=A0- a comma after an initializer if (and only if) the closing } is no=
t
> =C2=A0=C2=A0 directly following;
> =C2=A0- no explicit zeros in the list terminator;
> =C2=A0- a space after an opening { and before a closing }, a single space=
 in
> =C2=A0=C2=A0 the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759
