Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808706;
	b=CSPcdsl8frzwsv9XDi3XPuj/WcNadpmFgrtEM4fgQVeDP9EgCX2EcHK/O4l95+8UuImA
	 SHgR5KJ0It8wj9G0sxiaTL5o8188XuRhw91WPaDpY6haZUBZ0o1qXQZbZsHvFS0yAJdXI
	 GhLhn8gk5+L++itfMaoJgGaFKhPRF8xS0ZZxx8z5GFmyYGrP/jA8qu1437nzgSHF40DLV
	 L5OUkKUyUurh2RPzXGxSoRxdCkW2Th+r4/gYzkUuj9Fc4XgyDCG13wFEIslVpXKyoDcbz
	 wNFrIh025G3JZkaF+7XcwA3MSOQ507jD7bkZCjVZlmKTfJLIG6+htDDkFYdBQcj7TWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=3ertzVZP8Qd5nqpLpu/DsId2Ry9JfIEMN8nBR4Mzu/bd7ML6n1PhUN/IJsCQBQ2PC4k1
	 WzNPlQVBbDJOH/sS8UrPZQqPQOt3VgIjje4PQAqZpsdg+wo4P4W/dBBWaLODAgldiUBzQ
	 sDE+IWIuxwkDiHP/Ub3x5cGzni5C+cVz/H0wClg5LJEAT12qMjzhW08UloxsWqt3Cj3jx
	 ehHzEXgYy0FwtBBm6+ytUjuUFugxyeJ0qk0HpNLBPol+I4FTeLpVhJaYO59Fz0NOr0aDS
	 PhKqvgMiBFMIMDu1WVw7NoK3hysQQKVsGY9EFHjlPn8U0OqMQPuSMPMAbXBBsow9iqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntzD+cB5;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E977606A33C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 16:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E977606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntzD+cB5
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so1793053eec.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793808705; x=1794413505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=ntzD+cB5Ax2MdxkWFXtV9/ynYpM1go0Q8dmGJ36rNdgsikHoKKCssFKb4nzZZunaIY
         7RQLa8VQZKSep74Fxcdb94IpfcN+s3p0rivVkV6TkRfGd9m7l6UYhHCZYmp3V+ps0uYP
         fM50paLflEs8K/j9YkEgUEPeYko8RhjC7ss2O+4jZr5DFwbZQp7D0fBI1dzNR/BkXYj2
         ZP75iTaLx78dR04EiJX6hl16bZshM+rpXr/LOv6dV+K1iquoOXaTOiv4OfukckiZkSXs
         hkh6QtAIYzS5DVcIIkQK3mPGQVEoOtexGgQUI0MDHZD8lpY4d70NcCSMV9R9JvQrQjgY
         Wvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808705; x=1794413505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=CFxNnFXcepmylnWEzcZ1MEcctt8F4GkpiitCy8aCPaShWPVWmSy0sTCqvFvLmwlIAU
         yNbGHhsqHSy8wIXx4m09U85NZ31LYlU7nlglghhrUMUcxhSmTGUqDqia3TyQ7ptV3OVm
         ccAorNr+a/+X9Nagh4PgWMjF/LFVoWztzhD6Egmuj2q/UzLzhCCN7vg86DsN0kWo0ZBb
         wdaXsW4OTwo6DUky9Q0lzUFMRoz5OWSJN060bB7j2Gqp+VV0UVKcrdR2HSVUXaWfe/F8
         V3ya0DYStdSAokQ2CYs7Mlu0oHb5Yr12c1OpLlr6CwuDCoGsJRhUsHjgTGD6nPezRjKS
         nBAw==
X-Forwarded-Encrypted: i=1; AKwUvBxbaCk3kWlHurlqHUZYuq8JZLzClgkXiJqvqhjouLdg057lWvavPT0mvHxj4STCFTsZlb8avRNfB/Esfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8G/l5RkV5L86VBGEOpCQDd6ouhltn2QG4uNcwR0J9GlcmXEfzc
	c3gm8IAHcFbA0lUn6px2LC5yqF6TzK4o9LUDaqRzT3zIv4IvToj9xczu
X-Gm-Gg: AYBFou0dnBDioOy1N0ONxK2geFDY/VQhPKsXnnVht2JDWTf3Kj+BxODkbbHJrus+Yy1
	dDxQpSNwHtLLg452lb9p8sDl2yH4AL7hjUwZ2Ro5NAu8xM9GyXw1PD+cGldZFlm5yDHz6O4L1Nw
	8yd4FPwjhiTzQYRGtdN2XHIwz2jMtMTD4/nX36aXvgdqLW5x4iDb8dqcLwsHLCXxr/VKzSFrwdE
	caoezkPhVllNXH0vJnnq1VRq7rrb9y31jnzt7I/16nCszuj8jmrnXWTlCyse5qjxNp7NTdWtITf
	hJEfa/20AcvsF/Zs/IJcfGEE+wWyx6VEoYkAmQGKlLD0toCyv56P91Lgb+wMw2GQiadk6MH7ZUg
	I1j0+EiwWtk8+EkIErXwZfxlZ5vW1fs/fJIybyLISOLujcsszXyKsou2Zx3ov0SyQPYKVxjhea0
	mIe7DmLkpoziZNQJgfSgqBAlXWEqqStxLe0vOYi5zJlGvahe1XbJGgGwAfpvg0Tc70T8BKPV8xD
	Im6qdcgYl0c0wj5t4mPovE0Z91Gq8hwZGHxHViOcgHwf+W4TcNuS15cbra7ckHPmBbVtLR7wZF3
	y0sp2akE+NUiwZKVLiFl1ploCOGDlw7RVTHj5+3PFka8d3REC9E=
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr29590490eec.27.1793808704617;
        Wed, 04 Nov 2026 08:11:44 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm10250426eec.7.2026.11.04.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:11:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cassiogabrielcontato@gmail.com,
	cezary.rojewski@intel.com,
	kees+treewide@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mstrozek@opensource.cirrus.com,
	perex@perex.cz,
	phucduc.bui@gmail.com,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: control: Clear user-provided numid before adding a control
Date: Wed,  4 Nov 2026 16:11:03 +0000
Message-ID: <20261104161103.3674-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87v76evueh.wl-tiwai@suse.de>
References: <87v76evueh.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
