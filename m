Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0D4B0499
	for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 00:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838471; cv=none; b=eRwtk018wVkJodMYsvkapymdz1+I2LCw6c5Mfzc0+dd19DtNjwYSKPvJNH2ROgs/GG6mz+hizFRh/ppf4a/rVP4iEFe6mF/e/Jnc+7UUlIqkQ5he1mCQxs8pZoBlJSOc1ERoxwN+TrhGDLNVk0TPBdN5bbSgHl/m3VVzQ/bcajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838471; c=relaxed/simple;
	bh=jTIAf27M5NzIQ/HT/8Rvh+AaCXsZu3pvrlyi40ZBRCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjeHmcjHGGmP91ujkG8k2pze2mYkM1lPHxJLPXTIuarnkdggFcUxX25POH74uc9by7n96o/KzHp4HJLMFvDhlVlRykknn34+few3Sx0max4xSJ3ZymURhhr7M7TLRz/TqbI69gCYRj0wml4E7PiS9JedaEDtRY+v+kpvb1X18zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2sZsASq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2sZsASq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1392611f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 17:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786838468; x=1787443268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S05GcFVUlDeLHwWGA/nTU8ZIeoXZY8FYWxsLnhiIPVM=;
        b=c2sZsASqOafDhVRjgNP5TcTOWfDZufwws1Ch2OfcHGf78tGd7CYl4BlqlKIOwiQjxw
         BS2JwTuPcwu3lMNrAQ6Ffy0sPoAN7scJ7hmEMWg0pcxJ2E/T4k1Q4iWiuzuBebic/UZq
         tld+2u5BgnffpullZOJHpaOCqOybvbPKyfIZV3MLxaptM95ApWPIAy3OEXpSs9EvZTNC
         KZFWoJoT2BQL64oo9G87g5OnWa7IxFB9dmhMyiB1KWUzpi2TQ5ga878/Yr/B2pTX3g2I
         szCVoA5psQBCJ8hi1MOlwZfW2VaRNx4HJxk2HTx7zkJWbCEq4/BwMyG0Xre7Yr/9fZU4
         rH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838468; x=1787443268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S05GcFVUlDeLHwWGA/nTU8ZIeoXZY8FYWxsLnhiIPVM=;
        b=oJjvBtO/5EpEvHCKnX1CVzyMtMkkNlMwx5+gsdqm4RW/XEQFerjltFpH+KlRltKZG8
         2hmnZOwtJCOI3LgP0RkOd9vDIPXpgX7MdRM93tXbZrJpsg79QOAPIQT37VcUj4Nj8U8T
         9sR0aZ8hGtMAaGRvnoCunYiN0xM5hCcXMFImz+b6U86PVR7XW76tsrmiP9ePHi4g/Lse
         1H0gphht9HfoaaMnYMD8UOwjJi5b8Y8wciz8eNiIqkcBL1RZdn2fOxNIfrLMxjvBv1+t
         dj87DQ17BceA61r3oluYM7TQtYUhiYCTU8OjkPAuuj4IA1wHUn2C84A8hQMFcRWiC09x
         sNPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoK9voDD2SnTs7YIh0gWUFZMgrWf1mE8lHGVXxYHlPFNPikC6M/5Zc/LlluRSWtpzCTO2oommk3HOzGTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyrqWkk4l3QrsZlUtLGBXhNvZjRLdILzy0AQejh0zdUz9QYCz
	l6AGCzn1laXZMod1OZVLZ+tfQUZ/Sdp2ewv1h/0p2h1vexc38AENnKbI
X-Gm-Gg: AR+sD123omQqDsjeFPcpc+hMPKIYVQ1wqzwSRU2boItyDAqK1a2nY6MB3CzWtsjn0xq
	xfrFnOzuZI/b1UgZz3jKcSiJLlfsFvt0XAG2seYnn64IW7y3MruJUtFmDhYE8QA0HbNT2mrenT5
	kXH+83mlkA6vkBiP3FdWIoSQUdAG4w+c0eOO63jwTH6Gd7zIlLFwb8YgenayCuViuroVQ5OKReb
	37ByR6WS3nw1U7vauI3obxTtVcHxpZr/Ck6+JHmmScrPWN4E7C9sHYj9smPjbGGk4XIGp42cYAJ
	/eQwVDDq1cd60peqF5nU5+22d3KTKcGUz8PJ2jY+FNJdlFe+RMB60K0up/Ck2Hen4sf4v2s/xKj
	tMbPC/YU05JInyhGxOnj+OqGwNrdQNyFKfTDhjaqd4L+nUQkYaxmvEcVRHsn02ZYHZrglgsnMjQ
	CWT4sWKY4oI1Itx8bp9cs+b2BEo5Zkgc5a2TSEdj1SmukVrXHVngJ+ErBozNtbD6cAKpBBFoPcI
	kAvOSx8Y5JlQQ2yV912yhK/4IY3Cj1yGh3pobnr9wK19QVX/ql5E+3C
X-Received: by 2002:a5d:44cc:0:b0:47f:f908:ba7b with SMTP id ffacd0b85a97d-481607a8812mr19313208f8f.23.1786838468080;
        Sat, 15 Aug 2026 17:01:08 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c1307sm21029207f8f.27.2026.08.15.17.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 17:01:07 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <999edd39-43d0-4973-96ce-a205283277ff@gmail.com>
Date: Sun, 16 Aug 2026 01:01:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fix unmet dependencies on PPC_BESTCOMM and
 SND_SOC_AC97_BUS
To: Rosen Penev <rosenp@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 arnd@arndb.de, chancel.liu@nxp.com, jonsmirl@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802144855.3596995-1-julianbraha@gmail.com>
 <CAKxU2N9HkStUEo+iTa6xc2BJGe6KE==vARDdHPEhRH9yKOMLuw@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAKxU2N9HkStUEo+iTa6xc2BJGe6KE==vARDdHPEhRH9yKOMLuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rosen,

On 8/2/26 22:14, Rosen Penev wrote:
> On Sun, Aug 2, 2026 at 7:49 AM Julian Braha <julianbraha@gmail.com> wrote:
>>
>> SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA both select
>> SND_SOC_MPC5200_AC97 without ensuring that its dependency on PPC_BESTCOMM is
>> met. This causes unmet dependencies such as:
>>
>> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
>>   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_BESTCOMM [=n]
>>   Selected by [m]:
>>   - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
>>
>> SND_MPC52xx_SOC_EFIKA also selects SND_SOC_STAC9766 without ensuring its
>> dependency on SND_SOC_AC97_BUS is met.
>>
>> Let's resolve all 3 unmet dependencies by adding the dependencies on
>> PPC_BESTCOMM where needed, and selecting SND_SOC_AC97_BUS as other, similar
>> options in this subsystem do.
>>
>> These unmet dependency bugs were detected by kconfirm, a static analysis tool
>> for Kconfig.
>>
>> Fixes: a9262c4fd404 ("ASoC: Support for AC97 on Phytec pmc030 base board.")
>> Fixes: 6ffee43ecf8b ("ASoC: Fabric bindings for STAC9766 on the Efika")
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>> ---
>>  sound/soc/fsl/Kconfig | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
>> index 8ae59c094878..a5d7cf534391 100644
>> --- a/sound/soc/fsl/Kconfig
>> +++ b/sound/soc/fsl/Kconfig
>> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
>>
>>  config SND_MPC52xx_SOC_PCM030
>>         tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
>> -       depends on PPC_MPC5200_SIMPLE
>> +       depends on PPC_BESTCOMM
>>         select SND_SOC_MPC5200_AC97
>>         select SND_SOC_WM9712
>>         help
>> @@ -253,6 +253,8 @@ config SND_MPC52xx_SOC_PCM030
>>  config SND_MPC52xx_SOC_EFIKA
>>         tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
>>         depends on PPC_EFIKA
>> +       depends on PPC_BESTCOMM
> does this really depend on PPC_BESTCOMM?

Yes, BestComm is the co-processor found on Freescale MPC5200.

- Julian Braha
