Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E72F531F
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780718837; cv=none; b=sEUUOyuYWNDQwXaupLcSSV69Bwq6akamA8qtWmTAMd7OHPwe/FOl7YLxTdwtvNmcBNxvzeTPg1Gv6oqNk/I8zxQ1Yxia68iNl/mapssxF5rcWDIUBM1DgadI3Q5EVCDOyOUbFT04yFqYyiTXvigsBXZr+CxXI3FLZ7GqV+X51Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780718837; c=relaxed/simple;
	bh=w8hHiCqTiBueu+hLKwHEFRoEYFKueC7agAu4x975W9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjrZr38JyMmqEEQQN6Z5JOM6ZV1fw6xidlcNYtw3gLqTvTD/vkPEy2wB7MTIjnd6c5KfQGKAT6wkPboNCAXQsMMg48RbifCTGN+FSzO5WNxprn4T5MDHh3VH88y3luQSlL9TYabuMCyubG29nsEf3RMylPV6zsmYfEt76J13Ggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQhSeOYy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQhSeOYy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf114b0cf9so22591625ad.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 21:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780718835; x=1781323635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=;
        b=ZQhSeOYy+RSGlSjG1Hfc5sztL0CsNfqB1cIu73Ymzx/UU4z8ROh1RmlLyDaCRAc8Vg
         s+DiBBQcdTmD7rxvZCoBI3/hsR7+v1CRqfqdMBeC9dO2VUN9Azy+jmsik9IeMUtYZITp
         YM7BEZF1XRpmZ50u5PO/whJP7BYpxyu4R6BeuOcsBt5d/oW4v3eHOxS+N06kQGI7K1Ht
         9P0pr+3yEhJ33Ia0iCZ1Q1Z7K77jhe+kVEbdOpOWycVJgl0zR+/2MkX/XfpvgbLMmOpn
         SOoNPvctklj10O47/Ts9Ody6FY5/V5kNom1aGhU0DeRKjfWrYFmeDYO/HaZAa7uRA91J
         JDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780718835; x=1781323635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=;
        b=Zs6JIQEsEIXrvDRmwTDBxCf4TA+aTAVxTCaeA3qKJCnlEWVlgiZMaNZ2KscyqFUDP/
         ZIvd1oPodle7E4CWRmaKoTCQpXoXFNhxxhjoffklrUQPf4p8adVMTnb3WRwvrhE4ELGg
         HREJB2MyqwC9kfXyf2UuXVTzS4Hjl3/L8JVpiRb9mrPOAZas8+TybDAha63ehVXauF0N
         OFmcEFRmo14Yy0yZRMxqzR49B8ib6ynmr+/9rJGiY8etN2okynwWtQfh7V4CUvdVEvAV
         F+9kHABuS4ZRPOLkKK4R/ka3yKhgN4lWU3nHcBwqpkS76UOnChriAVPwY8hD/xxaR5lO
         nhMQ==
X-Forwarded-Encrypted: i=1; AFNElJ91w+dKXTqvqAKE+POSjIbGvmQXPNxeQHnCBjsV0GCknGRnKk9rh+WELjJH0GzW8oxBDn5thpI94KTy8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0WHmZGrqoULljxe+ukkEtj/oVmDc8rzch9Neui7D7VjRRr2e
	qaLergpEVERRNcq3HqR3nRC4Oi/+OpcZ8ZUASnTBtdGLr4vh3XZZhVjtvukE92yEww9bQQ==
X-Gm-Gg: Acq92OFCOCNzROVDzXL6U1bEgnJK6CNs22yHzv5KviM9UtOQker9pZGYhqnC3yb1PEy
	BA6hPSSI0WE7yTddyr8UjXyvDmVlhY4hG3RqwzP08swq2cGArdfKtP9wokjT8Iy1g3KQPZ9U1Fv
	LILhJ2MWirCTQNMN7NTAzfcgNjtMqM2JjXvqW2IH4C0twkqKba7vtNzRPFAG6nOjVmhh9OO6hvy
	8q9yQeOQHL3PnClDyDBaKEYjP4LF7kL4FAGRFizaFnvrjkP3DS1r7VlkP9nNcFDfJlpqgDWYsWW
	L7D6T5HHr1IXaoZKIbuspWbHsHqy5w3AiOhFnFz4b58LF6EXlKVjieubOw2ZFzGB8TY9m89zwCd
	g8PivSWz+bV7eUPUQJmwa8DRdtBg3nz+PQDtdURFVPO41+JkKT0dbAz4NZdwLjvXhPKW/HSt9zV
	O1bmQ5SC1ewrQyJ26Fptt7K3k5k6jPlHqQThkRGPuad2KjCZpdLXKdhw==
X-Received: by 2002:a17:902:e78f:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c1e80f9975mr70654185ad.1.1780718835009;
        Fri, 05 Jun 2026 21:07:15 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f84335sm107056905ad.19.2026.06.05.21.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:07:14 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8365: check suspend backup allocation
Date: Sat,  6 Jun 2026 12:07:08 +0800
Message-ID: <20260606040708.13-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8365_afe_suspend() lazily allocates the register backup array and then
stores register values into it. If devm_kcalloc() fails, the suspend path
dereferences afe->reg_back_up in the backup loop.

Check the allocation result before using the array. Disable the main
clock before returning so the error path balances the clock enable at the
start of suspend.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d01793394f225..74e4f53b31605 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1978,6 +1978,10 @@ static int mt8365_afe_suspend(struct device *dev)
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+	if (!afe->reg_back_up) {
+		mt8365_afe_disable_main_clk(afe);
+		return -ENOMEM;
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
-- 
2.34.1

