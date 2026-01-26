Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E83016FC
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431149; cv=none; b=b1gzTl1+3rJiLMk2AVEXAekl3FPMTkvLp1VG9C5gN4yz6MnT4JTKoWSs5t++f6v8HmwoaZyBY4i6UP/S3X6PtgZLFGpV8MJq16dE7QB6zvsN5Qq3VJTPwyXzsxwIooHXLEk/HXV9xr+MyW9zMKuc521OvNeKW9xIa4ENbWnpTlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431149; c=relaxed/simple;
	bh=cyOIiW4pRspU7Ky5fnCdxX16wwU+4Lx/7snzOfV0wDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz2EZiBdzuhzwM7r8+nmEGQ5qiTa0AabNW4lSEItoOl2pwbTq0vOZDq/54uohPUHy0oh7DPDaulfCxvwXJKTMYZBncbSExyTcHxxj4mg7jyA90Bb3wj5eKvML8BtFFjwDs0vPsahMIX5IimtzNftO1+J+Y7t2ytAL3Dy5e65I40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qdP9RXdJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qdP9RXdJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee07570deso34272305e9.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769431146; x=1770035946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9LPVZSPw9JF8KAbPLK9s3M1ut6MOkLUhCUq7qppfgc=;
        b=qdP9RXdJjCEm2AMH8YRaUTrD0PF+7Sx7JsYV8tPjWRD7tut1noRqfV/WzSbU7t85Sb
         TY0See//8mL7TJW+p69ixwPpPLBZ4ysHt+AY4xFyRgbvBoSFnMjEqxP3Bb0PYIOf7E+K
         BL4elODtMaM76JXafll7dlxDz/fyXFzrkFY+QylFw6eQyYFwRLMHay+82GvN7JA/eZMI
         gImrvZr/lwKqM2fKh/CyQOiN6p8+lP7vn2+Yw9HfODsevfEEUTMsH1ZnfdXhxaO6Aaph
         3dwHQD7fSc6UkSpeS1LP/ZdPrzHj/4emzXKPfIETSijGjkkv+m9HQ7NEWfLRRiVy83cj
         j0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769431146; x=1770035946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9LPVZSPw9JF8KAbPLK9s3M1ut6MOkLUhCUq7qppfgc=;
        b=mJNwrxwdgH0JphimMog5fDNHCK0tTRZWYPodkWrJh/TBFCW63S7RXM72bkLgrjRZjm
         StnKLl6WizZg+uH7IfBwx54g6r1AL0g+ZRY9StsUtwpWmhFBPfGseFpnHbhQMKNvDEIJ
         i+9TbyKkqz9mFnLukw+Tv5vvhR8Z8ErpPdD/F3KUh9Kf/PSRFhFHOFVX/hUnzEWs0NlP
         b5RFes3L9cuk+viEfdDstNNVBNb45lbZ4kydJWlZwGcHGsEx0bIez3Plps5IccoD49Qe
         b27IuV9jRTLE+GmwI/gK3zjC4y2THJ+WlEA8QY/xf/LRXOLTyS7wxHdOK3iFgL0x7wE0
         y0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXzVBLg/fSrDirOSPbEyD5AAxa3hFuBMr5cWaj13g2e4T6yeKHd72dKrCmpiDKIk5XnWXNpLy1s/bZH0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmWp4nSL/4TbMKUXB/GlZwQPL28g1a4Tz8I9R+kC1Wqjl52W4
	BTBaiINvx12ktJObh9x98BOD3OXWns0AKq4IV1lYTugsVy6n5ZztmVoVmP4uR07Mft0=
X-Gm-Gg: AZuq6aLJLKrSuFBR9zDUEJRcbqY3rWXOss42hxZMvo34Yo7Xh5WBNTxmSw41S6XXcqI
	yqqTQs6BgqkDgp2TQjPdfWjd8patGwvz5eqRqmpKEuvO5/yrKKrgN7G7AEsMq67d1M93gHzlwsl
	mM2FmXpq6vjAM+y52qbmcF0DK5tpvA8Fe+l7TiQWI5ysV2JLy6YW/boVxf062L/Q9tK09ct/8tT
	aYnV2lfQ60QtqbEr/HyBPxitn3HNXh9ufSKKvyuVVCP/kTiXxQZqlHae6Ch5pFLc34MA7PBtwW5
	e814yXtxSn19A8LjNIaouY9ERBxlnx9Yfs768V2vMspVOloZ5Vox3nzlwzanIcZ2S5XpAeR2Iia
	VgzY6Zq3TlsUIXBGsx4wroRvcsWWcggjY3H0qpEgMLfPtBllj9AsK4AtHR/9dVREJ8JqySzpXpu
	uw5Kqh9uAe1hy6+p6BTpkQC5cTLCar
X-Received: by 2002:a05:600c:3b8e:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-4805d064497mr79561075e9.33.1769431145878;
        Mon, 26 Jan 2026 04:39:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d627871sm102636035e9.6.2026.01.26.04.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 04:39:05 -0800 (PST)
Message-ID: <5438ccc8-ed5a-4dd6-8995-e8e9926883a5@tuxon.dev>
Date: Mon, 26 Jan 2026 14:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113461F734BA087B60605C6FC8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <16a6f14a-93e6-472c-8718-d46972f0ac5e@tuxon.dev>
 <TY3PR01MB113463BE8A4B1A40DBB0860538693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113463BE8A4B1A40DBB0860538693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/26/26 14:10, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 26 January 2026 12:05
>> To: Biju Das <biju.das.jz@bp.renesas.com>; vkoul@kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
>> lad.rj@bp.renesas.com>; lgirdwood@gmail.com; broonie@kernel.org; perex@perex.cz; tiwai@suse.com;
>> p.zabel@pengutronix.de; geert+renesas@glider.be; Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>> Cc: dmaengine@vger.kernel.org; linux-kernel@vger.kernel.org; linux-sound@vger.kernel.org; linux-
>> renesas-soc@vger.kernel.org; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
>>
>> Hi,
>>
>> On 1/26/26 13:03, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>> Thanks for the patch.
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: 26 January 2026 10:32
>>>> Subject: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM
>>>> support
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S SoC supports a power saving mode in which power to
>>>> most SoC components is turned off, including the DMA IP. Add suspend to RAM support to save and
>> restore the DMA IP registers.
>>>>
>>>> Cyclic DMA channels require special handling. Since they can be
>>>> paused and resumed during system suspend and resume, the driver
>>>> restores additional registers for these channels during the resume
>>>> phase. If a channel was not explicitly paused during suspend, the
>>>> driver ensures that it is paused and resumed as part of the system suspend/resume flow. This might
>> be the case of a serial device being used with no_console_suspend.
>>>>
>>>> For non-cyclic channels, the dev_pm_ops::prepare callback waits for
>>>> all ongoing transfers to complete before allowing suspend-to-RAM to proceed.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>    drivers/dma/sh/rz-dmac.c | 183 +++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 175 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
>>>> index ab5f49a0b9f2..8f3e2719e639
>>>> +
>>>> +	pm_runtime_put_sync(dmac->dev);
>>>> +
>>>> +	ret = reset_control_assert(dmac->rstc);
>>>> +	if (ret) {
>>>> +		pm_runtime_resume_and_get(dmac->dev);
>>>> +		rz_dmac_suspend_recover(dmac);
>>>> +	}
>>>> +
>>>
>>>
>>> This patch breaks, s2idle in RZ/G3L as it turns off DMA ACLK and IRQ's
>>> are not routed to CPU for wakeup.
>>
>> Is this particular patch the one that explicitly breaks it? Is there any mainline PM support available
>> for RZ/G3L? Can it be fixed along with the RZ/G3L support, if any, as I don't have the board to test
>> it?
> 
> Maybe your TF-A is enabling DMAACLK during resume. Can you check that mean time, I will check what you have mentioned
> Here?
> 

You used "freeze" in your example. Same did I to check your usecase. That 
suspend type don't involve TF-A (unless something changes and I'm not aware of).

Thank you,
Claudiu
