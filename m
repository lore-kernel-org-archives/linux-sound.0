Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C622737EB
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443408; cv=none; b=HUTsRtRdqNBExr5fW6NKr8+BfixWbn7r/W1RgCHTddxtyIkN0rtSwUTliBzo0QnGdJ+h0UM1N6UNj0YP1LtriuuyyQq0Uj9K4NYaffQDkcBGqqdvxuUKeV2QHTgu5HqPbDAvMJQzGG/1+ngyLWKGYDu8maN8AUZkDC1/hV0a+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443408; c=relaxed/simple;
	bh=xk6l2WOOOp6czqXIg1WfykCAiMAdHCUw6VSHs/tqjfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4V7btwnNz5oEKdDT4+mgBQqPhSfIB9qcLO5FDZwEsPUS4iLzrvry3VteNbm4p4GsLsrk1hXTUgN69qxgh0C0Fn5RZgc0SjHihIMpE/vdVCHybB3xdolO3F7mweDjqZyMx/iwgkwU5GFWUPRWWOzgy87Xv5OBIdRF9s2JwoA24E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RCBBHmI5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RCBBHmI5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47114a40161so11363105e9.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 07:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443404; x=1763048204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoiFfWZaW31Ma9mD3WuZZQSDOEMD5VY8nTTYH6Ca1fs=;
        b=RCBBHmI5NJuL/b0QMZqwJKF7ud8TA4ryMo59VDUQpnay3XsUAvEHe9LO/fOzuRpsZT
         Jx1NFanVf4S6AnMyYzJCnljlJyN6jxlel+V/rblI5B/Ke6DaEPf+ndUzWrqDMCP+HdnB
         uDl16AbXtCY5QarJXQGxMW4weytJLsYo/hhgWgTWp6oEXUmaIM9yVLpkAXqAknXGbXx1
         QuqO79EbjR+FpS9ROH8ywiCYKLR1Vo0TveRfPl4UAmhu6xulcIFSO5a0/1OJf0Rjev67
         yegxuQY82ZCP4p/4NvCgTDGdk/lzzVLD1htvb51kbSpM+eaB4whicLPwz/DWF4glUFn4
         0IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443404; x=1763048204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoiFfWZaW31Ma9mD3WuZZQSDOEMD5VY8nTTYH6Ca1fs=;
        b=CLxt71BlgDAsUEVjxSFr4AKb9rbkT0vR+Fj2WrwPqUuf3LRPN32OTNKF1msnDb9FVt
         bU8qv8BtRF6NgqV9pDNbk5UavD21e/SoUcpuDVuuqGCe9y/A4rshMZggIwy3KnE0/mLj
         n0PgHR2VcJ8QEHF7VGCz09CzCKLrUKvn9Uok/c6ArNtS4QBG5NDD4zc3No/BEbyWBpLO
         /CktYt/H5L2RSkDoEwgF+EzzP1OTkfp0Go3fa6BTSOmfzquN1twKdVOGYO6TvknYWK69
         qswmR7GzvaBvIBIQD908ISSF+OR1zZOm/WXg4QVuwP1XQ3jGUcQmCkT/ul16E8ncKYyH
         S85w==
X-Forwarded-Encrypted: i=1; AJvYcCUeatH/+/4mySlLfVfOBOyDq8X3iwVFCLO0HtLX5P1KIgeB3S6SWK37AlxcoHG1Gi3Wvv6mwakBFW8qEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGB+ixWHsXBuJW8Vfr6qnt+bdEZFxg7QtfHofC8oxVXahWV9P
	S4lR0Upuanhx7IqHBBrdt+Zmaky59cErarYdrapjkO4fiKevVKNQn4RJbGsv1/kNTu0=
X-Gm-Gg: ASbGnctAYtpI301dJnlK2eT1Px5FHKjiJtjdJrVgCihvHfnSqMDqruT+JSQyBkwApM0
	DwdHeH2nVbLx7Fty08IEEldI7P/2dzy1kuEKGd5cHMMHJrgxFC8wjlHMuRCI2QDVLw7r8ZlrRdt
	vEPDS49reap4RANLCjmHbVYaSdbh8PjeTZgLEQIACwAWSbZI5r92gzzfFiWKoZQ91hlsPY7rNSW
	gEFYyzbzSoG+R9RxXZggOsfaQFdGXXHhNObJ9QpEVlAg321CPVQTJZEzJ+BLy8D/SKqRmjcaTDA
	vbxes0AxTLcTdUTIhcRaWxVewT/8Xo1qtTKZrQSadQ6gswtz5oloP+SylgL6JM20X2/z4il+irr
	PqVXm7bkG3yabbad9yC/8+rINqNr6/rXm0WUZf2kv1xyFLLXHDkxFlCBWduTCwcZBB9DYuHvmBV
	+kmz6womdOuXW1ID6ZRYk=
X-Google-Smtp-Source: AGHT+IHm/6/RnHvUQpqjyEKIYZGBSjHuPRp5b3DBLGbL1GoDEzCDZheRRGUhzX2BHAHpgilQLx/Q7g==
X-Received: by 2002:a05:600c:621a:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4775ce206f3mr59734595e9.33.1762443404278;
        Thu, 06 Nov 2025 07:36:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477622f42a5sm98437525e9.1.2025.11.06.07.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:36:43 -0800 (PST)
Message-ID: <d1b02488-7722-4b39-bb8e-f7e5c8e11b1e@tuxon.dev>
Date: Thu, 6 Nov 2025 17:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/26] clk: at91: pmc: #undef field_{get,prep}() before
 definition
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
 <939d8c6da1f468026b1bb201413ba08b1d0751fd.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <939d8c6da1f468026b1bb201413ba08b1d0751fd.1762435376.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 15:33, Geert Uytterhoeven wrote:
> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
