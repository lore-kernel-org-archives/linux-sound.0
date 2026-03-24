Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81FB39098A
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389050; cv=none; b=SaOk9+pBZq7FunHkSww8c/Ki8vELrP2a2RixbXP2TXA5Sw08cpw0a/Q3xWcLYRY8PVuIFmTrLH10EBqgOSOylu1JZiKryawVMcEM4xMwoXRqytCglyZgMd1yfH4ACQTaZG0XLKJQQWccld+4/1fuyR/Q28n77gMdHngxY69Vo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389050; c=relaxed/simple;
	bh=IhCzKnpFZ/7R1tzZ9AmRUksEnvUmr0C4rBLy6ViKZZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjh12p78phBMcMEsILejJa4Yhkgkpm1+3P1hhtsOa71xBdOB27nlv+8XnMWl3iN0TCbWy4aA1n6o7baGLfBrYRJYnXoN021mBlK00SDc76sASJWadi8wS4aMwnNqYdtTSJmvVX7OeeGgXKX/maQHGnsf3icEa+WHJG3igGRKLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1Rhy0Dv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1Rhy0Dv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fda2a389so35987995e9.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 14:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389047; x=1774993847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9UZoxXnHxa1lJ8uTX0DyBZEmodcnXtRtQREa7yuqxc=;
        b=g1Rhy0Dvnk8zLbLJJNzRayYYvyf+X+XGx8cmt8oWfjnDy8Ny4FfqAfCd3bQhYpN2Ow
         9X2Bm8yDrLFXGSGr2oEjdaMWmm0XxJEoOjMjdoVojlL0OstyjSZ937jw1dzpP37S0jra
         KNJV/5dtIw1nmcGvJ0dvL5EIbz5f7VO0ZdUtTu1eenlCVjrFZiqIUK5oNPbwm7+emhLr
         iD+2eR5QUU44OvbwSfvpN03MZV2H1em+SUD7TXjcA0V+7TRn14v94jHyhL/gzZk6vSUr
         8JqStddHejtE18geyiLdo0WLiYxIJrWTgAazZUiSuls1Hif7s2xVa4ugngi5A51BpP2G
         Yh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389047; x=1774993847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9UZoxXnHxa1lJ8uTX0DyBZEmodcnXtRtQREa7yuqxc=;
        b=tZRI25ADPNulOh8X9zh2ox5gJ4v74vaReFI96Qx7Qoc7baLRF3fx5FrMg5PJXbcn3w
         RQAfofT8Sq5QMn8m6tzcMqyONrLt9AGPQvLmUsOCFl5f5LvjdJUOK+/JnyYY8GsxuzhF
         XHbA81NNMcP/bGz3x/QD0X9keBTNLRaKtJ2MpppgUMSvR0FswD4qOBDViJ3Gqqc8Cg5A
         G+bUbmWF9668Q+U+lDkJQVxD7TsxQid9G/XBnH7wB5QOzmNL6KGCxgufEnCQIzoSw0h/
         vq3uIDGNEv1BVThoSfTFtavRhU+dGUlxfEBUWhyhaWzC+OPDkdbI43L4X4iswyOpy01+
         nhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCou66FkqwPPlP0kBB+4Ivfvy1vZlyBnifGOgtv52CTZ/k8/qPJeavg6w9CKLHAad1nK5k1fLVv3O1Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiyCHdZXKmjM6KAWPxrO14biQcrg/fxEsW6CDbf8mEPoSaGlo
	HbYubknxjpPfq1pqYStbhxX++DeYWYCEqOQMWuYXcy/evokXBJ7buOn+/ItX
X-Gm-Gg: ATEYQzwRmk6zOt6CqoWVVvdcSyqkIHrqtsNtUM4jybpIXwSCBGXfApCsHhhRCSpKJ1e
	C3N/VEdaL0n7sZMUigolczzsap12v7fbK6pmuRxxytyQFvWV+ig577hiXMFJX7yEeqGrplvSmUe
	2nI3FGYLqSdFyAlMpd65+Mq7TbpdkZaZW/qGjhFUzFQYJ1gBJAaxnzqUmxB+nKMqhiqZNltQhn1
	cGB7tjxe0eTKeNs6bK0DRnRNk5m/nyN15PJTut9AXhQczuaHwnbGCc/vnKrUhqpTV6gRIz+uQnV
	IVGJZTHA1QYq40ZDiKanFQ/Lf7prXueaH4PRzvzWGgiGlp+6HU8+JBSG+OFW0++ETCsD/5ydpyF
	3kFaHcG1PO5evXfmH37PB0Lo/HrLXQzCWNlAAecklMrNPikbsfZP2/iQmZlMxF247ysDbVJA7ZX
	VNI/gRX794a51MpzpFt7eVzde7ybkiRMzz7v8ffvEnrw==
X-Received: by 2002:a05:600c:3f16:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4871606db4amr19408235e9.23.1774389047252;
        Tue, 24 Mar 2026 14:50:47 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm159316465e9.7.2026.03.24.14.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:50:46 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 0/2] ASoC: adau1372: Fix error handling in adau1372_set_power()
Date: Tue, 24 Mar 2026 22:50:13 +0100
Message-ID: <20260324215016.66347-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adau1372_set_power() had two related error handling issues in its enable
path: clk_prepare_enable() was called but its return value discarded, and
adau1372_enable_pll() was a void function that silently swallowed lock
failures, leaving mclk enabled and adau1372->enabled set to true despite
the device being in a broken state.

Patch 1 fixes the unchecked clk_prepare_enable() by making
adau1372_set_power() return int and propagating the error.

Patch 2 converts adau1372_enable_pll() to return int and adds a
clk_disable_unprepare() unwind in adau1372_set_power() if PLL lock fails.

Jihed Chaibi (2):
  ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
  ASoC: adau1372: Fix clock leak on PLL lock failure

 sound/soc/codecs/adau1372.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

-- 
2.47.3

