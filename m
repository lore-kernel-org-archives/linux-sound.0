Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F035DA67
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574777; cv=none; b=XpSCwnqCwuA+c1nh7iI0GGzZAjHas1MC8nVWULHv8xcmWKa+4aSLTEDwwSKp3OygpP9sSs1FznIBYO2xpdGDwDjnTuZp7TKWYw9mo3EFjeuwbThGaF3Ddu5wlKiRrzN9RtkcJUG5Gj0YaVQMzgiustS9YZQz8InknAafsIkxM8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574777; c=relaxed/simple;
	bh=M5lgZ/rycwHwuDJmxlQA/pldnZYgh5o1O0sdz/ym/FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQy6291y4Xjj3bWiTkm+i9/0xc6N6U1461QeeWVZQAT8G2fYZMy6HyTFCraMpIHpuwnzPqxobagBvCxD0McCTJUT2XRQBlTF/N2DEDB8zp6bSvOA6qE+hcw1eFUZcAx21OvT8cZRhsCBZY4xT4gWzSBN3t6V6pTO6BSHv2vL54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SrhCrVAr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SrhCrVAr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a29e6110so32985835e9.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775574774; x=1776179574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1hN8mCBwc97NQZYyYnJTNMhtLwGP6OBa0knSNEhsEI=;
        b=SrhCrVArYbSnUexuuKKihGscalGqPI/QzOjFRrHaHr0HlRct9NO7fK80oF7pRUVnnZ
         AQyPhQDVlGJs8hhudrGECrHpN0BY/91AKdbFGKvJLHLRhi+52eBwW/kCT6XirIdABe0X
         tWEtEoYNyZas1wK2Se72Ska3wd27IZZ2Z+a+IRMT3/Ui8pEafrlnzgWd17lOl1+5d/uE
         BLO3DK2eZr+VR7CxRZg2xwvy4xjhZ18iqjspbZZmSbNsvQo+q/4Gv+LUtvyikfuwboqw
         aalWUZjk4oo6QTESph58pqtHp/PR2LjDdu4QTd+O3Ccj0aZLnFx8/5kgU7E1uU4RJXaZ
         Zgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574774; x=1776179574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1hN8mCBwc97NQZYyYnJTNMhtLwGP6OBa0knSNEhsEI=;
        b=Qs8asc4yKcj1ncy+oWRNg2YlBSYO5UdWYFnAaOLqc1z4wyqOHB4HclxMsLLNnXAoCP
         8eiB+3ECf5r3yh5W8+UJilh6/3XHnFGX4wsGuqLToG04Y1ts41hLC8fpFDE8Vbxhzuv5
         BmTk45UDn3mkNMBP0IGW9xWRpTPwBnPS3HEJgc4ZO3FpMyEAYzaD+JOZ+tFaamHtw+kQ
         nRRUyXK/bGXsBz+waPEJL4yrWYZGYhPi9UmtWg/6N2R9j6I73x/yjw+ybkFVQ2KJDvqd
         D3M0sO/d0K4VtgBRYNmCLgDVLWJ5rQsGhvuKbmA50ql5Z9IJMuOBQOizo1guRbB4EKfA
         cJQw==
X-Forwarded-Encrypted: i=1; AJvYcCVv8euQF4CmzQoJYnOcJeTu/MDEJ7LuFNW2btC9mut5g2BEBYy9u/Vk6ryp6tuzPWvAwUdloX2pa1zBBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8JWJOcJkodhAmssMJQEk8Iab6f/JFKWFh4c+Ikjsp9vjoZoWd
	htnHaiNjErMjguonLMhGyNgi31JzMFBr1WGJBPnNYadx4ka5PQ9RY7y8NTRLnjrGRSg=
X-Gm-Gg: AeBDieu6WuuhNaXMuPWMVF4CMAu399n1LjKQf9kTOZ9sPxyd594HmV6q/KQjbDMyLO2
	fmqNHUYnGMishDO+SF5AHwG6GCXitv9C69Ju8nm291EvnJnDMgfGOyriWd1iO3WZI6qkkfX005q
	RLUOQ2/0k1pcjm+1kWTRohRbml7O9l9GnSOQ1RyS7/MEs+TFTWZ8jlu6Dti8bckdlKaf5OBpHBz
	sOJT7z6azAwAF/c798uS4KU1N41RnHJtaUVGqsBZOcONhjtNHa4kKX95VslHxMH/ZGzoptzfYFx
	a6Ixf88Ju+De94gW3n/5Gpx+dIrhQiJ1Vhc2Pc58yvz4Yc6lAfKlgQzMAHW4PWh7qAtjZZEQVQS
	p7xXrCtCDzKKR09D4iERj15A44Wngyr8MoxUqwN5eeRc4OnUUhMdLzySBfUnAzkbmfQw9jNf4kr
	NCcUXLjfSdvpI3TLR4/xQdnwTXVyGLgcg3KUhHKsx4Vg==
X-Received: by 2002:a05:600c:3b1b:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-488996a3560mr236913405e9.4.1775574773822;
        Tue, 07 Apr 2026 08:12:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a8ddfde7sm428997685e9.5.2026.04.07.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:12:53 -0700 (PDT)
Message-ID: <77514d1b-e418-47db-9b47-8f7d8a4cedc5@tuxon.dev>
Date: Tue, 7 Apr 2026 18:12:51 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] dmaengine: sh: rz-dmac: Add cyclic DMA support
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
 <20260407133507.887404-12-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11332705744F2802F745C1567865AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11332705744F2802F745C1567865AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 4/7/26 17:36, Biju Das wrote:
> 
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 07 April 2026 14:35
>> Subject: [PATCH v3 11/15] dmaengine: sh: rz-dmac: Add cyclic DMA support
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add cyclic DMA support to the RZ DMAC driver. A per-channel status bit is introduced to mark cyclic
>> channels and is set during the DMA prepare callback. The IRQ handler checks this status bit and calls
>> vchan_cyclic_callback() accordingly.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - updated rz_dmac_lmdesc_recycle() to restore the lmdesc->nxla
>> - in rz_dmac_prepare_descs_for_cyclic() update directly the
>>    desc->start_lmdesc with the descriptor pointer insted of the
>>    descriptor address
>> - used rz_dmac_lmdesc_addr() to compute the descritor address
>> - set channel->status = 0 in rz_dmac_free_chan_resources()
>> - in rz_dmac_prep_dma_cyclic() check for invalid periods or buffer len
>>    and limit the critical area protected by spinlock
>> - set channel->status = 0 in rz_dmac_terminate_all()
>> - updated rz_dmac_calculate_residue_bytes_in_vd() to use
>>    rz_dmac_lmdesc_addr()
>> - dropped goto in rz_dmac_irq_handler_thread() as it is not needed
>>    anymore; dropped also the local variable desc
>>
>> Changes in v2:
>> - none
>>
>>   drivers/dma/sh/rz-dmac.c | 144 +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 138 insertions(+), 6 deletions(-)
>>

[ ... ]

>> @@ -500,6 +562,8 @@ static void rz_dmac_free_chan_resources(struct dma_chan *chan)
>>   		channel->mid_rid = -EINVAL;
>>   	}
>>
>> +	channel->status = 0;
>> +
>>   	spin_unlock_irqrestore(&channel->vc.lock, flags);
> 
> Maybe create a patch to convert all the spin_{lock,unlock} with guard()
> in this driver.

This series already has to many patches and I want to keep only what is 
necessary for the cyclic support. My plan is to do the guard conversion after 
cyclic support gets merged.

Thank you,
Claudiu
