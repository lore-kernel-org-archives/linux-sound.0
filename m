Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF01221D8E
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605590; cv=none; b=qU8Tt5ALKqz7sgic0OeQwGfBP1IGa8gHNWrQ124R6SqFFWlFJViGOLQqKxkYb5V0LmDAZH2y7dV9KpXwiuRcE3x3yj9tuASUKjNsueDS/sSr+9fYsj4OEH90I9+AhMB3n3MRgCM1UZDV1CWEFB+cy8/GlF5ZPxGCih9lmWdUomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605590; c=relaxed/simple;
	bh=k28pLNNZjozLAKrGqFNCyucEiaZ4YUhCVjh8E4110oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S5pjkX38HwiQ9vQY863vswS2HjPBHl1CMn6aFOIz7BFvPcqsjKOdJ0YMHh9KiOmxlTOSVRQFsNyJBhG3yHw5k3H3VRqIVLVfipcc8eL8+E5FJXuiRbwjdCUsAGiwzRj2BDSNht0xw5kYv9ugaZg/M5yRnvJLLwvaU4AA0SHjNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KJ0RXbX1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KJ0RXbX1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd2ff40782so476340a12.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 02:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734605588; x=1735210388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=;
        b=KJ0RXbX1drflt9ehU3JTgVXItynFxGNuZ7iCdg7a4wkFlQZcH1b9OFMJX6nmOuQy/T
         fMDxPDf6Gm//1ujKiYNxxBMlFJZqs64RSNnXlr8gaSvWxP6gwVLY8VJoHPRDcGFurbpc
         tHuJg9YTFhn2VgS21RuQkeADszZtmvcZ56qLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605588; x=1735210388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=;
        b=s1iKyQP3W0AnKXitV+aqRYNSzPuuIgqQlboxsIQsPyq/gY3kxtKlGAhelotrlxhXYm
         LMpRpk5XvZNx37OFMwq+wmkcQh6wZx5Bj2IETeK7r3G2wKHs7dCv9N1RDrAlA5v8Yq6I
         5HdpfgpfQPV1lP/MXrB/fFCtNNedZ+erOPVbF2xDFUsCElkG7ZuqbgpV4Nr/A7fXhDGL
         U6kcuxzAFTMZ7hR7sdbs+N4hpz+QnbEgCXgLXpAgIdIJDIhlSHuYvfn/4MarLIWCj1rW
         vLQdZ8bZAX1kPYSZpapSCt05zJcCACb7uscDhr5Q5a936hEXWUPc64ZXeIpmTsnNb/ll
         vJUg==
X-Forwarded-Encrypted: i=1; AJvYcCXJdHs6Tbxc0Fv14RJbI1tfBczsqdL6/x+6xq7XNa9Eo3sMMXLdZfBF6rIelEEZCG1OUtYAKOBvygc4dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeA5hRIXix4jwQz+X/o9Gq1RAINVJ0DHxF/MjQ6ZZFpu6GsvIu
	UBgzEdOmf53uOmO47js1Oljc5GR4bnBnDMrTiZ7Ibk7HLmhz+1kn84eQ1QApPA==
X-Gm-Gg: ASbGncs9HDqQZ9jw60D2e0TuZEKaz27dCLuz3Mz08jhYB7MuZ+GZ3AD1d5yfpLSn8I6
	5HqX8xBVdPsZT3AHya68tEjKP9Mppy2ZM4Qq/yyO09pvIpr2b4HTu2lVDXWNbMkzq59Ai33r1tC
	igo84D0HhTTN9KsGh/uzLIa9WM2UxtOjtwZ+gaV3MvO8Rga2gzOhHaackZt1kQkeVFZfGgKRHSZ
	T9tTaK58c0jEhwwF6c+sKBp95I8AWIGlYCiw22qutDPEdGSyqcDrRTjpgYxynTgDjsg+6fTWQ==
X-Google-Smtp-Source: AGHT+IENxlsOZm9def6oti4V70uj/jGgxMRZENhVtBejHswBs3FlI1YExvOn9EK0Mjoqmtw4PCN2Zg==
X-Received: by 2002:a17:90a:c105:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2f2e91a4d5emr9173937a91.3.1734605588162;
        Thu, 19 Dec 2024 02:53:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6603:6add:77e:d71c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dd61sm2975014a91.42.2024.12.19.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:53:07 -0800 (PST)
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
Subject: [PATCH] ASoC: mediatek: disable buffer pre-allocation
Date: Thu, 19 Dec 2024 18:53:02 +0800
Message-ID: <20241219105303.548437-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
(AFE) is limited to accessing a very small window (1 MiB) of memory,
which is described as a reserved memory region in the device tree.

On these two platforms, the maximum buffer size is given as 512 KiB.
The MediaTek common code uses the same value for preallocations. This
means that only the first two PCM substreams get preallocations, and
then the whole space is exhausted, barring any other substreams from
working. Since the substreams used are not always the first two, this
means audio won't work correctly.

This is observed on the MT8188 Geralt Chromebooks, on which the
"mediatek,dai-link" property was dropped when it was upstreamed. That
property causes the driver to only register the PCM substreams listed
in the property, and in the order given.

Instead of trying to compute an optimal value and figuring out which
streams are used, simply disable preallocation. The PCM buffers are
managed by the core and are allocated and released on the fly. There
should be no impact to any of the other MediaTek platforms.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 9b72b2a7ae91..6b6330583941 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,8 +120,8 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-				       afe->dev, size, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
-- 
2.47.1.613.gc27f4b7a9f-goog

