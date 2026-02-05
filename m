Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74231AA87
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 05:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770269073; cv=none; b=WG1dqPYvB8kALUEVMXWGFnCKK2pwLxDK3VmysMw0hyPEbirHDl5Oj+KmvFCf/ywhYWEMHclPKwk39alVNDCfR8iSXYUzwzaYkOBZimUnto+09T/gQDeVZFt5G24W0gFrgKoDyZSLlUfxVCOwGZQch0ukBftT6ADx1s+dJmxZU1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770269073; c=relaxed/simple;
	bh=PpFoTrEob6zmU8S7w2lrzqtIJeJYrJEyv/fehN/5IOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LZkEQ/rK7r+V5tLDJZk2Ug3cFqjlMVmpvS0OomPeldnGiH/heM4xqmf0nKETmc79G0m9uLHo1NHS5NcKVz3Wo3eXdT5ETMrmoYl3XbjYuLbwgTvTfl/BfJJRJA0NiBgiLckEqkBqXSzp++fV313FPaVCfDdOeUE6Sw+CdkI2duw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=mYad7Hiu; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="mYad7Hiu"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso448870a34.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Feb 2026 21:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770269072; x=1770873872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=;
        b=mYad7Hiu9NKdKCMU6o+OcrW+GBd1Y8ObZ9wB52m9C0oD6C87mD2cvj1S6bZcUIYX4U
         zJFyqWoOgpRzpTCAZFieAE6NpO56ZwBk/AzEHxUFlzUqCtjA9qXLzUycsxHYigTeVyUk
         xusM4cAOPYTdDfJs8I12p9mfxjIETihwr0ZLwv5EpumrLKuXIhRYj91vcw/+zKiIMrQy
         cfMfe8r7JRBR05vD5A9WXoJebDwIiyYkFyaKJCSNPTMfyL1XpNskcNThtuZlZZjvCEFy
         /pACAmS0wp2TUz7+9RC+u8O0fRAMbDvCZuqi+0/lfvloDXkgAMPk2kzIGD/G9befLPc4
         95hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770269072; x=1770873872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=;
        b=mv0+nn2M/xzL03IGUu0NmYac0suA2t9PSiOLuO+XpgAHJiWDbaJDcyF6y66bGixsO8
         ksK9yGEYo6x7wtPrAKr2322klo7TcO9MrgtQQVr6YYvE+0g6Rz+MSICTf4CpjQDIqu0J
         CMCQuK0pTD5C+pcnwvrLYgNZZhQsXaJmEoRs8w2xSn1AlLbMm4mr6wDxVoWcNX4Gf+OJ
         8lr/99g7Q2kvSEwJV1hP00nMHwdX4b+Yw45xCK9SHA0zpc1H0bNi94mH8Rz/JUuS8h63
         MgrZZVzAmtvmsW5IGhOWmmp8pdRykas1f/YzFXI9h65T9vIu3doEeOZvRfT0FtEsYZDM
         5aDw==
X-Forwarded-Encrypted: i=1; AJvYcCWHUv4PkIJcS6kGbQzBVWrKfPHgx2eX9/JidTcJIQZXdhFa+JLoSoTMXqP9teNOwGCLiqJFUKqlprrCiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvdCjCNepu8LhFF/ilR1JILtq9rRSucoUbxw3NIC9U9WZi/JPK
	+fZ9AxEv1fjPeYoR/rvdf8zQW2eRcMQlFfSPlhEXRMBWFZcgYUA0Swmnp+6xczZ5ucI=
X-Gm-Gg: AZuq6aLBVDb7eALeX9EnGSX1BDtSQjf1OzkbikgMDtrO9KApSPlgWqSlC5FfTs12qJ3
	UgbmOG8PnMt21muUo9a7uCLI4rl9fvCZBpbLAXlXn7Bv7XPEf/fowMiYg3DlRY6mLofnblM29RK
	AkXyXF4e3Z+vYgh8odnDGGBO5GFIT2YZP3FEkKpGezsH8af5cxXOPAHhYNrA/+R9IKS5lFp+xlt
	lQEUwcRSZtkyPzSCA3uwl9kwXjd4bsFpfJIkLzqoc92re5t1+LevCTAJMJB0Av3IIYBMpKUJdgt
	mcnlpF9ms/gmblndASdE/WuHTySot0DuRGp2wfQmnJ4LsJ0XvSBzeSyU8lDQTAQ0ZRsUcKJSiss
	1USPpiJNPsi8eu6FmiCqLaizHaIu/wIhP9pKKKWADa9tk04fRMgCMc1/yTUxAUZlebL+v1+Fqxo
	xw9tRt+N4vClf7a9lKmi5KHVHXOd2h/fE+PZuplanaKDEYxdvMuOZYmy80cUsYwYsSpnxiq5n6H
	7ctlQKVv+oyecZn4LqQZWetOxXIncs=
X-Received: by 2002:a05:6830:2649:b0:7d1:87ef:2b01 with SMTP id 46e09a7af769-7d44899c6a7mr2655061a34.10.1770269072338;
        Wed, 04 Feb 2026 21:24:32 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d45bd28d81sm98644a34.6.2026.02.04.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 21:24:31 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
Date: Thu,  5 Feb 2026 05:24:29 +0000
Message-Id: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
indicating callers must hold this lock, as the function iterates over the
global component list.

All other callers of snd_soc_find_dai() either hold client_mutex via the
snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.

Use snd_soc_find_dai_with_mutex() instead to fix the missing lock
protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 53f04d1f3280..76a8e68c1b62 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -145,7 +145,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.ignore_pmdown_time = 1;
 
 	data->dai.cpus->dai_name = pdev->dev.platform_data;
-	cpu_dai = snd_soc_find_dai(data->dai.cpus);
+	cpu_dai = snd_soc_find_dai_with_mutex(data->dai.cpus);
 	if (!cpu_dai) {
 		ret = -EPROBE_DEFER;
 		goto fail;
-- 
2.34.1

