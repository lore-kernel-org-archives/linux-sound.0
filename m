Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3B25B09F
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416468; cv=none; b=ZKcvyJSxc4DZcFPIm2zzf3RMOqnyWLTPCjSgTEPg1v4RNIZU8gdkdPFqcLYgWPUSqR59M8a1MFZTY7ee1uKaEgoQRgy70nhOLLPGq8mnUhkUP3MR4fUswNGl/XYt4TIBTq4Ffh6FCVZq9LVD6iA+2Fwf7xOpebahVD8mdq2jAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416468; c=relaxed/simple;
	bh=Bc4zPvzi1H+hs5znlyIpdiVtRqDHAzQ6BmPehn0EoYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOtUjJ15uQiNHAEUOoy7XTNQkw/iHaeS0crp5HvdXBFuMm3h70Meo1IEnKGpqSngxmik5u5pkf2jaESESWFf6HYpbaDNcWZb8rDN3QfMU/Gn86u0T2UxPB6t06lffLl3lcWzp4cM6e7RluRvIqeT3eHTXfl22NHSpHJcAmINm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qssnGpS9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qssnGpS9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso3497123a91.1
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 19:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779416466; x=1780021266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr0MFlHTKblGLvHF+KnyvmeSCPqB+OIGNPu1sUtajoA=;
        b=qssnGpS9FyCssc9MNjPCUsB71u1+0xjbpSuYlIBoDgpFfBKQCr+ctOAiYkcN/NC44v
         DpV9UuJdc5mFrmz4CqwQj+ZXTjixT8tR6vyq3KxVJNlN0Ahdv2ZJmnyzx62+nhtIZy4E
         HoPcYrKXe12FEcHXywAYxrkoyIjXcSPGv09H2SUN+qFF8XAuNZ4t6jg7TIZa9aHke78r
         KfRS2DqFJGgFWMVQ9MXRRczT0lxq4yxb7My6NarWQMnJFGp61dToLdeyCxia7vBbirjN
         cBfLeqkmhaV6SMkuvV5ytdvOVqFoEp9Ykki5PXfGa6nfKGgSqgvMwtUhD94Gmi8akx7U
         ve8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779416466; x=1780021266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rr0MFlHTKblGLvHF+KnyvmeSCPqB+OIGNPu1sUtajoA=;
        b=ktzCxwzLzvBZWWrWeo9ABqh8vhx/9UKBdnM5LURRE+7Cb4+JSUS60ghMLLsR2PRiyF
         6yOLJqRY5lU3lMFCb3l8UGCmCii4tAWj5H6avN6Zn8j6DJcoH6YOcfvjz5OrKg57g1t8
         VcXNCRAZe+O1a9PHXwAKpgj0LsA2fshFqdgvFSdTx0tPDPdxTtOqzqZIIM0fcQOtc9GU
         pztOrF1IeKUpap6PPhQs/XDrecqPSIzRPHH+iiFNwJGEXN+AO0ry34L8M2Ju4G6dXJcP
         Tzfvj60oPbiDvHZgy2vgiiL9Zf6sAan4TNTFi7HtDwy7nWdGn8YBZW0QaCcPlcJC27y1
         Dydg==
X-Forwarded-Encrypted: i=1; AFNElJ9TfYJKiMWE5aHEyA52OTaEmJkShw85rcdJxufyh2do4lE5/7vePjBC++ZADjpjzdSbrvzTyYvs9zSSZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtJrv6GlS9pOfU9LB75skEkHTqJTaF7u3nF12jLGPGAO4Afvxj
	mL+jEFbMy/kl76Xni1Fp2kZ93pm5leNMHUjTRE1/HSA59H4A2vt3TMYn
X-Gm-Gg: Acq92OEgdRJv2iqa264CGEAxr98cEcYMRsj0S0NUSff2e5qC+fF1IxaQyWeFYqd9+3F
	lQzPLfG/+II9mrGxZ3nz0yqCRIo9CpL9c825p2JOueKlOvEt9fOO9jl01lvyvOecIA44Ijdg+kh
	ly6dAmdjExfBjbt9qAFZ42J/3qthgSC9Em6/T5q6X1ks8ddFS823Odu6H9rVgS0U5lwNJl1Eodw
	kYz030io15zSGB9rx/JskXQeeM3QubpDdFp7oE41F4k2bNeWIgAgksTbUl8qdoHTkO0W3uAXa9k
	e3wPYPdTUfG1YFWiSnys3nLqMaq2lBhk9xuZFm9DxlXGgHxWcfxSwP226QRsdNWGuK2eF0YobJl
	lRxjVRRhFnS8HUZTAY25GX4Be4kQSZSjZPoo1avxEARPQd27nQvcXGRN9Y9d07k017Tv0SvqJbH
	kYg812MXm81etPuF2UJiUHR8P1Kg8KhJKCR1tlgvna3UyMtE7gXyZq9STCWA==
X-Received: by 2002:a17:90b:3f85:b0:369:7421:7534 with SMTP id 98e67ed59e1d1-36a67765ce2mr1608562a91.8.1779416466365;
        Thu, 21 May 2026 19:21:06 -0700 (PDT)
Received: from [172.20.10.2] (42-79-61-163.emome-ip.hinet.net. [42.79.61.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cfb57sm348254a91.15.2026.05.21.19.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 19:21:05 -0700 (PDT)
Message-ID: <d61bf634-75c2-f0dd-cbd0-8a4abea8591b@gmail.com>
Date: Fri, 22 May 2026 10:18:49 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-3-YLCHANG2@nuvoton.com>
 <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
 <ddacfe50-072d-66fd-c760-c898bdab52f4@gmail.com>
 <934509a9-1347-4b02-a341-0db0d1db42e7@sirena.org.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <934509a9-1347-4b02-a341-0db0d1db42e7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/26 23:35, Mark Brown wrote:
> On Wed, May 20, 2026 at 11:01:53AM +0800, YLCHANG2 wrote:
>> On 5/18/26 19:35, Mark Brown wrote:
>>>> +static bool nau8360_volatile_reg(struct device *dev, unsigned int reg)
>>>> +{
>>>> +	switch (reg) {
>>>> +	case NAU8360_R00_SOFTWARE_RST ... NAU8360_R02_I2C_ADDR:
>>>> +	case NAU8360_R06_INT_CLR_STATUS:
>>>> +	case NAU8360_R21_VBAT_READOUT ... NAU8360_R22_TEMP_READOUT:
>>>> +	case NAU8360_R41_CLK_CTL2:
>>>> +	case NAU8360_R46_I2C_DEVICE_ID:
>>> Are the I2C addresss and device ID volatile or do they just not have
>>> defaults?
>> For NAU8360_R02_I2C_ADDR, it requires a write operation to latch the I2C
>> device address.
>> For NAU8360_R46_I2C_DEVICE_ID, although it is read-only, its value is
>> determined by the hardware configuration
>> of the GPIO1 and GPIO2 pins at boot (e.g., 0x1a, 0x1b, 0x4a, or 0x4b).
> In that case they shouldn't be marked as volatile, just omitted from the
> defaults - they can be cached on first use.
Thanks for the suggestion. I will remove it from the volatile register list.
