Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BA219DF49
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391178; cv=none; b=FmTlTnBPrj3oUq2oLkeqc2m95H2YT4Qwqwg/h9kd7Lc4rn0l2TiextVMWKN8F/f1t7UAVyi8MliY93shz30JvUv482o8PiZgbz+9IP+Bf9vslLvKQfHn7HRsHObZXKStN2Bg7918QrOintoShubfz3mxIgHGq5TD33M2p2tiWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391178; c=relaxed/simple;
	bh=T7lsxKz9kQsG7strIXKc3gaNkdkt4hLNvF6991VM4Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ag1IzXASfnlZweJjIfvenlIQwgEtJma2HHz0F2+uBmdVIVAeeREyEGU5r92u2U7GPndYXkh6oeluY/1A6eJPKmfl7qUhMN2n8uTvXUvSvpbfbjT56kVOT/EBPbsVYHh6PUpjChhwV36/bQ6BFu9yD9ugma0qyEnqXoN3vy+1vNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8BLUrgY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8BLUrgY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a4031f69fso155451566b.0
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730391175; x=1730995975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33Vl4BG5lS6i+uqsZfszmYg374g55dOekrq3OhCrRPg=;
        b=m8BLUrgYWarCGmwq6CkCoXi08oAccNv4cPNSM36UJDSD7UjDTsLeNmwsGCk/di6NT9
         1OtO1qsBRTd9FUYPrblg9Xt0bQI70e0ApzJ1bxvREuMh+hdzebmBKPpNzLybucFZalc9
         dbeVYAcKxj1oly4YYA47iAMssjdTAeDX6hdVJDm4g3FrUtbjIE/V0jH4+btVuc7R6Uzn
         OZ1H8enW3mopD54xOMmM7/9wWHzA2W/vHpH+P3Aozq0i2anLqCRYpHVYwwZ0wNSC+ing
         DTRmHVodjFMXwccQkZuNaWyCAhR87bvpuf9BRkLUbfZvTYJjPirdKEIQSZnurMABF3Xz
         dw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730391175; x=1730995975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33Vl4BG5lS6i+uqsZfszmYg374g55dOekrq3OhCrRPg=;
        b=uvVsHZ15kdmxJ54luHT0Z8T78sJkjrNdH4nvYEDYkLzeEudA39/7LEwi7eNAUELmnR
         QQlUfncKrl4Q4R9R6GKZ9MaFH8Z/wsO3fdoDMAHkCWzL4mejzBCPuFn6Tva4XHm0MWeG
         TRJoZ3PxRpvh6VcxDe/+vphLpzJO+AhqTCUUqiKhixeqdXVqdqfsbyD4bzpZlrseyAAR
         azXdvRQLw+wU4AJNrFeUQYgU43c7/J7z+fhHTIL5hKqLRjqkxOqaxPIo0QWNLI/8CnbP
         fKB2ECS+ww2kJWKVhtF3VFrTuHc0cvooEiqnTKLJOaZSkuCPpCIs1BaFMd9xT2IWPD6h
         AeUg==
X-Forwarded-Encrypted: i=1; AJvYcCVOpqjepjA2CyJeei87kWLP922FS8HF1GC+81ZDjAWrJqfYl90O3SEL/RJgkWnv15OaFxco1fxyytH93w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbALiHe2K8ZB1bhHxw4K5/b+bH3f/pBgBX49vhKDdMJs5Tth74
	RGDs5oBmXbiriggo5nZllBaTihg9QcbUsNdoTQEaBqwYEw6LBR6U
X-Google-Smtp-Source: AGHT+IEIOWNHYZtp6hG2x3Oeh1unpwO75JV6wt2k/6i0jA55K7cVTxSSqoACbnvEW3HPy1cKj/lyxQ==
X-Received: by 2002:a17:907:86a2:b0:a9a:134:9887 with SMTP id a640c23a62f3a-a9de6167ad2mr1794669566b.41.1730391174696;
        Thu, 31 Oct 2024 09:12:54 -0700 (PDT)
Received: from [172.24.224.254] (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c4fbbsm82772166b.58.2024.10.31.09.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 09:12:54 -0700 (PDT)
Message-ID: <5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
Date: Thu, 31 Oct 2024 17:12:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
 <87r07wws4j.wl-tiwai@suse.de>
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <87r07wws4j.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 10:15, Takashi Iwai wrote:

> Per reading the patch description, though, the behavior appears to be
> pretty unreliable, as it depends on the runtime suspend.  We may
> control the runtime PM better if we know that the beep must be
> submitted; or it's even possible to runtime resume/re-suspend upon
> beeping, too.  But it's maybe too complex than needed.

You must have misunderstood that, this unreliable behavior is what
happens with your patch applied, once this patch is reverted everything
works perfectly fine (again). Perhaps the commit message should be
rewritten to indicate it more clearly, e.g. replace:
> now those beeps are either muted altogether
with
> since 4f61c8fe3520 those beeps are either muted altogether

... or perhaps it should be just left as it is...

Thanks anyway!

-- 
Regards!
Jarosław Janik

