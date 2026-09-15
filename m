Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76A470E80
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464338; cv=none; b=ck6KJanoBQppzrXQZS3RSKEv/dg81bWsolsjgpTq5N261cz4UfLFbC9F1y1Tj0uTmwapW95K6S5uSPQmZzqqbu8Z/2g+sKSwJ+Y7P/u1akEzCpZGV+q1xmUeJx1ri28zAhzsW/yR8kDrX1r53pIbIOgaxknzlk7ypXuFezu/mJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464338; c=relaxed/simple;
	bh=lXe6aSYFPWJ7c/AmG9xUu7LcDVy6kBr+8frdycfYPTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=choqPo9a/UKHA75s6nILrN5K9lnrtRUQVfLwcxDGxNQTfkW14NZ+RERZr4FwC/0Yk+o8bNwBuVHyqXeKK9n+/23xGRnHAxiXARWJgurOm2drqyJC48nrGy7eF61gpMqJ7gNTakC/JO02Tdf1I85sWkMvpZVz5VDaPFMp5vHwOOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDQSHAt1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDQSHAt1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso39291a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789464336; x=1790069136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AeTuTtLFD6wST7Qvf0FgJNMqRZl8DBcYMCo5RZWoxc=;
        b=gDQSHAt1THzTAMx9jCiyrVan1OKnQccbJig0dRPSnKqBKnQSJ1pyrJRLjkiT5y+757
         Xq8rH32wQs/sC176XSKBiEJKJo6Rh5djuw2rQb9/BHFv1Frip9V4hTO3e0zVZC5tdiM7
         BgV7RvcP4IyAPDHOCAqySJRL4I9npIiMUIopsSpPy+gAF7ialT6+xO0ZBYV/iiLt3Wjl
         +lZHb0onrT/XTD+U90ZEO2OUIkWn3RWw2l8wmmOa40L5Jsk2mGYxj+iYQCWnqnURcH8p
         hUEtleOlv9A4txHlM6razBoOm/JujUbEgIF6YchSD4pubZvAbVLZZRunX/nhXYVF4Vm7
         qB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464336; x=1790069136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AeTuTtLFD6wST7Qvf0FgJNMqRZl8DBcYMCo5RZWoxc=;
        b=iU4QqwmVAPSJjj00WhcxumQvEd7u0NbZ4vd8f+EPHrZZDxSuaIy5ZvYiTE2QidzT2n
         DWIUzFgbvdyhYCOOK2eDYUOYNiHUfjVoRL2Api4bJ5kCcS4GTUa7+wbYgCEzxL3PNFQ+
         Y+upthkF4EeYD3Azzvdet9t26lCvE37Yy3raSZ9O8+dfLJN6BS/WiAOypSV56fKt5xsd
         v4367thqfbgS2BCS/LBZfb7y0U0Uw2FeY6VYfJgg8WgmTxQVv5djFmUbA/r/wAZOCkUj
         SZbO8L2oywSUxC9uyIVdmELLPi5loRXCZJjlnSS/XPGqaJRYgRDDUyn2PNQh37lRUljK
         SwPA==
X-Forwarded-Encrypted: i=1; AKwUvBygJWWW7NJjqu3U4VfhWVUSfUiDLJWE7YMW9i+2i8gye19Wbl2JmDJbg1DeY15PKI0FQTssiB4V1w1v6g==@vger.kernel.org
X-Gm-Message-State: AFuF++nbzCrtF6p9UdINTs0A7NLBuLN+1cosmHom9xCTb/SLXyDv7Z0e
	ztL+3NAmQofgTnqpeo3XpiU6w6p+RMMo1TzVOIiJNNwTAN7ohWhraILQ
X-Gm-Gg: AYBFou1QccGKpNa5PPOxWv+66Zcwjpt6g4GPEa9AhaYOrvY+n/X32BbZ8aBlqkP35hB
	dPwoKMEZOJN1j/wsOyhVbC42aFYmTGNYyBsKOxlBeq5wIn24Uq1TZ9/XmTxlJ27IKKVz1Ffg7Z/
	toOgu1HL/exulNJ6wKStQilamsAGEoVhfPO6uhmyzz0FBxz3nGU2HGpXLA4dpsZ7sVJUMmQAPlm
	zv5noJpC+Ntfo8G0TaAScaK2ObxHZe1o0TMGEWEeRHMCJtQ2zeKwRQ2F8jR1zcUPDbjJs8qRqFT
	RhmEh6oXSaJ6ZQ+RTMFeKYB3kHi7+goCJGxxTtgHzw1O1fhJpsn8ie7+iLNWdI4tph5T46sxuDZ
	F249FfC8bwKkMkARx1VE10hTLDmvKbQhcs3BpG+ZnGNYpyAN4a/saH7BRIw7lNAN2TNc5PVjr6j
	Y4C4EagAq3tl6Hqrvze/prB3/4nY9tnC4b4drFhCro1l6eSYMh9d/hwjcFC4o3fMFrUb4MCf5bB
	C4lIh/qUMkg6U1ExtHlGaMTVsNHQS4UjSIFfJK7je1+QxOQIn1nW1C0p4v8MzXx3bsSodERHy8L
	yvFWWOujP1Q=
X-Received: by 2002:a17:90b:560e:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-39e10c45eedmr148835a91.2.1789464335615;
        Tue, 15 Sep 2026 02:25:35 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd58af8sm4123719a91.12.2026.09.15.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:25:35 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	mripard@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: hdmi-codec: Report a change when the channel status moves
Date: Tue, 15 Sep 2026 18:25:15 +0900
Message-ID: <20260915092515.2638542-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The put() callback of "IEC958 Playback Default" stores all 24 channel
status bytes and then returns 0. The core notifies userspace only on a
positive return, so a write that changes what the get() callback hands
back is never announced, and a mixer holding the control open keeps
showing the old value.

Compare the stored bytes and return 1 when they move, the way
snd_hda_spdif_default_put() does.

The same shape is in img-spdif-out and uniperif_player.

No board with this codec was to hand. The change is a comparison of
driver state with no hardware behaviour in it, and mixer-test counts the
missing notification as event_missing.

Fixes: 7a8e1d44211e ("ASoC: hdmi-codec: Add iec958 controls")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 sound/soc/codecs/hdmi-codec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index bc2c22436ba6..7aa50c5bd3df 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -426,10 +426,14 @@ static int hdmi_codec_iec958_default_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
 
+	if (!memcmp(hcp->iec_status, ucontrol->value.iec958.status,
+		    sizeof(hcp->iec_status)))
+		return 0;
+
 	memcpy(hcp->iec_status, ucontrol->value.iec958.status,
 	       sizeof(hcp->iec_status));
 
-	return 0;
+	return 1;
 }
 
 static int hdmi_codec_iec958_mask_get(struct snd_kcontrol *kcontrol,
-- 
2.43.0

