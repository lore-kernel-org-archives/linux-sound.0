Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131718;
	b=1VTiBo3Pejncxhqo2urEobIEPMUmVjrSJZxmr+Ucu4YGvAl2B/GRcM1hQnhflEAjrYcm
	 OFTcF8yzh/fpe7g6FB2sBxZcUcE8QdruE1BgX+/aADoNCq/45duoKnVbj6dV9YGV0cM5A
	 WWhXqnkhqQVHRn3o7Za8zdf/IGtzJeDUzPyHDaiFxJ0G28vEJ2tR0Fcn1JpUs3weUwu0V
	 XPEhllPZH4Yx5ErxcLl9SlUqURfIsp21Y9cY4XetnUYh6su9Oq7ZEdhjmEk/dtlCrzRlw
	 mxAeuNySkt0QNNSmJImyZX1VkejM1PixKcfQp5VBbMrzlNmPCwzYT/JOWzHyLhQNrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
	b=ZGqtDnjzzeUn3O9g+i5YMkfC5RjE0xoD5qtcwLf7UTZW1vwXz3KUn4CWa1LJ/QdHG2gA
	 bya0b1FAakYnQv4vAVeIhhPUj9xgrxpPanAdAYTcwPpcKZ/Zvg/FxGC+SSgRAjV5RC2AR
	 8DWgReCEcuxSsA8l8S5OKq7+1v9ExutmkwpVdeM54u6GQrpHjeH+rG/X0pvjccBl9O/uX
	 xzqEfQLc0HwjyWE2i0V6u4uFJK+GBdVjjeDhlmMi+DkjBA222CqvP4NqMGjOIKRr5+MXO
	 V+XvOmFT4U8NfmSkYcxlbJgRMmc3X3JfNgNOHrIPmBoTBlY+aF5JfjMmi/gxxvYVC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JkIeu8tB;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AA606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 09:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35AA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JkIeu8tB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso42124eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 01:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131717; x=1794736517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=JkIeu8tBbHiZgQwmyx2ybj3vfbRQAr2mZSXi7O0JQz78COxN6x2rM41N2IyZ4fUDQD
         wgQKWj0R/Xw6oKMKYw54uFMKQv+aNeKxVBiAjBA+AQFt/X6YIlZDuyhndWWuLSxazreU
         zDI9fXIFTm/YOGhc4ANdhwp/EvMaW9phzy2Bm2RsYet4UAPMkpFboui+Kml3lANnjOiE
         kDVwnNuMO/6v8D2sahigBz4ML8W/POalLD9zi6992asnrhHtJriy6Qp7idOebgHrjmVr
         /m2uVw8eEDXPOsUQNG6dJQKSFayCHZ/149q7IOTDsTWFvdQ04FqPOrKjp2UYOLnbftwh
         nq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131717; x=1794736517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=OihOl3+Tbdz2O3Dm3X8KSGL02U9NMVrNmUhvPdikWB3gH9jV5miFRbUqDgwqPEnL23
         co6rC9fcFFaS6IOCl9SwvNwtBaqcGH4d2u2u+cV888AfGXiOeYFewhogOIk1kiWrlsSw
         90ULPPnPYkpMDIPnkpMMrPulY7lM9nRHMGvylQY0rUNXdW5mNiQrjOnCQ3lnghr9BT8r
         zyUqmf6n3N6ZPULHX9g8I2ysRa+dwHbrcs2T3BAqW09OxqlxtvI3Mk0vrmmlxSjQdnbh
         65Beynd2OakaM6ugEOLmJHtXeiKUvQN+3z9iFHV9S2xbMh9NC4hHgemv2SzthpNZeusL
         mVfg==
X-Forwarded-Encrypted: i=1; AL+hErGBgq1zSj+kMtskLwzwEQfOcmIBfgqlEpar6sJfx21qPegNfwDvs4dCmWNGUQO3XS3OkN4fVH+ER4wDUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kNY+0mN70uuWfy+9OdYBhNBX6QA3kY6xaKfpiQIPAQWcDVEoF
	nH+QMX1X6bXSEljekycloAA1E1KphP7xcV5zftME9WTAKyipx9QjO1VfRLJuJDOt
X-Gm-Gg: AYBFou2dRNnArg6aRhoC6p9O5YhNTo6kKMTzixn805c8GKfRs/LRG5ivMZo+95NKuiy
	pxFMOVWfBMdN7DwrebEHhkH9tU69EEwJjAiURcrHR+8Em+o6hw9hyRJitx/9eINCijWNU8KNhmu
	sfzheG22b+syGyB78c3Ta99b4D+iL9SaOQRhkQYF01uns3uC+kA+8k76UQxXB7nPPeOSTRaM4/k
	DeUlWiSi7a9ioKUH+tRPdV2LFvkmIL1KqR0SB686M81TRNPmYREXIcvjPx0YwlnL6PlH/o7Bo93
	99PowvcWE2v5Y03V+X+ZciJc5ZfwcZEtPwLWNZ3m7jZnwRX7O9rsjs88Z9gETTvJu3FRtRw167Z
	803veDtc+J+PuftZwUMA63kj8oUFnP+IL1knySgTGnBPtJlpk3nzM1PUvQqnUBFa3baHmO8mM1V
	i63RgX73Ct6peibNJqYon1DvECR7BR076yp0dQQ0biU6xUkbDsUI64uFVql2KsU92HpSd389VZL
	AOMw16LRX0ctwQ5aUXdsQ+z8WHKculqZj97VoyPELxzZq6cu/yLmxJ2PKNQ6iOfVqa+7JILgPVN
	/5d+Bbc1TdFKyHWqhrau36tTOYd67CVC23rOdUbiDG+mwFYCFH8=
X-Received: by 2002:a05:7301:fc81:b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-372570dae47mr2109524eec.30.1794131716767;
        Sun, 08 Nov 2026 01:55:16 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c0701csm4351128eec.13.2026.11.08.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:55:16 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 09:54:30 +0000
Message-ID: <20261108095430.3300-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
References: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
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

Hi Takashi,

I looked into using simple_strtoul(), but noticed that it is deprecated. 
kstrtoul() does not provide an end pointer either.

Would it be reasonable to retain the delimiter-first approach with 
kstrtouint(), as in v2?

Thanks,
Sreeraj
