Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE81B87C0
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621827; cv=none; b=gGaWMVtSNZzKKzVuwuvPEIZdySw+inrLqs8f1UPZ373YtHp/z5t3j8DyxkODkiWCtA4evyZhT9jMi0W0r1ibCBSfu3GfSzKs6bguBsyAFmXNqvvoNDjp3WHlhZDup1dfqMI12uAvkDw4DdspZEMGRwQ9LaZh5g/UHFSiqp41ODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621827; c=relaxed/simple;
	bh=3V4CPpUgnKQCvlxe4Ldu/4T9KyUNtJ3mMs2fbBfixwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kfb/N7sG/l/M4LuOUWo9CwqqtrQ/cNz7suDKaSZzyfEs2jsgdJ/PmMapBt4+gV+iW+vYpQ7oVG6VNTCmjYLXvQ9XitTvEC3vUHIVnf52hL3dIqfI8R5LqdkshaOjwciPEHT29rmsZxI6dWxzeBzNT9RRMTRurF3DGc2qa3wZXyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=TqKLzFD7; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="TqKLzFD7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 070B4101F07;
	Fri, 27 Mar 2026 15:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774621816; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=21dH0vvgYBh1Jkrs8gJc1KjIgQNSWn6a0K9jBl2Ec5A=;
	b=TqKLzFD7IsxIZ4BGDxjzzXTMxXwld4/h750zI+/W2rcxTuL0IOdB6ZX/cD7+gQTKG4ffbB
	xgkAoXVjrF7jPQve7Zkdv8mUiHFFGIz/pN5PiK1X/I7703IOASUTS2b2k8bWFhzYWsTjtH
	uecYM3bqhg1tKoL2ioCIg9JPG530tgovl1ECbj/t9cgLt3oOJkIDPy8YJTDXnYwNyM/POg
	g4TJOshuHiPAiDYeyO4furA4gsKPqXiVAYIIjVgdxmykezXAoZgoH8vfxjxcLJExZw/+/J
	Bx3Mf2OIJK01U1TumEXUov5wgUBNvufzAR3duYdQHYF9O1ob/98LPXuPkisDSQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Takashi Iwai <tiwai@suse.com>
Subject: [RFC][PATCH] ALSA: pcm_dmaengine: Use more shorter periods for SEGMENT granularity PCM DMA
Date: Fri, 27 Mar 2026 15:29:43 +0100
Message-ID: <20260327143014.54867-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The segment granularity PCM DMA updates PCM pointer at the end of every
segment. In case the segments are too long, which happens with pipewire,
it may happen that pcm_lib wait_for_avail() will time out while waiting
for PCM pointer update and playback will fail with IO error.

In case of SEGMENT granularity, use 8 shorter segments over the default
2 long segments set in dmaengine_pcm_set_runtime_hwparams(). That gives
the DMA engine some chance to update the PCM pointer every once in a
while and prevent the timeout.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
---
 sound/core/pcm_dmaengine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171a..092ce958e1aee 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -424,6 +424,10 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
 			hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
 		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
 			hw->info |= SNDRV_PCM_INFO_BATCH;
+		if (dma_caps.residue_granularity == DMA_RESIDUE_GRANULARITY_SEGMENT) {
+			hw->periods_min = 8;
+			hw->period_bytes_max /= 8;
+		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			addr_widths = dma_caps.dst_addr_widths;
-- 
2.53.0

