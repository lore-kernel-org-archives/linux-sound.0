Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333B1E0DC4
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901395; cv=none; b=mNqwwIUiEcJhIaHcoDbnRR2e2Z7D9R9tR+A6IhKxR1IbS8XkwUoPYikpigirQFxQP8mbksYEjlPCrwwHZLCjRGh08nvTnYz5cbRnOxDTp9/SiZUhkjOCIf2NtkGKSJ1NervknDg45kpN32oehMS0MgyBDXBDy7Z4Cy74olvMdTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901395; c=relaxed/simple;
	bh=LDBL0kkMZtib5PEfH1gjZQJCnJISQdKjevP7+A6MsOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTZi4b8YZXocaFC3CP8qJrauZU5RAHDM1sXh3gvmdZDOXCTAPSV8VT8pEkBa3NrtO7Z7HjfAPPpI50bojThANoJep/V1XER7yM3b98LG10wrKsUIyqhN6CUrmJeZjnt6BqFQWrMBNMsBo/ImZ4e5C07YZgJVwl/s2z5oxJHZCg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QJtJ0QYC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QJtJ0QYC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9eaf93e40dso359151766b.0
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 05:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730901392; x=1731506192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnVWSw+KJhETAVasGJrIAvyKjF38C4m7Mqa7Ozg4wBM=;
        b=QJtJ0QYCTKpEhaHTwkjuDI+CjQJ8lSZcMOUmKbKX83mQpOvlYyItL/GaNQWi5D71Rs
         5e0IngXpcErtXMlER5/y5PLVHuAMrjOBJWW/dxE4+q4KeZTdAAWed2mE+rw5xERqwjHk
         n8r4/iyk2w6uuewRpZGAiNyL85vA7cr4TR3vvT5VWFdV+srw7bnC1RF7S8rnLcc2qy77
         2kKk0yP45enW2tNp3/AvJi0UrLi15dRGEz+RkH8F6iP1+U+l1xi/kz5WMTnKbqji8MLX
         YiBQGUTUm0JipJ2CSn84nTkPP7Cy5heoGotzHzeJsy1CM6rdGJDlS+TuWUpk+NJZtHRg
         6Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901392; x=1731506192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnVWSw+KJhETAVasGJrIAvyKjF38C4m7Mqa7Ozg4wBM=;
        b=hm4sYAW2z19dUPstAvj7bwSbLODzvoPJh7Ej7uzVlcucMmL/oxo9Ge1I0rXLqMdqJU
         Rtub3VYcVq82iIq1VOk6+Xsc1afNpDGPLiCQ22FwBNkUS1sY2A4iSWx4TkJxM+R1k4zU
         eOXeklXDjKAPasXjgtDO8g4H9+T/1PrN+4lQm8SAbmfgQ6aVIxZfi2aXKOKGPI8pyd0O
         RKukBiq59IOMiA7KQGjwk6srGh2Nrklm1cck6e0VEopoHjHiFhtGNCJKVGKwNvxTosP0
         opKIbBSG6n1uVhoAUormUSA+mmZHP0Sdrvf3nIW1bCoKarUPBGTBFhRtS0XaZCo3tcan
         exMg==
X-Forwarded-Encrypted: i=1; AJvYcCUf+4C9lDT+BVXlBIhzCdR7sb60r8JDGUO/MbZ2UoR1YWtTH2+913wNCOUun8M7tb/eHSoybGgsaecu0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhBNBSYttp4YkaHvvlGutL4x5f2MOx/VCMTuSehWYqlsUlXLp
	H/tF9ahb3yHp38HQI/gFSqxWAbXHbpGjLIptsi0pFufveeCpxFwO6scPb8pGuGk=
X-Google-Smtp-Source: AGHT+IF9scKQ8e7/Ni57o63cOTx1M2FE154987xaiGVVDPZ0ZG5nyAs/OZYi2hcL/6qm28yhXA9oEA==
X-Received: by 2002:a17:907:948c:b0:a99:f8db:68b2 with SMTP id a640c23a62f3a-a9de5ecca55mr4251763866b.18.1730901392595;
        Wed, 06 Nov 2024 05:56:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a1012sm283324366b.38.2024.11.06.05.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:56:32 -0800 (PST)
Message-ID: <bfe67d69-66ad-4121-8c54-a874c7727002@tuxon.dev>
Date: Wed, 6 Nov 2024 15:56:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/31] ASoC: da7213: Populate max_register to
 regmap_config
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lgirdwood@gmail.com, magnus.damm@gmail.com, linus.walleij@linaro.org,
 support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-23-claudiu.beznea.uj@bp.renesas.com>
 <d3c28a8b-878c-4894-aa23-5b360153b85d@sirena.org.uk>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <d3c28a8b-878c-4894-aa23-5b360153b85d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Mark,

On 06.11.2024 15:43, Mark Brown wrote:
> On Wed, Nov 06, 2024 at 10:18:17AM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the Renesas RZ/G3S SMARC Carrier II board having a DA7212 codec (using
>> da7213 driver) connected to one SSIF-2 available on the Renesas RZ/G3S SoC
>> it has been discovered that using the runtime PM API for suspend/resume
>> (as will be proposed in the following commits) leads to the codec not
>> being propertly initialized after resume. This is because w/o
>> max_register populated to regmap_config the regcache_rbtree_sync()
>> breaks on base_reg > max condition and the regcache_sync_block() call is
>> skipped.
>>
>> Fixes: ef5c2eba2412 ("ASoC: codecs: Add da7213 codec")
>> Cc: stable@vger.kernel.org
> 
> Why is this a stable fix when it only enables further work?

I thought that not syncing the cached registers might impact other setups
as well.

Also, Renesas is contributing to CIP (Civil Infrastructure Project) which
is based on stable releases. The audio support in this series will be
backported to CIP kernels. Marking it for stable ease the work to backport
the RZ/G3S audio support to CIP.

With this, would you prefer to drop the "Cc: stable@vger.kernel.org"?

Thank you,
Claudiu Beznea
