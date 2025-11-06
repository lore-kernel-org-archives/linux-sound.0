Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8129ACC0
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443603; cv=none; b=VHFbN0PnJvNdXBRcxYh+8RvHkvDgrQdkzMRTSuw3w3I/yPkcZAiOu0cO1Y0NvNMng8cP+/fgDxL0brCbOgXD6aJojls5wRtsoUyKUWSFAjhRuDRI27fKVsw4fQLmi0/a8nt1eazlF+l16i6zK/94TkWipZe4FG1EBVj4Mnf2yN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443603; c=relaxed/simple;
	bh=OvVab99hJjNyRIYEydBN0V5gIv2r0yCOEdtFZCKRP7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFSlAdUH7U3D8bsc7yQo9/wkxt5MfhHHuHhWzP28Rx2OPK94hl8WFmZA9vnXk98j0BoP/UPRRGP7YT6b1ho03JWVP98q7DTHV/45W/5izrne430XHrqIVEU96TVR7S5BbV67hZAMw+tDGv66wLo+ljyPHuURFvNga+9MDy/ZR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kevjdNmR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kevjdNmR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42421b1514fso623095f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443599; x=1763048399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCImS8vAPGN6LTIAPQAR8IZZ+CU8X+89zO49Z6Ixv/M=;
        b=kevjdNmRx/vPItHpbAA8Fj/gaSq9j+ClmImM0Wu41WWm99Io6fzx1WKICnV2NjGuga
         7IPYAskhRW4/AmYolW7YBPO5Us9+jZsIrLHiG60JwBHYXnsUkPauVfjnTaE7HaGJ2vb9
         YGNWemlzo8c5S8XaxIUhpJdfzy1o0vDVeYDzanJ7FEzuwIBnVjTH+A2WC6Akerw0Ujh9
         XdXdYQ+U6S1KSzGZWRK+gDlIUg3OtdsU6dsVGLp7OZhbTOU7VORIj2VozYwXtAmuFWWY
         NHgSOcI4vnO0JmiT4KN7GSGhmyfgV6CH/JaOMA9Vvl/ijiQ7GjMFxUmDrbMY5N/29B7v
         jW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443599; x=1763048399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCImS8vAPGN6LTIAPQAR8IZZ+CU8X+89zO49Z6Ixv/M=;
        b=BuRlwgVO/x4lzvwCLXkDVzUNsxpPe+DbscHsvpqWhPuamtz3CFXIg7Cg4MqRkQVlKw
         4olkMM6sDW+QRd/pXLiwmNtumz/TSMbgzRctZCm0DXzrvLv0/dxfN9hUsJEsZRAjvvNR
         rbynbQEjr/2qMoTdsSdCShbw0JlTAO6aN8zZ3Cx4kYD57UgQMJ5S9tjsJOR6FgaScQWS
         c5eNYdOPv1mmHTYBGBEIzKA6dzqeVAxYKfpurVa/lIYtEHhFPgrKxfRZI8lACowtAqO4
         z+87O/Nsht6mstV8GLOFwnSJ21SMl7P6NZumIPJtnVayXFSp7DvLVgre4I/Nos2qdVMS
         zTcg==
X-Forwarded-Encrypted: i=1; AJvYcCUxL4MwJ6GEYJDC6DHs1Uyb31AhyhnUwgm8O+DZB4bOytz1cnWOBar/PinuhnrGfZVC80rsCxg+ACDGXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDe69Rwe1blvOggxeYxgJ7unHbgt8bxPFYyFT1XEGchc6MMc7P
	wZ/J/Sk5neoUXUrwGuolPu6vYwdaDPDDM/T4ZJc5/JDGM9fyFiQeRIeqNF9GWReeJD8=
X-Gm-Gg: ASbGncuz2LEcxXZHjjQUzWRRSDadHPeaXWL0tFVwRHlwLWGRJlWQg5ikEB1Sf3nViKw
	CpbxllIi9Z3J9jegcR0Ebeh25Wmi+cCCiw3DIie53yB1BPIPmDaacL5jVYzm1ySW5QJtsaH+Nbf
	F9j92jHCqIszFb2PS+/ZZurC0A+e9Piuu89w23KNO/YmL78aNiFW93nrjYsdxlGf4oaL6Z+abWK
	+/nBYSJF56XARqaIewxCfQuWOo5Ask0DBloYGLAp8nB6VrisW1faFiETUFJt8NSOyYxeN0iRsXg
	8tDY5rAGiCUZfheavQtYx4eUdgt4tzgK+lWrVpIkQdL36mcRnrpKUj8fW7HZARcRLnNKtApzYC4
	B2OyL3PMldErPtIzIrEEpil/tRNd/ZzmCcJromXJPeCaZ8ZS5yqmAG6Nzx9D4ic6hxFNH1WIiNv
	J/b6iHBs1b
X-Google-Smtp-Source: AGHT+IEnd90RJHx7ZuzW87zs5Q4EEB4nWgY3Vtjy9fpk248/BemBXzC7fRUumPfx0M4xpvI1GCS0qw==
X-Received: by 2002:a05:6000:2510:b0:429:d0b8:3850 with SMTP id ffacd0b85a97d-429e330b68dmr6675168f8f.48.1762443599342;
        Thu, 06 Nov 2025 07:39:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4772basm6489913f8f.26.2025.11.06.07.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:39:58 -0800 (PST)
Message-ID: <181cb561-4fdf-49c0-aeb0-85844411a6ad@tuxon.dev>
Date: Thu, 6 Nov 2025 17:39:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/26] soc: renesas: rz-sysc: #undef field_get() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yury Norov <yury.norov@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>,
 Alex Elder <elder@ieee.org>, David Laight <david.laight.linux@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Jianping Shen <Jianping.Shen@de.bosch.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-edac@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1762435376.git.geert+renesas@glider.be>
 <7feec8e9cf823dd365d6e0f21004f943964e52a0.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7feec8e9cf823dd365d6e0f21004f943964e52a0.1762435376.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 15:33, Geert Uytterhoeven wrote:
> Prepare for the advent of a globally available common field_get() macro
> by undefining the symbol before defining a local variant.  This prevents
> redefinition warnings from the C preprocessor when introducing the common
> macro later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

