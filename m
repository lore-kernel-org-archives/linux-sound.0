Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9A29B8D0
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443633; cv=none; b=QE41zSDh0QT8PkKGTPtDR/QG02a2qqudEdxBTsKVnVLLQyQbxB6KaqM+YeMkw7b5aPUA/cfUBthf5RRzsAqItIR9kZCYJuMj9uNyYS/Y6zXVVNr7VqEDsVJl5VkUEHKmQCos/o20hg+D0I+HpvYjcaIMHNR17NVm2w537h6whBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443633; c=relaxed/simple;
	bh=bPYWoT/GHriiQOAtYqZ8RIEg/mdLe3X0Fy0Cau6Ehaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTLbRvCvYOuwtyuHCkUbWMsClW860lhWmi+OB78MwdEfnzCyKscFLahf3Gg97q0kDl+6qibfnD1yBWEQqquOOeXYYZtLN28Pb/gNHLylx7yUK3TO8M6hSN1KHvYvznV/P2eTKLmauENxvaUXzr/dGTIY0/WRIGWrG5dOpQs3++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mtvz5v52; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mtvz5v52"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429bf011e6cso1146139f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443629; x=1763048429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Wk3Zb6iHABuxMtqYWJQhotr9eHGE3DttWEmz8jd9g=;
        b=mtvz5v52aKC7EZ6exceptOGN/yR8gwoXsD6+ODVzB9kwg3a747NB7nAIIRkFLLuLQR
         XBcjKQN5CZNpKd1ZcguBqMiX2nSvC0Z1oG4hopafKH8vJx+eI4zGuJAJwrSH9ktm9bUP
         ef5TD6xf7LgbjHen8vXyrF1x4MZh1P2Rn6KmzqAaAkc2ej7h2JXr9LBezDKJBzCJWyb/
         kLk8+T9ZGQe0OQH6XEgJfMkwIarLnluWJZ4U2rBWJ/A9Cu8+7CHNuyhqwbPZS+Pgd3lb
         Lp2qBmseBwR7R4lAID9txgDYo+nALkyWLvigN2v5GkBKoQN4Y1Ocwb6z5ztpSHoMdW0J
         FBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443629; x=1763048429;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Wk3Zb6iHABuxMtqYWJQhotr9eHGE3DttWEmz8jd9g=;
        b=wBJx9UeG1ED0QCzJB2dL/Zn3Q2GzgCJxL3+AqKWXboIxCDGcNp4yMvTWWkGuAaOlGK
         dcMuCyMtsowN/pITggmgJGBwMlTDJO8nxBj+5QWzQj8dhA9vcJUY47aYyFRpewDh8Q0l
         AnzdMUtHa5m4ILuuCDuY9zcXRaQxjVvc9UOlzBaPE53MVh6GEWPvWNozOTNz/fAxsHxV
         Q1WZvh7SIIIY1sm13s1J4AByBMci9IA0y5DiBVcLtCj2u6akdogqCINCpR34NO5j2qcz
         aD28n9GBUZRE/sodUsAVHi2MOr7Y5mwouyj07dBZJHEIUU+RVXMP+7Ln7/jJq/6r+5k/
         Z4XA==
X-Forwarded-Encrypted: i=1; AJvYcCWFWDGXHWxo9PgCAZ/GwKr+eY04v5AENlcsMIsovFDHvm4V300ovRm5V3ZePudBLZfBbx0ehK0GY8j4Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhbnJrenvk7nvMR7D1D3N9fuz4NYAtPloBJHDfaDdUgcfTAfA
	sxm1n3cbCq0vuTut4rFQFBtGPAiRUmAhhPyqLZsTUQCcT5RG+0z93V5Ec0IvjMa0/MQ=
X-Gm-Gg: ASbGnctKudrBx1aNdnErIEG9EtnH5LIdCwWHIIFHMqxE0KKdpXCzJU7S5OgbgephWQZ
	Mb2jUZGPn06A5ZoTHhlC3/Tn+d+PWBRZ8CO6W26RV4PwdRUcJSnp0uAbBekKsek5KWUgjmPu/8T
	ipEJDfepNtQmIDAsL5rfDjWs742g3CglgtEnNCUp9LL5oXgNsauwlaFjSO/pUrxMb6kBEwAUHFH
	RjEYolCPbsX8zZ/evP1V4gT14Lq0VX+n590p4Qjb68LcU2u3A6EenLMYNGvwoJoPHtZvM6nCI9x
	vXlUtZxIMrdRqxIMB2c+3lJDqztLBUAq8SUfrB8DYGHy8+zIJ/4LQ8skqieLa5MFyr4slLR71+h
	FWDD0xdWSPXsYH4Zc8o/pzg3fc1f6vOrOkdlHM21aCQVEHg7g48lSEJmk2BKIiDvulpVqBCEfCw
	YgGWsdB8vkLBisaF/I050=
X-Google-Smtp-Source: AGHT+IFjpy8Et4z+rAreshTApQ1UnG8la7y5eDtsFm4fqVoBZudQUf3WRA0jtYYTZf5YlVXK7dWKmw==
X-Received: by 2002:a5d:5d0c:0:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-429e3309cc9mr7040773f8f.43.1762443629298;
        Thu, 06 Nov 2025 07:40:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ec767edasm5003126f8f.43.2025.11.06.07.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:40:28 -0800 (PST)
Message-ID: <e0c8b161-3e08-48a0-89ef-8e0ea8b76672@tuxon.dev>
Date: Thu, 6 Nov 2025 17:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/26] soc: renesas: rz-sysc: Convert to common
 field_get() helper
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
 <ed045ec4db284ca8b4ec0c5b6ff334e459d14096.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ed045ec4db284ca8b4ec0c5b6ff334e459d14096.1762435376.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 15:34, Geert Uytterhoeven wrote:
> Drop the driver-specific field_get() macro, in favor of the globally
> available variant from <linux/bitfield.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
