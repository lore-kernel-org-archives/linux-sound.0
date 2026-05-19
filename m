Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10041A682A
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151628; cv=none; b=ApPC70fhCIUeuqQXYDGelFNpr9wOIJ49XiNJ3PoYeuCYpLPXwfusugazbQzeFZioggU7VkJApFzCSmGweMDiRx7tWPUQQZ6vOzTr6nAVRIDY8PWyIh6urLEkp7RfYfFEsnWmp2odJ9OS9ri3W9JuilgLumFNKYf1WfZnbVDhz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151628; c=relaxed/simple;
	bh=R6uJrbTqQmPy1D1IUuXGlkwkUvSeL/s1BQHKmhVjkzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=siCQB3YhEmmPqQM4oXU/UHEK/s3sWeE2KJL1qFt5I6Jt9wnZw/BIBbMyZNGFy7Pz5QFOBXwRKNSmd6++ggHcVPUuYNnRs5sGlsPpRG693S1VF0dn4hsE0Y7E704eCEphTdoa/4ZOwBmRhEWws9YHuhYlwjIxkVigv6+2b8VPT6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBz1chOU; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBz1chOU"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-90fe17c157aso352779885a.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 17:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151626; x=1779756426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VdXgADGRpb9mOhg55ztkYvSf6x98/8z8tsPUc7Dl4w=;
        b=tBz1chOUH9sSv8pYiEDc+jRDHr8qhx1ddv6BcswIfCzaH5+FgHxrDca1dUKMUg+c5S
         rs8yz/vDENxTy7ZyNmXsIuregLdnLb9n/iw1EUQ0aqVATfVirXBL+N9yimyOfLLyhJXi
         LH2raGo/HW0leujTWBg2mBRk3tlvAjS7926F/1hm/soSNMyUknd+oWm1vgqjhZdZ0qgS
         Re3UCPVlFnaql5ZxBo1pB2qMaqHEk7C5kn8Q9ACjgaPBP6a2Pl8a/nbrqgmGA6oAZOwO
         oK5acsfgwh7/vCodqCVzfRlr7TqsShzQ/wAsGmZIlF14uV0J6/f515FLiLz+ZY6FyQOD
         IuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151626; x=1779756426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VdXgADGRpb9mOhg55ztkYvSf6x98/8z8tsPUc7Dl4w=;
        b=EQDwHvq/U16iuk1S+CpDS4Lkc2F5A6XU/CEMi6T6UWcXkz4LvTKnMdCEFA1FvcC8Te
         2jqMkIE3/EBHKyRwLH57tHrIyWsiUm5vUakUdgRTkHaDT+2rFfmLpHWac/v3GwYfP4Ml
         lM7AESECb7AnYiLsQEw0m4kfCoRbYQM/L9t5KKNJwMtBGL4kideCJaD545NQ3O/45tko
         Oke2spotDRUPlwdlen+sZFuA47WiObm/JaA0j1Knp8HqtDNkdlA+8f/wd835bXy8qPp3
         ydWVtfiufKOmJiLabSMN+OcnqQlDMecL2pB4ZWc0S4UnCZkDyIIlXPvvm8abSDWaUoDY
         19Fg==
X-Gm-Message-State: AOJu0YyJfr/AtWEeLUi7ICj8v/WM5AuFGT/2gQg4PDLTY/jvBpPvr7Dw
	ZEGMtxvYvZFD2xplxJssnmfXmQZDTb5RyB9hCE1QEl1LypWpTZBnxosFAWIeeXVb
X-Gm-Gg: Acq92OHn8utu4VDj0VXVmCcXw1klhCtkMV8xL00Xkvvub/WauWjqZo/Nfx6XIpFEne9
	1eXxgzYngnVUsDSvAb3sj+f1NKGt09ExsbkGFtUcrTvYtrvAK1eXc6QKHH8HUfL4TKHEoAElgDN
	920OOSmumM6ATX0SA1uwe2MSYTkoP2yG4mysysfA3mN14sI7l4sElbYS5osfvQWDX3WVoIrLx5Q
	aUSJJhhQ0EsOkJRs869gdyhgpwK3mZXb9r/4JfxGo7EBihX5sT7TSHcIZTtikEKMWOQb4rP3766
	hfi3qCyKOA5Hq/EFAOM5qH6+cKQmTgBR3KgvkErDv2kMKNCfLGrjqSNeP+slYhUHRfozl3NjG6o
	5KI4r29NLXxBj9XzYO/3hF7O5rTif7zTzSHDOjBs3uJ5LvsNmn3t1aAiTVteDm8o6oDHZYl4hQh
	Jk0kDElT1881nEI2qnADuwsktQubnSGBSAH7x1B6IER//0azMfOgB7kWaVBE2L/xVonQL4BjkfC
	hDm8l5Z7XRbDgbLe24bdT3nodedJkqYhy4=
X-Received: by 2002:a05:620a:4046:b0:912:c611:8113 with SMTP id af79cd13be357-912c61187f4mr2042706085a.56.1779151625622;
        Mon, 18 May 2026 17:47:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba181322sm1676589185a.7.2026.05.18.17.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:47:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: oss: Use flexible allocation for PCM plugins
Date: Mon, 18 May 2026 17:46:47 -0700
Message-ID: <20260519004647.627429-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate PCM plugin objects with kzalloc_flex() for the trailing
extra data area instead of open-coding the size calculation.

This keeps the allocation tied to the existing flexible array member
without changing the plugin lifetime.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/core/oss/pcm_plugin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 14b4a390a219..5f4d6945a7df 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -146,7 +146,7 @@ int snd_pcm_plugin_build(struct snd_pcm_substream *plug,
 		return -ENXIO;
 	if (snd_BUG_ON(!src_format || !dst_format))
 		return -ENXIO;
-	plugin = kzalloc(sizeof(*plugin) + extra, GFP_KERNEL);
+	plugin = kzalloc_flex(*plugin, extra_data, extra);
 	if (plugin == NULL)
 		return -ENOMEM;
 	plugin->name = name;
-- 
2.54.0

