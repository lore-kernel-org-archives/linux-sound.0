Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4D03AE1AF
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695847; cv=none; b=SljAuPcQMtsxU0f6h+MF0bAWUOLYwypWb9ba6+fxbee7ba+eXemBPBfSufII9znMMz0XJY7tSqxqht6r6f5cRjjYwIHE/1uhzEh8NY8ND1zIcQA9vVzSe8cjuCuatbfXHD3fqdwOL5hGERFZ6SNNnpr7mO+W8VtrEoLLP3+6QwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695847; c=relaxed/simple;
	bh=G43em0UTQ2JQXzJA76cdqW6wsnO4G8o1Mo5P6nGZgPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ue3erPrxArT1X9cove2Ho9AiHNHQJtb8GEC+8+pOyzIJ2FAicS1MDaVwFg0RbYibkspcgTnrrn9qHqbhjcsIZPGBJoY8LKRK4PjjBxeVjoKeGRUXFQvP2JOKYPNgOQXTxfJFFJVZV1rQNleJCUz/0qlTUGZiizXLnWpufHMCKJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z1ad9HW3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z1ad9HW3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so29790185e9.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776695844; x=1777300644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2uTS1FpJvpBuQ/f8W19roBhKwBLhDMKvzjCC/g1ICM=;
        b=Z1ad9HW3b0ftwI665ozfA7pOvAv/MixGYv/maWoHIEqxhvnBU0SzMrxmu9s2QN+qln
         iyWsKOc7JhZ28n/TmoqfF81rocMwYRRWix0jHEyDkZ2QiMWfOXMsEOfmHZV4Sw0wLZbZ
         O67u2MVUmz1Ez2hsVTzOru86X6Pif0vlP8IjVzM0RRDDLoLUeCqemOQbNDaAMcbZwe1/
         2twhgk6HuVDE8Np5FcVpJfgMDvvd1AanT4gdLw4is9Y5fI/0zYajGEoEzgfSGEYrqTj4
         Rd31hcC4oZ6JR9C+/zcE/3GwDq25NYH3ibyZ08JYqYAnSvd5T4IymwyMEpsbqYv5rWG+
         5KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776695844; x=1777300644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2uTS1FpJvpBuQ/f8W19roBhKwBLhDMKvzjCC/g1ICM=;
        b=DqsuLqVSovTYSOPspfMnrK8kPxl1QjzU6IjFBlmKY3JW+PRyyIuW2wivaCV4YqmpHO
         Bbprmwv1uwK5tQmYjxRsjmUZxA1LxKQcuvDU0qANq/lOzxsx09aPIS/UFaDW7+2Q758K
         5xx5rw0p09k/4hl+IBLAaMlYllpThyQea9S7unuAzmZFmePwS48LmEfo9DfSGld/Q+hJ
         aCm7eaT8Umx7ukGAKPeREc0y9qRsqNHDjnDNbTL0JYwk42xK7g9zn49MmeCRqIIXJR82
         ZfDaFYH8PvL9QoPK4/7kIYLW6LSNxq7nkirdzbChEgidwUs/8VV54+FT3orVQMg4rwv9
         nbDw==
X-Forwarded-Encrypted: i=1; AFNElJ/iOS9277JmJhTLb1mPF3ztIfY2mSd081q4z7khohpSqDHgNHzUqFX/d4c+TtjglQ6wNiKFd9uDVb8DRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGbld7GxiNfjebbJM3JKtILnn5Zu32ZPuyc7rgMuEXWxtAfsQ
	4LWrBSrGhvZfl11fwtgmZ8WTT5c0isLLWd9k2gfKY6nnrMPUjXA3StVwu5JOAitanPQ=
X-Gm-Gg: AeBDieuAIdkUgZQIF4+qxRllGLDEejiFGcMOL4gH8TmeS2vbTRFBlAv3cvt+Ep54VDc
	4kCB2D1uQsdkluzXCMa9kI+aIsMx4fWhazshVzHGj9SvHgcNC4qTfW7TSAZ4WiD5XQ4Lnxz/N8g
	T+jjinIQoRCqcApRo/ObDJix6FxZ/MJB7sdKNFick1jD2JcGBOHPXqxaqJekwdKGANQp6luJrFB
	PUcSSRgRI3SIEJrN6SXN2QR03yMNYisnZvY7jfZvkjyIIuSc8yDuXXCuyOsRWQXzMv0UM7+SEyZ
	wBcwAHUhWwMQfi+rF4AFUhhv29xc9ApD0T/9S3+EyeTM/kkprLNCgcQwfzopCUBiHDQDmgeRJe5
	6ie4fAHXz/WBKHRKhA0dmxVkBWJyVSBBHia7t3IEhBnak0wOe1M1ir1baOkpAeeZwA4oCtK2dJY
	33sw2jwS/sVkk3ZCKkdE2SbMJyB/uOhGQ7dzy/Gu7AHQ==
X-Received: by 2002:a05:600c:1385:b0:485:4eaf:eb54 with SMTP id 5b1f17b1804b1-488fb78260bmr187342395e9.20.1776695843391;
        Mon, 20 Apr 2026 07:37:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm271273795e9.15.2026.04.20.07.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:37:22 -0700 (PDT)
Message-ID: <2d055792-c8ad-440e-8fe6-68b75832e30f@tuxon.dev>
Date: Mon, 20 Apr 2026 17:37:21 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/17] dmaengine: sh: rz-dmac: Add suspend to RAM
 support
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Long Luu <long.luu.ur@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-15-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346C39C7EABCC7A1BC64109862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <36468f41-7808-4fe3-b4bf-94eb128276fc@tuxon.dev>
 <TY3PR01MB11346EBEC14B199CC0729E33C862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346EBEC14B199CC0729E33C862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/20/26 17:21, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 20 April 2026 15:15
>> Subject: Re: [PATCH v4 14/17] dmaengine: sh: rz-dmac: Add suspend to RAM support
>>
>>
>>
>> On 4/20/26 10:42, Biju Das wrote:
>>>> +static int rz_dmac_suspend(struct device *dev) {
>>>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	for (unsigned int i = 0; i < dmac->n_channels; i++) {
>>>> +		struct rz_dmac_chan *channel = &dmac->channels[i];
>>>> +
>>>> +		guard(spinlock_irqsave)(&channel->vc.lock);
>>>> +
>>>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
>>>> +			continue;
>>>> +
>>>> +		ret = rz_dmac_device_pause_internal(channel);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "Failed to suspend channel %s\n",
>>>> +				dma_chan_name(&channel->vc.chan));
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
>>>> +	}
>>>> +
>>>> +	if (ret) {
>>>> +		rz_dmac_suspend_recover(dmac);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	pm_runtime_put_sync(dmac->dev);
>>>> +
>>>> +	ret = reset_control_assert(dmac->rstc);
>>>> +	if (ret) {
>>>> +		pm_runtime_resume_and_get(dmac->dev);
>>>> +		rz_dmac_suspend_recover(dmac);
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int rz_dmac_resume(struct device *dev) {
>>>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>>>> +	int errors = 0, ret;
>>>> +
>>>> +	ret = reset_control_deassert(dmac->rstc);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(dmac->dev);
>>>
>>> If this fails for any reason, the next suspend still be called and it will decrement the counter,
>> potentially undeflowing it.
>>> Consider switching to pm_runtime_get_sync(), which suits better here
>>
>>
>> I think runtime PM usage counter underflow will be the less significant problem in case runtime PM
>> fails.
>>
>> Anyhow, could you please provide the code pattern you consider would be better for both suspend and
>> resume?
> 
> 
> system_resume()
> {
>            pm_runtime_resume_and_get() --> PM counter is not incremented in case of error
> }
>   
> system_suspend()
> {
>         pm_runtime_put() --> counter is decremented and prints a noisy WARN message
> }
> 
> Just replace pm_runtime_resume_and_get()->pm_runtime_get_sync()
> this will return the error to caller like previously and also increment the counter
> which avoids warning on the subsequent suspend()

This wouldn't solve anything.

If the newly added pm_runtime_get_sync() fails the next dev_pm_ops::prepare() 
call, accesses DMA IP registers. That will sync abort (due to MSTOP) even before 
any warning (I guess underflow runtime PM usage counter) will be printed.

If we add runtime PM resumes in the dev_pm_ops::prepare() to overcome part of 
the sync abort in the next dev_pm_ops::prepare() call and keep 
pm_runtime_get_sync() blindly, w/o dropping the usage counter on failure, that 
will still lead to sync aborts, because the runtime PM resumes in 
dev_pm_ops::prepare() should only increase the runtime PM ref counter and return 
success.

Thank you,
Claudiu
