Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C554B04BF
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 01:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065852; cv=none; b=gsudSXc/gmbQFzWJSZbIsJbaRMfxbpKb1LSCWkzSKxYOUrE7GMxVt8BVKryTfUgB80Goe0YjH/BOkBVNvdJ8JuTmwmfUal0/9MOMcpaELNAPKiEtK/geJWIpo980QbkUQDcN2xt6dyyLWy4TYzRy39Vnt5t/N+5R0f+7Ngzr2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065852; c=relaxed/simple;
	bh=80ocvmi2cf0dwGKVeh0HWEPDBLshhhyTQY0cJgcK5ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcprMGh9yfb8SHxX4ziTGcbK8yGxyzih6hUJNvWGkgPsCFbX40uH116WJUHpkyTQXZY0rzaDjvhCLsIFYtrtkCg6QHNi8jfM05o2SId6CO4hG7iqR7BejhuNNvjLHWjO8NQRWUMx4AYwc1WshnBPW0XAbYUhbaC3H8vNcgnlmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFtSRDA6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFtSRDA6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84867f07d63so3382642b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 18:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786065850; x=1786670650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9zn9Q6cIABIwDsq5qthJMTxEdPEhQL7gXImIY/tzQU=;
        b=EFtSRDA6rFgPoWLQxw0hReJ/TW8i5v0GFLdLcYRYNOId8yOp5BRpX5+BgxIPJfIz5m
         KHFx5JLzLF+jjbauN8UOyNu4eMOM6L8krnvwQUNJ509m7Nr/wKCSFbob5/5vt/USbu39
         43Ore2INI9qzy3NVoKWgihNA8yZGcwaIdMwee9aMI5XOFv1JQPU1CXaHHwS/XM1Gp7BA
         0BYo2yF1EFq/io4iL1LjtVPwSjLn4LLOIrIJJggDSi+ZCPBmp8bOgb8GFNiWtT/ODV7v
         5WXH9huuVGCBCLRguZo388lRtNWtYjKVSLmkOslOSUSyDcq5z1b4g8wNaGGLqDCx0sCH
         9eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786065850; x=1786670650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9zn9Q6cIABIwDsq5qthJMTxEdPEhQL7gXImIY/tzQU=;
        b=X2wxb3+bGbmG1Ef3DFL62qQtgb9ZweQaQuktsvqPEyQ53/W7kkBVFHgwI2puKANihA
         5BQ7+36AzxoYelYHDj6nTZ2XJ98a6nga7ZXGrCTEN6labx1qhpfR2Bgw1gXC1bU4qhE5
         a96y5oB/364hzAhRgtiQE2gWIUgecz0RPiAWgtxx5kYdVEjedCVNFQCCGdtQ235o3XFv
         cw3kSjlRT51XDqFkO1Rn/OGg9pDVaGTArODnthDE56zIx3QwMeCUj1IuqCTOL5tlOk/j
         SLx7OyEFW3UIdBdeQy3euGwgtJp800c1teD0m1zPMz6c6wihs2AIMB9/7Qk4KUxk9Fn8
         bZeg==
X-Gm-Message-State: AOJu0YylpOXNHgauHaH/xceleoBfbvpQ9jRIzQYLgK2DneX8JvAaoQOZ
	RFzfdhJTTgjhZb5S0xap9H12ohYEQAhts8clLVwP3WPENLKONGfkBZL9tZtXxA==
X-Gm-Gg: AR+sD13HqsJrQPwD4kAKWH2fQI242TSBavW8QPgfbgq65VLfGYVmpewVYDymJvR/0Lr
	v7NDJ93P1MjNHFghsU5EY9Isbb5p1mAZtvc0ESgJoIivAcHhLoKuhR+QQELOIaSVCqOZURgv2sU
	x1UfKG/oR/QI6WH86HeOUb8r85EazBdQSprabklHawd2jPUCiRi7MCh4DhOqsiTJ6/IGAXH4ZaA
	fh0J0M9odj+iDHG7QoIPrxwBGXQHJdCDT+Ptd+fAmpeERiSPwn0rXoLdBxjndBjQ7HK5pcdUUE/
	5elWjHGSmusrOnjAKUScP+kbKwnc5E9zQEJyvNUQRwZVa6iCYOsZJM32n84seRB+PegsHdOf6tj
	E+fFFhbCJAK3jRS3G7JuDLf44pXqHwboroC9R8MIEffjo9Vjx+6iNDO/VvBbBG2YNrUJqSBTc8C
	YGOBPJCTRfmM+LeLtFwZlACAulkTODXIVb6tZdsjx9hnlLK0dWIwBJtNi47FuWew7V5WaiwhpGP
	ib6IBG0jFE7nlCBGETb0itQDvKGUACuWrtgQ+a9X3MsDaClOJs0cNX8tob7fBwymCzth8tsfoCE
	HVpo2A9dSH9UvoaT6byrs4P8D0GDBkNi53TcHA==
X-Received: by 2002:a05:6a20:7487:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3cb85e2b724mr20842810637.6.1786065850586;
        Thu, 06 Aug 2026 18:24:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8bbddac6sm82550a12.17.2026.08.06.18.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 18:24:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: amd: acp: return irq error directly
Date: Thu,  6 Aug 2026 18:24:08 -0700
Message-ID: <20260807012408.55272-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() returns multiple error codes. Return the irq directly
instead of just -ENODEV.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/amd/acp-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index baf4b41e54df..e99588458ed8 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1292,7 +1292,7 @@ static int acp_audio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	status = devm_request_irq(&pdev->dev, irq, dma_irq_handler,
 				  0, "ACP_IRQ", &pdev->dev);
-- 
2.55.0

