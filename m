Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170639;
	b=VWdVsajKSqJtmg8Y+KDmJ1wP1WluO4WUPM0tqk2/9Ti0yxfTNyBpN1YAl0Ktk+GCLnIG
	 NdMxMeV2MmnoNJbyP4GfxmUtZbgjwWKZVvzZEHaoMSxSdESyNeDUOdIN/G1q+hzHNJqE6
	 yY1ktDu9it1b6HRQ+XwycpQLn0kzn5SSTLB5IIwA43ovYRTKjHs9elzxPeKzWN0rIgQT7
	 QhJ9q5tyx6gojQk5OOaCeEklN02WNXFvhelSVCPTka9n61WdyAnkSpa6aUBWzxgwDb0OM
	 3ciQ6yqSpDmjyijBEf6DqTf3hYWkCKYarc6cZ/USgnaUPwKsCatwYdKsMvOSMc9OsUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
	b=kL+Ll0BJrH16zUXWHikpuj9gPlcbw9HAFYReHInSoCjvXBD5Yk9Iw8z8nIO9tBy/Fevm
	 SLOx8ZcaK2Hvu6jxdMTGTHuHVm4YONFq+jMvykqnHGcVTcS3FF8COFz3JkDJy6ApJzg/b
	 PpkZihQ5TvyZwMWFmKgbOzChf3oZw2JWya/2D8e2OE279lB9/oWKiHMNORUvYcba0QeuW
	 rfwQArLhyEI/GJWBxHPB1PVBmjtLmI13wuijt9zvVaaKTezps5UHet533cEimra2kaS7L
	 x/RNs3Bea4O/lJh1iDrLEYVnl/VSEwvaS5UPVT8A1Ivr2EymRXbsrOyh4pYp3ZOarCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpWwxav5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A4E606A334
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A4E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpWwxav5
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1690481a91.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170638; cv=none;
        d=google.com; s=arc-20260327;
        b=qGarGSosqgzbc7jPj2tvqklm3aawGoQYk4dwuhHfuYxQHw2UgiZTQwgfXcG+mW/oSS
         uGC/58OsXBu+2zOkCG2UuNpRHnxpFb3SbLK9l/6gx13tV8QOZhc0uvbTyGMx8goCFqJL
         fWR38pvRR5nWax1wYAiQXyDvQTBCgiDXQPckVvOAaUs4NR/0zQr32JDPtQuCMOMBRtY3
         2ycwFTNjvmBkFVsFGp+CWkuPPXjXoBuycKIi6Q5/8vCuOtgr1kd3Q9SltVHjjCyy9Shb
         XEPbdYRWtAvKX2j8SPNJMnzDmIRUrmJ0E3eTuG1eolVUtG2PbIiNVnZ0KgoG56DhEaif
         VeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=DMTkgv8CjD1trr5ETlO01HrnzzfgwJqfhOJOWjUgJMmh4NMmQZYPFxW5HAY3zWxUuo
         UZCrlS4Bc8xYUH3Sc6euC5Q44zFENC+KPg3d63+ChqtMI+Q+ax79tsH1rsfqSJbPnnym
         qeEi1iNGEeQUoh9B6oLeUYj0cfiCzu74HyvxUMr4n+LU7MCBTrz7TyEPBIjTscyxL8pM
         w5wUr2mCQOCTSaK5SIQh1QyvDXrfieWLc9d2WHJ6dSx6Lf2ANjEhufktyQkFni6BP1+Z
         hhKcKiwAdQCDU2gzWkolWkfBM0Sn3kVcSTHZSzw+6aQPPM0FCS1Ch6OhoNK4kHA7hRp+
         Q0aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170638; x=1795775438; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
        b=IpWwxav5TZFVXsw1m/XsBmdPOkKaGvcyKW0aM2XEhE93AIQv8EMzyWE3XelN86MLAU
         Y3Q/0UvAy0rgqXVhQSQMxQADquEg2gbb6b4fIbaFsctlWMNKZwtBLXPnhHhSTR976H4U
         ob5uJIcwiFZTxeyulxnHmT0a7CtV/TQZ96dMNSAjL1xDjPviUqTyudhK/iaVjpo6osVc
         oB02lL1LTTYr7CKWo4tcQ76lWgwDH7qh3eZ4Em2wdRdokc33QiKMW6kTisFcG9UIFYHJ
         B9HLQPELej4ZMTgAGaLQ8zlzK9nrFhnKyvmKpe14ZT2yjzsAXA5OlfqE+Vq8XJFV8Ike
         gN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170638; x=1795775438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
        b=Nayc/92f0z42JLR2qpUkQ4f+UXnsOFTluHUBLf2wYTNE0B6OrEUV4/DUyVqJzErZHq
         hXMayssSVluuF2R3Y7zvKLHDZ1j0hS7YPH74fxanaSDb/7DRMM4qbtWT+jzrXsfBdgyx
         IjdllcggmDQzlrMhbAdjG8XLi0hrsZH61ApF1vbTDamWJXM2YZEKo35deCEu8L71pXGs
         FmyrUBl2tJ8HS4ZXk8rl4NuY3HDL/7j9ld3Yr9VlY2CADcZve55qxA6Y/0GHf8lcq8gU
         TxcHLJDMiIxrMiO8ATc7QjPiKk7a5y8P89yvAiGimli2Q0acRmPQfK1SD5kbFpGy91TJ
         8p0g==
X-Gm-Message-State: APuU4Z/1ejQXr76l8RNHkMrGazUOixk793apm0RHhUEQNvCIw4h59n0M
	AXZLZrauBWQRvw575CmY65qomG9esbjGDUFH/uyJtqPBxsWErpx1paHMk+jyrw8bENznIcMaw1h
	HLMHFeM3xoBMhDXTHepYs0kGg03+2ddM=
X-Gm-Gg: AZFdTZevI07JHVeQlmhAqCh+L0dVaEc8CcR0dWNLUQ+Vmcl6O5HTVcCd7cWUdaDUX/L
	E2eoZ/1Q1tBtgInPZqvnim/J6EdNxU7jKrKaIixNhOleNjJ3RWbI3tJlELExhUJ4l0Vgq+R+60w
	UJbVqfvMR3LfVBokCAq3q/CBFDPnqBZ4S6kVzVmnopLXWFPz5+lBR7XKpbh2zcR1vvWhNniYqNs
	ZiGfyjJlvY8MMNYvtp7fxzVaEm4ZFpzkGJhLs99M11W0f9o3AJOo68QWDYirI3tC83Hyt6a1FBW
	ZUvaYb59kxT/Zet6pKNofYgBG/aUuznNaMAyXChVyXuTbpTR7pU5Fy3D2w7vUq/JC+S31268Sab
	Wez2X0DofySYWvTCoPxCiGqyEIoRnIu3Fv8lE/fSTLCARJOsCFtBDpo+48ZVaFNKHzOCSJeBT26
	fSvtR1hetbZxikS3ixVyZ3TPEW5nIXd0JErssKUBv5rx0TaAIs
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id
 98e67ed59e1d1-3b41c8e0507mr1470253a91.8.1795170638122; Fri, 20 Nov 2026
 02:30:38 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120035939.12774-1-phucduc.bui@gmail.com> <20261120035939.12774-2-phucduc.bui@gmail.com>
 <sashiko-outbox-224436@kernel.org>
In-Reply-To: <sashiko-outbox-224436@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:30:26 +0700
X-Gm-Features: AclHuK-x0GBjw-ppja0gJA74xwgyfzSdytJdreI-vMgFr8FeeqLMhnSvi_-YRk0
Message-ID: <CAABR9nFZg_RfJMPevPb92BRsQpakuE-3P9d_aciidipShCNB-g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian
 format check
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Medium]
> Should MCHP_SPDIF_FORMATS be changed from SNDRV_PCM_FMTBIT_U16_BE to
> SNDRV_PCM_FMTBIT_S16_BE instead?
>
> IEC-60958 linear PCM samples are signed two's-complement values, and
> SPDIFRX_MR_ENDIAN_BIG only switches the byte order in SPDIFRX_MR without
> converting signed samples to unsigned.  All other format pairs in
> MCHP_SPDIF_FORMATS are signed, and the companion linux,spdif-dir codec
> (sound/soc/codecs/spdif_receiver.c) used with this controller only
> supports S16_LE and S16_BE, so advertising U16_BE prevents 16-bit
> big-endian capture from being negotiated (or delivers signed samples into
> an unsigned stream if paired with a codec that permits U16_BE).
>


The SAMA7G5 datasheet does not explicitly document support for 16-bit
big-endian samples in the SPDIFRX block.
I think hardware testing is needed to confirm this before changing
MCHP_SPDIF_FORMATS.
