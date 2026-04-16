Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D85368277
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342793; cv=none; b=UsU30Xi2e7mzska9BrA+0opVw52S4gBG/hwTXlssE3RLLj9J6kbVFtuJ+FvZxNPZwF9m6PpypMp+92W8BR6afU6ZAk9sJ9lrv5S3ZLkAjAphP36uKfKPxrzay9+64q+tjOGyvtys8UBHir1kg52NPysJywiJWURWQmQsYU7ix3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342793; c=relaxed/simple;
	bh=F0KRr1fNLI9QNaiGUy7X498/hzWHeh7SvOfYmIbsG+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzwVKmM8wbvlpq0d2jNcHWEIPbqMIKw04QpltIvSG9mTVUgEZGPAvFcueBK8W7J7EOoqeUpaUxq42oynjp/qurpZzVEy2lrg9LMzWm2EzCxo95DOCwnLkB9YGjII+loyOISPe8WBCWsC262TuzCMLFffTFq4MQrGwmN5U5N5OIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-60fecdd1efaso1404422137.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342791; x=1776947591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRFemq5MfyXGBsug9FBiLn47cAaLasQlDTsqCZS8paQ=;
        b=Iy64rPMTnTv/n1B2fZYbGbteTftDAr5b2XGeKIyZoxw95HlK1Z66PoC4Y7eoek3lTW
         /OPwGqJP0K1uC+38syeY0ZPiGg86t9dVSTMPT5weqII9IAnSHtYkL/OfnzP1ER/N9HPV
         ch/8kD9HtTWUs5FqKjaCMygiA5rIXvGkw4VVx/nv6JNx1rizd1D4ChUVlwAsoIPYRziH
         jqNpY11SL3A7jAMfvgYf7uGjQg27g9W/IrhM5WlNaSb/xARgK6iE2ROPMKlKFFT+UnJT
         ZvUwWU5S7WYWW3ti5gVoPYsxNArYW/O7p2c3A40epbynINClm6qYmGyMz/u0V+TyBFtU
         X/ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9rXewIfWd3nWznEZH2b8s+m5BavlXI1agPmbURipAsbKPBiJYHnfJVZgO/ul04SqZEbroPczI4pSKftQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBeEUoVHQLBVhWvLHcdph2K0vjd0sbs7EPgMReGjsKMxnMUsoM
	I/5STv40jKjton3o7Haf+3RKFJNwLwNoRTS7Jh/rqJ7acpFT/wQepyzyAslnmsaT
X-Gm-Gg: AeBDies2OojJq0y0Vr0mw36WYvtRKeynu5UcGxnwOWYQRzmlbkXdQ/bgzkwzDoop0wF
	I5L1cIJh41VgCJeNkOKnaipHaHmHy76WStXgpe7lYtyYGHPDatjfiMG9gnPGsG0CZo2au/1r7R5
	Fw7r8bDlZFyOct8mO4k+FAZqYWvZ4cfQuMg+A33iq0d4sVsWSHOgDPwAsT0fqKzMFLzOjkaEy+M
	BJmWamRujlXPKv0pNXfFaTPmg6C0basARlJLWXKtZxvczVxJDn4XRpoF9BElSGK20l/qNBdx1Ro
	eZRZactJulWNeTjQFHG671QdUoKn8Fe9XDjoYp9iDFyO/rIWa6dh2Tu36PilkKN/oWebHqUy9ql
	LcEYv6DImAXkGAIvBPCXsf64HUsEFfX0CHtGYAQ8FetgXLFHTiaEkl2kuQtmNctPpOg1uc7K1mc
	7yZgoPmgxYDOEoLlUZRQbWkoCIvxJFwIku79QhJaKKYxCnGt4g6H/S5SVzlwJ3EAfbJ3WoADQ=
X-Received: by 2002:a05:6102:4b19:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-60a01162bd7mr11591940137.24.1776342790582;
        Thu, 16 Apr 2026 05:33:10 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-958652c9d06sm2243009241.1.2026.04.16.05.33.09
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:33:09 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff05af29b4so2753889137.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Y22NRdPsJ07D696GCUhrCeOu/NkmQEQMqqIVqpltI8O60FJCRfDiDLyNiayM5LJaetf/4DN1dXkg32A==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:608:8fb9:9102 with SMTP id
 ada2fe7eead31-609fb6720ccmr10437630137.0.1776342789380; Thu, 16 Apr 2026
 05:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
In-Reply-To: <20260413100700.30995-7-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:32:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXPrLxY0u1NxoFatn51+VFZCb21ktieKXoU851HozbSA@mail.gmail.com>
X-Gm-Features: AQROBzBguP3PgGaZjGZ5LvVBGYPHFMcYN5pNT3cJNtzjVS5xLJ_ABy0llU6KPj4
Message-ID: <CAMuHMdWXPrLxY0u1NxoFatn51+VFZCb21ktieKXoU851HozbSA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bui,

On Mon, 13 Apr 2026 at 12:07, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support a flexible positional clock list to properly
> describe the hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.
>   - FSI internal dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for the update!

> Changes in v2:
>  - Rename FSI module clock to "own" to match driver.

Where does this match the driver?
Usually the functional clock is called "fck".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
