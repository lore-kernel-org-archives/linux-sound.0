Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794906310;
	b=QJ7jsQLt9mN7dq7E3hIMk4VlFgLWGgxaR4DWHD4qyEaj330qtGSaF1aHiQoXwXMTb0M5
	 lKgxbAfN402E0JBdHcqKB42+mRHf9zNN6M3idYkNLnKoWIihOtJ4FVnJlf9Jhe5BzySE9
	 oiATFlRaFnurqUl1bc9yDkdR6J3rptZxyJOujup6DJfr2KtBoRdv6V/TNFT95DdhgXcDG
	 0gxanRtXKdnIEakaKF5DkC7eWDyfsb1ZoqsZJ5KZ+tf8eMbtQ32GNU2hBzzuIK4x5zWQz
	 Ghmp9SZqKKWqaVVZDVLAX/rfWVstN0gPHbjnvvuyKn4YvkOHt2iJA2yeMoTT0OQRD8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=1i4BJTkeMjLWdq+nlLc8WEAuSF6GyrQHaIC+T4Xr5yA=;
	b=xNk6DIPn/dn/0ri7cpkNzN26WF71bGZ58rUq7ZuwGyYkGrVd2Nw4f0LXtiVcSn/BnJqf
	 VDjg6yINol1I21F3opw9mfSMXW+E+oOEpfSi9QNcRZfxN8z0JbkK6+l0nmibZUZi48ivz
	 j1/dUJjHjcMb94/i/8Gf0feSMixO5NxkoVmdNZkX6DJMw5vt0sBFuOjjtS+4+F0Qibl60
	 ue8Ux4yknzk7TLjoLBqVLqw2DwDoXwIonaRTLxuRPiYH2UyUdXxtUU2C/IwiX9wLITEqq
	 bGcHSg77I88G9HBK0ED2nSjDky5RkR4PyBAVCVvPbEU98Bhc7CW7lBM+/X1iPS3aoSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlPnNXIe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFEE606A329
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 09:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFEE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlPnNXIe
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so6311433a12.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 01:05:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794906308; cv=none;
        d=google.com; s=arc-20260327;
        b=jY/GfOviG5syiIuy2XvCITZGHqBzC5qkaY+TWxvUBuh/ODYIA/RtjLTgvaDBR0SoAP
         YxnTZzPdz3+7aoQ2XvAeIPTCa1xbr2TAjpQZ63xCOu6fWldIwYpaJS4L0bJtDKmflLYE
         sVYZiOKTYO5DJyvCkQiDbEC8MY/AydG8J+PsPmXl4wfr2nezOs4JPOssCHJC0LhUmdQS
         VxsYOo2I4LT8gvAq9vabg+8XcX1rfWREkw3OFNag/DgMBJgg8KvXnaZFT2uV0tEypRq2
         H3AGBnW+kUN/INNLOED2C85r+v+wip3lLS4PcmF788lLQ6Pp4XQYSxN7qDerdkc+FMi+
         70NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1i4BJTkeMjLWdq+nlLc8WEAuSF6GyrQHaIC+T4Xr5yA=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=T3pqYQ3KjD2t9sWwHi1ecFrg+WsS0+dUKMSTfZaUeNe9RyUdBvaeHR8hXAKUi5lSQ1
         hY1qH7hwcQR5R561M9YemMp/GoR+daYtQ3mCdMf4vnVY9cIJ1trFKosqhP4FOFOrJAeD
         /JJU5hxiFiS7ximLvnPITrPoAAuQ9p/X7I/GYpcrUUuAyfqXnwcOUUG7njD8z8J5eTDA
         UaiEFhOtDrCrieKtxjsxuyJU5WgoW1EFpkObE3en1SLWBTodRRzrhXEtlebjhumAi9Gm
         sJH4VDNuRvn8VWHe7RwQW3zNYWwt19hGqT2Wgt+uObv2HhscmEHsRdBq7C7xnmX5z2xJ
         1O6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906308; x=1795511108; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1i4BJTkeMjLWdq+nlLc8WEAuSF6GyrQHaIC+T4Xr5yA=;
        b=IlPnNXIexmp6kQvlPHuo0fLgBs4YI6M7ekV1wnES4ml4RpEV27XGfw3vDfZVUG4jUR
         dAFOVK0NtheembZkeMaBsUDrov2BxaYmt80uv4pq4O+Bsq3QEoDldcVKu12/sOSpraGG
         V1eUSOO2ahPw1Pm9maWIXLCel+8RGSkGiL7ud+nGc+CDqzaC4nZB8aVgo1cCDrAblg4r
         YbAu94sZ7exggyXfMLvVxXf9z4HAthoO2jkywxR9l3P/9XO3ymfs7ls6QfHFqEnwVUPq
         8hRNQgORaN+k/B559wMVUsBfJ/KGFPyN8DAvHo+SzcijHicRFG9xQIQ+jzoAFbD0mLGE
         5z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906308; x=1795511108;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1i4BJTkeMjLWdq+nlLc8WEAuSF6GyrQHaIC+T4Xr5yA=;
        b=Jmuh2tcx9ybFvmv7kPcMEs02ZmOe1Drb5ovfW/tp4WaT8SoJ4m9zneCWV2w3cBw5jR
         wbS4CxMq2XhNhrcn1JO6l0AcGqXs0P3RLnGNL9iLzTMBlddvxuN7j4RG78IUbEVO9FRQ
         UuQU7sJEcQ47LdDPT/fRmF61GIRXeClHgxBR7bGLothfEk1MwDSz5lAtj9aoRtXFNoq1
         YiMcL6+joVonuGi++tPRpbqH1eSBFcHb0T1TVXAElc063IeG0BQfZsM6GrDojlYXt/x6
         zCTjpHSo7jIP0r0k83d8VQeJK7KJGaE+X9aYQfRQkADnsnj3lGZ2NanvlgG4xdKSeBKK
         KmFw==
X-Gm-Message-State: APuU4Z9kEn7YUodZR50xmuCFBmjlnHqkQ2cwrzeRXPO4hJ2ROMzhJLts
	23oE6puTIglP40NFdlVRq+26bfPUTugtT/nmxtoLjz8L8/zeAw+/pOPdZsADl8nhSy28RkPyKJv
	r2gmWmx+193JeW5ZeuqD+nzyK6GEXRGQFIwyM
X-Gm-Gg: AYBFou2eSo04sjtBjtDrME/1tB0Z6lLv9u/d2xm2f+FDThytj2RJViRvPx/JSKaQ2O3
	0HUEv3b4u20F20LwPdnk8VcGNExKepLblhn5uHvGVmw4eRa8KyeVSvGyYr+Fpiywl3APw33CqIb
	1IuKpsevgbKRAUqQ8qbnjiwswnG8c2nWs+IxAyzUdkx7fSC363CMgnmZAifMhpkMj8I5+yK925E
	Y6xQFsEP6ZdsRW3dYw5Xwr1mFRG39DAzNR7ViDpmugOdnrl3T4+oNM7PwrJDAfkmqruTpUtSnMC
	KORE2EQ8bsU9htaGMrfj14dWoS+44DpclierfI0w04u6ZXTjokRLrre8KQxtQtKKXj8AsvNdUUS
	873u/2FAJB9Dzm9rzcJ0RZsVcDnBBWcxz6T8JzPqwbHlbpHy82biI2AncIBGgbhsaU/tnWeQ7AD
	0opq4LQ4sbSyhRZzXm/daApojdZwd9O9WqGsKY
X-Received: by 2002:a05:6402:13d3:b0:6b8:6d8e:bf1 with SMTP id
 4fb4d7f45d1cf-6b86d8e0d46mr905355a12.25.1794906308348; Tue, 17 Nov 2026
 01:05:08 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Yaron Shahrabani <sh.yaron@gmail.com>
Date: Tue, 17 Nov 2026 11:04:42 +0200
X-Gm-Features: AclHuK_rqJZwx2T6YyytpaI0RCUf8nN-F8pI3vWyDGeDTvBrfvg5Q1jiQIwkROI
Message-ID: <CACVjhxVo=0FJMA1q35bP3-1re6Fo55vbSyEr+uGRsR9cAjSBjA@mail.gmail.com>
Subject: Audio driver fails on 7.4.0rc2-3 Manjaro, Thinkpad T14
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I upgraded from 7.2 to 7.4rc2 and found out that the sound no longer works.

I filed this bug report accordingly:
https://bugzilla.kernel.org/show_bug.cgi?id=222284

Thank you!
Yaron Shahrabani
