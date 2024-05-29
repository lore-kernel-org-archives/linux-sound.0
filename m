Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCD2B9A9
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945304; cv=none; b=cdgLe79ddGo9rMEYN69bBvF09e0+Qou4f21gDp7N8sMyWUSstk1XXKk0ZDe9yKIGNdcTnvHAJ7ZlgfKUpFSgACeXtmdrHlB5BghwMBdpfVCnE0s3oXAp8dGUNMuEvuOPIn7Oq401m1A5ZlV/wZqXNNqpf2N5HiiS+jF9JPBQPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945304; c=relaxed/simple;
	bh=+Qsjco8mzogGjPHsQpxrxienekhbLpRvY1W41Ce+fUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HAm/3wkTs779EuHbggenuAgded9jtsR6JSISyGC6V2ALmgfoDldVL/fQdXrOZrHWZm+VGyrs3MRUHD03pXMjkq4FySm+ATKRy4lJijT9s1Q5+GtQrG48GzgBW3MO/YKHa/HCMsrYRvQEmLNI6oW9tqbfNYVrDtsO1TZ32iUujmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTGXOos9; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTGXOos9"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d1d134f6c9so144170b6e.0
        for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 18:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716945301; x=1717550101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIgxIWxoyeej6fijgWSOIvBp3gx1sP9DeVeu8osJFH8=;
        b=fTGXOos91BNGuUlOP0i+Q8vwpZStnYYVKWEHjqxmHL7Eurbls+IU6geMJkJbY0c8aY
         bpFbP6q1fviilbv7MZBncsUsklgqEBfVA1Ps1kzgjQPdtnWKir2hlwe78vN0vD0cA81y
         RRlRx6B2J7llFBBqxk4yUU8YIq8coPFLGcL+4qjIzSTVjpqAEYMFZKVwbhKDqNlS0IT7
         jwTFIBQFz9v698NguxusVog76d+enRrIMTIRQn58mWvp3SdyjRV57+5+IUEgdRCF37+6
         rTUzRsyu5r3U9Z9Wj0N4Evtg3GKiVnPwOCMHW8MQFvYwaOuMdYbJUN4Ebu5tPNIP9ucr
         PVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716945301; x=1717550101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIgxIWxoyeej6fijgWSOIvBp3gx1sP9DeVeu8osJFH8=;
        b=wKYG35YQU1glG1L74lZUs7HaQHT6pertbEvsBZgdcNneTD86S5ig6XgVbxIQFVxrSI
         tTgJmrJYytcj6v77Ldh/IxPdK7FBRCEdkK5cNbL0HAjX0DRPPEzPqwnsX4xvt0Vg6j+8
         t2s3wLQfR6X0BozwsjR5QGnwaGDJ0eE77iqKVM4K9MEBE+mmXuL5VZoNCLolHjYtxms/
         0SX+G+u/RItuoaGEq3CtO9lJQl5XMrrmr4M6QvpMn2VMiKCEgNbFfPzqlEVfxdfCPyY3
         UgM7kIfN91V/oSRZHjd0RFvZevAu1lmqn0wZzPzXXYD6mkXS/asTIGkIaUSBaU3bowVH
         cfcw==
X-Forwarded-Encrypted: i=1; AJvYcCWPNsRcBjVWUlI9IWlVT/EQ6R3zgOm4N4Obhgc/8i9ZdLVBnR0ljMboGd1KreshY4V0WWKu+Eg5DrfV/NNOFdxMpY98lhjYXn0Zt94=
X-Gm-Message-State: AOJu0YzOgHNs/bhD/XXEPn6Pj92j3+VBfsyfaqnunRGutgXb+K2Wrm07
	bRc/whnGHC8/QRBHLC7lKwL6UdUDubob06aABbjppJ5eTtvIh1jH
X-Google-Smtp-Source: AGHT+IHvchjWI41AxUR2jMbxPd1j9QcK7/SkYPCCllvDv46JKURUgiDP3HLBL3VBn5gw4u5KokWjfA==
X-Received: by 2002:a05:6870:f708:b0:24c:67b8:2cb8 with SMTP id 586e51a60fabf-24ca0d87c0amr16153257fac.0.1716945301389;
        Tue, 28 May 2024 18:15:01 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dfd9:2d9b:ff9d:4f57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3ebdasm7029015b3a.44.2024.05.28.18.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 18:15:00 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/3] ASoC: fsl: fsl_easrc: Switch to RUNTIME_PM_OPS()
Date: Tue, 28 May 2024 22:14:44 -0300
Message-Id: <20240529011445.1436596-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529011445.1436596-1-festevam@gmail.com>
References: <20240529011445.1436596-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions are used
at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
Changes since v1:
- Only colleted Shengjiu's Ack.

 sound/soc/fsl/fsl_easrc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ec53bda46a46..962f30912091 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1988,7 +1988,7 @@ static void fsl_easrc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
+static int fsl_easrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
@@ -2005,7 +2005,7 @@ static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
+static int fsl_easrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
@@ -2086,9 +2086,7 @@ static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_easrc_runtime_suspend,
-			   fsl_easrc_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -2098,7 +2096,7 @@ static struct platform_driver fsl_easrc_driver = {
 	.remove_new = fsl_easrc_remove,
 	.driver = {
 		.name = "fsl-easrc",
-		.pm = &fsl_easrc_pm_ops,
+		.pm = pm_ptr(&fsl_easrc_pm_ops),
 		.of_match_table = fsl_easrc_dt_ids,
 	},
 };
-- 
2.34.1

