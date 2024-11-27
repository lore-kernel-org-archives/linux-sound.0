Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C1201010
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732728111; cv=none; b=rWMeslg8M7492ZMZK50oB8PRq86tA6zl54qRzoJhPgG94aagZO99IGw98db8UQ1ZkVqqYLxBOfja9t8+1urZAmAKKnRp+FMepizYf85Wm6rMlZC3FGIy/oEwlsqR8AFIOf+WiFWTMkDTRis5o9NcWED308JyS2EfoUlIi9TdzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732728111; c=relaxed/simple;
	bh=65aYM6N26qjzWOA+Lupo8UVQBrVj+zOdMVkxHTv50Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0sRe1Y2rAZKzY22vg6vKujFPPByjIsBR2+lVrxdK8sluLI09Eo67UYhtlchhBF8G1Q7b32SBuEqnNdvMFIVGZplMg/9zpdss4dKhQ92IOy+gd1uSmlUn1ofYJPaMSXtNb5BxXQDy3xo9VxttdLyhZhcpcJQBXxjE8oZ9TVPSqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G77ziwA0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G77ziwA0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38241435528so4426756f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732728108; x=1733332908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joY9jROGlnz2og0g8pwUmAhFhVOpMoCp26ajpyfTKYY=;
        b=G77ziwA0y9G9j4cePwQnZAW154DzixMaIkHm0krR8wW8WEDoorADqsl5IHEwEBQtCG
         YrIcl5JKcVl6DLcU9GdrfWhrbOF13k4LIT82pumvU+Suyn6Gqlju0ric9O3kYIoCa/2p
         ZviuAWa7tPNucPLIzI6YFY5fE7VXwg3ywtr72B4RpOfUDXUW3yhK3pYJ5up8hXFUON3x
         uDE/8uCQvPPE2kbdYM1O4qsTWIrSCgRSQy5zRUK/xnF0RpgQSc8XKKBvYj3vWoyNr5WQ
         hZx8p3H/F+BbEwgBlF/ghshCNWgHDWQB7erhOEcb3BHtww5MnjLH7luagnTFO/zrfpyH
         usVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728108; x=1733332908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joY9jROGlnz2og0g8pwUmAhFhVOpMoCp26ajpyfTKYY=;
        b=V3A5Ji7qdpuMTeCw9hh1XOIalGdFc8yhUo98cn0zpxsx1wd1cxQTnZO6lXsMa1C7G9
         IVdLwrnHZjFgC667x1bZMHqfwiCl9MnHkuSFWK6meshbyqP5voHkKrTv1ZF/zvHG0UXM
         9OOqBY7dRIBXtbOPjgqQXkFXrqAA+BnizAtYJ0GDlyU1K45814/12UQBkGj3qT2xvWDi
         0IeSk4nfgTTMTHh5oZ5EbGETX9QfjOEu+wLc6NbQwrOytli+xkY+zHtNJBwNfLW/0Bn5
         Z1/9/a03xYLM4a/b4urO3Ug/91Z0wLdEvWThVVeGgpkQ5547dD4UcOZzReTX/R4AMnvT
         XHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOsbKxYb3HQCsgcIivMsyMP0YXDZzw7IoK9f4naurEOjX1of4TJy/f/E1pEDgat7puhjCqs3mZmodr1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg31knJa4gQ4BTYU1jkCDoivLzaafSZYOJMtbIr4Qbo7em9vmF
	/mG25wlrmeczqq2HmwrFIL8535RHy5IByea+zUvjW1ugcSQNpOxNyA3uVITwd2E=
X-Gm-Gg: ASbGncs5iFgnE7CSJzLmZ0w/uHdeR64ny32DxKsbhQJIGCAtMYhPLJ3O3ToPQCfoTRC
	graEJAjM5amWIaiuOBA3NL8khhYSnSj4OL8GqNqQZZHsHonWzAeYKvyZOdRJ1tm/Ngc1sLI2vVi
	H85+iDt09uGmr5o/AA8/DBLP3YdW9M3UwxO5LACxQRx6lnz6xyCdkCrBy6ztfq6AFmavuZDsSVl
	fzY8bXtjVirfJLmiuSCMhsy/EB785R9LtA6vz5q11t3yCuR1BFvs4uoSA==
X-Google-Smtp-Source: AGHT+IEwxFX2alAudU3RtsTrvMnoOq4JYgGY0fdaW4rv6kK+qa7GhKDhgceGlbe6flrzyyd7UpC7Pw==
X-Received: by 2002:a05:6000:2b03:b0:37d:3735:8fe7 with SMTP id ffacd0b85a97d-385c6ec08e2mr2414458f8f.32.1732728107563;
        Wed, 27 Nov 2024 09:21:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe3cbsm16741588f8f.38.2024.11.27.09.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 09:21:47 -0800 (PST)
Message-ID: <9cc61971-4a0a-4421-a998-341cc3072d3b@tuxon.dev>
Date: Wed, 27 Nov 2024 19:21:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets
 and power domains support for SSI
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com,
 linus.walleij@linaro.org, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXfSmkbnTS463xa5ty_2W+vFbWhRK65nN1yiN_+c66P5A@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXfSmkbnTS463xa5ty_2W+vFbWhRK65nN1yiN_+c66P5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 27.11.2024 16:46, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:35 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add SSI clocks, resets and power domains support for the SSI blocks
>> available on the Renesas RZ/G3S SoC.
>>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
> 
> Thanks for the update!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -209,6 +209,14 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
>>         DEF_MOD("sdhi2_imclk2",         R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9),
>>         DEF_MOD("sdhi2_clk_hs",         R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x554, 10),
>>         DEF_MOD("sdhi2_aclk",           R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11),
>> +       DEF_MOD("ssi0_pclk",            R9A08G045_SSI0_PCLK2, R9A08G045_CLK_P0, 0x570, 0),
>> +       DEF_MOD("ssi0_sfr",             R9A08G045_SSI0_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 1),
>> +       DEF_MOD("ssi1_pclk",            R9A08G045_SSI1_PCLK2, R9A08G045_CLK_P0, 0x570, 2),
>> +       DEF_MOD("ssi1_sfr",             R9A08G045_SSI1_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 3),
>> +       DEF_MOD("ssi2_pclk",            R9A08G045_SSI2_PCLK2, R9A08G045_CLK_P0, 0x570, 4),
>> +       DEF_MOD("ssi2_sfr",             R9A08G045_SSI2_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 5),
>> +       DEF_MOD("ssi3_pclk",            R9A08G045_SSI3_PCLK2, R9A08G045_CLK_P0, 0x570, 6),
>> +       DEF_MOD("ssi3_sfr",             R9A08G045_SSI3_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 7),
> 
> If you don't mind, I will rename "ssi[0123]_pclk" to "ssi[0123]_pclk2",
> to match the define and the documentation.

Sure, thank you!

> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.14.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
