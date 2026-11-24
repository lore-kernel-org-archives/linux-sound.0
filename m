Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532830;
	b=2j36QwQ7971LilrVlepl7tZNQEIYq1bZKLwFJOo/7WLpk/Zpd/fjKmlR+sbO6DLao0Vm
	 ez6c2cykoOH43lcVKXXaBPo20eh2hl6EZQZEQsx+ePVqg6BIHEprwvYM9iWMHMUitG00f
	 Tcsa8zhqssiquWajfie0r1LVZQxGjGmg06bH0DQOsmJwhBvQ6XPIYpMG+b9i38MH7c8oZ
	 w97nCif93HKk1SHBw3yLxSOeOTVJ7myLd7qw5vzQXwrY03OZgtP6kogZ6KHgOVLt43Cmw
	 tDF/4vx5iGhPmWs9+9+XDCaKQ81YM6cG70sQTctVPyHXKpsvfTO0fByjPl8zt6aL5ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=kZeOsCj1i42jElJQEquc2908NUAq6b+cKxFGK3OiactHTrD3lT2kEpK3dy4f+GCDyvg2
	 lCnqp4x0ckAKbc19KcqbTzPnthlMFqCGRNgsC4BUWyFoVn7G4EdvU3bAdSGYxact/ZEgu
	 qH6RY17Bo5EmrGS9Q9a7iP8nV3aY4t1MvJmg74By19LO/ZcgaAHpLTXeMTSytuXtKW+SY
	 e9wnHShXfed145iOocUuc2el6A5MiZ49xp9Vq0Kaqb/Fg/nADMNoDLlFkmJ1rpUvY/p3+
	 g2omzBjaFvJp2Pt3KJaYqei5gtwYynC1fgOm1Mau2iQA7N1i3pJfc/0s+Q11nbfJBhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oawMuID1;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC3606A326
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 15:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EDC3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oawMuID1
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so6726625eec.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 07:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532829; x=1796137629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=oawMuID1kmubn1t/+T9ikxrmuyO8SiZvLdSJSiJJWC8ReJcm8QQEaWbpd+RAneNGJZ
         ww/4FL/wELbrzZGcT6Z4sAsw2+jOD+0ttcefX5O4oUswHlPzUwE1rd0gAQ/OYw3B4YDV
         B+em+gKTenae4nT8LPVOGApHKbaLRaWw36qhmR3ESIqK6o9O8SEHHP/Yupi4XedNBHjN
         ey5a77U0fmpS30cY9ohvSier1nFLxTDc3DofBfh/M0rIUHLqZLPPOpC17s95AsGchZp2
         43TArlHgH8AUIF8/XHsDI4N3oApa0Qe0vjJlbiFMxFARgrm0T7y5pfnVWqzAdpoUUlPs
         pfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532829; x=1796137629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=tSV88HITaAhxfvtE39KW7i66EhV44gXh1EexYXsnluVhMLVVJJh5AvIYOOrK0l+Mlz
         XfnwWMeQYOdKL31FviUO/6H+oNakc/b/Mm/JWVl6TPa9FEihjyBXaNsly4luUS0BVlTG
         up/YeaZ0BxMyg5H9b65AyG3Nva1uk9hFNONYeJ6ft8th/gm8I2hSgUMyNGhs/OpkTkFE
         0j3zdYMVuAAGQMDIhmtDsvkwcu1GoYI4914yVyWA6m1t4rat9ESCKEhGLNeepYn77LP4
         Wq/uxVQVlDXx69XyMThGUsHSRMxQ6MV8PpbbooyeNboqBHihOt7ZfrEIWKJIR11W2SU5
         Yfuw==
X-Forwarded-Encrypted: i=1; AL+hErG/g6N4JJTswSQKfWt8wXssrXVpEgGGzC9EYPNetIUTxhiPirz6OH2n+pFtb8ZuEpHYqxr6H4koBEdfaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3A2KIeqtboo6lUTjeVw35XLiFZV9sgBAvBjIPItdzxReAPES+
	jyI1lACVOwcRViFjcjQq9cUBGDXD8rfowWpmewbbVjzquyqrcLmzn1IR
X-Gm-Gg: AZFdTZdDCVDYDaRNlYwcL8vcHR3g3XCdMh5rS7KtFJ+4Fm5ObJQiC0JnPaNayI0pU5O
	uwogviUYZaZIpoxnMcUJ4U96KwSN1SeJOkBZrqqAnK/pKIHz9s8gD5XeZQscyM8GC7zHWX+eWQy
	BE49BtyIwJXrJJAY1PXokMkWrxxc3EQPF9tulLA1I8kdroC+NO2b5F7hgUyCM9KSrCvsgHLEkcX
	EesmuXuw3wMypokTfiNTvlvQztcnKg2A4P0Km21cD8qOiFFELMIzYKHwbnlvntMcwV//Qz9EAHt
	Zkkt4hEtcws6mKxDtoXS0/B7XwxhQCdQ9s3C6xgboWpC8C+p2chvcbUKOpzTfcUUKSGgtB0A1im
	oQbj+7o7KBwu+cfN+Y6x7zrJvFJjQtadQpDBW0D9FxVbMHMkqI4UF6+2epcJ7wW9SkuJ/wrrzxf
	TccoZfT7ezIO8w30XJsswEE72Of3p++KzRsIggSZ0GfqIvzJVaozf+oUqOYATZA/lOPuxRY/J2G
	GThJhR7VExoPY219Lktrd/SgmqYa0KfH28cmFLLvJvD37akrFry/0/2FvCLZVydtL+0X9DIRsAi
	a/LZeobok22P8x5+ozMGCAACTC6KAp+oHFvVPEmwtIgAuzyGJiky
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr16303982eec.19.1795532828449;
        Tue, 24 Nov 2026 07:07:08 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm12728260eec.9.2026.11.24.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:07:08 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] sound: core: Check return value of device_create()
Date: Tue, 24 Nov 2026 15:06:41 +0000
Message-ID: <20261124150641.2650-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzga9ytd.wl-tiwai@suse.de>
References: <87qzga9ytd.wl-tiwai@suse.de>
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
