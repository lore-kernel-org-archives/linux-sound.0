Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D623EAB7
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764620449; cv=none; b=VoSxuH4xdhXUPpYmTUC3hD/CyoUj+Bs1sLrLHXHPIvhFHTOQC30V41o1J0BpQNyOYPmAwdj1ovvoEcg1tg9jiNkAFasqimT+iEqgJOUsF8rPWwI0WIgNDX1JSr4VffzWn4+HfupNVqqC7hzKh0XBo33fB/U7AUYjqkjq0zAc9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764620449; c=relaxed/simple;
	bh=fE/oWPjBpVdA4YQbxk3ORggkaf7Hnvev3Eh0hZI3+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDG9+M/AdjU3jtfx4jno1KmARuuTllWgE3EQuTi/xBuLQQF/BDy8uAk8UihAzX6etdX9q7rHoX7jk3ogR0Y+6cqawgSM2x8gPuy3b/4230t28g3swUA0wPmfJZ4UDubWAG38mRz4d8lyhIoQ8OXEm/4BjquusiaHYCXSORCZTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBPlHWxM; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBPlHWxM"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso6599030eec.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764620447; x=1765225247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
        b=fBPlHWxMKoEO5LSf2xYitQnN+BelTyMKVJEdxx6GNaBPi+J9ZPNXRN+ary2WmsI7ZX
         0KYh4tyrcs44NQjZpSEDsuZCkEFuwqCR+pKKJft1SI3t9DfpmIdEk8P/TU88Sq/MQ5Xl
         OoYalG+MLoMdM5DtfySOHyF/CZfIg5l4sCOsL6fxe5wiunQP4UkKNueGa1ixMsLBw3oA
         6qDA6WlwhQ2xehHGG0nrcsnqSvrr/3UY90Ojgz6CX93YsTmcv7qV93IcDR/VWnRF4IFZ
         9+fRmShU/WVG260VLCW07cxMhv2F0ETUN/d3EI31jWZEa7b4K3VDOd0Npv7cW3uXd+74
         NIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764620447; x=1765225247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
        b=gJoB4en4tGfMjBsyQhw2DNayOHMNUEZStlCcUPOwcnCMv0qBtcg8utPhEWMjFOqBq/
         s1R1Uq50hU+VKWeNw423eEk4N9njLAGHHtxlJyVNWeFOiUI0zhCDh1Ucj+6+0Q9Kowy+
         ivcBSYK9BfDIJyP5QWNcQOBuZrhqkBkB3o7kH0Kwa0cWx7G/6CJZq2p/8KPvwzJD1KQ3
         ybHzeA18NE3RPjFO1hjnzP3z+8NUVKnSsI7pPvMuJfLPj0kWdYp/m+JGCepV1kF2AvGG
         J4KCRfWjcO16TQG4fIflxGpydgayyIk7Fps9VqswY3o+sffOrZoHk5MQWKKwJEeefSP1
         CfBg==
X-Forwarded-Encrypted: i=1; AJvYcCUoMIWC31Uc4slWBWdw88adakA2ds+cX9CwUDdItCCTdBz1QKyOnolS1yg0MsJ45iwiAEk+Yeyf6crLJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXGJxzwSOp5JfvDeyWbsWQhaur31NWvDIDUWLHXVUXTOHT2Asw
	Ql85EVhOvYdkRok3N1mDUIcgBR6QzSPiVvgaH5x5/jJVoFro+m9et4Mx
X-Gm-Gg: ASbGncttPjMpyKkusSj6rkSFkBfMXIMEEM6dmOjzcIr33b79o/OD0E3T/jFCInnQvA2
	3igShd9wuOboUDoKyD1T7RGdUCckEfst/kM0cT3cOxDLG8ayWxKZdRLkxkFvgGyQ14KNwQZY/RR
	pkkIT+by/j6a4YRpMGXRWFVi2boDQBgv3rW+ixFC6yQPdeVKSHo6bBR36PftYsZlRslo0LcwPpV
	lp9bo2wEVs87Xn9Sq614axbcuGx4tHMtQkK/MWf+LsyIfIh+GpaweX7ADI3egkdJAd85QABfbJr
	W1dhX7/9F/myYyFv/q6LuRD9/ZNzOi0PiKwUfsCrv+GPpn+FsrRHfTN/rNMVD1MyMCnnFt14oD6
	0GBnQ3aXeqdGqfaHKsNJqMy0mLNJ1orDRctjfzWW2ZbwwujJaaX0tNcmlZ4o1HW+fa/RTZWe6Fp
	w89UdgoPdz+4iiTNGd9hgiA3I=
X-Google-Smtp-Source: AGHT+IEKYg7dqAFBQA5yqyy/4gBG0pLJPO1wg8rofbFAF4WSvH7ZOKVnsnUBP8EQlCPhsTPLoRMRqg==
X-Received: by 2002:a05:7300:ce8b:b0:2a4:7dbd:1d7a with SMTP id 5a478bee46e88-2a718664ddemr19837071eec.11.1764620446566;
        Mon, 01 Dec 2025 12:20:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm71991900eec.2.2025.12.01.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:20:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 1 Dec 2025 12:20:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hansg@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Iskren Chernev <me@iskren.info>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
Message-ID: <8d7a5210-f88c-4af2-80f8-61a390586fd2@roeck-us.net>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>

On Mon, Dec 01, 2025 at 11:59:43AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
...
>  drivers/hwmon/iio_hwmon.c                       |  1 +
>  drivers/hwmon/ntc_thermistor.c                  |  1 +

for hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
