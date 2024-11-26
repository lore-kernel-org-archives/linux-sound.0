Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10201B4129
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732616974; cv=none; b=oj3Ge2PeWjDn93eijaiGi/WrpA/c3ay02c/VnpD/krCtKfCTELKlv1juHY0nnz1GNj/pnjaO/imFJ8Nk9PyiMf39YTYGV6WNSSdVHnL6bLMLapQZemyegmma1r2wIDisxWubaZGmEzmI0/wPYALy4tLTuaWFkxKSjf2+neSH+Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732616974; c=relaxed/simple;
	bh=NjyGHAc2oi2KnpU+ygfb/gz2HMXg+H1wEaeSlojCR3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2nRxW3usIEO8fe6b3ITbVcmQ/8CT+nX7yeR8xJgPJxv1sZxgH3QRitNIFZSgMVZG3xNjwwqZz80ksZl7OwDuJoZg7sSnseDudJkxhatgcqaaK1Dat2tQQcDOLYcFbEkqv6st0NkJ3BqaD+e3ztmoCfcgiA2kkUi4j/6wETKtxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZfhKKIs9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZfhKKIs9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-382296631f1so4343010f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732616970; x=1733221770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=;
        b=ZfhKKIs9ee7qrNgXwe62rmxzIBu4nbCtLtSnk5m2+/DlY3HuS2iGuU9Vr8g7UOGoB6
         3wYWwzi2tIiZxSHdjDXe8hQ60LzAtJ37Y2AvNC4N+zxuuud01hZviokyEyXSyNsuMmD3
         qhLhlT9TxamMdXuKvx3NDwc8CXyEvtnVTILJHqVe8pAVu4olOjMMOTcO15/+BKHA0RnI
         MLv5dfI1iJQ9MstmzWSDj13uVT/x0P4idvt8j4Mxh4IaUuQn0eBS2o4FK+AgqA9r0ur9
         eyVswcMljopGBZjQjDV7iNdf02WMkUnxh1rzWDak1xjASh+VuxBqoPXSGa/O/lTIzFmz
         g7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616970; x=1733221770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=;
        b=qibafexsrecuRnl8SRJAim4WOjQaaUUSnsqA6KspHt1ruZRxxiD4CYz3yvuYWb2Pxv
         chCtTkKqVf8hzszZzv4AeAWGISfDghegkjGESRubo8emDiXUkNO7sEZyuvoEpLZn6lGw
         eMZO1kLluohR9li2Hh9E1wYyfxW4BNxQ8bCIDoLksw0M/WL5WAFGd0Jrey5wXkUEJsOe
         WVNGpL1nSi0VBllTj70DxNdxcPhd42ZPpEUC7AT9mZGqeNjgs33RIRt+Lx5S49iFi+1c
         b1YrQO4BDPI3RAteX/xea/SMqz6w6nIzMlzdNww8vHodeRagRpU+aEnZs4XZ/2vBhhwY
         2llA==
X-Forwarded-Encrypted: i=1; AJvYcCWw/IwbPB5fgn8KE5lQ8xgncu6NJPS4obT2hsLgynxXHxoV6I8Sd8BL81uWOtlmx7gKH2ix1X3q6yTDpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2/f3cJdMbFccezlG9pS9QY/AKXZAKV6meg0REB2XWdrpd1Kc
	pVLlmXNZS3w9rwk1L8fTNRVAbydV/y5UaBL6YW3h+bPAozqGQ6umnkRUTNpB1UE=
X-Gm-Gg: ASbGncvkqcmD13Nw7wBd365yI4UK1WpUjBwKJBnpNkm4+kJ7LH+p5UZNxTkXLTWgkKv
	PwI/rQ1SOM2R9glS6itBseDKCmEhlpiE31Gpxd5hs4475pcaQkfKQQpvje2RfZwN8IyD56oQkV4
	5CmSaiEi2d51xslt5gp43bAl+DxqxWeDdSRoTzuHcNdjUxJcmexOL1flMdaJ1jen9g5lTxQSIXG
	GTvw03zg/V5yObTdA39uKgQ34eANh7yOo8YQwRa2FT9/xwrG9v5AQavHMR3CmED08xZ7Cvk5RaX
	aoJB/Zwc3+/2JA==
X-Google-Smtp-Source: AGHT+IFgeqqkJ6wjR9SgxT1xrYJ0KahQXa7sIHvXaict/TpEQq8UBgqk2qQhjj3zdFl3pgNOycsAVA==
X-Received: by 2002:a05:6000:1866:b0:382:4a3b:5139 with SMTP id ffacd0b85a97d-38260bed0dcmr13711723f8f.59.1732616970162;
        Tue, 26 Nov 2024 02:29:30 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde8c804sm159339195e9.30.2024.11.26.02.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:29:29 -0800 (PST)
Message-ID: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Date: Tue, 26 Nov 2024 11:29:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
 <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
 <Z0RkaqfID9v0age_@smile.fi.intel.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <Z0RkaqfID9v0age_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy

On 25/11/2024 12:50, Andy Shevchenko wrote:
> On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
>> Hello Andy.
>>
>> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
>>
>> That mean all added include in this patch aren't required.
> Do you mean the driver doesn't not use types from types.h or dev_*() macros
> from dev_printk.h? I don't believe this, sorry.

> 
> Basically what you are trying to say is "let's move of_gpio.h implicit
> includes to become something else's problem". It's not what this patch
> intended to do.

I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
include added in you patch. My understand is "linux/of_gpio.h" act as proxy
for the includes added in your patch, my first idea was "if I remove it, build should fail cause
of lack of other includes". I can understand these missing includes are mandatory, that
probably means there is another proxy header ?
Maybe my test isn't consistent because it isn't possible to clear all proxy ?

If that's the case, consider my review-by.
I've validated some include manually. Are you using a script to parse the file and raise all 
necessary "linux/*" include ?

-- 
Regards,
Alexandre
