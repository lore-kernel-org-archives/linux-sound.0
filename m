Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578B40855
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063236; cv=none; b=dFpjXaK3G/YKbAOr8B6wWBN5ZjPSzJzu3LDD6lgRpEhx71u7L323Vi6ZNNdEhmgt0FbjHXMvoTjuY2Gm7jKCEzcr6uMWUh2CeDKVFZE95Kq2XpkU+jG9IraTwHG6VzGCzY90EsnEa+p3zkJHq9OzeQOXBwjMhx1fBCKW4f0G4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063236; c=relaxed/simple;
	bh=rGQpAFcVPqwsxvRsXonBNrgM5K9pjdCMdwnFGtWJhpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQx0FAUAqKZEnjSGbutQ1WrcJcndlJ3KGilJPXjIoUkzmcRPDlU7I7/eQfczF2uB78p5p0X5wren56qPdWhlPDrWeYptI57qV9NY/7QjmZ52bMZUZlLuoTrhyqrvXVVDds6cPjTMk6fn7xXesyyxGq7jz0OWlfcXfH1C70tEtvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERVL5OPE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERVL5OPE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3001315a91.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 17:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063234; x=1786668034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04FhADnipVf1VPFtyxLVHbuBJYmlqyNGeVnPiku2pjU=;
        b=ERVL5OPEJmX7yPsZrKgk52WD7VeX6JeEtQQ9QcvqP7ECrX/CAUGfyrfN0wW65Xzrtk
         WJKUZhJJrOOA1mC0rAC0B3rJtWh47JEXdCt9+jyhkY4IKri5mHVBFyDU11fxHlFNTI6X
         m737BxH2dCIy8mXliz2X6ZmvM3IQewL7gAGzJ+55jRt3Bm+AACv9ESufjseH73Q5d+IT
         tuSYOIKTeAvEHPPNMhh7LO558KXa1FA0r2r9HpcAFZQChZGpn+cXUwMG2qakI0JuA6TW
         8zZIGkjmqtwXXp8idOYSzcxc1FedQMF7FEreFHxRitqFWi9LOpFLQGXpNv8O1AmFrFX7
         YvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063234; x=1786668034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04FhADnipVf1VPFtyxLVHbuBJYmlqyNGeVnPiku2pjU=;
        b=U/qHELY9rNIaVM6IIeQeJ+JMaz8YAl+ZfF6owagpDefM2GBZCiMuf03BPxLSdPH3vd
         BkoKD188tbmugKJL2UDPZ3mViQjVL7tST+KrCvKnotL652hlupokryEkpgfLyBhysldN
         BYnn2p959GyXMibXpJZXQDhAs0w6C0+8XLIhtM9GpCaIZ1vin9U4rPsXJ5JcSVzNGaSd
         tLnU9gub6IgtYCZyGSNjNDy2a5IogwJXRnR7FxGCBF0TLjbjX8ZZ8xJgw1i0lhA3AkbM
         6WN4ZokM+m2u0VD364d2zvwuiT50iqqAAy153SFXfz1/dxlj3u/p2Hd5MG/1qYbLdDoM
         Q79g==
X-Gm-Message-State: AOJu0YwLMtZf5Cd+JGUM1eag1f3mukjMvjR9k8AalG0TFleROFsxekW4
	Y8EpuyAX+RUb7TcgtsPWUZi6FYu+t1kJR4iKkiIz0Jk9ndzyYDdDtuUcyCdCcQ==
X-Gm-Gg: AR+sD12Keee0Q/7jrSyG8oM7ZZIM2am/40AGgajoR7LJFQ/M0kWJWx54raffNPSybpo
	eMYI2mGbQegW5KA+coTG1g6NyushsAEIWTuwZG1/VLy+S8+jfjVJw3AjD+JQZrVGIDNGg98pWvg
	X5fWhhQhjIFnkvkUna+ttJTo0xGZ2McbT3khTRIRAkfe79TULEF8DuFc33V5AylX8vqyzyxNqf3
	neGKeT/nN+FFig9yH95cBDuDT4X/OEGenC+ZLFvYw3lD5rY98bz0JGiG8zY4ljvCVqtI2UIrCQl
	fN5lmiMtKO4syCxCc2D0oj8QKuWqi0or3Mp1/jcDJuDcERmgVMfBHA8qAsM0p4UQoEODbQcNdxr
	yxfl5eosivxES3NnTTLwubteknJfHw4GlLmi+5YFCLW44kBO75ybiNt+B4p00msCIrT3FHp33Y0
	mXkViS/bvxG3wqerNa30BNSJU7ygRYt14atCggkrex6e8ao4jIMcA4G/dlibZ/L9Ig98Zi1Uu/X
	1GazREEsq7dSwDyVr+HGSAQqwQWfEutWSbpApEUjAvwyRDUyH7GvajhL++hy+Y+dqrLBNaSQlmi
	MQQ2VRD26YNduddI2IrAAh9ui4NMv+f27J9qnA==
X-Received: by 2002:a17:90b:5447:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-3903c634cd0mr20028872a91.20.1786063234266;
        Thu, 06 Aug 2026 17:40:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm2511616a91.12.2026.08.06.17.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:40:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
Date: Thu,  6 Aug 2026 17:40:31 -0700
Message-ID: <20260807004031.47455-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xlnx_formatter_pcm_open(), stream_data is allocated and
adata->play_stream or adata->capture_stream is assigned early.  If a
later step, such as snd_pcm_hw_constraint_step() or
snd_pcm_hw_constraint_integer(), fails, the function returns the error
immediately.  ALSA does not call the close callback when open fails, so
stream_data is leaked and the stream pointer is left dangling, pointing
to a substream that ALSA frees.  A later interrupt would then call
snd_pcm_period_elapsed() on the freed substream.

Free stream_data and clear the stream pointer on the error paths.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 7eba3a0205f1..4f4c1e650aaf 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -385,7 +385,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on period bytes\n");
-		return err;
+		goto err;
 	}
 
 	/* Resize the buffer bytes as divisible by 64 */
@@ -395,7 +395,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on buffer bytes\n");
-		return err;
+		goto err;
 	}
 
 	/* Set periods as integer multiple */
@@ -404,7 +404,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err < 0) {
 		dev_err(component->dev,
 			"Unable to set constraint on periods to be integer\n");
-		return err;
+		goto err;
 	}
 
 	/* enable DMA IOC irq */
@@ -413,6 +413,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	return 0;
+
+err:
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		adata->play_stream = NULL;
+	else
+		adata->capture_stream = NULL;
+	kfree(stream_data);
+	return err;
 }
 
 static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
-- 
2.55.0

