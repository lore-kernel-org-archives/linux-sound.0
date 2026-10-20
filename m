Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506704;
	b=bOJGMPJ2mtjYq6OEKtmV6Zsk0sQZQXvV55FqpSv0Nw9wyK4Xk9eD+oj6wsdJLKAfPb7V
	 fPbMFH7VSF8OyFRM4APR5mNC5OweoBn2SU30Tw/n56utdIKdsAymwueBOdGxADKyjVw6s
	 VIk60/eU4c9xio9j8matE7t9oiEbiJG0EyxP0OoF2bejcOqEi+uWkAmaZNbvaiPqC2Rpf
	 e1+hOrb7QrnTSCbFFwhk8QQyxOG7HfYKggYlMVyJmeB6S9K1UbPDQeuKLFI9lVXh1qXJh
	 h6um3k70pmVWoQe/A9fXzxEWHb7aUFopWKMhbv+E6sMdQHFZ6zOFNuQVB5k54NvOTdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
	b=pV/CP+vRpvvo3khehsvKnuB9ubXt4scO229uytfJO5GutShRlj7t0/LOcEUycA3fbiGp
	 RfJaqWzLyxN0ZxMefY7STgbsIH00AdCekq/ObJ+7NfH10COlruCxo03GVtiXFMXtT3KhR
	 TsCm6+6Q+W+OSQ4D8QjcRxf6r7hzBcyhLLq9DrU9OAN6P7yHzIVSlAbU51VTG/pbkMATL
	 61lPCCNNNF7ikASL7J/zCOTWIHbQGNL3BG5pgHDRMm44d3wuQ+YtFnP/zSzETRjXGeH01
	 o2GIekDG0uCznpPDjHG4i2yTQKx5Vy7xedoSn+xB4z0TgzOwoeaW3DC4WTEZ7L14crw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oM4d/Kri";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B128606A320
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 14:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B128606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oM4d/Kri
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so1371951b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506703; x=1793111503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=oM4d/KriHS1CJeZrfVsVM/Ncn0aQPYiCz2FhG+VV75PK5Y75SD43lvlsP1cSSU5nVc
         FOmJfIjRRnat8deDz/Qkl5JdnDDizXXVqRzBbG2m5nO6ck5HOtuISAckWiVgpMDjmyuH
         Fkn+Zg8kmhU44YsoFNDczzMhr2Ipz4GZz1v3fUxQ5Vfk3JRNnkw7daNmI8wlYAd0/uFi
         mYf+Ijnnq7LRIuUpMaKV6ZrCj2sMR19xn0Sn/BEFMoMYr9R7PWfpqqdrDtiKfcldO9B5
         0g3yjuZIoKjKxLHYSO3WrqyswQov8l6R7xooPimWzKc6KRroVj7ydb7fC50UbI8ki7EG
         mkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506703; x=1793111503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=Ivl6UMDseIwiDAeYs6DUGDP5D5W+stV7PSL5UNQ1R7UAhjoe6/NxeM8pesqO0I56Yk
         RSanZ1XyE9gSHV8/mNL8xPasOhCKz26dEVSZcYFwvovafD+qXjtvirO2McTgb0J03VrE
         /fVex3m+TCSusn1nvW3V3RUUKaOd/Rq+q+NZqUz6D2helkcSIwz7ULdWBVnpIcihSZPz
         NAWDZbIfsLZcLLp8sE6T+UjzpYXgJ/NUmJTpVk4E52eUMxOrD2y9A8DIMzd2Wz3FnRLh
         FrYDKFsJn1KkScC2YAapbH551Br4IWwU6VlejT8R2L9qBZ3x0W59gWbVzDg/WA3xrJdt
         ioaw==
X-Gm-Message-State: AFq9FYIHRaHZ1UEHaBoo29ivrhRdg/eHC0V9cgA6DyZyiEhwlA/iOU0d
	FDBjodXvkf8S46AHb9t/emJhSAcjO7qp6GeqMk8crnCorQy1k+QmD7HF1W7sVusfETg=
X-Gm-Gg: AYBFou0F5PvMSbyUVEwPNOi4gLePJD4S9nl/BQ0ruv/QRRfhtn4vVQ+xysd6F7JnVgO
	FIg2hrWnPlx3NBwjyMbrTFJr1n6lD9kl86yWibogbtXIXjJ77WfxLqx/vyl96dXp1zzF+cufXmf
	lSCXcO+vts+9eUFY/FTD43j47qsbUt6NS92SDdQogXOVwZGiMwXzs30ExQR/NXryTnl48yorBCD
	UV3UEQDwVkEzEYbe3BRmWbH0t/MQDM+yctQitcoJGSoVUdIXIrKp67V18jJpxbl4XikHXoe7YeR
	mvZbw6PbLdIeVReiMp+ZrOrYuuKqN9YgSInV3m28L80kvpjlsM7Q8u4Y/REE3uMtDYObasGWH+W
	mJocshJJ4OHfZdBVV0LQB5jrnCf7uh1fCn4qTboQCrx5cA4VWQZ7EgCuGc3vZtKiTaCzfhP4ln3
	QTzd9f9sWMo4U8KbX7TxAPXW3sl7+ucqPJkiuFEQ+pkbSLRNyIbsuvUBlJKMFZmGlbKf+EasW1G
	JEJ7SR0lkuikWuxiCI4mpxFMcgXuHHJ2g==
X-Received: by 2002:a05:6a00:4b49:b0:869:84b4:4b36 with SMTP id d2e1a72fcca58-8a04be69ef6mr8251834b3a.16.1792506703265;
        Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Tue, 20 Oct 2026 22:31:30 +0800
Message-ID: <20261020143135.623897-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 372 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 133 +++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

--
2.56.0

