Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170186;
	b=ZNcJ2Qxd5Txv+HseY+RhJgsHX4PuLcbyNxzUkVSW9onOtxHo+mu5nnxRWfcAqYunqf1m
	 TQcqKhEkrXP02OfBcpGoeBf811I27ICU0+M3tHOYE3AdAbiXBhGUvP5re2znmdDJ0Kb0M
	 ChlLa6RVSVYlrGroCXjdQ+ETIN9pfzlSGheb11zgytAp1E9gZeozuSiv94eBlmodhu3E0
	 wRwiyQBlrfWAOB8oCjjcoq5Bmx9wJzbbTNvdXAtZKdi8LNaZZFK/j4cAX1vstyDEGDupw
	 ZfFHrTu7kSWhGLdszKjmTZdQywWUVsWmm59h4Im49mQbBPBb+pVP8WjOqeUF9OcKdVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
	b=EHnh7BZcrimtiCghCuU1sHvrq4PIFwYvTlQ7zJgxRzpDGuqHcjRqOGeFulGRd/nc09qL
	 ptj/SRbkyGXoIYFYzbxzy4DlXU0g+s3wDojYYErM4fDV5tfsAO/nmL8dgZJypxb/TysRG
	 n4+x9SUdsw/SdaqAQZVK2Hi8RQVH+VWfE/JLLrqx4xyiCRAg6JMjnmjKsLfSyxsVivrOc
	 a0SwkFSYPBsFMZ9oDuCAWtCAuQ9UOkYjSjdQ0hcDbXdtPKXJjckSkKlOEp2RI4IuIaf+9
	 m3MUjsTtAkHPc94yPEyxAa0hJjqX4F/na9gEPrXvCoRHT4kmmJkZEynoPVKm1r+1Xwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4hoiC6m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A5606A32A
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4hoiC6m
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1684998a91.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:23:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170185; cv=none;
        d=google.com; s=arc-20260327;
        b=stvT22LTHnkdOLAktBh2dSthmUC7VWXEmi0zbFKbu12TgEz8qkLDM2uvSjXkQt3rZw
         ZGGQUPZaivBAJPVVNpbkILidPjKSOFX6OpLKU/S9dUZseQAFuoDlNie5We2ugEJSlQ6W
         BJYSGAMrepeHOMeYDeUYBQuK69HNaJg431mRYq+dneKSP6eFF3mNvZveP6nQsPJy8VrI
         SLHJvWORIjf6SW+ZTyxVW/8BRFeQ6Ah142Tu2ENOlMTUVI1YOnfEAd2DeQEth5QtcReE
         8oEUbNOSHy1nM7Qpb2DHLvWrWUyxCAZt8rZhwljd95YWa8g/O885FPOwasg1h3Bm9wpv
         eq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=lQQlAZdBwaa2VIrUwMIaLlcITGse/MMc6HZxoMbqA//gu5CNwzsfBXgll/OuztKGpp
         aNwD8wr/Yg/BAzVsazjzlS6graphgD905TsFFvt0XJBMze5xvPSPVmY11l3P5bAIVtQp
         48W7zd4jDSL37fTnuI6qTkIHIH3+JRnr9QTl36RnHiVlNm4CeGVZJf5PWKmGRSKUNCP7
         a54t5k0WvuSWJeCMfxy33m95iU885RentRdCLgzgcbhw+/Njo5cvCavFqs9/7u+5+LVI
         876/mN0RyYArWyb+EQtlL2M5hfI0yofDw08oByb4ktQ2fm+R31HnXi9PaR1hdvFX7uv1
         gixQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170185; x=1795774985; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
        b=O4hoiC6mIPiexQPbNNGEibZyAtRSiE1V5bQyfhNUZlo2NJm7Yk5eVfP6FcD9s8Ublf
         hcMZdyMkk6wRYSysDgHySJukItKT13Cbb3ftMm65wJDI89KLJoRKT0WBCLT78uyyYwh+
         L7BVPRMPGJI6+IMEkPTQRXgWMouYKMfoLPIm8M15RHQTkxM2h9qFNSKDLVeN/Y4PjTEi
         MdKYWS7zAIxy9ZOw09HKYAGc+HScjf9xNEwGp3eAGfYE83DTiTTA4ROHDM9DweDChFwf
         kx180Iiv8z7mlb/aNJhXoPIUjyYRohBBg+aO7x5z/5Ew37fH1WAsA4g5fo4L0jmwFYzm
         RO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170185; x=1795774985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
        b=rU/snhCFuq1xBNGeGQ21YkMNeBWIOQRdt5ocSK+QhPybmWGGAtLxVwcQ7kpXI1yrrc
         URAhKyzA+4+m6fprZmuxbqaVjs+U59Ma3DuI2XMX22bRp16QNrCNDy5xguBjqGCi4nAy
         eI9rPk1T4eU6+E+t8o8FSsrpVUWJsW11IrcYLd4CsJi8pu4JSTcy7fzKTyRnZ1WB9vOQ
         GAuoIaqT30NeMl5tltRt30uPovvPmMVRU4M5DJgAQxOhn6fAsAlRKYT8vzXIvHwIU3RT
         4Ym/GIhDzq3fHJsTIR2vs8axWyusRM2094sRcVYDgwkTmWqba/QAKW4cWKwL6dbwgXDI
         IXYg==
X-Gm-Message-State: APuU4Z8eo3Uk5h21rL/6cJaZ+/CVOg4gn1FYdHT79j+3jaC/cC1xqUoL
	BXr73ynKKvzN4ICTI7F5NkHQFnZ0IVgGZdHx6O5KtHXjsfnjWNBlo4G4okCfSF9s6fLntEfQd1/
	bcfvzjtTQqAwVJACDtY3XDaU2fNcV9bQ=
X-Gm-Gg: AZFdTZfRaaZsOgP1pxLB263KgLDn2U15Pk5a3+7NklZy1RT1MojPNsqCsT/eHxAqDqv
	1NXLFaBQztAjf7An+HyWziNptWB+s83BCL14226aF8bi41kpFz6q2vEM+XzNTK37iBK7TfMBqSz
	Q54PORFn0uAeZsk88wqufwdXKZGMQrcoV+aljzUxl1gwH7hV4M6U+Wg3V/jwQViPdjTlMMBXQ+F
	1dKYJppbx0e3Mc35UdilWPnhSBpBQVY/peXto0WVO5HWwu6POBdYZp7X4CMole/3cfD7ZqS4CDg
	4kfGwAtn4sxsQwxh8DoGBtucy3bKmPynlgKUIqEM+ZBgYhJNI6bRC0o9eWDdbGgSRcKKWiEprb+
	Ao2b8DZw/yLfV0csCynLGvK6JV7bfc+DJoqnBz5uBYB7L9DHHQ2ex2whLqy0IbANPG5IyWWkPHl
	MXmdRutM92PqnPZ6n+BnmyS+kpOSUEdh6tWX+Zu5ASRfHf7S0PPY3Xer5Ow1cH1mHWuTgRNw==
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b41c907eb4mr1384723a91.20.1795170184998; Fri, 20 Nov 2026
 02:23:04 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120100408.8053-1-phucduc.bui@gmail.com> <20261120100408.8053-3-phucduc.bui@gmail.com>
 <sashiko-outbox-224911@kernel.org>
In-Reply-To: <sashiko-outbox-224911@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:22:52 +0700
X-Gm-Features: AclHuK9UCmFMfooa63hk8VPfqyAB-zcUysW3gAim7LDAJQ8tCvRxpT_6QIwMMXE
Message-ID: <CAABR9nEJ3Jgva3iTo2GVacHXRp_FVrqVxQ-VCdGg41vLbh4htQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers
 as volatile
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> In commit 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX
> Controller"), mchp_spdiftx_regmap_config left .cache_type unset
> (REGCACHE_NONE), so regmap_read() read SPDIFTX_ISR and SPDIFTX_IMR
> directly from hardware.  Regmap caching was enabled later in commit
> 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support"), which added
> .cache_type = REGCACHE_FLAT without a .volatile_reg callback.
>
> Should the Fixes tag reference that commit instead?
>
>   Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")

Commit 06ca24e98e6b already fixes 4bf54ca60f99, so I included both
commits in the Fixes tags.
I don't think this is a critical issue, so I'll wait for the
maintainer's opinion.
