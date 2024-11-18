Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA8E1E8823
	for <linux-sound@vger.kernel.org>; Mon, 18 Nov 2024 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970469; cv=none; b=lVuzr19fVaZ9SkUOggjnaasZv8EOwnxLpF0PYMgfyXVw/SjE1/4DrawfWnSjt6zcpdOh2+rTgx8JJr0EFvGvzHCy7+2WPg8XHYD4cd3Ok995uwsK9T8FbB/+oMeJe0DsXwHxR2LuBb1XUv+GhoPbwJTbLcZHPfDVHlbSbXqsJ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970469; c=relaxed/simple;
	bh=HkoCCdRW/H+xh3lTqBY8Ix0PmDgMIJshBbvCetsSrv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue52C5tRYHsCymP69xn+mYyhu+AzjKVZv+84aZRcpYpgebBSUu1o9ieG+aN2zkaQ0Jcn23S0O6MqwSpY9K+OCTkXrBiHnxYY94AAfcmsHXM0v8F9Rwm7MfvFBB82vIl/RqfZP/tybiRvc//qnfwydGl/t2ac4F0pX0ms9nYRasY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTYmrDbQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTYmrDbQ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso35149851fa.3
        for <linux-sound@vger.kernel.org>; Mon, 18 Nov 2024 14:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970465; x=1732575265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkoCCdRW/H+xh3lTqBY8Ix0PmDgMIJshBbvCetsSrv4=;
        b=JTYmrDbQ+C8TvOUHC3GPS16kpcNJ+yN3KW+JTVMc0jI1NVURaQFuQsvjIFdte3m6zB
         G2uAIzHsepVGFLqBP5JJVGiprRH4zRo8r1T9Gw9eVitF/cIhqFAw59vWgscRH1o8eDUi
         39rbiHPgJ6Q+BxNbnXRQk1UorXKOYyI+9h8O8PLu5N7iHmsT5XLrBGPLq0rVZzGVkDOJ
         G04NcETlHJa1vOopuzLDpgdDlJEgMbexjzGtr1VVs7/FI7KtRJiDcTQ/ye+sLIcDxav1
         mYfmLvcK+Bmfn8e1ztjcrJfUnCoXkSU4bDCv/97iTZTaJFsXkevwbqWJAtiOSK4vWVrB
         T1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970465; x=1732575265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkoCCdRW/H+xh3lTqBY8Ix0PmDgMIJshBbvCetsSrv4=;
        b=fWpoEVDGoWY8yMIxkYsdM2HufZ6vdirVg2lQl+1ZQp1r3P1zO1qIe4tWdhGp6cwMl1
         1C6hc7AAJZKYkP77HRglAyJ5HV99JtntaV4GO5RF57wdwNmY5p/r8L+sVED28K/v0ZIf
         xDd0Ot6bj2GiC+AipnXPoMfuvHcEkxKBbF6fi4r0npqcW/lIdF/OK7oWo+adKkbkcEl5
         Lu0tlT0f/cfHpOgafb98cdilE9ri5ioVuHjAO4/z3HConCPhpMe4N2xMuV+oBXH+Hzti
         GbCzWjamsS0H9yfssdVG0qg+rc3/pSpJjBWE13arWPan3pIJVmhfVd4Noe9XuN8f2rW4
         pgIg==
X-Forwarded-Encrypted: i=1; AJvYcCXYBqwU2oRp0t3PT3jN6OddRG415iYzop4MPDbnPDnDYMyTMEtAKrtuThwl5Vya8Mk9cDnpoQ0jX+3tOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykCgD0kZZ+zXN/CPIIeXvuHMC0OouDKafqYAiTuemxjO6d4ooz
	sh1WB7h6MlF0S10d2blh3h49T38Qp8vppOekvW8c3J44cwmUzwtgpF0SqOyZfzXenDN+/9D5J9g
	8WpK9uuCpKmREKwWxHLEKJZ0WzdgywCchuNGhQg==
X-Google-Smtp-Source: AGHT+IGHG4Twpe7lD6OgNd5mV9qcyQc83WrpmnfXyZIpyvXqcxMftc1zLuzdmDBbSMgcY0l2Bh6rM2EDwkL6YApVoRM=
X-Received: by 2002:a2e:9fc9:0:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2ff60661b95mr94886281fa.17.1731970465383; Mon, 18 Nov 2024
 14:54:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:54:14 +0100
Message-ID: <CACRpkdaSuj=nKbz4E90Et5gcCmCKvjb3AZr5Zn6k6KnVeuf_dw@mail.gmail.com>
Subject: Re: [PATCH v3 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add audio clock pins. These are used by audio IPs as input pins to feed
> them with audio clocks.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Patch looks okay
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect Geert will pick this up separately to his Renesas patch stack sinc=
e
it doesn't seem to have any compile-time dependencies on the other
patches.

Yours,
Linus Walleij
