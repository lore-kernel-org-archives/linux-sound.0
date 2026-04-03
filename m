Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD9B3AA512
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222597; cv=none; b=aNifG/28pW2zuRuQRmJsdKTOBsC3VIK+ELmTewe/dJXMMg+gjOA87QnNAnTesx1oBhuOU/qJZdRVDTI6PZwPy7pEJKPjoROKpCWadElxZpu4qZfscdmbZUBK38sVQHr0kFY6JMWCYH5/iCcGb7j85TLHcwH6wJ6/Vr4eajhcBH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222597; c=relaxed/simple;
	bh=AmsvdwdayWu06Mx+NZCnZMnk+cGFTx7+3fvfcRy0eus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+iHF1zyUKZ3WVYEvkzkO+MdcHK+XWantaKVd/W5OHy2cx00ZndgmtK5aAbMdUvnvevStNkAm5p/C/Q2DDwPJJNTxM7Bs8dBwS0Ql0KCt04FxpBOmrGlbUwIWZoHcrf5ANtsdVckhcTt/KyjyYlUFEMKs/z6ElHBY/WvnZoNbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XwVikn+P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XwVikn+P"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-487012ce896so10428275e9.0
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775222594; x=1775827394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7gLEmVLAIU9eni8ZgJe0K46aqhNxnfudqkF3d3e4PI=;
        b=XwVikn+P6UHnMUk7/QAW/HCzLt/dr3u64nxQryFWT73HZc79xYPRMh7UmxBDngo8Jf
         jJXWXN2aQsjQb9O1X9xNdX43B+z1cd2rhanFpRtpyr4la5VGh3T4O8EYh/U81831GuXx
         1tdKiaVEXbGhO4TFE5sV4VNq5zeypxRd7tWpWCHbL9ykqJNK9uDwt5lrMPkiTIAb+lxf
         QVN7TW6pCE40KD3iTEF6tZo0bjDvzewV4gDMwpOjXpTMUhbf5ruyzWdmj56wY3kff2cm
         iarJhxOWI5s7L2P7S2bjaLymehN1ifwqUsNxWq+nBeqfL4l7ljRgZ+l0CnIaQ2E8eCeR
         WttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222594; x=1775827394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7gLEmVLAIU9eni8ZgJe0K46aqhNxnfudqkF3d3e4PI=;
        b=Ml2giv6BHqvGTl8rgCrO2dhSOKK+gfHLonCDexTGkIUBoyWZCD6ZymCWAypeBvp94j
         gsvwsfOjDakg+YikwQdh122PDCm5p/mtvL+mxgYPomrzSQcqRy+fPH560D3w3FFljiSZ
         X6Vs0+WPCpv1JNLvS2pB3wPrteR35MuqLIbCUztPWm1JOguMiC6AmFJj/9QSEHQKdyqi
         SmrY62dqLgKu4toXwzQzwXHmGmpbULNV44p2ihfuPAysmgvzQFFb0DiwJZJGLt/af5NQ
         3b4hojS8jXxYH9x3YsAVXBNDUl7UpimuB/+OmGkYSlRnI59fZ8Yv2UQyQYJqimdmmkF1
         X7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU0G+Q/Ho/Hd9PzgrvdQZtudDpGeckMtQCQn4DO+O1nQZufSRnCvgrgTJi6dXZ+S7zdc7nrATBXG+B7mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAy/f7qmdgpyWw7Xp1iO/dBMHwBEWyY5A4wwOj/VKdLIIGGeH4
	Xr2Knux/kKs6ZXIa+ll+xwCCsHe7yNcveD1LrM3pGhQvGNgqU8Wc4atkNWzaXtIbriw=
X-Gm-Gg: ATEYQzzMdyRQWduuQUNxY1187Q+fYyN4Gs+IN7XIk50iofD/COktevdQ0B6fkKtpA8P
	sM3EeRZSyDkbXsV/Q+f9Qb+THdSE/GmuQA7pBr1iZTDdN2mUBUAj1OEwNA9Gh+MJm4pit/JZ+7z
	8E2o/UdEB6qddvY7g84UB8o4yHMKlvNYWlCShU/1bzBvdSHBD5rM9mR4LUGPRYz40KG9FyGiuHU
	NiDhT8Jo69ZotV3P+M3gyaN5i41RIQxvc4TrwwtA2cQuTtuIT1MNgJASNiwhMvgy2U7TZsQS9tQ
	zHz9mPA7PFcFpaBp5/kFr6bk3zQ9ncGzseM1epNft83rtmPxXS7AzCQOUgayI6YRhU80LtZpZqq
	NKCIxJoOvkRQij2JbKJ8CX9PHO1Qr02hmbwvEedsFYYlgDQItkgifg8DOJTsTJjx7VgmsnFR4Uq
	kjrOAAOlu/rdi3+LDeA9ocaTZWG3NA/Z5TDkLgFcEamBfZY7cUj6Ja
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488996f08f5mr56228715e9.9.1775222594196;
        Fri, 03 Apr 2026 06:23:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm17229822f8f.33.2026.04.03.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:23:13 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: perex@perex.cz,
	tiwai@suse.com,
	chleroy@kernel.org,
	zzzccc427@gmail.com,
	nathan@kernel.org,
	mehulrao@gmail.com,
	bigeasy@linutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] ALSA: pcm: Drop the space after ! operator
Date: Fri,  3 Apr 2026 16:23:01 +0300
Message-ID: <20260403132301.2743319-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the space after ! operator to follow the coding style.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/core/pcm_native.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 674b50c7c5f6..65822e53924c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -246,7 +246,7 @@ int snd_pcm_info_user(struct snd_pcm_substream *substream,
 	struct snd_pcm_info *info __free(kfree) =
 		kmalloc_obj(*info);
 
-	if (! info)
+	if (!info)
 		return -ENOMEM;
 	err = snd_pcm_info(substream, info);
 	if (err >= 0) {
@@ -607,7 +607,7 @@ static int period_to_usecs(struct snd_pcm_runtime *runtime)
 {
 	int usecs;
 
-	if (! runtime->rate)
+	if (!runtime->rate)
 		return -1; /* invalid */
 
 	/* take 75% of period time as the deadline */
@@ -1735,7 +1735,7 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->trigger_master != substream)
 		return 0;
-	if (! snd_pcm_running(substream))
+	if (!snd_pcm_running(substream))
 		return 0;
 	substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
 	runtime->stop_operating = true;
@@ -1789,7 +1789,7 @@ int snd_pcm_suspend_all(struct snd_pcm *pcm)
 	struct snd_pcm_substream *substream;
 	int stream, err = 0;
 
-	if (! pcm)
+	if (!pcm)
 		return 0;
 
 	for_each_pcm_substream(pcm, stream, substream) {
@@ -2066,7 +2066,7 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 		switch (runtime->state) {
 		case SNDRV_PCM_STATE_PREPARED:
 			/* start playback stream if possible */
-			if (! snd_pcm_playback_empty(substream)) {
+			if (!snd_pcm_playback_empty(substream)) {
 				snd_pcm_do_start(substream, SNDRV_PCM_STATE_DRAINING);
 				snd_pcm_post_start(substream, SNDRV_PCM_STATE_DRAINING);
 			} else {
@@ -3212,7 +3212,7 @@ static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
 	snd_pcm_uframes_t border;
 	int order;
 
-	if (! runtime->buffer_size)
+	if (!runtime->buffer_size)
 		return 0;
 
 	border = 0x7fffffffUL - runtime->buffer_size;
@@ -3253,7 +3253,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	status = runtime->status;
 	control = runtime->control;
 	boundary = recalculate_boundary(runtime);
-	if (! boundary)
+	if (!boundary)
 		boundary = 0x7fffffff;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		/* FIXME: we should consider the boundary for the sync from app */
-- 
2.43.0

