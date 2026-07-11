Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07F35294E
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783769970; cv=none; b=ddn76cTgnPwMvZQ0QHQKz0it7JtQuzzXUtOmpNViTL/JXonOrEow9SsgRV6QJTFAV2IBC5mhmqj3O1CJNMt9hwTHztd03nX9OF9rJyHrXlPqvLW5JdnzRotCkgoAbaGIAEgcNcCUbE92Xv7veAeieAGUmbEy8aalclkpE9iUaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783769970; c=relaxed/simple;
	bh=/V9aJygM45xNNQSX0JoGwGv7gQeayjRUR4gf62fYu8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzPqElmuDr2vNatYzNcGKjgyqjnk7zsJMzCuEDsO0MTwaoT3aJaJupoRxWg3EnLi28K3DXzD6FG0mH1fSPS7WjXIRzdXSaEweyVY7l7gGqiqEyqRFhfXXv7sdTphbQ4qrOEMbEFPUf+YmUmqcfPmbRxNL2KQH/AZQkt3CjCJDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOXfdfMm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOXfdfMm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1563861f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783769967; x=1784374767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaWhI2wQ7rol4Vu9TMGFIS5R1vwCn0PiFCfGw57BvxU=;
        b=tOXfdfMmIudTw8IvsCuJ1rFZBSHa0VH38jd9UJzzbh3/ue5xU/C9LjptEHblia61B5
         3ZpyciqglJj4tqg6jH7UFx+7m/lrnGpNru4P0iVV0D3SIoE1b7qSZTSCLFsDuzrp3T/B
         K+PheIO0yJ9s8LxHNTxKVrQD+BFEhFzAntNASMFVOeXNGUjsKrZZQKUGkmH/gPKM16U3
         5gt/PUqFI/miP2RMBbEPR0b35w6ANHW38EhQUP9vw1ifBRsxpKmxNKgjCbFnrKZdaeSU
         XUC7fFJIW0hm9b/Z/Efo1IQwvIx7lzkiW1GOSrHKPT/x5g+1LYxn0dul+HQLR53rlANj
         aRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783769967; x=1784374767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZaWhI2wQ7rol4Vu9TMGFIS5R1vwCn0PiFCfGw57BvxU=;
        b=JbwTxsyZ/ICtK+g60mH4ISee3977uDLQVwDP2rRjuiL7jrpLRJNSH8q2/kOf2U/rFy
         xtDwDSGnzF37fs9YbXOESP3oVeyVwoY2HZdMSPCigQrRlOwJsTwqKjhBcb+RQywbLgVn
         MMiTh8q2lrV2YUq6Oz9vAJ8Qd6WLsXZ50/yp0Qpl1CcNBfVpps6BQbRN4+R4jkhu1JSD
         wYi0w8rHk8yztIhahUxYVssSSITowD/nnNIDZF0AmP3LH2TGfCUDcRD71BGnkIPFEfS6
         XPoWsbrsNLNq8RxvLFr+swdo8Qi9j+wN1pr0kHXXlAX4nQPlWhMyck57wuxsHBgd9Hqz
         Dt/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEXx4xzJPzS9VmA7OCwbFPNCq/GYXlUAU4IZ+MTF0iOyvgRes7e5Qq0f3vbH8wKySDF2rj+JoOPJVzog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1J2GCd3b5nwyBmg+JDm4v/pbm+f5Izt2030lsyv2Py59Rti7
	iQzoO0Nwa4xbY7Yg9YnfkEGafCzeKRE2quMQnFgqBc+nKodDIxJXZ81q
X-Gm-Gg: AfdE7cmjJ814V1wSBwN6l0c9EzF8XQ/piJlLkNrf730tbg+nWMDfJfC21WxTfpZGFJF
	Qxx9MY8Le53pqkyqj8ftNdoA3w5rF+GsdiI/vvqgGzJnq8ixoXatl2hbIAUneGcKCd6sW0S5Q6P
	/QYhc2P3YlC8OXvlREGL5UgkJO58jB0iefQ+hNgxAjAfR3bkfQYkzuxfaijEwWMQ/ehV8eyaw0A
	P0yRj+iuvKP3Br4GSOWS4poIsqOHEhp3HSkj1VMIji56a2ew7bj2ZzJu1IC5M7h1mWP9m2i7yGd
	afnHZE+o+pvR0kMhlqQdsKKKEyEOVEQKxsXjyRgEzXGaUvJ4xVvJz0+s+QJ4KZFelylIwSxcwGJ
	RzWowKAkLj/J1nz4FDLzaWjeIGiGjTRP/0C2jBAgjOBRqfI99CjTcUem10NaXiVIZt6BqnbvZ7E
	ksGvBYjMl09O6/pGkb+HK38Pj0npCx
X-Received: by 2002:a05:6000:2612:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47f2dd1f23fmr2658296f8f.29.1783769966968;
        Sat, 11 Jul 2026 04:39:26 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:e106:f973:a70:bd1e:4000])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm69194942f8f.26.2026.07.11.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:39:26 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: "Wang, Sen" <sen@ti.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sat, 11 Jul 2026 13:39:12 +0200
Message-ID: <20260711113913.71220-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f814faf1-bfbe-42e4-ae0e-e34c7b2aad7d@ti.com>
References: <f814faf1-bfbe-42e4-ae0e-e34c7b2aad7d@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	ret = devm_regulator_bulk_get_enable(dev, 	ARRAY_SIZE(tas2557_supplies),
> +					     tas2557_supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get/enable supplies\n");
>
> Looks like all supplies listed above is mandatory in the driver, please
> make sure you list them here in the required as well.

Added vbat-supply, iovdd-supply, avdd-supply, dvdd-supply to required:
in v2.

Thanks,
Gianluca
