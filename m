Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794200489;
	b=lp9Int/MLcQR8zzROWGnibXpF3ZUPL70w3y/CcXLnB5WZJjvqM0ZTggMvF6JfyHRNGhp
	 Dt+AxucBdatc28ZDniG0Nf+IVPZm9TpYRA133XzbPBQVC4W4HFDEH1Larn47gzVoR/Z+8
	 J94T9/stQlEBiJQzP0GONuceStOEnthmcZ7vPwmESSwzvIqzL3fWyN3uE1xPtTPXrFqFf
	 /IHybKGu7Mp7KSxTA3iafce3enhgkWKF7g/tLJ5tL9mfpj32LqRyhFqaDmwp+e0WIQUbi
	 w3U7OL9SwNHYe79I3Ysg3fJsFswtOOw1v90KmnLqeQHgC1T26IJTHnsAf9VPFCtqhNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
	b=VF0fSrbOqs+pMjjenbJbVddAKzXpo4ZqwKFCuuvlR7FsFh8+Q4nZHjyf1wXo/mErJI0t
	 vW/r3grBZPWh44kFKBUZT1pNoWTvTGaRocBmvqp/wY4KgBi35hEo6rDrAMOxNhLQQf15o
	 kdhX4kzoteAETZTJPWPvS4Mr8js++gr5fz26SItOV7tc7M6FHdQGpv1vBVBMxb8Ra0DpR
	 PkV+PlFDKdzn4X7uZG3SEBGFPkxcNo+09+mtLKS4Zg9YYMmeKg5qoxJKuLf4kcs9LspMr
	 sdgcLX+Or/mlWGyEoguFIOf80iblP+dSsOACPOxREU6VYSQFfQlRFKGBzj9D//vMrHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wkl0FpMq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCF606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wkl0FpMq
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so161135a12.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794200489; cv=none;
        d=google.com; s=arc-20260327;
        b=MtquUy4XB9aGzcgv4PoqUowFsTB4ghpMc0JA5zDtGkKngLn9JIbDq2sDCY1+u5NcvG
         eNS2I4iiwSI9ExwMZzWX3Gu7ogmkmKVLiFLlJlNYYjJcbsbv3TM6IxYYtNmdldXtyD2z
         tg2usrZIB+t6Wy7GhGMbTqGFb3iL8Vvd/OLZIZMMoGhCvZC2IUcoeAHGX6rfcJWAJ7FA
         +mQ3e6cD47dRLx8ys2Se2F3cXUDRMd3x0uqbJYMhvxXywWlsQZxjy2xOlt8p/rFEScTA
         2ZtV+Vt9YnvAS+niHvLfR9szbQfEUkBnIwbSkjqpR4fW5MstztvGbW82/5p/tZjaAq+U
         hDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=OuT6NTCcjoOoIAdK/NPhoNbwhg0VX/ppy5E1E8R97y8L4MKjFH/q/Bp5fWOn0Ius70
         qJ2Rxoz1eVKKf+CLs8UMJ7+qDKs+e9U2Pia7CJDqWGKAewcHWejZGE+a3fNEZoRI6KHP
         r4awASUJ5g1Em0I+e/fifTSNaCyChMJY4PxjXs+LswciiCyfd4Uu/cU2sFbrjQzmIGpS
         Mbii9ajNj+WY28vladOmODoGzCrVcXxQhh4+SI1liDoGcbBI8g4RO50CynOstbfqLQ2W
         INeuw5+ZUEjM9jXbG18aib2Iz8AI/4rqjaJq7hCNEXtGV3R3DoHH9oKbs0W1djczeCnH
         FeZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200489; x=1794805289; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
        b=Wkl0FpMqJv0BxicK7qBb9DxOEDaTmF69snHRwvas8gemCCP7ios72fbuHnsWtEhpy5
         gjopYJ0vnU2wPqpUNh8mhGtMbTJ19XP5N8XT3Qg41cRupZ3srG+qLhF6rtwmJIBFxDBm
         aI8lctdq7l3Nq7SVXSrppEku0YwZeaq8v0JiBV7UP2ok6WqGRbk24haAMGHOeBCBYnGd
         HPkVMtQLiKWNi0SLfzbhXMvV2Bo/8pCrFGcTGAntgBSomLCZ2esnozcJVc0gLcbiMZql
         44auGkaf2USuin8tMoB1tj7Vy5srtrI7/8YktV7LlkOCbfKGbKrqEC2A1Jk0cy1g0xBJ
         uv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200489; x=1794805289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
        b=wZ1WOjiwcFmuMdofRA62/+085ONaQlw8YKDkyCUVQqP3vwOEEda++pPEMXKZlRPq+w
         H/8xx7tqQ2QhfLRGdBbDxrgrdf+3cjBdwBvtvxsZGVZH1iPdWaDDqnf+YoypeO+HJo06
         zYif+sGO/76r/nGVSmROJ2AnqvvYlADGNuyQjgGu+LaxmRRE5q4d4ST/yJDIt+QpQk6J
         7VBEIugkEudOqx3OPRI0h7fYdCOnBXTu9SU9ZYbbhNkPzqF8G4uRfmY6O0J0DC0ZC7P0
         M2uGtlKTYEhlzNvW/CBDS4DbIVkuymVMHsMRQMEnjkamE9uTDZWEfAnlwoznpM2WE6cc
         hDjQ==
X-Gm-Message-State: APuU4Z89GTTMEfc5+NduF5MDy//qa0HWfRLDm1ALgUMdGItR7b0YWFa4
	RyisXroaiaGTbxXRDcAdHgeeFcA5yVGDLh+zaUNYwqWMcm4Q/1wWGwTLHto+Oludlyhv8AgBiBk
	uRoLuhvgxQZqGXQ2Go+4n26CsNjm1ngAQirYw
X-Gm-Gg: AYBFou284UHtQSfWmjoeJ2bTn6avgi5voU2GReF85dBmJup+gGwmxVTOnVsibqgigSf
	aJ2wiT/cY1TFy0KUuIg2Qjum6t/4u1NJs9oWoPbXl80wl0SlsnIK+iTShPrk4jYjL5au1e3V3s1
	mqATFw5YC7sc6bCptbGJ+4Bo7ds4NdQMhCbwLVATCIlOplzMe6XoM6jqLuUgyCBMD5FlE6AiOs6
	bYwGXh53F8Q/0PpQ1L807vQ5ieWh0vQJieIxX9YfG0PwKg7f9cK4lMrZrP3kk3Q8zf6O+mCY5Gp
	v9CE47MN/U0T80BunKAka518a48Npt3IyLM/IR9W9cfDnvQ5VIffnW+rMd53Dy5coAXdpo3JqUa
	FEyJNow7z8nlTu/xHaOHN67BP2V3ZS//eYQluAhelMsem9jFWLFTgyrCbQYJTFZM0RWTfQ6jk8t
	XLktjNeQp1m9/jTspod1mzcJ3YOXKkx0FLhGauO7CkeZxRzsMC
X-Received: by 2002:a17:90a:cb93:b0:3b1:4018:bfdd with SMTP id
 98e67ed59e1d1-3b14018c05dmr1328463a91.7.1794200488303; Sun, 08 Nov 2026
 21:01:28 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-6-phucduc.bui@gmail.com>
 <sashiko-outbox-201333@kernel.org>
In-Reply-To: <sashiko-outbox-201333@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 12:01:16 +0700
X-Gm-Features: AclHuK_O0wbrzQKBAOvzzwdSeKE-pl4ntwv6Yz_1ad6WU0wDxVfnxKoJwNwEAAU
Message-ID: <CAABR9nHrU_x++FxAgw=q9-WA6h-GieLMG3sAVuj2s4ijVygKnQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] ASoC: dwc: use-after-free in jh7110_i2s_crg_master_init()
>   [1]
> --

This is a pre-existing issue unrelated to the current patch,
so I'll keep the patch scope unchanged.
