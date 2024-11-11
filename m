Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABFD1527A7
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323775; cv=none; b=tWYd1rHYEm1q0z/XnsZAOLqSD/Dk6SVipUncyXd6VpPfUXAseV/MnxxRBFNfR+dIv55tW78BG+lWNncAO1lRrI9JC4As2m8lNedl4631SLABHkbu//tevDRRnywrGEH8Cn91tun3ZjByxJYz49a+P7+qKW6GY6oN7LIbE+EFDcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323775; c=relaxed/simple;
	bh=driMdGrMh2CQU3EhaccQrwFYyIsDDb/uDW3/8Wb/CZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mG3aIqxLiAe1jSKOkQCgftGm9hg1IkSSiL3d4uZIk5RxbkDJKF45RZ9l/myhmQepmNwZtOVEHiS0b2pJx68VYqK36WC/yFEFkdxFnlCvhmnsiUD9h43iiIpN90zvitfc6ZXwGjFlMhdIA01F1idh8zbRDg1j+bU3BIkUOOEUF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RFe5ho+3; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RFe5ho+3"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ed0ec0e92so623681666b.0
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731323772; x=1731928572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymcL/BmbTqU8qfDUCoVyraAtY6xWOZahvC7lOWoyBMo=;
        b=RFe5ho+3CKXVrNqbTNxvWa0N7t7htxFN003LZo5VhmJnf/rpIjbJlwJSuSDMCk34HT
         ym6NvcChK8jlHp1xmwcUF/sollyFfXuyI2aJhHO5vgEBTZi+hyUNwOdcer02RyNG95rQ
         zkrnQfHhVFxjO2M50eMNe5imd6UR62YiAbwRBK0XrQgv8cB6LEs+MmUel1rsjcmzVkcQ
         Y6B0DI9cIhuakDYR329jKK8rLZOf3kIZScynlsYNig1wh5C+L5G8WjOoeoRtdiwjhaQt
         MLp9Grht7RMNPitkE3Bf8PUAG2IsbGWZdRu3iNcEPZJTKWGdAM8Jp31KdqX/mrg6mkLi
         2hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323772; x=1731928572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymcL/BmbTqU8qfDUCoVyraAtY6xWOZahvC7lOWoyBMo=;
        b=c7z4JRyZMIrM/odIKqTzS1hQoMnpetZAQUxgFDPFhOwMw72g+Volqj0AmzZhWAb1EI
         ig6puCIly+Kp8Fir3EnXFmdh8PtWryLl+6sJECB0tA9TVyXTMdQKJqkgfn18jZfHgORy
         oxDIYK/UVXfdTYc8NrrujelBxXXAP9vGQdsIyHhLDIht1NNLLz8sDoCoEcccySC+v/mY
         fanyI01cfoP0zB+wQlKb80OcWanllfiMpZp3tIRZ+rQgwuhpPBAL3n7GNzYbiGwt74t1
         6pa+kP7FNO298ohNENrIcCE+kGAxk4DZTW7kHdxdbx0VkWPpo7TwLXVOsUaX3tnYAVEa
         bu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9RbgC3sZk7DCI132x7MH5lQODa0vuBBrDUi+W0drL5LpksBsDwQ/w3dcgxEJhfuvOPV3m7jRMlS1AWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxStVgIjIdkA6Pf8RYV2onfUi4ENfUnLVVaK0vSFhXW02nXYK0m
	QRaC0PriMd6884YEea6zL2C8LR0RIA2YjXai48DiCQcUX52JKAORInTEBZACfUQ=
X-Google-Smtp-Source: AGHT+IEIXXKEeW8AK/XEUpMILAea87VIswegaWQL9LSGa2DctrGMApRhmo53B5f76Sl4Kpl0fHqtKw==
X-Received: by 2002:a17:907:94ca:b0:a99:2ab0:d973 with SMTP id a640c23a62f3a-a9ef001b427mr1296793366b.55.1731323771938;
        Mon, 11 Nov 2024 03:16:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176cbsm593593066b.23.2024.11.11.03.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 03:16:11 -0800 (PST)
Message-ID: <42c5da73-466e-4238-8862-dbe727d3bf3f@tuxon.dev>
Date: Mon, 11 Nov 2024 13:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA
 transactions
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com,
 linus.walleij@linaro.org, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
 <87ldxqmwdc.wl-kuninori.morimoto.gx@renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87ldxqmwdc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Kuninori,

On 11.11.2024 02:45, Kuninori Morimoto wrote:
> 
> Hi Claudiu
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> In case of full duplex the 1st closed stream doesn't benefit from the
>> dmaengine_terminate_async(). Call it after the companion stream is
>> closed.
>>
>> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> (snip)
>>  sound/soc/renesas/rz-ssi.c | 8 ++++++--
> 
> We are now using "renesas" dir, so, you want to use "ASoC: renesas:"
> instead of "ASoC: sh:" in Subject ?

You're right! I'll update it.

Thank you,
Claudiu Beznea


> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
