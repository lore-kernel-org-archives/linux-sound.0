Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077831B87E1
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732617461; cv=none; b=h5vRO1sRNTMh/b77LzSnOI8LRiGXvNxZBQFpa7yTmLFKKHZxU5TCM05iHgDpgdsPGHftC1ple0NQnIQq2plustKxL9Y+F1GJNxiXw6xTcK+4uqXSH5SxdtvydWkS/cdVVp0xB3RGcseiqEkbKoKWUqUXlOe/cARrCAnQpxSKXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732617461; c=relaxed/simple;
	bh=bsvH9kSUCwHWawfblNJ3PAi3vG5GvJUBddlpJRrsx3g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iA4QwlPpDAB2V9SUaz3YBQd8Fult87EtkShTyiP8hWsC++BdqDfcXCEB9hwYEgTyS9NP/enIo6XK2IBBVE/qG7UPs9LL+mGli7g0hj3cmTDN1CELewhE+SEDcLn5TnOVD0lXP6TF+BITcW/uOvuKtpuNV6otiHkAuplgwdk+lqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xMxj/S/t; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xMxj/S/t"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so44872791fa.3
        for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732617457; x=1733222257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=;
        b=xMxj/S/tOPbUkbqCLLckSQb5XvgUMAJfI2BfNGc00Q775+EYirZitoj16d630Y9gWT
         TWdvQibP0Ef8eStRRoeVtbp/NdlKkZo1Gls7JkLDT+aZkXbolf/vI+RlhJKvkHvdEoji
         5CCGTQSuNiaT2IwQ0gbDO5+8ahH1S4im04Z4+f9cfl4rFEtfGUpb9w0mWDsdqjASPMHd
         isF+Uf8EQnHa7XSX86QQD4Tzmx+kPzXS/W8aFv+ypRuLOQh5B7xoOV5b2JB6i36ayCx4
         3M4u+kKZJvry9z9YniN2zuoloB1ZucvNiw+Xit7WpXun2fcVQVWtVWgv5cPVpDR6Kif+
         upKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617457; x=1733222257;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=;
        b=VsB30nEBlrH+eCPwINXNjl5cwuqg0SzgSC9lhFEF7JvxjHES+PJm/0aL7CWSmXTEJD
         rqvHVghJCxl2SQ16CbfbxgJABit0z/WjHAMLdUphB8yjjeZmh9X8bdFlci5ZlTOIUQUw
         zU/5UMMCo7PMdJ2Ps/yfNW5Gj1WIjaQM3Av0nEOrWsxW/jGcfiPC1DtwVDfgSF3up05s
         sL7cLD5h41LkzBZmqj9Mxsgday5EHpOYeCgiYQFvLRlw8ip5Twi0LVybThogMh+1/cPa
         sHWAFCiHm6Vq5SeLQtVxiGc7e6MbXKNkivNLefW6EFiL9PuIzxXs5LHrE6wO2YcdL4Xz
         VVJA==
X-Forwarded-Encrypted: i=1; AJvYcCXdSthdFEzMxBS+okVSV3xP8tfQkicFs+OzbXFVgnl0b1t5X50XHutcgAclVXTZr1NCESifK3XAHyuPaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPf4fgiV532/vfvsO0qFetkq2h2+X6Bs2X7ARoc9XnLfZY2jjE
	zo1Uqr1g+nbV+cbfQZBQSVhEPwoWENUTEIBer7Pg5bs0GHUQFGsgTfNYwBbsNzo=
X-Gm-Gg: ASbGncsvi9SbPcsoTKF0Mk2ob144O3P05PlsFwXxeQnsnva0fcxN9LnxGbnjLDQ6DNb
	UERKhyWM9o7tLvSCJGLyNriHbEx4i6cKvEik94MvefUUcuR3CR8Kok7cdhmV1bVfIOkCEQbPG5J
	OhGTP65wz+S0ACKp93j2ct5IK7yrUGTGO+74omOw+9XjI5zX+DEiocSScF1lsHzh8ErD1qpb0dG
	lkmQWL/z/p7sHI6qiU7AxcwPioQ0gby8i+7g7SmdvOpttlmpu8WTi0HNgo7btyusmJxSED/vOVa
	G952ghyrL2q94w==
X-Google-Smtp-Source: AGHT+IGm9T8BP8eFPLu32fca54MvgO0F+vLQWk0tpYQ0ycW//DTGAHcftsM6xJdvIIJ/40Jr4imMYA==
X-Received: by 2002:a05:6512:39cb:b0:53d:ec92:2968 with SMTP id 2adb3069b0e04-53dec922a7cmr947039e87.17.1732617457163;
        Tue, 26 Nov 2024 02:37:37 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad658esm13229915f8f.8.2024.11.26.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:37:36 -0800 (PST)
Message-ID: <49fa1677-db35-497b-afae-caa5dccf3747@baylibre.com>
Date: Tue, 26 Nov 2024 11:37:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
From: Alexandre Mergnat <amergnat@baylibre.com>
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
 <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Content-Language: en-US
In-Reply-To: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/11/2024 11:29, Alexandre Mergnat wrote:
> On 25/11/2024 12:50, Andy Shevchenko wrote:
>> On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
>>> Hello Andy.
>>>
>>> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
>>>
>>> That mean all added include in this patch aren't required.
>> Do you mean the driver doesn't not use types from types.h or dev_*() macros
>> from dev_printk.h? I don't believe this, sorry.
> 
>>
>> Basically what you are trying to say is "let's move of_gpio.h implicit
>> includes to become something else's problem". It's not what this patch
>> intended to do.
> 
> I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
> include added in you patch. My understand is "linux/of_gpio.h" act as proxy
> for the includes added in your patch, my first idea was "if I remove it, build should fail cause
> of lack of other includes". I can understand these missing includes are mandatory, that
> probably means there is another proxy header ?
> Maybe my test isn't consistent because it isn't possible to clear all proxy ?
> 
> If that's the case, consider my review-by.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

> I've validated some include manually. Are you using a script to parse the file and raise all 
> necessary "linux/*" include ?

-- 
Regards,
Alexandre
