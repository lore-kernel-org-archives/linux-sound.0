Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13A37AA74
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085229; cv=none; b=dwWnhyNHvdzxgZ4Fp/zF0zcPS26dQyqXbQJFZdpy8Dp6UL6kStpgo9ZQIrzZFnR2xsQZoRb+GXzVdpCDKCnfgvXlozXnw8XR71anyhLsuoCf4DeqyFuysyRgTFZqqTP1WcD/ES6LpD+12VA7G8N7vyhmzif0CQoM9rK03789aB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085229; c=relaxed/simple;
	bh=+EEy4qpk2eBdZs1VXT497/DwvRtxn6z7miUTuIy3oig=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZCsdI+7hLAvH/pkKyY9D0tYx63EF+izwNE2vun545JcnZ8Ty4KLoPcaXTk6D0tQVqyl5+HCz2DB+xQwSBSv04y5tS/+9O1fko1QtYdgAf9bVFIKvZzxfXyE/MMSCM1mjiegngf3ouZUUUS1EQVlmVym+hFfBN81Qnjvhzpb0dho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyE4vOMu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyE4vOMu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccf2360620so1971915ad.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 13:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085227; x=1787690027; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GSv3ii9HXTdYv9LSM05qRUQPTHrz9VAi0bKPqbWiLxI=;
        b=AyE4vOMuvWdBoYK9hkIqPle9ZCCiQt78fXo9IhRYvoKcexRHlFu/l/T3AdNhcu4R7Q
         BXCPa/1ni4E5gr6bdoN3fXe6cDjSPzD+z5sroicC2LgLLYtlzdiq4gZX29AI6xB3fSmP
         9Fe9czsooP5aOHQdsTaiHplYscBh1EhdlMVYynkHxY2JRpeOvwLGABMoXfY3HgNUmyHE
         U3LY+MS2yy5vQia6Ni7cFkb+iRlDB4ZZOnty4QhDLZVxaGqBeW1L46vaaz77SX3gtO9s
         pHo644gw0W7ZnBE0Gh5yG+OHp7s052cK5OhFJr6EJqZGEO5+BLU4dAqJpPh/CikWxcjk
         SwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085227; x=1787690027;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSv3ii9HXTdYv9LSM05qRUQPTHrz9VAi0bKPqbWiLxI=;
        b=RJUCwzw51tD3q5pUdYPdz2hnVW057YbiUdyqvxbRINl4ho3pfKnD+WOBNnjnFoePwe
         bM8bujTzdxmjXJKy3sMKYaaUHln+Qlug0H7ekBNwk7/SKYf5m3ATGE4wdXKFvnxxvo2j
         a7bHWjh5KuVwaNJa0t36HOokNcsFr/nD2Sbavru5MhpOOsHMZ2UKHyVijAC/M5kY8PSy
         8AZ6x2/+muOxcaV4FX/Pnqn3ufnE+sOBiJacorpv4yDv9OtOfyUPWTAh7uDEWb7BoWO+
         +Stw8PM8+0vpLO2WXX2S5GycPA0+EZlMKQjFsdDMJXNdhLmJ8stgm0nyoaX8hk8eSFZL
         nuuQ==
X-Gm-Message-State: AOJu0Yy2/PxSsI8+uP0EXCLMSZub+JUBcP52CiZPsoDQ9UmwyRbtB7F3
	9ZsOC36MHsgER03EKvNDBJN3zFV7+UmBwALk5XCKyBhHT6OAJrOYD/0Q
X-Gm-Gg: AR+sD11EQmzQtNnzUa2IsQjJ3osVoifQXzKKJLaaf7q69H7N/4Q2PHKyISuIfgHCMA/
	4FnLvtRFgcCWJ1bKalAaAuDqrrWtyBl/GgwepT0wLX1OARYKmRbSH0bRsiEhXvFOpUGxN1vhItD
	5CdAEz9HIPeMUE0gxt8J73Lv/1+vrtkVqSgxxeiWWEPA2Y+9DTrRbrZFU4aQUwXDbtxxcBpGv3f
	lH4lydBBgJsGNXTWTVfqE8U9D+b3p0ANZhn+oP7SAyKXeyriV5KqfI8WAtMcIx2PxYwlc/GQLa7
	1PzbJdxH7KRl0MRvUu9kWlFjLaSKm2rqKpWNrmudX2WSS2SCH0k1iq5NcKsCVBy+ugFqEFQOxpq
	qM7ICYs6RsWemoykeGNmQmVwymm0xE3KB0nrczpFbWy5x1EfMf3Qf9+5mp1nrQ56V2JZJQStIvb
	FUGQcHWh0OW3xm7ZJYQz5sSJId9wGMJNz9ef3a5//0jUcMTUYT/ZJSiNPpd5Em3YXbE8Ixqx0xf
	8ElmqrsPrFJkwSMmAGAMonJXJuvaicsSfUgGV33hECdtpLz4zd9XDLvzAfVpDNKtDqib8rIJbG7
	Js4kT5ykYdCGNDSsBjN4avYqlPxgbllLGCXbug==
X-Received: by 2002:a17:903:1acc:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d5f6b11405mr8473765ad.8.1787085227100;
        Tue, 18 Aug 2026 13:33:47 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1f00840sm18306575ad.80.2026.08.18.13.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 13:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 13:33:45 -0700
Message-Id: <DKSCUAP946RH.AXJJ9UJMW9CU@gmail.com>
Cc: <linux-sound@vger.kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
From: "Rosen Penev" <rosenp@gmail.com>
To: "Thierry Reding" <thierry.reding@kernel.org>, "Rosen Penev"
 <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814205018.39015-1-rosenp@gmail.com>
 <aoQ7SynywUKcIAaS@orome>
In-Reply-To: <aoQ7SynywUKcIAaS@orome>

On Tue Aug 18, 2026 at 4:04 AM PDT, Thierry Reding wrote:
> On Fri, Aug 14, 2026 at 01:50:18PM -0700, Rosen Penev wrote:
>> Replace the pointer-based map allocation with a flexible array
>> member and use struct_size() for allocation. This simplifies
>> the code and avoid an extra allocation.
>>
>> Assisted-by: opencode:big-pickle
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  sound/soc/tegra/tegra210_adx.c | 12 ++++--------
>>  sound/soc/tegra/tegra210_adx.h |  2 +-
>>  2 files changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_a=
dx.c
>> index 9175598b52a7..d607ba4233b6 100644
>> --- a/sound/soc/tegra/tegra210_adx.c
>> +++ b/sound/soc/tegra/tegra210_adx.c
>> @@ -677,11 +677,13 @@ static int tegra210_adx_platform_probe(struct plat=
form_device *pdev)
>>  	void __iomem *regs;
>>  	int err, i;
>>
>> -	adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
>> +	soc_data =3D of_device_get_match_data(dev);
>> +	adx =3D devm_kzalloc(dev,
>> +			   struct_size(adx, map, soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_W=
ORD),
>> +			   GFP_KERNEL);
>
> This is slightly hideous. Maybe add a temporary "count" variable for
> readability?
The reason for this is to allow a treewide conversion of this when
devm_kzalloc_flex() gets introduced.
>
> Either way, though, this looks correct:
>
> Reviewed-by: Thierry Reding <treding@nvidia.com>

