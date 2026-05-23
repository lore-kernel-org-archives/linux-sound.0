Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA521D63F3
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 21:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779570933; cv=none; b=oCIXJ+TSbEGEoHg08X8tSaQPeCFTugk8gl05oOd18WwUV41qad/ZJVjcMkuYjbmpllRTqtf+KQvtPLa1H4kG6h4S0Ukk7vqCpJIOGjmYlr4N5Ef3zSSKgREVa9+FPqSXUCncm6h3vginyXQcF1TCq9Gd/15gQPJc55AxQUa2Lv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779570933; c=relaxed/simple;
	bh=rutS1RQikpnjyL+eNqGL1WNo/BebSsTm+9s0H7lfchc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FKVH0DPVErtesc/7ndxGLA+Nqnr54YZ3CpDmfVr+5LVmPtycBlUgp2JX007sFS86Dphs5X+xnF87jJBta1ic6l3k7stpO74cSJD/QcO5wu5Dc2gLOHxty3qWKw3DNfcmPNatkyMbZJat8lzbS65AwEJztyNw5kJZhSThZ8IovsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpyX5z4X; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpyX5z4X"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c7a459105so8962463d50.0
        for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779570931; x=1780175731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KocvSnRR4xwqM/7p6szeLx88yfSIAZF4LMX54OxwjhA=;
        b=QpyX5z4XOFXrKTpl5Dsd7gu2T0m7hLrVOneO76pgv8r/YX8bq4J1heK8hG93wqjU/2
         mb+fVkSXMQLwAaNK/9KP4S/nltnz3rINZ9+kCXSOihgGZ4GitVb2HeA3JQNfB6wV90JE
         To/pL7gQW5fyP0mPZ0K9YNC+cuoJj/I5AQm1hwkF3X8fokiGnh229Cse3G04r/A6M4Np
         r3gFh9cyezCLd44BSc870GZjMujDy+3oxeWKa9Cy+29n9bBhIjNUfmFujOV+4grm+Epd
         pACOLVHUbOqG5cOR+kdqHfyWt9WyiyBwoe7vQC8/bwKRZ03bNLml0g51Zp4ExqzNaLNp
         SGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779570931; x=1780175731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KocvSnRR4xwqM/7p6szeLx88yfSIAZF4LMX54OxwjhA=;
        b=CAD9NNWazAK6bYM42+Qvs5mWi+hhTAXsZenta8897GfqgNWyeCNRIDAGPuwZSH5XAD
         CGu7EzV2sPiRVsg33rjS/BfKXqq+3oZ8LiJUr5hL0I7KOyuxnvjBnbAREyA5sFWEUX1h
         E7tOyQVxxeOLRJEi1/DHWogXtB3Yc/cqeFVZABk9ZPY9L/sbmvvKhURLVxrx0Pn/yoQt
         zh5dkDDbt2b3yHHAZIlDeKtJ+mbrBrtNtgBmTzuAmt6fQCIQ6KqwdavZ/tMFhKGZgbcL
         VgBhSjBAhdLH5D7HI8KXZ5lniDaRpEMnpDgLrs0L5hJjSK/iKiLM0gMbhPyrNouB2VSJ
         XwCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mo3lLjRjVYP3DqLXE3W2n+19gjVRh1pzLx7N+2X5QIUEU3Hh/yAiB+5nPA1kiBQL7yuUBFrF8hSSVgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCk71fSMby8bopRiqkGuigGnIIz1KTPVxkWYpgCC98xvzdNDSr
	K39ZS35NcaGgy3XcLz02SnovxDXJsGfS9pcpRnoCpYXhK4r/+ivEPza9x1OY3A==
X-Gm-Gg: Acq92OEhbPk7bs6PQafaqK0CPzk6gU9MQvDtI0ihTcv2AZnjNj6vjiotq3oDr/FoHwE
	63jcZvP0jI8fREIAMfHQQZ/o4UgKPnBHkwdcqL5nL70BnKOh86Gu+gC8N1NVq55fsRgMgVy3FMy
	AgE0uk3ssy4jeSDk4dBIjxVvDxHrhBhatslj6H9rEyIuIOuVlHgyoGR4ZphbdLF7sGZsTxmwtqx
	eC6XypOUeTrSzTpPaIbRydRjeqL1jDQDZ1FybMKJFiXZdZ0f2pPrptIDHPKMYM4Tkyxr8ygoT72
	0OHRhkNFtvnzUmceqTJOL5RGr17QYW/8kkNubY8a8ttoGMxPMPTb4kuFr3Ve+tSYFimUgmCKO7H
	TdL4QPQAFkDm8YjaAjEODpV9bq/Hdzt5QK8vidUuKG7dVhc2OyoJ3WKu/yDYn7kAC7GywLIyZ7o
	u74GijWANs4KE10GAYqia8yR3vGXb9Ci8mpXIHPjJXRS16oBK49S4ZgTKfVFRhBSORbFJHX6rbW
	YVAYSTdS/SD8suzKupBGSiDetDAKF8LbWM=
X-Received: by 2002:a53:e19c:0:b0:65e:15fb:2413 with SMTP id 956f58d0204a3-65ead070579mr7417282d50.48.1779570931156;
        Sat, 23 May 2026 14:15:31 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::111d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecf698e8asm2419199d50.0.2026.05.23.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 14:15:30 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] ASoC: cs35l56-shared-test: Fix possible null pointer dereference
Date: Sat, 23 May 2026 16:15:22 -0500
Message-ID: <20260523211522.522616-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct regmap_config is dereferenced before its check. Also, after
it is checked priv->reg_offset is assigned to regmap_config->reg_base,
making the removed line redundant.

Detected by Smatch:
sound/soc/codecs/cs35l56-shared-test.c:681 cs35l56_shared_test_case_base_init()
warn: variable dereferenced before check 'regmap_config' (see line 665)

Fixes: a6f7c21accb5f ("ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 sound/soc/codecs/cs35l56-shared-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index 5b2b915559a9..4f52c8a192e5 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -662,7 +662,6 @@ static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 re
 
 	test->priv = priv;
 	priv->test = test;
-	priv->reg_offset = regmap_config->reg_base;
 
 	/* Create dummy amp driver dev */
 	priv->amp_dev = faux_device_create("cs35l56_shared_test_drv", NULL, NULL);
-- 
2.54.0

