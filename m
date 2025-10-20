Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC24F22A1D4
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972195; cv=none; b=D5l7I7jUCj9kGf1HS70XuZ6vWd0FuZfYyxN+pI1CstUHeLuAvFUsEUlN04L7ln1qnfFmrYVLjsrEidkiiZweSv/kYKEk2O5Rp9qMjygakfqgJU+IWdyiKEu5MNW5OZ4LaZXALxxSyk+5p60p1lvkjBlCYwS/3sjziCw0GYubz1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972195; c=relaxed/simple;
	bh=Sug/TiaFVNCgE/OTMIDWvRovNGDHRM3X2PR+kC0SaFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzNuuuUFMN46BAdOtoVYpTTsIYAnPTAfmX6vY8Ne0+7SAfTUA12UTcQKZtJKta1R4Ce4fdYORArmplkM5/PNCVUjPmZ10B3H80njI1LD67N9SsFhwNyzj1jtievulV+5OiLuFeO9QTkIuEdtcs6ppyWE47gLqhTuKlwmlRhY0HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+52i0G1; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+52i0G1"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-781014f4e12so55443887b3.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760972193; x=1761576993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=;
        b=C+52i0G1Q5aLYH8+WnTKL2NZUdCf1L4lQCQitDT3kcaz8o1OVvR/hul5Lo05P+kTdK
         wSAk6OtNDnvAnZ9yazIGJxLkY5PNCsVPgcaoBAt642cUwZUBPg3XF3ibWybW2syzEV4O
         t0IobW43VIv7D8O8BXNptHEdhwel+TTc7SEYDaz8eZqbejXyVE0cau6Nw5OHikq0KCNZ
         +EwIno3T6IvxkbX7HvnmwFls2Dh7Rp7a/1fr6ygtjHTg51cAgBICGl+WnI4BLqj03oxC
         wSfBAbyrfcFOB7pkZQIwetrPw1e36Z4M/Ri3+AWWiJ+FajQE/cxpYJu2lDmEpwYU9sgG
         RmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972193; x=1761576993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=;
        b=T8Dmf+69D2OL51ohnZqBtymrXnqwm4sAUZ2mbz4gn8lkCZ0VdO4CstAWD6wBYlvUrk
         pKI4arnanMY/ayTgKy51wcaNn+p2bmhH+7rcaq5YC9SLYB20EzWmjSVsCL0MBCMmMQt1
         uA+tCuwiEgnHCzaOgpuetViBkoliXZ3RKF3C4lWO2DKRFCtFTcGcUlHRbtsTRKw12lA5
         Hbu1h2UcRFs2Msr4YbIS2UO7FpOHH9R5+ZxOH52RKuEpCW/3N6rWdwLJecIqwBqCJwoa
         jYJjOUigu0xarY9xhriDdLwoKGVn/EtFLVnDzEihSbQXPTJEkPS6gt6d+z7ruedCOU/y
         yv6w==
X-Forwarded-Encrypted: i=1; AJvYcCWDwM0sp7YFZNdizn3GT+v/esJfBWlIM22ZiqeqGG1zdfrXwOt/KTxQHuqskUV3S6+sogHgL+ND/cctoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypxh2gDCB51/Vn4Ng3dOHrSI5s527OeQt/yCr82k60yC80Mz97
	optbAOxPOLbrJM89FqXgJFARM+S12+y1Gw7P7OGwQg1JNjIbkoFzkwzM
X-Gm-Gg: ASbGncudV193uLao74/ibbJhjuQqA7LXh8NbDTttOzPNtVCAqMWlGLIDa7U2UxX6U39
	ll6+/klDB7iU2dhfPEQ8i5f1Ca4QnnjIX5uOJDu9x5gjYlaQ6uIZduSZUi/Wn/9rXzY4N5KOvGu
	W9JxX7Fcgvgjfr56i215QYCDbZB3Q4OeEtRktMdUxqIWxrcg/MJLLp/VAmub0A0AkV4jmbIrE0Z
	M1q/iUIaFrNPbtksCvxewDANAKqzlrXLKdUjggzmRXc588+pDm7x3VEgLiZKXNSQXS9Ajn4wXz8
	yo1gJU1y3CHfbMX2so4T5n8i3qB75/1Y5OP8A5yoHqy5WUj//0Z07TFd+3BC4P6ayfpXKwe3oB/
	tupgQMEoH4AiT2iEUXRzpATZF1BrBnXwFFe9IicDES0eeGMWlwvAg9YeaS6puuOHCNl1XysOpK+
	Z/o6FSac9ED70oF1JOm0zCddTOV1VbO+uT
X-Google-Smtp-Source: AGHT+IE81F/jaXbyHR42ph2vrE4i4G97ZO8UgGatFFTjrjbQ0UYwj8u7zrZ9iwbiKwTlSepO74M7sA==
X-Received: by 2002:a05:690c:951c:b0:781:1280:db43 with SMTP id 00721157ae682-7836d3bdceemr92264887b3.68.1760972192509;
        Mon, 20 Oct 2025 07:56:32 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-784674d66fesm21762357b3.41.2025.10.20.07.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:56:31 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:56:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
Message-ID: <aPZNnmot-Z5a2yIc@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
 <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>

> > I agree that underscored parameters are excessive. But fixing them has
> > a side effect of wiping the history, which is a bad thing.
> >
> > I would prefer to save a history over following a rule that seemingly
> > is not written down. Let's keep this untouched for now, and if there
> > will be a need to move the code, we can drop underscores as well.
> 
> Fair enough.
> So I assume you are fine with not having underscored parameters in
> new code, like in [PATCH v4 2/4]?

Yes, sure.
