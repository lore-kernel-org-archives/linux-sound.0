Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6852571A0
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443900; cv=none; b=kPKksMEyjL6y2c2YmNu8Qvndl0+rdUegdSR53C8d5Rh1N3QBLP1k/4MQxvvHU5iWCVynwfEHMd8AVQuCedjp89Dmnj6U7pt8ANwJqg9JbTzL7l45j6CQqphRMfUKP1QBheEx5+CvinnXePxicwqBylxeIr7fvnu9yJm5+y9St+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443900; c=relaxed/simple;
	bh=ir86bNXUyXX52mY7hjK0YW1lIK6fPwyN3rKPVErB4Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1FM7h2P1u1sc6+NIZk1rltcT+UdqxreUsIcEnU+Jc6xyHIPLX4hKP/8WxP+2Rwgt3S79APyAj9OyFvpQDrBVLXME2G7nTcskKAEJ28WJkjTJtTxNa2BIdKKQKHq9I5tc7iTcVraq4aKIYhue8ikl0gkLexYbEEZ2Sv7hBGPdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oyafMGVj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oyafMGVj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so13327945e9.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 07:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443897; x=1763048697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDBfIt+d555CHw458VAbNG3bfHQEwmpPFewi9LatYFE=;
        b=oyafMGVj8rfucZtwMDNT7+phmmyZ8dNEZOYEY9Q57QHqZJoyoIJ9OQJpzpssPwAAUY
         p1cucHLkqadoykScHTYiZZygeQ/2+y+X9FXBBrzheC8maMeT3KaSdcKzfJuIAtFiKMVD
         9bTv3YnG5FJcmpkd662vPds4xEsAH7Ni3IcYRWHdk2BAh9rtXwffQmy39LFYYprGFkbP
         NHwOTlJfQ9UI2vyII4ONRiqWKMGAT4G38zP5/ICf0lH6eDc/WqOChblx20cnzIVdMf/s
         +pkDF7X4DR5yijB/jniXDKERhHa0ItlV6wMuNhqGMXQxnO3rr/fg61KyjIC7zgKqc47F
         I4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443897; x=1763048697;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDBfIt+d555CHw458VAbNG3bfHQEwmpPFewi9LatYFE=;
        b=wwDgQt9LhJU5+SnfLnWNG66hukEm1WC+5bBfU98Il1cg2XeaNoEI/dgEbI/VCSyjof
         RD5q26AupgnRdCu2re6KZtCe60IjpG5pLrpRg51PoqUYVN7NB/Iy6FGJnVNH7SQQxmrM
         tjZLQrtBbxyxdftOBMueMXPA6Sh+IBewfkOFytUEqDxQFFg1AMX47ZxnR1JgfEehAIQY
         hPuLp5QhkketlLM5ezOEsgOsf5aEAoXmyrw/D3/mDt3PfGaQRLuEYKAFdZVMG7/akMPQ
         9BWkkwTzkc3pAwChHu2OoMEZyk5gkqgi6NVhoAV3WUtoDEX11hFA3OOyNaxjjwpwoueI
         fgjg==
X-Forwarded-Encrypted: i=1; AJvYcCVn70aOtHbMUbqIJNqE89p9hKUFe5b+v9Gc5cXJe7qHI1N0ckw16qDMvvZV3vQtJQeB3x1Cgw8+5b4kFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQ5iLow5ONWyhGL8ZOje9bE27dWVDEIP/zNBhRY5L4SzFQ3/B
	6pGcZG7pgZULIlcGWL7FjpbXOqbItsGMlLfVm8IsK8+K8uhCzI/970bAXsr/gNGi80g=
X-Gm-Gg: ASbGncvmRdEibgp3+pJaz/OZsFc4YMHBI8EgGyVoNbsNCTNIISlTJ7IAfpPU4NUZKCU
	LFRomeK0hKC1yacV5LDdhrWLYG7M7IqTAP5JnXNrpgWVwWkk8n6q3n7hy2jHihLUw0dHoflPLb+
	QwRl5ivUxNPzdLw1jJu6B2JUFQYomhjqDn4COOBL3JdbTkXIWT97ugDBi0TOu5RgrQYsMujsCh2
	XiEGZousf6oAtmUbjdP4cLM7ViVAOOH/iBCmkuluqGDr7HsaJN03B6cvo+RcLxILyf6ZQ+K4TH0
	BX0asBew4h53577kuyOlQNgWfoGOw8uQOo0HO/7bkiXfb9rdpnB4DiFUYjo5FJBLBY8RXFzbRIP
	UDArQRX2N48ap6GPAbeENXvoYej1c5eQ00DQw4gl0fSTwnPMkpCfMJn6U5iKvvsUBFHsJjVOhQe
	Jr0S8LfVzf
X-Google-Smtp-Source: AGHT+IEAc10N1RtkN4NVSk1Zu24SSpZFPG8gHp4xc27V6x28O5IWRTQBVQkr2p/iYh6QAS/I0T8A6w==
X-Received: by 2002:a05:6000:310a:b0:429:c8f6:5873 with SMTP id ffacd0b85a97d-429e32edf7bmr7715744f8f.22.1762443896966;
        Thu, 06 Nov 2025 07:44:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40375bsm5553906f8f.8.2025.11.06.07.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:44:56 -0800 (PST)
Message-ID: <509b427c-5586-4c92-88ad-16bbde7c3f92@tuxon.dev>
Date: Thu, 6 Nov 2025 17:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/26] clk: at91: Convert to common field_{get,prep}()
 helpers
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
 <7414c080bbacc3c5be00c0eec4f5cbca386acaf3.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7414c080bbacc3c5be00c0eec4f5cbca386acaf3.1762435376.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 15:34, Geert Uytterhoeven wrote:
> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
