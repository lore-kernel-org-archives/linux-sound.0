Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60E35943
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751122; cv=none; b=iMkPeITMYp0b/U37vUlNQXMeiczb9CZEZmo40JNqxZJSRGSniI3zHeYBiWPELfcqTV5x8FJnKpDHhO6OWBju9/c6jgzsUQLcm116zlFpEmGsG3RLTzLph6cbBwAEUk0uT01QDokIik/9woVuF7Sl1Q90mxJ09qcupnPYbB93A7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751122; c=relaxed/simple;
	bh=d9PZTUr6orWHC23l539tFQMpBlNZRrC0wSrH3eHbn6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIWOrn9bPnQAJrZQvwEYY5nMxWA1c/o6sWlo/Zyq2uUC0PYfJJCclePQ567mEaULuwNW8IByqATGToDTBZjEIzaxigM1NiMchsXxLNZG5w09ItY2kavRUkzQARx/9BNGU6kwH4bQ9FZP+4dL48xQrd3ZtgZGSUwMWqQ11UrhDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qPs8Xzsk; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qPs8Xzsk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so5494434a12.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Dec 2024 05:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733751119; x=1734355919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbxG3yBrfjzh5m7OHA690Ws9nh2pSGo1XTyv9ZWjP/M=;
        b=qPs8XzskI4s8GAW0T+6e6bq0we2GDAz/a5wNCsoi3/PiayF4ixL+oKHZKTMf23BSR2
         wqVaIXStsXhaV7kFTOSiomjw59CJr8zGq1hLUl6dxBwnVBr5Ju3uqr3H2yVzBbs10cHk
         Ft7+O6akMOEEmJfmU/t8j7rr+YVgr0JpB1OksVizPJA50Izq2dAPg4iIkjVNnzTEOAxY
         flX+Dr+LWOYTHItDXS3Wqlhs2m+Sv5RzqY1BQp53vZ5TXH7Pn88i4vt06F9WDsHdSwzo
         okK4FWqrSnymwcXx7Ithj9Z39LUAZ65LnIxiBhQ6b9Vmi/79yqqwrH53iuczjsItfnjR
         I2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751119; x=1734355919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbxG3yBrfjzh5m7OHA690Ws9nh2pSGo1XTyv9ZWjP/M=;
        b=Mgr5XGELTDHJzmbEcCdZccvT3fnKkhaSPwXjBrMBQhIZTjnlcQWZhM5gmyKN7/tb92
         CeAothjXE7Lv6P3V2vxhbfbIwVPZl9YwlJatMfIXNGlqlteJnAEZhmRAbVHJdEk0FXwp
         LHGwVzVxCszkyKe+ybluZNw8heQkDlUtBXazlwwe6WErtaFpUxPGcuRcQfWffrCCHO7d
         +aFvr/Nuk+/Xdgt7sDXm2pLsIhzsCtihyZViwXenI2gvXuneiZM/aAWppKjuVJRaPZ6T
         vkoXh2mOz1KkcwY4UGMlCR2cJW2t5HeFj0ZginPuCNfQP7wxFJ61vIOFS4e9ntoYU613
         oxZg==
X-Forwarded-Encrypted: i=1; AJvYcCUimoFap/OMPjgpd+Wytf7mvPIlRJbqKjR/83LCfelzUmaCd8EDzZIX/aJIKnOAuEhKHJdSCGaxmQgFLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9NAEN6FnOedptuJM88aLMkOISu9iR99Ylduo34/tIYjawU258
	hLCkLjUiAIXPBhRulYQSxH36kkiNYE8XZyE0MrMX249jLTE9cKQu5Dc6uvUb2lI=
X-Gm-Gg: ASbGnctMfUpuI4KHirJbD0lHZqeUoKSN4zFi9PiV9r7OXS7xOS9KKbwQoIFDgGb8MRp
	8f0BvA5qmp2WHqwPD7Ki/xXVBUwXWHnZcMksh6mMTqEQTHNcIkb3YwOcV0P7rxcO2VXfPIkfm2k
	JuYPJXWWiEU4AKzPa9FGY7s2XXl3m0hFyOvLI65pi14YRPXBrYNC9JKTRiW9Oa0Unp2Zhvvy7wI
	Xz9LJkglGtNXFlUzNItULeE0I9DkLPNSv1d6FxAlt4jqoeKsNPI4+dnECw=
X-Google-Smtp-Source: AGHT+IEsrlESQiYVoiKv8vD0ypOrjTVD+6RHuECL3G9XiqxEE715IsjeegDQVL8LbbssL5zLsoGdrw==
X-Received: by 2002:a05:6402:2689:b0:5d0:b879:fa36 with SMTP id 4fb4d7f45d1cf-5d418506a04mr834126a12.7.1733751118594;
        Mon, 09 Dec 2024 05:31:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ec8ef816sm2678075a12.59.2024.12.09.05.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:31:58 -0800 (PST)
Message-ID: <97049f44-cdcf-42be-aefb-c535bd7d0dbc@tuxon.dev>
Date: Mon, 9 Dec 2024 15:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/25] ASoC: renesas: rz-ssi: Use only the proper
 amount of dividers
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-8-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 09.12.2024 15:22, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:36 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> There is no need to populate the ckdv[] with invalid dividers as that
>> part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
>> always be >= 0.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
>> @@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
>>  static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
>>                             unsigned int channels)
>>  {
>> -       static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
>> -                              6, 12, 24, 48, 96, -1, -1, -1 };
>> +       static s8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
> 
> "u8", as 128 doesn't fit in s8 (why doesn't the compiler complain?).

Failed to notice that. Thank you for pointing it! I saw no compiler
complains, though.

Thank you,
Claudiu

> 
>>         unsigned int channel_bits = 32; /* System Word Length */
>>         unsigned long bclk_rate = rate * channels * channel_bits;
>>         unsigned int div;
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
