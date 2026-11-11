Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361793;
	b=5S8eQ3lTFF3e0Hx0LyMpT5K68k6/tdA06FKp6TIUf7HvFY4VsMgNfE6uWH9u/qtjPyiw
	 E7nWmJg0Hxd1FGrNZVPBofuKhmSkeI0+lQO5OCYGYX9SKWEW6qZqUtVIr1Lr5O6YHkFBi
	 KMpvU6Wi22o7KE5CiGbDiUEgsOB8Dtm1QaBZekZzGxOLge3e8tDbWVmsAB4u8K6EshUAK
	 XBIQMUSKyhZU/QoxD35NaEpVazXBPmtC7wQtjbowmC3YEDy05OX7yJ7QBFEHiTH68d/et
	 DL76PgNhWjapy/nrcyXiLag6IKUQWKN2YspH+WKQ964TNtjrBzD1Pz3dVt1TG5x9kyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
	b=CybUExFwvNKDDzKiqJPx2v/qAqfVyyaVo/vQ/Uw7cLFzzmSgKldDBsxf0TIpkha6DQR7
	 Pkdb4xirpAQStMN52i+bu9rAC8vHU0w84MA9DnS6mIagRRUMRYVwE68P3ztaCYPqCFBOC
	 KFGCA/ycFj0x+oEFo2TokDg84NwO4Evzcs7V/cN48Hum3y88PoCLmDSHFg4IrpcNEc0x+
	 GFbRcahgyrYbglzARHmPPyy3L9U4vO1OR5lnfvvW/3F+mFB4m4gSgh6VWSgO4ikWr/MQb
	 U+1pXb7a7Z0bDgLmd6X0sLoBSFsY46K73MslasTlZHPzclA9LW2xDBkSWXeSyPFsc2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsPtMm2T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A29606A32D
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A29606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsPtMm2T
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed39646f04so10371985ad.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 17:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794361793; cv=none;
        d=google.com; s=arc-20260327;
        b=aRZhpkghxdqoHX0qLB3xwSjJDJhv+MRLc1a7s7ZkxQnk0kN6qCrGQMIUK2wqqwe7+p
         QDIBVY+iJ2WhKdFoXCwDK29L4vPsIkTvvdikSi6v72JctdVHlxPRc9yKJeAx+cvfiVxv
         Y4o5eu/vubEZzLCJgL/j0zBP+s7+LgwAyPqOnOSaS/Ibe2nAEVGQ82S8Rl2Tp4k14FHa
         8NFwooh5tmJDjHIIlH8ksN/tZWLg83T6D3g23nsVGLirAF2qWlNV9ylhPh4Pcm0l6UIo
         gIhHtMka11GGpz6vhEgAsX7Ow5SAzHj1S/buK8BK0dcncdmzB87LunVx8Gc2wDvOVm8v
         m+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=ZhGUuPDaBxxlLKpn0gDmJ/aHTdIBrkm7Y9jgzOgOuqSG8r7Gf4vjCQTGu8CC+AbjG1
         K45AR1scHGpEBx+S2H+qGeMGfGJuTrEoEsOpP77c/mTb67/wo7InmpyOkcPcGbvgBoSh
         iyVo68qYz373KNBne+r/DM+78LrASkqfnis/bjHFaAgJ5a3fVm/XrYVA96Y/Jj7X9ego
         x7rpIIN7/2wdcjjAwA7FivCUy6PuVg2fjm2pLyA/JXM+AnNJT/HwbURPv04K80AVRof/
         eU2goQXdV0KDwqnOoVnj6bM4LUBvdG5aZx7QLd8E0b/TS0kTrZbMCehqRl/Mhg+AxXeX
         hbfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361793; x=1794966593; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
        b=PsPtMm2TwKUu/BNPvKYlwFv2Z/J27GM2ER/fcLolgIjXxoOBq2uuJaiOHhzwLBwB2T
         tXJC/UbM0AgN0BQ53vYeTPXO8KR5kgtxB4XXFT3/WJWyQaV4rlrObrMUf3pBviKu9eYl
         b1LZpvwTBNdzRkovlgDV9Q3WtPM9LkwwB6oQXlICClyQcdU20udxxsl1MTal0ebtk6NT
         HfxstFVnZxB3YDQWwk1b1htsOtyvyLOnnAOTF1MQEsR/YhHF0F3QFbI/HZ8t47WrZjpu
         jU/ppAUQyqPz3MK4XotIM0o2sqWRbWejJSV56Fh7XdFg+uMLIZ1NBthBB3JNFcXsGh3w
         MC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361793; x=1794966593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
        b=N/ey3b0xb/Q3vjrK25m90Pux8ygnVOaQd7cYsxPbXPDN7QB66UnxV2DURJtKV6F7j7
         xTX2TfpHWxSPA1a3y1i5UJWUfTIMUF7CRN27dFMMfFsCDSniBT7H2Dgw7rz+cJ85xZUc
         gB0oqjTFeexV1D6YtNYB9mpPhTDxiHbsq5RZV8dT65lv3DAa1lVM4uwnkhbXG8WJNF8T
         7RZj2YaO1IlPp6B05722QtXEC7thxADJveQFU6F2VndlPm/3EgbcZUuc1R8caepTxfn4
         /km0Uym6p0+Svv5jFrIHMYzq0zsSJBRvDL9xY4BpcilDxRd7AXMJiwFRmGUpKNlHPOa0
         texA==
X-Gm-Message-State: APuU4Z+GWEkrQz7MmyxziDbs0s61kC4hgQwnXbgB60tO9oTeGYfRoA22
	GfCg71dEHboMDvjmyTLD/RfTVO/BC9SHw3c+6Kc7BMbSPG7ViJOc2X3r/0gFEv8whvb2SvViiGX
	IpAXugj3tlwR+s1s0UprF2tCfoSKZrdGsJbhD
X-Gm-Gg: AYBFou3RMaB5c7NIOQ3tMLcNUaV/SouB7nkxQ7WdRvU2zUHBdQyi6C/CJ8EHwGbqmBL
	QRcB/z7aOTpKTnYCLYSjBH4EqISvvjLm6BK4KVoeqYteZ59HXPnAFuA3cL3ghFf8BK0JZ3et3IX
	6AJhfVS8rxddbXJUGv9s0ePwZVfm0Yo6uStGUq16+e1NWjXUf84x7ghjIJxuXG7EYc8pEks5kTh
	Y6WF8QL5RX3/ymTaMNLakXDvMsLTWKBXg7thqfBaHNOyhXaf+FRKZbG3rsf8vSpKkpYFvpoxaII
	zGkjIc5PocUS+ONg0dYH6Ia/hIV+yFkyMu7Vhz2EqP+WYXcxikfnhrUkYfGJwJt1APtbRenzrAc
	/3FT4oV06yokfPrEcPsmQ2DCT8emhrhB27KVnzLesf99KErBWVDp4CWfItHPCwJMmqlLksOH54z
	A2LU8G4ShKJhih931jFbvy1bzgrwDKLyP4rh8BlPQIK03wGsHhzho0dJPhuBBdLCnEEJGjsQ==
X-Received: by 2002:a17:903:1a44:b0:2e9:64b9:a330 with SMTP id
 d9443c01a7336-2edd770aa68mr11073695ad.11.1794361792649; Tue, 10 Nov 2026
 17:49:52 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
 <20261110095525.504660-5-phucduc.bui@gmail.com> <sashiko-outbox-206828@kernel.org>
In-Reply-To: <sashiko-outbox-206828@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 08:49:39 +0700
X-Gm-Features: AclHuK8KXNuOVTdyXRsPKzDhKnjywq8-M4TuAaByLK27noLJZJj0Dz43IhVpt8s
Message-ID: <CAABR9nGcZ6uD5z30NbJ9sWLEDiFhF=KQ++Kwp8tPmST0hFweEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: dwc: Fix DMA fifo_size calculation
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> While 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
> added the calculation in dw_configure_dai_by_pd(), the broken fifo_size
> calculation in dw_configure_dai_by_dt() was introduced earlier. Should
> this also include:
>
>   Fixes: 0d274544bfee ("ASoC: dwc: Add devicetree support for Designware I2S")
>

Agreed. I'll add the Fixes tag in the next version.
