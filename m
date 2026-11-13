Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794543062;
	b=esmXmRHi0tenkld1fX/h3q2dGXlOMbIsvO4u/5C+wnHrhqqr84GlN9lEnr0UkJfUWqwt
	 5WWWGqOig1Afx8fkRqtPy78JoHlDILMVfKktRpmWMtEGLAFK0uu24hZitK02XikCDvI44
	 sQU+IVjkA0ooeuiNHTkC9W8tjn83SYI74xKozjhc7VyX32+1nl6wsDTZcV6m06Q+ez8/S
	 rqc8HYTZR8ZD4+abZAjAZOhATNKilgMhPymM1Hde++wXeWLY8IRllrF1DXEMcGc/g2HJS
	 yd6rFNf1A6oy9d1H0zlmFadtrKTn2vDCucaij+Wn9/sbog04sUz6t+ezzB+N/OOsFsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
	b=JXIKWJ1+AlJBMNeBqp+5F2jSrsr/m8t8f8NYgqmdg2SZKstT+mBrQoHVo2C6BLMuZA5/
	 s3+lvxyFO3c+HNzh0oBkA3/Al0UXwgEfT/J3z37d19jMLkgax+KKKi0YHIm+nFpI9R+iI
	 6lX5dafXNuEOhCSzPx2et7wkK/TQCLKWELjv9UMud0lSUxHq34hZqAgEp74JxGUbnZzXZ
	 HSlpxy2tRNocXkRp+8cPvDBvwb/JiNkOlxPOEqpLJF8W4rKXnPEuBw4IToie8AXANxKIB
	 lsN7Xb8ElSVVgJNrfblOWLd4HWb6jt+Xpc7B8W6BxX4P4I1hSXzfuR08v0pz2jEbrtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUa0LUEl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED20606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 04:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUa0LUEl
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso1017211a91.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 20:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543062; cv=none;
        d=google.com; s=arc-20260327;
        b=PfuwHtKjAvgHX0PspZyQ4kCVNb7U1WpiXFxzw5IjB3Jpey8+PkX746ai97lzmjJiyM
         vaoVzRkAp7+G+MGUJS+BEDfgKu2QpzYPR2iwqwLtMYMH03C9Qzf86FnycZQ1t3nWskNb
         9ohLqu0zrSLi2KszTiYclzoWVqbFE6uCAfpmi7M8hX19sI8GokEmKRAY5tAcW6B9YYn5
         YrgXcvh67wU4GJU0waQluicMQmzjcIjaGpog5XI7mY+d4G54yecsISt+6/QYkv1rmHrJ
         r7dqvJe2lzDZ/ViOiqELNiRdnROLUXBrwRWVAc11Vjq83Nt6EFfMKM1hZEwXXljJij71
         wGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=W/aAu8WjDYR1Vflz+VQRPCPlKNRVxs4AWo9vSLlulRP0BlroSkzj6X+ieivE6nCjoi
         x75dk+oQ+AVcPWpoQ5I80FRxX3GEOWIFeO8j87opZtrYqdkTrSZAdcg08m3q3R648Gxf
         hnyuCSDbxyGcxR+cSNjC6R6pUOysEtVFk5CLs2JnSG1HNEkkUuCQrTmnKZ+TR8VC62Zm
         CNTTxXKMnqaVvdjyKj4p+QxTsuDoxhFbLqbU/NM3bweNkg204tCd+qhE0FkeCf+0fhdt
         1+swMk4zCMg+ON3VbOPxAND6Rie7Z6s4PUDZYjOpqekFagtGD1xvFGi8QwwSHOLGknh6
         w4Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543062; x=1795147862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
        b=rUa0LUElaoTodstSCSRfUMe2UH3diOIbHRnbPFsKsEhRkWiLnjYkiSvU2k8G3TEEp7
         /RyQaXQbuzAz1GtMhTZUfSHtMFB9drQf6WRlk4+TV+N4WeUfSHMTHBvIVtlLA+pCHr5L
         6ScDKeEnQ7/TJ51PYKm26zNW27yf1XodLjv69vrKO8KTDej2zW7KcboyNBf28HrSxNAD
         xZ8H1UJa5rFxIyINnH/ZGySOk08Wzelgs0pcjXG4IBX6qg7ucnea/8HzPGOJiyzps3Qz
         qVPumdxuMm8B+d/QP0IO1Frs4jpPOUgBcb9do/JDZtRvMMXEb88I5eriPE8r4KFQfXfg
         f6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543062; x=1795147862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
        b=iIobjLFqy1TXjMzDlVYQuCrVdpomexufejC/Qw9v/6Ra3/G4k/rxD1l4wLEGGHL6kB
         pMqUKO7ZTaWK1JrwrRyEBGhWQ+p1/5SWb39eBamES4SOrUo4i6rlHT6EINlH6NUSzqo2
         h3G53mEA+Lxbc+QwvEz8I+Ju8SeZlxWT2N8YasrudjtrCI+gNbDhAZXVkfGCWxNFlaME
         O6+ggn22vQ6qC7Pu5jEsq9sMc1uKjcQuwz63PMoFt6wh8R7JQntwbv5GG4sozGKKRhm4
         SaKWCjPtfDh/GfOplVUwcdxHrHkvwLjjsWpQp4S0v5ntAe1hozL2Ik9ZGlzbhhXVDHWo
         TV3g==
X-Gm-Message-State: APuU4Z/gq2Cig06kSKsTV2GS0Nxg+nZCT6mlVhsLcKynqJGX+kyUJTkd
	gxl61sXpzX5YvM3W2C4NzdeDWIqktF8aStZpuWPegRvlENMgYaIzdvU9pqslLFIq/fpEaz4cjhf
	ChFMwlp/LC4zltGA66vuiER3afj4D9B//mDMU
X-Gm-Gg: AYBFou3bEDZ90mi55lsKpNTuIB1VxBCAM1acwVCqhWHDgBvitilyr3mw4p02pIEOAhX
	1WdDS4CL2kYEZFAlKjSmNL/9mFB4Tq+/hDqVZAxPnEVHyiMICpKWs/goytTeiBYk/I0xZRic7Et
	0UCZ4pZ0sKfqYd/+ANFLuYbEEOuBBBUzoIVTfA0q93JG749sukWkbZ9OqpHrV5SPADDhTGqGMa2
	jT3HrOK4FuzjC+rnwMSZc2DV0yY8hMi+6kxROwxwdVTgNAHm1lLWgX1iIKB0OgidZyPqLt7CmbW
	lMp6B723ZcFvEEmfsJOgPPjih4l00fOEfIW/uwp4GsRDBpwg1xayMMnd2izW1uzRck8nDKfe1j7
	wvZ56Ov6oLL01+uSx/dq57OKzzSfmVcDolPJxpCJfSIRXCW91Gl81s75KC5aply0UF4r9w451qU
	udF+9hhkwyAWZheHRzNOBnemEoh72uMfqWclexGyqGOQ4tD+oyatt/5NGvL3fm2CABj9MamQ==
X-Received: by 2002:a17:90b:57cc:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3b1b0cd0fe9mr1161971a91.45.1794543061626; Thu, 12 Nov 2026
 20:11:01 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112105116.32274-1-phucduc.bui@gmail.com> <20261112105116.32274-4-phucduc.bui@gmail.com>
 <sashiko-outbox-210984@kernel.org>
In-Reply-To: <sashiko-outbox-210984@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 11:10:49 +0700
X-Gm-Features: AclHuK8PCS-tPrFWQVDfCW_VcQwFfTkRV94vefTGZJMawzt2VOoRcy2Kw7Qsg4I
Message-ID: <CAABR9nE_C_UZyEJ=6G-zCYMkBgZphP7KymUw5U8+CR_yfYzsnQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> Commit 286d658477a4 ("ASoC: fsl_asrc: register m2m platform device") only
> added fsl_asrc_m2m_init() at the end of fsl_asrc_probe() and did not touch
> fsl_asrc_init() or its error path.  The unbalanced runtime PM usage count on
> fsl_asrc_init() failure was introduced by commit cab04ab5900f ("ASoC:
> fsl_asrc: Don't use devm_regmap_init_mmio_clk"), so the Fixes tag should
> point to that commit instead.
>
> Also, fsl_asrc_probe() acquires the reference via pm_runtime_resume_and_get()
> rather than pm_runtime_get_sync() since commit d05040741afe ("ASoC: fsl_asrc:
> using pm_runtime_resume_and_get to simplify the code").
>

Good catch, thanks.
I will fix the Fixes tag to point to cab04ab5900f and mention
pm_runtime_resume_and_get() in the commit message in v2.
