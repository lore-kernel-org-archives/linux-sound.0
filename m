Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642937C90A
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545602; cv=pass; b=M/+SS10HkxjQNQR6y+yPyeJWM7zwOotkEjzmV1pwv8rF9JN1QZWxJmZVRI/wRoq6TPpKIcvMNXc6LfWjhQI9wS1Z25NvWcQkag8i6kuoeipxwhh52nPgk1of30acflBxqUxv72LrZtETuBoaaN+IMkGvKX0oKo3/A3ty3fuXry8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545602; c=relaxed/simple;
	bh=oUtQAxx6vL2RIVbyoqogaZhDTUmqZrpIVWk2UV+lzdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ef3btfxUyTkXQAghdFAqqquUZyzkmwnVdrLLo/AZZatKYeVeNedItjHPRo5pr/57TqC8Q/9ovyTqd1lpYWATCDcw6g2/h/+YDs76hx+hHThPda/YOLBNpPqxUz4zHSv0DPDHJCG9iw9n6qKpGOQ4yL525cjwQNhHAIXv1TqJmw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwTrq+Uj; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwTrq+Uj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cca0c5799eso13936025ad.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 17:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785545600; cv=none;
        d=google.com; s=arc-20260327;
        b=PIngIYjyB6Zk3o9L3Aou1QSJjsGmYazYO0J5YSzIMZrtju44cgpsLD1wsi+1Jawwfx
         dtuBH0cCovX3PWPc2UZU21Oj8Xg/JVyDfl53zq+wBfA5yevN44DbAbYnfxacY2YDjC4b
         7IIBD48CrV0ZKW7Sa4Sf2GZ4jzBRwBE1sBEcf4pI6BRzKDitJRj2bWOeZ9hJmjachSeW
         g73ze6JQiMGlBXWefyhB2dENlv1J/SIP+x9cvWJ3yMRJigMgVSP9q9tnjiqvK0MPmur2
         afQc8wEoF5UJL3AugLXHKQMA0HXWIqjCqeLDQwYR3C/xt+EJerwUZeCQX5ngiigF4COx
         7jFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        fh=YG+je7lX6aKoMFwFX6Uh9R4pwFZgGffjwZhSBEJtCYI=;
        b=OYuLfhhWb/pSZ7kqdl/Wc3CUAp2hOUjVSFxWGKpDxZFPCauP30kusd0sP9eQk/Npax
         Fz3mdiboaZ4K0v6//78OR4YZXQPe4zVqcem4h3sa/t/tAsaZmSqnZlu3GagENLfKJpvu
         eCnQAiszJaeXI9D1lNodgHSvJyRtg+whpEB7SWto09C8LflLuaTE6E5RqGKuqNDrfsm/
         tmGAuY73v6C4qAufZFBh/449wb7tZxAGj4CMTrbGfNS8xxQV0HT6gMk3G3KJj53DnpYn
         F03r0MxmLp87ALfGkAdGrAq36+V+1P+XpOxWwg1eEqbuLX4OvFGinyx2LhUq0OBhjMq9
         unbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785545600; x=1786150400; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        b=VwTrq+Uj7gcyFQu7TTFyCCQbn9pROiOS1jSAEyPZeOrZgT0q20qFnMAYYYEEdR/aZJ
         QbAlW0V4+kjzyLTCJpOccJMOGMDhjcLR+L7/XQb1K2uhs9KYSX+AJ2nkosdOSfTtRxAy
         vEkoXGa8Jclb4lrmu/BbyZPLwdx7EZ2zDsBjqs7x2CKTX3wCnPJpyeyo7wexLSENSPGG
         NnJWCuLcQpZ2/tOlgLvJhlutvWvgjCzW0mbna06pcH3qRgAXF5FLeue10MNX/nverAi4
         pKCy2BetY6tuBsgyEvA+QaPgv5shzk7UybtZqHhE48DKdSivlk4l+4OntQD+jBV9vfgI
         b7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545600; x=1786150400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        b=OWkm00wzooTYmGvgI25y8tYjNTMTINk9PXyxazHE6nKMVORge7jqvrHTXNHEEa8qfF
         ttTkZH4n1t40+KmprKiFvSM+dUCMKWblVA25azNQZ2RNyasCDNGjPC9eJZUHfJbUXIJ+
         G2Q2xRPXWzhqNyHQsd5ajLUSSbCFjNhuPdX0AWfbltSX99igzhsGLN1Nng3j8u2uamZl
         g2GUGXMizpH6YADWQCABB5ve/aNwD1kYKknWZTR/g5b4YUmJSnTsWZ2sO23zEKXuDmUG
         y9XrddBOvlhCZbeqxmN9ro+xnKTS/RrgWcxU43FyNHC72dPwN7pX4Ki2E5DYH91FsdeZ
         WQzA==
X-Forwarded-Encrypted: i=1; AHgh+RqBfEjWr0fqQqaNbKJkoWL1e7tqnORG8Ohc+m/L1JkMt24f+VHytqc4yWalGzvcMR4RQFFgrHyerHJGjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKxi1rilCXUEyeo9O2kYYq6FEO5xQYljzbSuM1QBV1NcaRIMx
	cRvSE28cpikcE/DnWMaL4gqchPgiuhbzTMfG5oG6JkO9F4BSCdS6frO+/CRblsfPfvupgih6t+h
	couUpUgy5pfTxPA6AwIKzPzbSbawlBAU=
X-Gm-Gg: AR+sD13AGAUUBhZyguFApnQnV5Dif8k10mQQ+Ubn50OhuD9AK/tbv0fTTD6RFFoRDei
	IcFAG0hm0FlHN+hYcvw059SLNsas6c9EGvN0fk7EtBLo1nUjJXGYN1Jc9geiE1OvpcFC/MV6PGz
	FkDOiA+T6zHCkqOUSXA6sgAdIqW6WnKGg0qM5diNlDbRo2+KldBus6T6B5HGADjT1FeMIrmT8Wp
	4Dvcmyeefg8CnhtwwuPA2r22uXeAr6aG+q5ic/GUiqqIdq2cM7OrIzTGS5hohOiuG+e4vDL9rmR
	m5la89EkPmp+lfWKVuaSW7k8A9A0wun5s6jkw58orSLyzd1Uo5dDxLxUfTGboDzGxA9MaqjfJKK
	lyimmZAz/uPGkB3JTDm7JNh/9KHXd/zKjK+7EVEjCgF54WVibQbTMKCI9NJGkPm5J+P3Hdhjj12
	BeboKdcZ7deFB2oio=
X-Received: by 2002:a17:902:d541:b0:2c9:97a8:aff1 with SMTP id
 d9443c01a7336-2d0523f6632mr17715015ad.42.1785545600095; Fri, 31 Jul 2026
 17:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
In-Reply-To: <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 1 Aug 2026 07:53:09 +0700
X-Gm-Features: AUfX_mwpBiIC-LAm7DPPHKlIG_sYNWPv02mGlSPv-uPLw52OHrWaev-lmAvMvpU
Message-ID: <CAABR9nEKCtmkt1H+qe5UAf42MncOpEqX+pZ-AySTSBQ5Q3URTg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> This doesn't apply against current code, please check and resend.

Oh, I think I already sent a v6,

https://lore.kernel.org/all/20260609113836.45079-1-phucduc.bui@gmail.com/

and most of the series has already been applied for 7.2:

[01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
        https://git.kernel.org/broonie/sound/c/955fecff55c3
[03/11] ASoC: renesas: fsi: Fix trigger stop ordering
        https://git.kernel.org/broonie/sound/c/859efe92b0bc
[04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
        https://git.kernel.org/broonie/sound/c/c9e05e2fa089
[05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ
after shutdown
        https://git.kernel.org/broonie/sound/c/e813df3ef529
[06/11] ASoC: renesas: fsi: Move fsi_clk_init()
        https://git.kernel.org/broonie/sound/c/cfa1466e6dfd
[07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
        https://git.kernel.org/broonie/sound/c/5fb4660ce59b
[08/11] ASoC: renesas: fsi: refactor clock initialization
        https://git.kernel.org/broonie/sound/c/2330e0b49f14
[09/11] ASoC: renesas: fsi: Add SPU clock support
        https://git.kernel.org/broonie/sound/c/39033b278f9c
[10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
        https://git.kernel.org/broonie/sound/c/05e1ebfeb726
[11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
        https://git.kernel.org/broonie/sound/c/26deeee42f4f

Only patch 2 is still pending, and Geert is planning to apply it for 7.3.
Could you please check again?

Best regards,
Phuc
