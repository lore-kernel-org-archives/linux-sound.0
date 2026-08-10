Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358313E02A
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370140; cv=none; b=nHlpMvYclMfjEw51xnZ858n9TK3BThKkp+4+rPmFqeG6LxGHTlSlkxMoNBwlN8TePS+usqyQHWOeS99KUVLop/fp41ehavSIV84AflPEX5TPVcHbg5USqlI8r7qct5tjnBkkI9GJLY4OUEFus8aUIM+bfI2GX9KR2a6czCzOXYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370140; c=relaxed/simple;
	bh=+49H72wzW6N8bjn12Wyc5oS2Vh9uUPL5RjM5Gza56wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4pxEfWoedd51/vcF7yVw5XV+uenAaO19Aqo+dnTukBr/880Tv5SjdZ/VvTXFILsYC2gMLJ/RNkrLZroCYEb4NT8gNfq02EtYH/HSkNR5L7IN86yfkCv3DxBlml8rTZJTEPslXygvLZYDq5LRAPeyGb90YLzcOf0TWQVgKbpIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-979dc8b391eso818366241.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 06:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370138; x=1786974938;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MmACebBfyQcjcArQc12qo4s2Hk/XInMFxhT8kxQZcwU=;
        b=dXS7Ivsd8e45HjCocBpBGY6N4dPglJ0/BJR5YcAgzCHcPGYKokWlMFS24EoeLhpq5a
         2GL5D7KzrAyBDEr4QbpRUgV+4qdcR0luxmkNZEyVhGgMlJ6aAqahaEZf1Aa/tQX92mdX
         rk2by+jmSnBmU2YpoescxdB3s9gjsTCIQ1s2YeGxO9aoU7zx7ncANemGoqdIcHsyBK/Q
         ZSfvgU0uszApO+UmDgPWa9tYhtcct1UB0LOrwSJqpjo+Fmtg4JjC7eZRsOvkUDDYT5M2
         v39/SGhdk5E5JMqjOPJV9ujp2rXOmBudJC3W4goWmFn4tHnqgFY0qdSvjW4V5YHPxlaM
         oh0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfhqbUOvL9/3+qwwuIXfMvbBJZgps06y6ERk1b/orsYB8x8mkO80MesFxTzQWrdgKpVY4dlxD40I/cUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOaRADok92+0zNegqG/urCVt0VtjWRux55gfIEwva1NedX4aV
	qBXxyH629WT7GKp/yITCoCBQosPkX/EeXDhjSRjLUXw1nXROy5Ew0CXaAy8rzctU
X-Gm-Gg: AR+sD10NkLKFz301Oe+BK95tEJwV4xL8rcLXQiyyiPMS3E3f0HhVFeMUxIW25EBAycZ
	5m+8LjuiF6Bm3y4m80hjrW2cHzUb7/qn006uetrLLNonKnoyM7t3B4/sCqcus7aZN02J6FdevTZ
	4FQJ8YAq7zr8dxBcTWPtiSwAreLjYYVL7aRg7qnk7oHuYmr1ECcldM58hhCpK54rYzjnt35Xekx
	Yz1nWYWw7POQsAWA8KnSmLieiS6nPbznvjksY8odetLQlSA7rM7sWADQULE20Q43chxM+brfob2
	ss3jx9+4WBM3QcHbwJcYE1CBGTOfrFCDPPVxJBOYTzjbuTbcl18W3mOua6rXa4HgggA8QyPq6zi
	ZQkaxpacetm1Zpy7I2r2YxaTsZb0rfmFddllEl+baewORZvwX2q8SZHEZ/EAI3VPexdBI2QArtm
	Id09vusjoTKBAtFJHLD849UjWKfc+bNy+ZZ9DqITqawUy5eMdrIJju+ajU6ba1I8d2NIh/Wka+C
	JLJ3ZAxLM14mjUls7CCfdHQBg==
X-Received: by 2002:a05:6102:f81:b0:752:757a:96f0 with SMTP id ada2fe7eead31-7634ac4a5c0mr9407096137.3.1786370138429;
        Mon, 10 Aug 2026 06:55:38 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2cbe70asm3721346241.0.2026.08.10.06.55.37
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:55:38 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso1047309241.2
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 06:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrXAVMHwXt0zyNUzNJYc1h/vj/hUjHAhmLqrtXN4R7u+u5kH+xFzT6zisBVqgOdgi2GOyQVWIugLgbKCg==@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:739:5cfb:50f6 with SMTP id
 ada2fe7eead31-7634d10fb7fmr9198315137.11.1786370137779; Mon, 10 Aug 2026
 06:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com> <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcCDcPiQh9DEL7ujWSCQCvqMZHatWZhHha-2-JBo4oKA@mail.gmail.com>
X-Gm-Features: AUfX_myvCDbZrLeq5_AkwBFoQaj9KuC2_xzwhuBv4cnxNXwsS1wJ2BykJXirplM
Message-ID: <CAMuHMdXcCDcPiQh9DEL7ujWSCQCvqMZHatWZhHha-2-JBo4oKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1
 clock frequency to 1 MHz
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 3 Aug 2026 at 15:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On the SMARC carrier board I2C1 only carries the DA7212 audio codec.
> Override the 100 kHz SoC default with 1 MHz.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

According to the DA7212 documentation, it supports 3.4 MHz, too.
But given the I2C bus is also exposed on PMOD, GPIO, and M2 connectors,
1 MHz is probably the safer value.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
