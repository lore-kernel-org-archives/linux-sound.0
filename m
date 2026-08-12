Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF2402B8F
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524751; cv=none; b=P3A7v9ZNraFd3RFpaYEDo+aXSM42dxf/9Qc6pTwPi1196p9ERCyPgFTscgHO2Vb1CRVfub/uTaGhTkViJqtxGhwtDPtA7RcIKWRkOA2T+tfYHX8n3p4AL0/1OnS4JJ+51Ntb6nULa1ejzFPCSozw2ZBOs6n1OFJMbnTSd2jwDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524751; c=relaxed/simple;
	bh=M0teJiHhZJB+s7lHKolMqcRLWg1902nbCV2zrE+V5PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLm7yUSmhjDYdvJ8VRCfc/Xlyfe6nusQzHqfj8gVdFoxTbcNjGyGeS90CAqYPna0ttApwsfoJViTjLyZZ6PwTax2FPPjD2YIutOpS7lwQwLro9HMYWe8vX2oXV7ZQuk/L55Tao6fPioE4l2/zJh0crQK5H8JZFoNTskJLV/1+tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0fzPZ3+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0fzPZ3+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1065556a91.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524750; x=1787129550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvVjFz5YIzhBE/JdIuURCqASBxrvK8z1MujXZBURz3A=;
        b=R0fzPZ3+8xszuhp0rEFEcyeBGTERyjKRsc9FQspjYpU3iScZxVsQ01e7wBW6zMkzNB
         z5jCq4XThkF0wxe5H/evVNCUv8QJZAIh4dIYkP/vbC5EENZvEvW9R7qZm4VpCGUMOBU9
         IJu1VeqG5RnraiFFa4brDoi7NuKHUZpPvEytL1E8k5SIXzLyax8Y4IBAcuiA2G+eAXDu
         4eqnKVfNVwazcrAAUh51/3UKEnL8gZhLt9+IKVFPjpN3u8gIcEvlisV+gQh5rJkL73HO
         c8xhrKylh9xxlMbNhbNWgHkc1MwjLU0HNmOcc9ajAlxSh3MCRTCQC5aFCaisCS8oQ797
         5wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524750; x=1787129550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvVjFz5YIzhBE/JdIuURCqASBxrvK8z1MujXZBURz3A=;
        b=frRKp9ETA5Lf1O4hmd41OCohUh5Ez0TwSoVlEjsUBx974V46l3eIZqheWs1jBo4/qD
         Zpq4EuMO7cdiygD9RrIuLOUZ5d2s8V9Gk3dIc1eBBEGH0o7tC93C7Jig9TlnP9tM5akq
         Mgez4M4zelx3MTZAElSc24+VQDaeehEzQV7HpgAqy+q0wbJXnqh3pdeGHYWZNH/xyk3K
         4VMSxB3r8QXNizLmijATLvTl4q3VOhFFJoeQYXcZbuGbo/sQPHzY4HLVMmrXpeX02B0S
         b/TnCbm/PKHB9txMy8C10WOaMQ2szJXfWItFeakhDLNoyXNYk5iBPPK/hO27vQavofLA
         wbKw==
X-Gm-Message-State: AOJu0YymB2TCugKm8wXDPzX3t0gZzcCk9Ne8oPWCemheMoLtcFutoCxx
	g5t9WzkUue7BF8CP7BQGpDD7m5Z1H5iGxFuUYOVsGaj2FhxgVGIPJQJB
X-Gm-Gg: AR+sD12QH11LyRtQ8qI98e917Hnt5rxSoPh6Ej9XtbK3P6tpghMqaUv3Y7jZDeqsgno
	CwrVQRU6ZEe1pWUu+dHpd9MkHYxqMzYEaaMgSfyJdF8Rq0AH68kBsHVP8appmy/4qrt63O0J2w6
	1qzb0P9sxXS352CJKTvE4dzrAiodoeqX/lY61C6mm2kgZJIybn2ZkiybdO2QrgH6511mq4AWePw
	5JpN3Hoib6bL4LsOGE1kNQNQppluSlVCJPPPwMtdPG9b3lhfdPoFcChZ0+rljve+UlWN0fmd0jQ
	7k7DbVgjlpeRL85gBt+8Abkj+LTFJnPXHgx9sDZ6l5/xecuAtQWTIinGqU2g9AlsJqn7WSgSFbv
	MUrHCPd6GwH1MtWtahjtNVvJp2BzYqoOzWOHvp5POC69N7LMG+5dBRK/oK69vPERLQ1LYEsep5Z
	2blGvfqExvHrghuu8/K1pJqvj6np73rt6m0qDb6FjWWOq37FzW/VDklfkjGPpshUHaQGFnnQwHO
	WPiN/pMBZuBmFjzNgIjrSx/4MUqVppDr27z3QMNwJeSiLG9+hBg6bKyN9utpG6VPF5y1vuJhjOb
	f0gF
X-Received: by 2002:a17:90b:5623:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39301201440mr3869474a91.6.1786524749654;
        Wed, 12 Aug 2026 01:52:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/6] ASoC: samsung: spdif: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 15:51:32 +0700
Message-ID: <20260812085133.29658-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message.

 sound/soc/samsung/spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 53eaabaf8956..719083e8e89d 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -415,19 +415,15 @@ static int spdif_probe(struct platform_device *pdev)
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
 						 NULL, NULL, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
+	if (ret)
 		goto err2;
-	}
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 			&samsung_spdif_component, &samsung_spdif_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "fail to register dai\n");
+	if (ret != 0)
 		goto err2;
-	}
 
 	return 0;
 err2:
-- 
2.43.0

