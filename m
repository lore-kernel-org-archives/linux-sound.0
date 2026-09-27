Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942E2AF00
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471421; cv=none; b=S4eZPAkufGl7J3djnXgqO13awengoIRSIKFmkZY5ffLqYflbzsZERRR1uOa7aWBeVqoXA/J6FA9L1DnZOEZRu4k+MNBUtarDPDAA/2cNQSssIJDDhyToSTuSduN1RaOmMNF/1WlIYx6/BTpbidWO6K5tSjpQiwtzyQ0cyz8qi7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471421; c=relaxed/simple;
	bh=GNR4fpZUGJ21uZ1t/ZUAIEe6gTLZnkX4Ug2geMzO4fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icpLlP7rrmmM4L/Ak91Htn2l+LUUlXaOUwFF8Yvrl0797HUTVNuxyvScAnEh85ShNFOcK0Zd5OOXu+7jWjlfVCuu/mfATN05sVhevKyYdrSWB4b7NmRulI8+Xek5kTHnqowXSCCQiflny2c7HG/r2Y7NeKKj+iEYMQJr7fegqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so7211395ad.2
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 18:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471420; x=1791076220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHub96pVZHtUuiGqtZ06K3QF0eNyRXbrpGkCUdoQKHg=;
        b=diUQ+lWxKgPLbVEzyVw1j5uiLWJ2du8lRWalZSXz8ItDm8okioavBG4asp/O6JVYo3
         AiQw+9RowcZ/mkrM5z/fXPw7qKsknXz/T1dE8gmNlrzCjvJZorhyOAaXTi3v/hRfFKpw
         ArAjXKgXRqTYtE4yjWrCFovgqHCBUL5QEmON/MwgAAfqn8j8+jadPDxqD3AhD2Ypy+MY
         HsLuEl3S9zhkVOw55hgL8I2muGBSgIkeJxCj+oCZS/F4nqdEs1E30iMiAgTUEErNfVzR
         OlAI0zWzGaRrzwEgcf3WXoInBcf0lY1fJ8y6iMdcN+/4koXgVAs0xf9+ZDbMgi48AXmd
         Cv+w==
X-Forwarded-Encrypted: i=1; AKwUvBxc5gy347NyL2vYFyzv2STGfDJiXZKmprJa6BR/vrRnOtl1Y23yvDLrCN7Elxtad3PhdX5ma6vHPT2SDA==@vger.kernel.org
X-Gm-Message-State: AFuF++kf3IXbJaZe0ux9tCCAOPwzWXx/WBRCwBzpweixm2+UptFt370V
	qrkrlQHfZkVcOZ4YfMm4u/2Z6VetWZZIym6p3sFHyzPMSbckktbt3gmZ
X-Gm-Gg: AYBFou2xD+OwdZoCNvlQnwkIiTck99xcRinR1oqu5E3gaR1N65AlUyZigbzSxwm2snY
	OgiBHwkWLZfxchugTKjECq4ULV8yURZXrYuLukC/UE37wb17G7EDB/tS/ypemMG8+UF8thVzzMz
	QWXiYt8p22dZiTImtkWLetbTD9uo3tXrq2xzrn1tLhg/r0Kcyp2n6A12pJXSoXzmCBBL02clALZ
	Wc/t2pqHeDiughTe9qDfVRQP1wfBj15c2TR/GmO9twsW/wtzLi1cPjlNdwJxwNqnd+C7sd0Hcun
	cByzvWM3ipbGh/ZSWsDIgaOSuWNI6FOkFDsp24yfqesVS/9/vApJPicPc9AK4WA7b5dg5lYfJoQ
	ME4f5xs9JX9onzM7Bc65NLkx1YrGwAa6FzpF+B8RYB/0PCyQ31kwLhRr2bNFTuBtZjoSnD2W7w3
	yqvaEEAh3bBg8p1NDVf2g0hvg7Ao42nas+r2xrT86KkLwXxeVg6FBfDnBky04U7RXMl0aCeZDDR
	6Eg/767zc+oL5XD2SBb
X-Received: by 2002:a05:6300:6cc5:10b0:3de:489a:7530 with SMTP id adf61e73a8af0-3de489a77c8mr1267646637.72.1790471419502;
        Sat, 26 Sep 2026 18:10:19 -0700 (PDT)
Received: from navi ([113.140.3.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf89651sm2514829b3a.41.2026.09.26.18.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:10:18 -0700 (PDT)
From: Zimeng Li <me@lizi.moe>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org,
	Zimeng Li <me@lizi.moe>
Subject: [PATCH v3] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
Date: Sun, 27 Sep 2026 09:09:11 +0800
Message-ID: <20260927010911.51980-1-me@lizi.moe>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAI ID is a hardware port ID and is not necessarily the index of
the corresponding entry in variant->dai_driver.

When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
currently uses dai_id to index variant->dai_driver. This is incorrect
for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
DAI has ID 4 while it is the only entry in the DAI driver table. If
that DAI is configured for QUAD01 and probe reaches this branch, the
code writes beyond that single entry via dai_driver[4] instead of
updating the DAI being processed.

Use the loop index i when updating the current DAI's playback channel
constraints, while retaining dai_id for indexing the hardware-port
specific playback SD-line mode array.

This fixes the incorrect DAI table access for platforms where the DAI
ID does not match its position in the driver table.

Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
Cc: stable@vger.kernel.org
Signed-off-by: Zimeng Li <me@lizi.moe>
Assisted-by: LLM-assisted source analysis
---
Changes in v3:
- Describe the assistance in Assisted-by, no longer name the model.

Changes in v2:
- Add stable to Cc.
- Identify the model in the Assisted-by trailer (superseded in v3).
- Clarify the conditions for the IPQ806x out-of-bounds access.

The code change is unchanged from v1 and v2.
Compile-tested with LLVM for ARM using multi_v7_defconfig with
CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
lpass-platform.o targets built successfully. Not hardware-tested;
the IPQ806x example is based on static analysis, not a reproduced crash.

 sound/soc/qcom/lpass-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da..079177a6d 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
 			LPAIF_I2SCTL_MODE_QUAD01) {
-			variant->dai_driver[dai_id].playback.channels_min = 4;
-			variant->dai_driver[dai_id].playback.channels_max = 4;
+			variant->dai_driver[i].playback.channels_min = 4;
+			variant->dai_driver[i].playback.channels_max = 4;
 		}
 	}
 

base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4
-- 
2.55.0
