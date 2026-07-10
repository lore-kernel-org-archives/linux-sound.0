Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EF37881F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660322; cv=pass; b=k204IZzOrwBZN4QJygHyWS059CAf11wfpX3/jjSeVwCHUv31vNaVpTOUYgMcBcyDixl8KJskE7lUlUHdVJbHqYuifWU3yoZ0MXSTCZ5ARcV7lE+c54SduTbN5FnHI4CtWJ379C9+YqV7tJzA/S8tKBDI4/Fs9CUS/XEVG7n0TVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660322; c=relaxed/simple;
	bh=fGMkQi0vaFPUyo+/rvWUwYm5SmHI75qSvtOVJC1THZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxQiTFAlFDTcSpV+zWxs/atcPxd+B9UnTGSb8S6eSVnMtXGFxL7rD3CoklhuOC4JS8Yz4ECH7bi7wLQswXrYaEt/FLZRDHhDSLZF4/RFveLEJe8vOCaqg++vHX/P4ZZfi6IAvFwLm0Gxl+4oPZTYF95Lol6r8NXDGljgcxUJECY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB3DBVVQ; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB3DBVVQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84867f07d63so544147b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783660321; cv=none;
        d=google.com; s=arc-20260327;
        b=NGezzArRQsWBOTBtusQMVse3ss8D9h7YBcJjPnT1HbUCZn7QkRsRJ6YH1zZ2nxtoRy
         1eEoH1j6nVjGWB6Vlf/vVAPGF1jQAxzmRT1gF/oJ0uHN9p7dh1jlzvszeuzpd6OmR/z4
         a8aZd4zyUrTsNz+cKRZTPMEcsrl/I9qXQuGEeAL2KjzwtfUbcNOJUPSa9074FlYd72ac
         nabIJ+c8li0p/0cDm4ZCAXfLh0GZINj3SfhlxLefUDOCw5TLqntm8EfYhxPa/+jPFpKH
         rXDgJzTwmgZUtMqB6ajX1bIBeYtLo4mvjx3z1RBvABWK66+TaZHqI8Iyig0uIpKtrVoa
         0GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGMkQi0vaFPUyo+/rvWUwYm5SmHI75qSvtOVJC1THZU=;
        fh=v0q5qLZ8LzatmybknqO9xWX/8jMQ3kGR+CVpPb5lTbY=;
        b=KWkF7EE59jOYN/IWMm8qzi0txLHR4dzgiA45dN1aaxaISBYG6S6FhoeYYe70yIThsA
         v6uhai2YaHsWEOWhpt50ZhcqNF6h7YWAIJOSeoOFCZMmH0GvVpLDGe244Vx1MBbGRgIx
         Dy2DV9yJHvJCq1XHJuH8KsDh3Mg2Anu4CWMyS2kLTbC618KHuyk3Fyu36IEE42IN56sW
         MgH39S7PuNu5a6HvMFRuamhMYD1ePK5YNQHFTzLc9bxbQ9TR440Zf5HKi60DOFDl6GXM
         vpZZ4JAGsF9vyD1/Fg68BFsXTgLbiwGLqMkLOQ1gPawtLLCPn/CbRgBzQKGyQYkoqLor
         y0Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660321; x=1784265121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGMkQi0vaFPUyo+/rvWUwYm5SmHI75qSvtOVJC1THZU=;
        b=jB3DBVVQO6mqiIOlKeQ1NfYt3mxsLOmrQy96Zv6XAmGI43XGfUGbHi5A8Yh6LPVbOV
         7fhgsDB+p0ff/9Uzrbfm4yVSKCxoPe5UC8/i8X1y8HTKr6ilLx+ODeFtWikqfClD+ltK
         5M7SspTjV66E7jErXM0uvFu20RdpY+Gk4ICp/yxJiltCgX8R4LLGez+o5xXhasd9WmWC
         QfmbkmA3hgrWObZDuYnM83Pu7BMCspi8uVJqny1MLPhvmtqljgShEvesZE/tlu4wgGq/
         Udqt5D4dBykg2qMmlq0FSKYdoUk3Vh1dnloQQ8LhgncEVwAzIepe1Z261vm0je1JXm4r
         ezEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660321; x=1784265121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fGMkQi0vaFPUyo+/rvWUwYm5SmHI75qSvtOVJC1THZU=;
        b=bnWx6nnBs3hbw2/FpQrXF56qu9JLTHFpeRD//TtSR+SsNdpj6GRlOVeF1CnfIeAkvj
         jAQa0Bs2ljBkr0Y3DrlL9WWD1MJGectK6X5lCKvdiJjM8Y7b78cd29wcGvCO5FRlnZsX
         nXhmyHhbw7Nf/yte5TP4BdMpkFE4NBrT9g3PbJPhqVhY70ko5a3PcLt83axeVG//eWLJ
         UQfrmxCiAwRXoBiGwQ1N7142oO1COBemC7OKj2Dbp9M9b8HyQ6CANlP7qO6iyo6/AesT
         auK2m5L/GbnFQx+qvS+JMJdY299MwJ93JOU2zMY+eH4JMtDXotE8+2uE6vnjTk8kcmSH
         Watw==
X-Forwarded-Encrypted: i=1; AHgh+Roi50G3FQ40lH8rBKS+dF439hxPiNO9oAO2xDQNpJEcML+VzaQX01+bAFgwkEW1L1rBrCuJY3YhQ+QVOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4sPe6gR3IcYpWAQ1KxPKqDF7ZGWZqA+vCeMkBn7EJaxSpDhp
	P6uMyejJHeEAdV2UgVp/kzWum2nH/Eqq+c7FdW0148aacUdAfdoFneHjmd/kjqYVy6t90iaRKTh
	kLW8No1c52lxMeHVieKlyjzHAVOEEYWo=
X-Gm-Gg: AfdE7cnpmuvB52tyb5aJW8+QTcFWsPIXlfsUQDw9jHan+ObL+i+Lktp0gJd5hqb/f80
	NXC0mJoIfUyONjl/QrriRiMKZeovQXY6WT8e1PzH6xjt602dre1l7qjhzPmJ74S2+vHndf36ECB
	2puYO2tcL9ygOrfp6iGMt3ZTssW5w0NG+uh4X/vvskG2bWw3DCiW+trC/Sep93xMRihxPdRtUER
	oLBqWKi48hxp+O6/a3l3K3mxKIeSvKKPBfJWgCCzFWcHq5J8lpkqtglJPkXB7fjb8VtZKHc572f
	u0DoapeU19mfZAsnTZSrZQ9YrBu7S9HnbJzI7w==
X-Received: by 2002:a05:6a21:4d8d:b0:3bf:6c08:fb8c with SMTP id
 adf61e73a8af0-3c0bd312faemr11174244637.60.1783660320662; Thu, 09 Jul 2026
 22:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709043740.329504-1-phucduc.bui@gmail.com>
 <CAMo8BfKVyG_nwDkeX=7fdOxz0m5SPD3YpFxRbEEipfkjejNqHA@mail.gmail.com> <CAMo8BfJqNLTUVqXb1miMvSaYhE5bE_8xho7f678_1PJXoWXOsw@mail.gmail.com>
In-Reply-To: <CAMo8BfJqNLTUVqXb1miMvSaYhE5bE_8xho7f678_1PJXoWXOsw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 12:11:49 +0700
X-Gm-Features: AVVi8Cd4C1qnszBaNACgsvzwK7RnMBNCbNkyyonVDn3pHUlhPUTJlYHdCHuKyNc
Message-ID: <CAABR9nHbvZiHL1YwDUY1OVAC5_N-__QM_xPjHE85GZbE+T9sgA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: xtensa: Use dev_err_probe() and drop redundant
 error handling
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Max,

Thank you for your review and the Reviewed-by tag.

> Doh, the answer's in the change description.
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
>

Best regards,
Phuc
