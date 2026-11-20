Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167855;
	b=0ydCIiLj/1ukPLpP+BkWH/3AcX/UP3ecVt4BPcrsQfYOb1ZYLwY4ql2CX65c05uyJpjN
	 LBZ0dy7oRjJy2D4cUS0TpP7Mt6dc1NhlY1S/vMQNpl3N9Y3vg5dRqFsvjdIlsQHR01CQz
	 VEE52TjLuwQCN5XZSnUSHO8Lq2yG2tAK5atDn9bW7FdmZt51uMZIQuqRjE7rRw5Yrq4am
	 ZSuZySfWGihcQFYmSuanPNPVKgIKFCKoiwDcNLqxlIAeDZiOoNsL/6XYY73NT2cRsq6pc
	 xsYwfTHSEwITSqcBaPV35QOk5R4gJraUVemnjH629MNKWoA36sjSgRy2H6m29Dhv28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
	b=T8ROAypUdve0+6syfKfUs7bpfgHijBMHUB7Vf8tK4g7bapDhBa6vobLXzlqFsXaI3Y3n
	 psNbDOtVTBIVOlkuI53AX9cqWyD/ADEnDYkpGEfBVCZmbJSrXKJq14zWH+6Qy3Kyg34Sz
	 sYWMflfFNF6l4ktoBrZk+RytdMTtzSMaFR4knvGWVF4pRGGy3vnztN0M2awQnnpCEMXL+
	 W9QfLa/OVadibvp3IdOWHOeusOnEugwi3TIU2Zu+yssz4+uR5jxrBDEcabbYeJ0u7Rmvu
	 lurUQIKrhXl2upNR5ArdtNzpPTUZa5j3vNKlNO2r0Fr6jgQ7LftnTz4/EUEoWKRnirQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R/fCaOt7";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C21606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 09:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C21606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R/fCaOt7
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3866a784546so28032eec.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167854; x=1795772654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
        b=R/fCaOt7h6VGBa2F7QoE5wOHp5I7Bl833ajUoiznXQnLT4az1H3l4+qWN0ERhk+mxo
         FID0w41tU3K1V3SK1XAkYXpjnx6F1lJG2sChXBseTM1OYW5WkM+j9Ta/zXPjmTzjeh+U
         WSKX8PF8uGt4P5tlh5U4SDdpwGLy7SEbteIWGMt9HVPrEJwHBUCBYHimLkmrRXnOM+nW
         lxLTu4zAjBGJHsdhWKcbebd1/WFSYunPCl9SF26MiyRljgqscAK6N9pV8Pt1CBbXYoue
         uEcO9ldw2qKnGnyd8RYCZS95gDjkDkZxkjceQk0VNklSi3A1rKCiXDK2BdNsMVsqHBBg
         gP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167854; x=1795772654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
        b=AiNqeiHfRUSLohuRFDM+EaItwNXbqSbA8/GRgtMRVW2Wknluloc7rgQhgnA2/cIdRH
         xoVoe1w/WcbrOXX3SRa4D0MkgzD4AJ++9r2kJqRZ+D9CO6x1QqcXMOJ94gynUV3DOpJe
         kD1CQFfETa3mEq3euAhDhXgvzPl9SnAbwfqdRaEcEtKh72b+d8iofKecs703fOm+4HYP
         19HXj0iBQLu6DTmSa/SAgDXIruTDhuAKxGJfn1HDWbbZLEkdKOQIDyH9GtEO7scoC+SO
         POZoO14OZbUvaPCg4jqtX1HaMBfGKttxgBB+/LDAW8ftARfqz90rnWpVI3Te5t36ffB6
         ruxA==
X-Forwarded-Encrypted: i=1; AL+hErHP7yMb9m45Zz1BToRVvseAkAeS+TO2vQciv5KL6o8UUtn97IQtwhQNX34+Ed32AhH70mqQrkGacHj9Ig==@vger.kernel.org
X-Gm-Message-State: APuU4Z+soM5BRLTeG53y5ZOrLmkAsKMhbGP2BQCyN14z6HRuXprajfYk
	ywywTDkK5H5bw+K4i8aJI57V53C37Bu8bYD/yNKz0Af5y5X/HmVgI/5T
X-Gm-Gg: AZFdTZf3gpvvjnoyTGsaB4jolMwpXnVMqWQxTw7B26liZoYmIPYTH9WVcJDAEPhN0fP
	OnSQCCslmuwcWn2MUwtzeRsEColJVpZK2Yp+3dJe56KUirtuvG3hWWM2FpcPSTi2iMnFGkh2bvi
	RQLDgJvHdin+77uOnlDyGTbV9Uhwocd+6WcuzYWOLfMGU4W4eRWijooLERLsox6Qc2qhO64PrZ6
	QHm/jWunjvn8v3DL6IL+vJ98+T+9t7MPB1RS/vFa73P1j+mL1eRMEo8ksReTupFM8tcwkWUER6G
	b2CVflpCibwIMA+2CaV82TJq4g4+8grdGFOhvoq0htDgAhedjWPWIUdBcIS/2gH8N9DkVO8cTod
	+FJ7ZrYoNgKz3Uk2ZJh0X0eSSOaOX8Ds9zN2ezcLSeFRoVINrUN7tKxwUNieX0teZJQ9ZwmsD2u
	s+HyEtX5jMjprcFgShNPOT8Msk0wke4SKmYjVL2XBwwLsMY7/GoqRSsdna9il8gqpoy9betiHyy
	eKPmwwTsImJnmKgtq5NXlb4iDe3sWq+AZbqQFpRZs2VJL3TLS98d2l7LXjZjKotk9K28CqWZA08
	slWQGv8HKq2phSIpe4zMlbYkoNFTieRxqk7DRrVukaFtGzG9nziVhdFtCvXORJT227xH5L+XYr2
	mVxUz0p6eovwL+2YG4pdTJ/eijcOGlZjFJN/gDMcq6A8l
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr1900177eec.28.1795167854304;
        Fri, 20 Nov 2026 01:44:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:13 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: atmel: mchp-spdiftx: Improve probe and PM handling
Date: Fri, 20 Nov 2026 16:43:51 +0700
Message-ID: <20261120094354.6814-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling and simplifies runtime PM 
management in the mchp-spdiftx driver. It also moves IRQ registration 
after runtime PM setup.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: atmel: mchp-spdiftx: Improve probe error handling
  ASoC: atmel: mchp-spdiftx: Use devm helpers for runtime PM
  ASoC: atmel: mchp-spdiftx: Move IRQ request after runtime PM setup

 sound/soc/atmel/mchp-spdiftx.c | 77 ++++++++++++++++------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

-- 
2.43.0

