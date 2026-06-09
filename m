Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745C3DFC9B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994550; cv=pass; b=m9NFvkdz+kJmTXqACg2c+1SS0cjQDPkmNstr1USA/Y+SgpU9lsq2SAn9+Z+coZ7rGtelft39ldpK0pryvNUns+fn3hQutNsJRYIVo+XMHcfJNWfEdkiogPHw+AQc6Pw5+9+04t/JcrVztHaExlSBqIjIcak3SiFbSBTBbdJFmaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994550; c=relaxed/simple;
	bh=TjqNXTdYC+1KhYAgIl8HmOtUZ5YqrP5H9MzSQdXyhXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUluWiUb8Mc1mTm12i+obug0v9/4evPEirv1/7NZ5GcAiyzugrCW4RJL3GB02WHbP43LeyEA7zDyDP4UUHJTlV8ttdpLrxCcsK/nFErRR/Bj3l6TaK9jQ+CmOnUgYWnI/Fqos5eKLVtRlUnspSOcTbXg3kJuuldGM/dcJcctEPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfVi4uv5; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfVi4uv5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c3184c71so39946985ad.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 01:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780994547; cv=none;
        d=google.com; s=arc-20240605;
        b=EgAru/JO4d2kTHFvOnzzaz80XQSd6KBAoN/ktfK7l4OAoqGd1RDRYQGSo5qyR9KeYo
         Ew5/5Odj8GQ+AXC8QjaMTLCwEJKDgELtYHbpHMPCay+5XoLyvSxL2ozWGReXAhs0ea5k
         Lou2BaA6TYAIQGJzi5G+KJrSFH3v5pUDj+9rFPAybAtBq2YmSvVnnlRnUgx8WKSFUB+Q
         Os1RUwZQFlhrcLXLAkPX/VPAaTtKoLyZs/TNLbJY6+/G8RQmtnU7qkpwOVkHUJ9GKaCr
         Cp7/r7CNll+GB7/SoA8lSN7TVbJeuBXDc1/LMQgAHgt0tAive/XsxXGnKjpxVlVZ3Wse
         uEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        fh=UQDbwhJ6YwErs/VCoI37xIc9BAhpgUbNobOfvK9QQSQ=;
        b=G9y6rAj0xTCkYm5cXlgzPp8qwgoMunSgMzLq9mw52eqgHtH9IsQBvLpF6YLb+zeHVg
         +tGgF296189wv3I8uHZodIJ2ftpE8juu2KKkSK038qB+Z8L36Es5AAa46Y3nAyqdB2mm
         3hwm+6yyKmsxP45RhnUJmj7i859PKX7twKJowtU/qDTXQYFe9t/YyAmrIzGNL8bQ20B7
         MeR5rL02ho8AXeMq511laIoilN1nkzvcYP3r4fVf/I9ABMEJpDHhg7Z4PkFWg7wQPtrO
         xSE1PHoXkaeDnx14O0du1Mczn+hWqzGw7/k2dPB7AJGV8LFOxUpzqwpMqGV7nGv8dZso
         oj9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994547; x=1781599347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        b=TfVi4uv53H8yG2R98vcKA7AbOiAdZAaJhhL24N8bX+x82en6ezaakEsuUwPUjI3BNx
         VSAWliDQ3+1GeC3FYAJLesknwOZjU+Kw/gl9B7fU+ZRY+Kx3SQDMGq5nJMk6O2zx70K1
         JP5nHk9QbP+GOqQMnq00pk67dz+c9P7yBE7tsN2zfq9dKZr2B1s0Jhbn7ux5autJKQ2R
         JX9yxUVoLeIPotjeHwdwTwe94VqAu9WBGf5KaOH/Tcg/LuoIygCpWACCvm0oLzMhF9cw
         o09t7yNFVk7HY7WLNkmoKsIUvfqpuyEbnJRSH1qjuIa30HhSFyAGJH6Hk+i/Lf1ZSkFk
         dhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994547; x=1781599347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        b=bH9p5HeHqpdLdDs6ZRUFlmCt0BYLzPqzIRfoLiQ2HC7/EMUfuj21lF1b1vSr2U9x6c
         e7BhUpLn27ggBOgWHoecmrnUlnByGuCrxp1ZhI8j0POcHHwdB08BUrCd17vLuZ/UHh7L
         WZua84fsKtauRrFuVfnXDJn4j41B5g26CEdDpITP4mULxbRWGN8Y0w8w2ATRRqMaiZe8
         NTO5SZ7SQ4QWQG6SmBea+VsipHHj9ZTowbOGK0wMz+Lfi1un8gMcCYtHYD2k1gEtbA+D
         TOYwW9ppncNPIeJWwuUb4GfEWej6fYkpkZXLwKhUqNGuV4GGRNken9F+huhHIchsLa9i
         7cnA==
X-Forwarded-Encrypted: i=1; AFNElJ/PkC+fwoOP+Px1ADoWoBPmsMRN0GEvs+cXTMMcKLeOiWA5iovOUroZIA1vKwEpM4M52o+FevNvW0WJgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPg2Mp8oqrhWf4Ld4s08BkAYi8jETTg6lIpKuM3ZmLpTcvUvq
	E2UoWCJbCdsGgfRq1h7hEcAZOv/bBeZX9J4sD06slABGR7Zk9CVjlgmE9+KF7yJ7YZfTiB1NadG
	Tbne3VzDeZ0pmXfXsGknVnJBGWHskEKCMC9Tf
X-Gm-Gg: Acq92OG7wYiBrzXavc0rkP9DrLpAIsjcJED+jkKKISsSacR4N+foiqp8XZOp9VTetA6
	nk3wStHpmKHjnAtmqngA3bsCInYGGUP+YWb+cIrvF1NxeDhMjXj0C6m1kZ0IthQY+Qrfqr5K/0E
	51xqxx8c0XQa3B55yqoHE68qVsqgWGTLKoefQdBF468HOoKhjtIabK2uj39roVJYg70IYwAzJAy
	cehb1XlZMUnNC1Qxfh0xek2mIV/mYs3kf2dafFlDSFhLTlCoNfTCMm8uqWMkttPR/moL+Eg76OG
	PkaCogSjo4lZX4D/KXN26QcWRe/6oa0HV9YGPxu4RSIwqDz7pJSCdgtHUas=
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id
 d9443c01a7336-2c1e7e527bdmr221175875ad.14.1780994547276; Tue, 09 Jun 2026
 01:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll> <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
 <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org>
In-Reply-To: <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 15:42:15 +0700
X-Gm-Features: AVVi8CcPsj0hRF2MDcCHJjJml-KAPCz7cDMeJub82nt26AoPo4Fq3Pllieca8tM
Message-ID: <CAABR9nHBA=sZsw54RWMCg_xdDCeo+stnSYg6yACfzuJoMNMyPg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for clarifying.

> >>> +          uniqueItems: true
> >>
> >> You don't need this, it's by default.
> >>
> >
> > Could you clarify which part you are referring to?
> > Are you referring to the "uniqueItems: true" property or another
> > constraint in this block?
>
> The uniqueItems should not be needed.
>

From my testing, if "uniqueItems: true" is removed, the schema still
accepts duplicated clock names, for example:
clock-names = "fck", "spu", "icka", "icka", "xcka", "xckb";
Since duplicate clock names are not valid, I believe
"uniqueItems: true" is still needed here to reject such cases.


> > The hardware supports several valid configurations, for example:
> >  - FSIA/FSIB slave: only fck and spu are needed.
> >  - FSI master using an internal clock: ickx and divx are used.
> >  - FSI master using an external clock: ickx and xckx are used.
> >
> > Therefore, while fck and spu are mandatory on r8a7740, the other clocks
> > depend on the selected master/slave configuration and clock source, so
> > not all of them are expected to be present in every DT.
>
> Explain that in the commit msg and be explicit that all these further
> clocks are optional.
>

Understood. I will update the commit message to clarify that
icka/b, diva/b and xcka/b are optional and depend on the selected
clock topology.

Best regards,
Phuc
