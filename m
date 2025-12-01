Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CED3375BF
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609361; cv=none; b=SnyUjOGvLfPo8obI5kTqREVwOCAN3U1N4M3wXBd4Xgg/xBxMq6sMvjFd9ukawkpmdnNKsqIE+Y5dOK9AnhvIcRdFg1F8uUFXRNa0fVRCzPS17mxbMTyem/FmTPpf8989yu6C7vsKm5oNVeeiGzR5GOOdqVmmC9ROjZld1XfwyFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609361; c=relaxed/simple;
	bh=HH/YjoTJvK+HycLUz2tbwGdJb1nNegFYrobhQ9Ypw8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhNB/I98FCC3LyQtUbEIxio+FTBBR+pi2iyoFqkgzuEc5SNMgo4da28a2iEB9jAwcbje5uauHc63RRSg9nUiF8V1dzsnT5zjcRFCbp34JRsHOUXzk5ElYR0S8KrUIIEHocA8vB57SFAn7t5Vqg9+7wb7fKGU0KPu7yISpQCd4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Npow+MGS; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Npow+MGS"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-657a6028fbbso1710113eaf.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 09:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764609357; x=1765214157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
        b=Npow+MGScSa9PmoCppCBKLkH/lvjtJcb6awX9aPoo0MtWh2u5ueZl/upHY6tPLROi5
         EW73g+TiACBOJ+6zy3qphgzGuN5GmxU+PFQrjTy1JxwXANnbrwdp5plkDZDTUHuv0JEr
         /OhNtkJdZQ2tjwgdau6y7JHlSn3T1eYWvaUdRrCjFeRqk2rWcjfNRY7xp9O58g1TKOs7
         TENNcDQyxVmuY8UZ9RorIWWD6IcDvaEP5x9IAtzciD9xU7ComNVSJfHGYv2lHYq0m5Mp
         C373JHEbOJ7pFsoWM7r6gp+mCteyyMrpi4dKE1LEy4ThHi502gBLwkQ2Pjs+1wi4HnJv
         zC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609357; x=1765214157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
        b=h5pBMCyV0U9Xstb1AV8sN6wZ59gbV4vRlUq5KDgw0fP9OX8xGt25VyVBiVqKchpkWM
         TskMBuhpskQMhUGFEZaRRDrCGlOpm+L9h/EgPkdJQRG7NMjcEf+k4g52ri6Jy09RQNJD
         qe4S/C130Av5suO3wqClwp/7kkKqbshQ2Z2Q75vsBwMFqYrn1IPnT+bFC96UmI4trS+T
         /vyVhK81aS99CpjdbQEqqCDXSnVrgQlQBBuZLw2s/+uC3VMmZmhcLqgkjJrIXJLa2oBP
         NeuQEIDk7HkI9976Vrk0EeR0z2w3qVSg4dG5khV2cAmOins+o253jdZgvIJlyqrNSIRC
         ab6g==
X-Forwarded-Encrypted: i=1; AJvYcCVgbpZvc9C8lPjcNtV6hA4+9VEWDCiHgwS/oppgzsYqduRpOJe6Jb7ZxXB0Cq8d4k++lPvldHN6k1Ja7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRn0EAZAN8aSYeqoIknj43XATtVF9iQhzwNrc8JohFGinL5BEU
	b56nMDGTKyPm8kPAABNvtfJgqYIgcT1VY0bBa1STlsKuCJGEpNYI+D/CALsKSuMES9g=
X-Gm-Gg: ASbGnculGp+wyx0q1TL3QkRB/wUfn4RLbRTyRdtYgPoLJS3TRKo/PuM7IaUP1LOKxwJ
	sJRqfseTpatAWC4AGFEbdU0eIzSY3cNxZPFA3vmX+Xhe1GVkT/3xzjdaORp95hZceBtXI8a6Gn1
	yC03o77yCXpWvXimmMY9ID5Av2PIY/7kXQXgngWDWpEAVMnkSlWomes+OSQ4QitTthaNxqeuzjd
	N8v+YO+TNmBBjLxZv0EuICeuMy/EJL/Bzm1gSU9rXZ5Ywr9oMvGWBKC4eGTVv8XWdRvDoNowAaf
	1Sod1xLpF0zzzW8helgkcmS6GFMb1TWJgr6XAic1Y/fzNiwmSdUqAfB1abf59Ff5N+WkYYwQtOp
	iKDnjaDkvEptPBFYnvsyF6oahYEqo+ijnCAEoWHngPkUn78tm94eqdF55WjGK1hS/71y/evDJ4K
	sVBu6lTP+2tD2lNC+qVUJA4HC8Hvl4mgWsPI53T4LdUA79hrgsidZPiXd6lw==
X-Google-Smtp-Source: AGHT+IFhXzu7oIvN//K+0gQ9fSmHlhexzrACWF7hMjJsE/gYpW4bjA3882odDNc+t9DkOzPtuw0t9A==
X-Received: by 2002:a05:6808:1790:b0:450:65dc:1fce with SMTP id 5614622812f47-4514e5f84ddmr11527679b6e.3.1764609356945;
        Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:b67b:16c:f7ae:4908? ([2600:8803:e7e4:500:b67b:16c:f7ae:4908])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-453169b2a51sm3922009b6e.4.2025.12.01.09.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Message-ID: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
Date: Mon, 1 Dec 2025 11:15:54 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
To: Romain Gantois <romain.gantois@bootlin.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Kevin Tsai
 <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hansg@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/1/25 4:59 AM, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---

...

> diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> index a8198ba4f98a..33d6692f46fe 100644
> --- a/drivers/iio/dac/ds4424.c
> +++ b/drivers/iio/dac/ds4424.c
> @@ -14,7 +14,6 @@
>  #include <linux/iio/iio.h>
>  #include <linux/iio/driver.h>
>  #include <linux/iio/machine.h>
> -#include <linux/iio/consumer.h>

Unrelated change?

>  
>  #define DS4422_MAX_DAC_CHANNELS		2
>  #define DS4424_MAX_DAC_CHANNELS		4
> @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose <ismail.kose@maximintegrated.com>");
>  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
>  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("IIO_CONSUMER");
Is this actually needed if we don't use anything from consumer.h?
