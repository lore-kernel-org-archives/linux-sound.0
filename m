Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5C5393DE2
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645468; cv=none; b=jubACy73DjepUTFRSp77X4EhSfms2B27sR4fEJcM7imnJeSIPDEUg5r9zY7q/WtRyfTijsrfD6Had6EwfLohln+NDquD0BCeUoQ9aN0hsIRgzzI9RBqYmc5HXAY5R9fYJ6o3WM8bETR8trTQQRTyTBfMHRa7cqMclaGmPJp9JEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645468; c=relaxed/simple;
	bh=hV0PSRnR/bl4CdLuH0CGuwoqFy9Ab3KJAJrnQZux0Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbswyPkp75oqBEk5KuPl7+v88rHRYStjjnU5VkzAl3T5i7okpRr/ea1ssjXcMUij2mNxiqZVgrxFAjfahBtb+DyuTnbiSY43o3ORFzwm53aDcM1pjIoQTfpaUSu+YG77xDReh0RfVs6yYVZifHEHvqX8rsxZVJn+ufwz71Rt5fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMj8RxVB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMj8RxVB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b2429f98d0so501615ad.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774645467; x=1775250267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N06TUEQJrWZFxO33UjJmD1NIhQS6pZplfv0sDwxN4UU=;
        b=EMj8RxVBqf/Go1u6blGshU+oF3b5xF+G5b6S3aZG6wegapRmGRDXF68RgbXnj3lrVQ
         OCvHllZENXBQpi6+OfDfOBw/ZiFWaaAO/jS7ZINy757h8uud4APPtp7+EcZ31U/kZe8j
         /ZdyrQXe+pfHwoZoveg+fUPRuEgGS8ETSTH3gaKM7oxVS8RetEzRzjnFErDx2wQ4d/Cc
         wjH1NMj1eBdDU3irT+Wa/mdl1fs5siNrBz1omJluFeiJ2s5Pkyp72DQggiOqqPF87L/E
         NaGx2+rbey+SMM5bsuUUGl1R4IbzqdKnCl0gXt9ZIpMMm5RxVhZvhdw892ShdiRhHNt+
         4AJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645467; x=1775250267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N06TUEQJrWZFxO33UjJmD1NIhQS6pZplfv0sDwxN4UU=;
        b=elSCYYA/vGj9bCRdbGbUdnbOVJpr6QiNXiBSybzWRnNZklI6j7LIuC89ApWvU6Yruq
         /TYrGMqa9qhaPNBEDKYb5QmC2vnrjgefeUXtuwhOUksfOEVGJNm0PbpkYnFj7zP4x12R
         tsReVMEB/YMo6AuojfNXdU8GqYfjgSqnCCMu/cHATXAmQQRjZFWx0bWrVF+OZdMTcPXo
         MOl1swgNAz2PPw8Y3RZ3BKp0pMGF3aH626M0J9tQtVX5ZbF17Gke71RMlUBb3W6cSB9N
         +YDcvaIuRgMpSrJhLmUKp+4iw8xtwgMFOkqWi4DAwiRAdfSRsKcU3aHeeNA0HyzrkUzJ
         GG6g==
X-Forwarded-Encrypted: i=1; AJvYcCX1N0PAq4OzistAqveY7ZQBo70oVMrgpFf+zFfonzfrUTy+7oc2Kbht81gdmBs6OZ4AKWNAbt5Vc0EPyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oLzoGPrbV9eQsyoz3OURipnJLwMCRfSRvv1hniABbzX7YA7b
	lIQzr+DGpHSsL7Xx8U4aej6Mj85quhz5f/5WUfuL3w+w+rgS/pO5Rkb3
X-Gm-Gg: ATEYQzzhrpilHLNjL7y6AhkIRQRG5+6gSJrgElvBG/6qDK5HVkvNVEqBamd+SL4GQ6S
	Nq3kHZ04i5rK4pitL1arn6F9ixESU/td8oxnBXfptblsKBrHHqpCpJWMfdwELWss94qxWilfLRm
	BFTa9pN7zS5SCOIBAaBtnT6ZYYibGIEcPrHKNL7o99cGerrDetbYjlT+ztSFF+hgHNyt9Cif0Lg
	kl0uTIgNdmGzKZc1aJXGEf4Vwsf87OxibAPdtXTtf3dkvF2vZ3Cm+8o57Ab/znpHHI89jPqiVD4
	i0Kaxjn6bhW1VcKib7X2PM/92jcCYftggXBTzXdz55LsKfbqSxMZU1LQcgf8FfZThWMU3wOSd5L
	qdAj6GD+/S4nj7PxPq1QUwBFTgvYXM8BM9BlC+XTLA5CQ7j1ZGuEakRByKj4LFDtTF/AFXObqhk
	w4+2sWKA4LrnL6h4KUpAOzzeO+NoLYZuxn7n8c54LtZg==
X-Received: by 2002:a17:902:e889:b0:2b0:7d6f:4627 with SMTP id d9443c01a7336-2b0cdcd224dmr43059925ad.37.1774645466690;
        Fri, 27 Mar 2026 14:04:26 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24250b15bsm2358125ad.0.2026.03.27.14.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:04:26 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v3 1/3] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
Date: Fri, 27 Mar 2026 17:04:06 -0400
Message-ID: <20260327210408.430908-2-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327210408.430908-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327210408.430908-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5640_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 103e0b445603..fce726a9c8c0 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -304,6 +304,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		if (SND_SOC_DAPM_EVENT_ON(event))
+			clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

