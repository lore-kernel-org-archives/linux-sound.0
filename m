Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AC1D7E52
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497826; cv=none; b=rP8EtQk9/XElo3lXjwL7LmLIbEuTHK0LnepyXoCaVuhoAL63hMI1ZyWPNTOw8TLMIzq0pQ4yMaaCd81WQwaiZCwwqeauBjKJ8/AdKAyCe4myGU8AjsqvXzM3xKpNI1eMERHscSSSlmpd6NgaO6U/i+ATpl6+2HWQDs282f3awQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497826; c=relaxed/simple;
	bh=dUCkBFacp8UJ8QjqcofhauhM4wz+Tj2ggrizreMINHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQsqE6tCuM1Wy5B+SKMyVBGD9+5CCgeAW8yA1XUr2oJD3cglLyayIS52x1JohBvDwahUPcHmQ5JINkqtD8jJBfaVKRFWclmUCMgdKN6oViVRlK83S5RkKhMa0J8M4zYT0EtMaawOKMhKPYc9M3LwH9ffKNB14+yHYCMhWnanw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Efwc8y+1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Efwc8y+1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso6259784a91.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743497824; x=1744102624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=;
        b=Efwc8y+1JMdzusfuG7ekaJYY6uWeA+ybvbsj3CN9/KwoZWOQS4wKjlyo8Lx5SJYMe5
         vonfHMM2xmSuBn9VYcz9pFYS2N9Hzeg7vlCpWOiTMg2ktUk5tLkrOja7Y6z4Bq+1kgrH
         EbExn24ntbJE1vr7DGKR6tVvH3833VIhXtPqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497824; x=1744102624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=;
        b=WmAEVhWufmstA6wF7taPDmdEPVUGnzfp/KORKjfjOI1GmR1CVWRJonx9BzCuxw1rfX
         L94GzT0S558VAsKHnBzvbItKDQnHqblGJDWIKVnDL7DKi6xBveymNrduCdRdlECtWhrk
         2ZAhU0+Q38dbqeIEqxe9bNnu5xM5ngIipxOAz8JDrCqD8JvGqmwailwUElgFSTXxsUE8
         XkbblmiS8f+6wGvgHDcjQ+W6QaAxSZTHCzJCN6avnabiMyW+e5gDhBVnjdJu8iEmemCH
         RcbJP04dZlwjqDT1ysnHd552vc1qnAEngbcOe0uuw03yp8AF6UdjDp95rj/rg3qKmvad
         44fw==
X-Forwarded-Encrypted: i=1; AJvYcCXmq0JhSqufZ0afgYKrH14sVQIDMcFsJv4hvOok1VjHDKg/29SxgIXpWXDRlPHecrtdtIFDBXlP1WqLUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvM9eY4eXd7oIa9PznbjSxdXisWqxK8vMAOIku/m8rnsLr/VB
	FxL9VpIUrdV2oQuJbrUHR8ZeSygcjBuIe2CgahK30AWFjIdiqo/7/dwWNIdUUg==
X-Gm-Gg: ASbGncvFd4twRGnGc3tTkYpBDIRe848MKYEGnaCmdKF+4NbYWNREnmUQC1TLrw2P3P3
	sT1J66knxl/TjbA0HULQgcLjjzQkI6Ypw4TChGY1wM+vrADdVjZL4sQJtTVgj1L+JU1jvdiZ2jI
	/jRBaQp1JRbEQtBOL1YqklaP+f2xuFp2xZTRHDhA1F0p7VcNsy4+JLQdIwjskBp3QikYsGAidXY
	3lq2DbmFD6WKYUo86wP9RkNNmfyVG0Sso8LFoob8KyD9rW51u20e/+QEXOUyFZ7eoKZ9NWLXrEI
	CvQRVh6E2YT+ffbsAEBRhNSqIvDGv6pCaikQXw0NiLyDoPgrxkr/Ij5IF54KR9E2BjKYj1QF/w=
	=
X-Google-Smtp-Source: AGHT+IEGnyXdQQaEtEc12iqZVx24nt1bNnc7msMFARFnIYDLX4DR4C5RKsaUHtsIKRjop94QRdf+PA==
X-Received: by 2002:a17:90b:5690:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-305608ab182mr4183384a91.18.1743497824504;
        Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad70:9e5d:51fd:567e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305166caa77sm8756803a91.0.2025.04.01.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	treapking@chromium.org,
	yuanhsinte@chromium.org
Subject: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
Date: Tue,  1 Apr 2025 16:56:57 +0800
Message-ID: <20250401085659.1222008-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
buffer pre-allocation was disabled to accommodate newer platforms that
have a limited reserved memory region for the audio frontend.

Turns out disabling pre-allocation across the board impacts platforms
that don't have this reserved memory region. Buffer allocation failures
have been observed on MT8173 and MT8183 based Chromebooks under low
memory conditions, which results in no audio playback for the user.

Reinstate the original policy of pre-allocating audio buffers at probe
time on MT8173, MT8183, and MT8186 platforms. These platforms do not
have reserved memory for the audio frontend.

Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
 sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..70fd05d5ff48 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+				       afe->preallocate_buffers ? size : 0,
+				       size);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..a406f2e3e7a8 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -117,6 +117,7 @@ struct mtk_base_afe {
 	struct mtk_base_afe_irq *irqs;
 	int irqs_size;
 	int memif_32bit_supported;
+	bool preallocate_buffers;
 
 	struct list_head sub_dais;
 	struct snd_soc_dai_driver *dai_drivers;
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 04ed0cfec174..37b20ec80829 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->mtk_afe_hardware = &mt8173_afe_hardware;
 	afe->memif_fs = mt8173_memif_fs;
 	afe->irq_fs = mt8173_irq_fs;
+	afe->preallocate_buffers = true;
 
 	platform_set_drvdata(pdev, afe);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d083b4bf0f95..0ef07fb2898d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->mtk_afe_hardware = &mt8183_afe_hardware;
 	afe->memif_fs = mt8183_memif_fs;
 	afe->irq_fs = mt8183_irq_fs;
+	afe->preallocate_buffers = true;
 
 	afe->runtime_resume = mt8183_afe_runtime_resume;
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index db7c93401bee..c588a68d672d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->irq_fs = mt8186_irq_fs;
 	afe->get_dai_fs = mt8186_get_dai_fs;
 	afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
+	afe->preallocate_buffers = true;
 
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
-- 
2.49.0.472.ge94155a9ec-goog

