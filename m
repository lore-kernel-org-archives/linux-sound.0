Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13828ECF7
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557824; cv=none; b=Zlfhwmze28f3umGZx63fv1rrdvubnFCT4X6ykiNjQyRSapc5xZHbNgZ27OBEJHEY93eSzJcCcJNOM9rl/m02ZjP58SxPRMdyY5FYWhXZkf8SO5GdZv4Amlijj8PB/5D/aT6nQS+x/LBgtFc/PAIjkDHGOLzs8orMIjGKkCdTCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557824; c=relaxed/simple;
	bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izGJe5BxF7gWu5PkyjAp9G7062SUww9A+ktG7d8nhZ2GCiTSulABCNJaixGounC22Dy6iTVee8Hh4SVVtiOrfYKX9l5Nvysy0Vl4rNj6kW0qK5QgsOT+i+sTAtWyZm8+eGYSrNghK8IBfiRe0EqjT6DyjXHA/mqES1wgAWn4Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKAYnwT0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKAYnwT0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5601603e87.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557821; x=1750162621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=xKAYnwT01L2nhypvYKscjinTuM31ltvKGf5E3UmypxMkAwpbw3718/cE2rbHHKcZNz
         Twzyryv3vHidqjN9rTY4zlibzIYqXCC7qtrthfAKCmLYrhLoF+3+ratQCgG38FhZ7mEK
         bCLGlqOEZLloWdF8ACmzbyRRiwPhp3b2pjzLa+IPetGeksw5pVXtLJJkWbx1wNzq0X1i
         u3M2Ag8GcLV9JpROERwk6wd7dZMrkuzwyt4y4m6KXmkuDFZTzhG7ZYnTSNU0/OTaMTJN
         i8XbF0aThVtJ0UlYncCosCYbtpFwIwtCOar/SgjJTxlhXzRIBmIncQZhqpT0ajXjCUVA
         TFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557821; x=1750162621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=clmSZxvYUxtLz/yYWqdwR9//0MVoQejtVq49GIXxrdAhtnkNx3Nu+BEQXoGvnFxMgq
         0++6k2NLA9f9ZTz4fq1TBRSsxNsA+xdA4rjANdgjM+0qg3foZg0U1U8V9oA+slvoP+ve
         bdabbdCHyK+MY1kNt3Ps9JIHh99Rj1OIf8zHHKsAjlmxTdwI5mTvALL0OhWSYv4hiqI8
         smfeJ51XmFtTWPGyYPIkOH5z2EdltkbUkA5jYALFDGeuhS72edfJx8AZMBCb3nnzMyh/
         yGUeddJ1QA1w3H1u/+C3VuHGi8tHCPnp1WSqUDzqnnab31a09iKM5C33P0aQmsffuVax
         Fdxw==
X-Forwarded-Encrypted: i=1; AJvYcCXsKxO7n54r2DNl2ndGLyzNXtuPojHwhNBjwW+pR3bB+VSgKtzR5VwqcHDlFZ1xyGeMEdCa9RglsT1VGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3xjDYdtOlRlZjaWk7OnzaYNz9cefkVq+9cprPY1d0qYCHcuk
	qNcWRCAhmJLB5jmOlSP+xaOYW2UmrbAxKfE8eW5vr52XhYxmHb1jNPAbdqvf3F58F9uAha6WRdS
	KlNHgTJ6jSFiC8EZuDibXOfSCqUxcPTVjz28LpkGA4A==
X-Gm-Gg: ASbGncvd+BpcHTAf8Ybw+1CknWWn2a/jD4YDopbiYr6tc/h/48n0bbyvppzP0sGZiJR
	I9QbVsbKWCQIa+NUUg+c2IBZ8VICkV3xzA60q84axHBxNuzJeGpCY8GxtiA3hzfgHW0IXmRltMm
	siGZDp1+7627LIy3r/gjhvfVYww0KB7QveRrYbLvvs+wvDDeZFRa2uLQ==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, May 28, 2025 at 12:41=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.

will you rebase this series on v6.16-rc1, fix the snags and send a new vers=
ion?
It's all nice cleanups so it'd be great to just merge this.

Yours,
Linus Walleij
