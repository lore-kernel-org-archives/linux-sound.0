Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F38218EFF8;
	Wed,  2 Oct 2024 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858600; cv=none; b=Mx/phi/SOIpjSGQWvaJnD0Usy+uI/tnp3uxy8iuY6jFE/cJ0rkxJB8j6ilbfKUf8VNr6+NqBDb1DXJ/GE9zhoFQ23shToWiM7419sZcM6n2ndRJQiNkE/boZ9qt/WPYfgq4yYVf+9yTjDJTuLmODd8QYwKqudkykxLkEQzQI8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858600; c=relaxed/simple;
	bh=VeqJiGZPeoJt/vn3E557Zb7LdzLEwvG5p+tBIW9OoC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVsRscz95uLBqHqyrqZqhtY62QG9QjWRo7MpmmX1wzSL5v1pkaRac5bOX0BnoSkU51tdjU7bpjhLD/9iZFmL03AIrfa67/TVrUxmtM/pbU8lZSeE/8uKt32THmdWlLyQt5am/+z21XWohpURPb6BX71/QGiJ4Z+OtQrwl6hpB2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWsFiSHR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWsFiSHR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5389917ef34so7476854e87.2;
        Wed, 02 Oct 2024 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727858597; x=1728463397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nXaZCtHNq7BKKF3CmtoESBg4ulxhWJtDtjqd9cV8Hs=;
        b=DWsFiSHRcXyN2CYqxVICdDQejZ79Mk0KT0PfbemL1oYJ5my4b5rarAtbP36yMzZxXP
         PJtFkgtmhBRqCF5dxuEGL5n+LmuHeULl5gtGC4YJeFgeyG7OWwKTrtfFiLcNA50NKU1e
         TYI7UfZnWKwtqj/6Ilna2mZZO94pns9hEDs5QOMJRbxh1ydND4sZj5rlXDaWi83yiUQn
         pXuFcLd5IqvFNvrn+7jDc1YryJiYx+Jhqwnh+7d9eZIwp095Astxz2v9ClaCg3IWGcMQ
         Q5xpJKg82mGMLIImx6bOjI4q9exQgzOfC6d68cjFSMUEkh6PFd5Ch+OOO4DQkY2Esdj7
         n9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858597; x=1728463397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nXaZCtHNq7BKKF3CmtoESBg4ulxhWJtDtjqd9cV8Hs=;
        b=DUzj5zPc3dn1UEItjK1o2HUV+B+Nu8yens/91stTODHYSM/77quzl47j5iikY1TOSj
         78DLRkspWdcIyYo+O5T3EBUuPyS0udA7QXphZR4a4Map+jkIA13bG8EXN3V0+Vo5duqb
         JbWUH/w9y07AoCoEUQIPHBGeTs+ubZbzgBucH35kHwUDm0EiiAKCt0ubXVQ7VsIVbolp
         w4Px1wjK+uYcIHC0Z9nvXIEbZjG0QZ9x5asTh3kX1PGsl4B79SFNrS3CIApMjBL4kbWO
         SNDRTMSqZuYHoKbh1VapSyFWqjyCYZWiGq06yUa47yjZZ5u5e8NNTanZPtJliqB+lzNn
         GYow==
X-Forwarded-Encrypted: i=1; AJvYcCUg0zayTU6vRUuhaPw1O9+D02S0+OraOtdmoNTO/VNEE4toRXD0caNXX7aL5P13R5tTPBX7BEhuSE2l@vger.kernel.org, AJvYcCX7WMZHH9fqiY6YnEpUEUHB6VSFFbtWrxbOOhip8xnXdzxR+1FSHLeIQmI8t/fmMDn0SyyXO3OLh+THd/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDtWOtlCPqGmvncGAbKvPxM8F81ffb5UZpHE5RPoxCihL2C8F
	gPJHxNYihQed9LG5HYdHyNnJeN7iqe0jnvYuyEM3P/RtGFsn+ATX
X-Google-Smtp-Source: AGHT+IGixNj4W4W7revkITaUB2HOY3ocF0+RwQ4hilUEhSgxQLDa+RAmgwv2ziLfVvWZf0H5TVg3HQ==
X-Received: by 2002:a05:6512:31ca:b0:52e:9e70:d068 with SMTP id 2adb3069b0e04-539a065c507mr1202032e87.4.1727858596239;
        Wed, 02 Oct 2024 01:43:16 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-124-88.kaisa-laajakaista.fi. [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd54746sm1868550e87.29.2024.10.02.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 01:43:12 -0700 (PDT)
Message-ID: <a67e031b-5685-48f2-b3b0-5181dd7371f2@gmail.com>
Date: Wed, 2 Oct 2024 11:43:56 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 01/10/2024 23:47, Miquel Raynal wrote:
> My understanding of the interrupts property is that it can either be:
> 1/ - TX
> 2/ - TX
>    - RX
> 3/ - Common/combined.
> 
> There are very little chances that either:
>    - TX
>    - Common/combined
> or even
>    - TX
>    - RX
>    - Common/combined
> could be a thing.

For interrupt these are the valid onesÉ
- Common only
- TX and RX
- TX only
- RX only

The driver cuts this through by trying to request all and leaves it for
DT to specify the correct irqs.

Note: in case of common only, we still have RX+TX, TX only, RX only
operation, but that is just a side note.

> 
> Looking at the interrupt-names definition (which uses oneOf instead of
> anyOf), it makes indeed little sense to use anyOf in the interrupts
> definition. I believe this is just a mistake, hence let's fix it.
> 
> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> ---
>  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> index 7735e08d35ba..ab3206ffa4af 100644
> --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -102,7 +102,7 @@ properties:
>      default: 2
>  
>    interrupts:
> -    anyOf:
> +    oneOf:
>        - minItems: 1
>          items:
>            - description: TX interrupt

-- 
Péter

