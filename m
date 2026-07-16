Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64340A931
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198391; cv=none; b=e/MMGYQv1Jnxh0AxhXdVTvKnuSq7N0Who1fQT3MIhgQagy640R6Pjgg7IJvMIvmhCJv6DBen92+IJvl/c1VQmF1qcfdWhRmwH18mJdbQOTWi6Tt7Nq6MBQZzPjCxQsaY6bxEzpDScA2kMqXWg3LWSpYIdU0CYOltvni8xwvHRtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198391; c=relaxed/simple;
	bh=+/YqiGn7cykJAzG8bjIMCJHbbdXednP2qib+QW4GpCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOq2xGkeKSMG4EBkddG6yH6pJPVD9/yxlhDoQVssbDe/287KQByN5M3LG+LswSsMXZ0TlxC1f5Afh/lfQFjvT3wrX8CqP7wySXVk98m27gMTvPnXGZ6JBWLw8WM3p3uvP4puzS+bY73UODRg0T+QVXd2Ny2X9nyKHgWdrSZxrZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVo5fh9K; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVo5fh9K"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a2c90e383so89423b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198390; x=1784803190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J+VREtQ4n4G6L6SKO8vPnjuq5ltVfgrR5RTZCU3biM=;
        b=JVo5fh9KUslZTmDvh3qiwKcM2KBMtLegBEHjH6pqw/dwdVqSo+yljXGvj4kec/gytr
         kiBkpnrEK/V/dyH/lNiZ7Iq9oGbBc8NSKUlfA++XEoQdVYEYJPyWqjl5aLo2ApbNR7pA
         yxGiF3gvnoRsmwbcT52buNQNeAp8fD3HSPbNiX3n/YVaTBu/wQ9WsA/NjMWDSn9/2zaT
         Wx6B3qGlS/q3MMZqf8LJ+FPEY9T6uQDxxsliZw7VVMpEFWaURvUy5yExFgoj012dkWrX
         RxMKoyX/JNYbETj+IfbVBDCGWHDz+91G3bMtJSjjbEgRACdRXktpHDLZbRoxt79PARKV
         6lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198390; x=1784803190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2J+VREtQ4n4G6L6SKO8vPnjuq5ltVfgrR5RTZCU3biM=;
        b=lWx+awvxeOSOunwX/grssrCHFvgYnN9m21sDBxXmqUQMS3EUoTT5JpVurludnpft7g
         7iztvOoFD+I9bTOuv1rDZ+2wNFHexohL+BsBQ6Nw6CzZCmSp7n61olxua3fPJkhxjtT3
         y4zzA5XhyNwmnM51xaSGE1z2Pv+PqS4SPn8FHBCPR88lDCFxaN8E6f00k3jLtyhxr0c1
         p01wBVKbFaltZFrsLep/tPVEjS7/Coh6ZGp3rlZ1otyM7InYD5EDd8dCkrgZjE9PPI7Q
         AND2ZzhoG05GYEMouj5WHSQ00aTSbSNRBFuFjNCOKyszdg3BnhX0KpJI03oZYCypR6+K
         8Twg==
X-Forwarded-Encrypted: i=1; AHgh+RqkLJGnSZ16aah0EKXdh3zVW9HCbnGk9FoK5YxJAMj8o07CZhUNJS2tHNLoVxZY+c/aiKZfirZIB9V+gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaPB6zkBvBNLVvYTZaeMHdkqiDc0t/JOEXcc+IiVZBcwXjqYk
	NDSjblVLYRRuZGclnSrpUy4odFpu53yqM1pn486phG88nsyWF3p2dlo/
X-Gm-Gg: AfdE7cmmLxqgVAvQWQ8Z0SNAuVOXlikfPR7KJfeSZjFdTH8ckr/v+NvD3Xa2KEDKmUa
	MVkRuIUSNYGZ3wtcCO1GeDibsulwUSuSdiyEGCmXbqcdwdL3m+U7rMnYhHXYpqN1SCQBAp8avZ0
	tIgug4GI4UAFKmX31REmi/8XrPZrOuMpeMFUv6FenTZPS/XemEtVSTC9cDxzwGtDgrcAE2iGYtO
	EaqYjkrTyTHRyzXghWS2zOQ4p4SvL33oHPSo2p7UUnnVY7fCUQsggf8jVGxcvey32pjHvWHxwsZ
	GMDEgeHtYXdkg5NVRiLLAsWIH0UBvgFFTZcynnbFmHFtObaLIpD6c8d12NCtjX+ucuIJ+DixpCG
	z7mLtaI4GNENR2NiLPxkFdlPDTaTEk21EJtpWFmaidbdy3Tt+ZEvxVe4zngczi/yHMnIBcDIeus
	haaNG4atOQ6W1xyNAuELbFM4CjjZGemkSj7v6b
X-Received: by 2002:a05:6a00:4f93:b0:847:7cf2:a8ff with SMTP id d2e1a72fcca58-84beb43958amr1937445b3a.30.1784198390379;
        Thu, 16 Jul 2026 03:39:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/10] ASoC: ti: omap-dmic: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:07 +0700
Message-ID: <20260716103911.77652-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when handling clock lookup
failures. This preserves the original error code and suppresses
unnecessary deferred probe error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-dmic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index b795b9f66b0e..c8d791f05ae4 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -465,10 +465,9 @@ static int asoc_dmic_probe(struct platform_device *pdev)
 	mutex_init(&dmic->mutex);
 
 	dmic->fclk = devm_clk_get(dmic->dev, "fck");
-	if (IS_ERR(dmic->fclk)) {
-		dev_err(dmic->dev, "can't get fck\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(dmic->fclk))
+		return dev_err_probe(dmic->dev, PTR_ERR(dmic->fclk),
+				     "can't get fck\n");
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
 	if (!res) {
-- 
2.43.0

