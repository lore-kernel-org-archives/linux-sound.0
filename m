Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9F020CCF2
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402719; cv=none; b=otBwn4/kWeE4NJ4/22Ua2+v1CgC9mp/8YR6/7LrWmLrzsr79KH/LL73Pfx1j4rjbAUjbOHEtKDzL3svfgBYSSoWTGulDdJ/GtnJjDmNl1+Zzowm1ZWQImcYtTg+qv0YpqlfZVOAtjpQI+OyIlKjodLrfK4dewIh5XWU3I95z+Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402719; c=relaxed/simple;
	bh=ByhGgvdqV4gerAhSZ+0p1VGIZ0e4s+vC2r6OuvedF2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baNgjVm6mcHJgCawYd+G9WA9A9cY5LWr9AV8JksFbHsWTjRXpAs8OuA+v4QfC2a8SxXrWPJhDikv0tkPy1kdsvqQtddVc7qQEv3hkCv5igUfWcTKzJ7gDGZtfKBzIyMxgn0yElk56ILtawz3W6fWmoSR4fLsSamkYHxb4EE+EIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fIWo2cUK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fIWo2cUK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso878349466b.1
        for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731402715; x=1732007515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bT49tEuI3XaNlJGqnWq8uFVJQIUx+wbR1sO+SjK7Ss=;
        b=fIWo2cUK61O/eAvvX/Q5QXDbekPP2pMR1pylIGUfmKaDmK44ICDn1DdIFq41546HzT
         IksrdJqumzAeFJ/7xI9NlrxXi6qTjlDyGdgmy7JujvTx9LjRPzZgWkVw5+VNroPTmjvX
         /bAn/vxPxJs6Dpa3ELNH3ELr/xvsgcGHYClk3+w7y53PG2lk4MoPWVZ1+hIy5hI4Cuso
         rMkRLOmXH8lNN5wMHcHLZLbR7BYiUQOf/JDkLZqvv6wwjaoe4VVUBYfFuZ/mllU322KW
         x6fKybqOEu02DKumvjMpoLjRWkWj0A8sNGuryL3zSoCmtxbIsxhuxOCJ6CTU/syye92O
         6nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731402715; x=1732007515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bT49tEuI3XaNlJGqnWq8uFVJQIUx+wbR1sO+SjK7Ss=;
        b=t4bleAnuE6Svq2lIpM5mDWH0TvsLHmnX3jsBt0Stl1fjDoFAeefGK1CAmpYYHD+Vd4
         elVTpMouRwEn83YJX4ZoMNtLv9wPBUj9jSH2DTbtbEsrAcfVvu/GqoAkoY+rswCNJGaI
         lx6Uomp1S9ybsAMcZVi2DxzHRse8cg5/xUkDnLnMSOmnV7RxMck9AfFpGkU+NDnwNHb9
         LV0KkEujaDHs4pGPPvz+KqEjLVpYm7EQ2a3pJcvnvDo/SzjyAH9wg5ZpOOVHBrx4qGMK
         ErkX6TsR1dLcHR44R9pZcR6VH1g9j2l0Ec5TYdcfDlfrvvSvXBJUH4BsA9tG5jif1ogp
         bh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGu19ym1lnad8t/78iHJZMpOl7oAapHhZT4M7PRuRgdGGQw4LbCXpwBZYloikHrQ5Q+zGnD+juwnhyxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxegkWv5ewlw42A+ub7bvBQx9jlmzEvoLnpdhfO3eCPnF62eEIl
	Q3AZDfaSVqn4TVAAw0s57zDXjedO99Z6vQEc4aA6fRXQQHzO/Awvukv3RtX2ZlE=
X-Google-Smtp-Source: AGHT+IFY6ZnIGl+BWNcLVcWN0We3CqKXyiZszP+RpGx14lKsX8/Pc0KElS+H7O02yRwDXvrWjPb4Ng==
X-Received: by 2002:a17:907:1c11:b0:a9e:4b88:e02a with SMTP id a640c23a62f3a-a9eefcd1ad8mr1505031866b.0.1731402714848;
        Tue, 12 Nov 2024 01:11:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa1dda672easm63499266b.40.2024.11.12.01.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 01:11:54 -0800 (PST)
Message-ID: <b109e943-7436-42ae-912a-e6f6e20a948e@tuxon.dev>
Date: Tue, 12 Nov 2024 11:11:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <c15bb621-6cd9-4be3-beec-20fecd411547@tuxon.dev>
 <TY3PR01MB1134600DEBF0096A67950441086582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ce074521-7d4b-4514-9b2b-59b246686210@tuxon.dev>
 <TY3PR01MB11346AF4A763ECF2D2F31588C86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346AF4A763ECF2D2F31588C86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.11.2024 11:03, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 12 November 2024 08:31
>> Subject: Re: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
>>
>> Hi, Biju,
>>
>> On 11.11.2024 13:30, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: 11 November 2024 11:20
>>>> Subject: Re: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc:
>>>> Enable SSI3
>>>>
>>>> Hi, Biju,
>>>>
>>>> On 10.11.2024 10:54, Biju Das wrote:
>>>>> Hi Claudiu,
>>>>>
>>>>> Thanks for the patch.
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>> Sent: 08 November 2024 10:50
>>>>>> Subject: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable
>>>>>> SSI3
>>>>>>
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> Enable SSI3.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> - none
>>>>>>
>>>>>>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26
>>>>>> ++++++++++++++++++++
>>>>>>  1 file changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>>>>>> b/arch/arm64/boot/dts/renesas/rzg3s-
>>>>>> smarc.dtsi
>>>>>> index 4aa99814b808..6dd439e68bd4 100644
>>>>>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>>>>>> @@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
>>>>>>  	};
>>>>>>  };
>>>>>>
>>>>>
>>>>> &audio_clk1 {
>>>>>        assigned-clocks = <&versa3 xx>;
>>>>>        clock-frequency = <11289600>; };
>>>>
>>>> audio_clk1 node is in the RZ/G3S dtsi to keep the compilation happy.
>>>>
>>>> For this board the audio clock1 for the SSI 3 is from <&versa3 2>.
>>>>
>>>> If we fill in the audio_clk1 here it will be useless, there will be
>>>> no consumers for it and it is not available on board.
>>>
>>> As per SSI IP needs external clks AUDIO_CLK1 and AUDIO_CLK2.
>>>
>>> AUDIO_CLK1 is provided by versa3 generator and
>>> AUDIO_CLK2 is provided by Crystal.
>>>
>>> Currently AUDIO_CLK2 it reports a frequency of 12288000 which is a
>>> multiple of 48kHz whereas for AUDIO_CLK1, it reports a frequency of 0.
>>
>> Why? You mentioned above that "AUDIO_CLK1 is provided by versa3 generator".
> 
> Output from versa3 generator is connector to AUDIO_CLK1 

According to schematics this is true.


> that you described in
> SoC dtsi node with the entries
> 
> +	audio_clk1: audio-clk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by boards that provide it. */
> +		clock-frequency = <0>;
> +		status = "disabled";
> +	};

That is a clock node, placeholder in the DTSI, to make compilation happy.

> 
> This needs to be overridden by board dts,

Only if used, otherwise is an useless node.

> where versa3 is providing this clk.
> Currently there is no relation between this SoC device node and versa3 clk output for audio clk1.

I may be wrong or I many not understand what you are trying to say, but
isn't what this patch does? See this diff from this patch:

+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
