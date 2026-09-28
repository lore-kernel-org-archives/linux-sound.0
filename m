Received: from mail-pz2-f34.google.com (mail-pz2-f34.google.com [74.125.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0936923F
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 02:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561919; cv=none; b=iVVJ61/ZGNYHA3l4mtj9l9z8qdaPTx20ADl4tt0qW+eWQ5LEOlRd4x/oWppi9fuIeUrdrqYsuR1VwGwlOwLOy7fuRcWm1gze3SGO6l+06nPbWUUGK/IOh7xjTf6Ao7cpDxIjR/S0srU3x8OPgG5BdUFx3uiBjE7i05+K+Dm/ofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561919; c=relaxed/simple;
	bh=zj4tvPqRF21upBgv6BYpTPfxCu7PxZhhGheN2EvdSp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/CaNGqZDK/gjrCoVcmSy6u1ILSoGCqyhy6VxG+egcEkBW6QGFUPLT3GkFex8xcoPjTy2tX9ux/0g1NTX2cyc/gpmSU5LurX6W136kA3jXCWMTXT02+JRzEGENIa+PiOzwAjpM5KqQFHQUKlbKM5+clQndjnQmekenclejjzU74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch3jHS3I; arc=none smtp.client-ip=74.125.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch3jHS3I"
Received: by mail-pz2-f34.google.com with SMTP id 41be03b00d2f7-cc79c0d2bbbso560098a12.1
        for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 19:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790561918; x=1791166718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivCY2NAlXyEyDv152Bu3AUgeth/0egS9qUPCJjLyURI=;
        b=ch3jHS3I2QqR0atOVdE3FOI/EDS61KIzY7V5aJMaqKF7zNLMbaYvi8Mb+uF8VqvUBt
         YYWi0l8w60ShHfz1AmfRZEXP5pfDf3Ak1OSzan9qlP2PijeNWzw9xCe9+KQ10RgmZwH+
         pyW2uNivqIipAR/N7zPEw12SWXB9iL0SbbFwccfRsvvDYuh9eF9Lj8tn1Mbpb562VMNd
         qbwFDQPoEO8uXSS+MyMrkbMd+gGz/UNR51GyaFJE6SA+umBzt1dv0JfQ6P57z3Hiwp48
         49lgWqZVo3HvCQRM29Ddl1GCx7Ys9VTH4lKPuvo9eWLQ0PC0xTTYR2RyVeJnCwVplbKo
         yhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790561918; x=1791166718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivCY2NAlXyEyDv152Bu3AUgeth/0egS9qUPCJjLyURI=;
        b=YwPu2SZKgkt2wM+Ut/D+QEM4uCrIxwxWW34H94qNaTIXY6WY4pT0xqvMAYcF1Dpf9j
         +BrG5H/MWQ47xoEILCJLmcseEXbzTi7Pr829LDEz7BgMIsILdo236/5/YROamsQKLCtg
         eooq6ajOi4+vS7ipCoeOQjJG/KIbmbV3JubqN6flUomKyVsl1sSfEvObgfkMLqXvWCh8
         YMgVDhyU/eGeR5dAcfh3L+FQyKV6JrLo5sh3BnCbt+I3ANPWMdUi+M5b+HcIz3/qCHBx
         72twzDE/XFZXAkcMciU7pVakWnVqR//mi1BCZxi1WrurbJ8WgDPqbqTubwEBstoO+BRA
         vsBg==
X-Forwarded-Encrypted: i=1; AKwUvBw4KV+loKUnPfVA1tpF43Ta9sxLtvCeWnWO+wAQaN/ZJAi8H2fSSedsEiFUF0AXREn0G7hba/O9F7dQJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwvs0qrBe5tUW4g7XB/Db90BuMMgVIV6ZDMJCDlZK2pTCePTB2
	ZVhjE8UKoL2hDYNTgXKo7SMygZK21ZDXrH3yN6nxfSNzIgl+40lcMnZQ
X-Gm-Gg: AYBFou3MnWYAIbvMezXtSlZYBuhdezBXu3uGb+NKArOthMs/yumqtbe211jZe0MqrcQ
	mDGVDDQa14YZuxDFEya/jfc7IVrERWYYUO9xPb5bd04u7TzC5qA0wHpxKzvcqTT+iV7OXBivYkR
	ZiDw52e19lW1b3sBAI1aTNwvhLegQ97XwvWJ+5XvGefXzFSbLO/21+Gi5LCdiKNnjX1eLv5dEmy
	w+N65IQ/OSGLSuAmm7/+fV5HV9VFLw0wNf0LxcA6U2pSlc8bfdDhsq7yxMw5B3lsOQawmJRLR8d
	zun36/bb+LOLIBfeXcpLwrhgDVEmjQFDvpqcaTStBhuUUBT2G+wuZyoTHyJ0dcjHNOAzZ3U5OXO
	d7NEUoscn+nSDS6gfOXa9c5PR2fcJE5Sw4ydmz1JWjrOE/LJRPlmAcw3J9qyQ5VB2o5jdLx+5O4
	5MB13jUbJk4E7CwRRPQ1uH1qqYR9PJGSeue1tuqKnB2VrSCxmS9jPA7nLddR7Fy9bqis4BhaxID
	K0yDxtcpUeLduFcjQm483t4KeBOj7gpARfa0pXBCxFZ4+YnIE0lJ6jFq0azrd6oesdNqsWv29R2
	CRM+n2IbsCQI8g==
X-Received: by 2002:a17:90b:4f91:b0:3a0:3881:ead0 with SMTP id 98e67ed59e1d1-3a0bb5530femr6510033a91.11.1790561917881;
        Sun, 27 Sep 2026 19:18:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b94936ddsm17588124a91.7.2026.09.27.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:18:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: thomas.weissschuh@linutronix.de,
	Thomas Gleixner <tglx@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: dummy: Move pcm_substreams check out of the loop
Date: Mon, 28 Sep 2026 09:18:23 +0700
Message-ID: <20260928021823.6517-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The pcm_substreams[dev] range check does not depend on the loop
index. Do it once before the loop instead of on every iteration.

No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/drivers/dummy.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 3f6bfee29986..6b0a06e5c876 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -1063,11 +1063,13 @@ static int snd_dummy_probe(struct platform_device *devptr)
 			break;
 		}
 	}
+
+	if (pcm_substreams[dev] < 1)
+		pcm_substreams[dev] = 1;
+	if (pcm_substreams[dev] > MAX_PCM_SUBSTREAMS)
+		pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
+
 	for (idx = 0; idx < MAX_PCM_DEVICES && idx < pcm_devs[dev]; idx++) {
-		if (pcm_substreams[dev] < 1)
-			pcm_substreams[dev] = 1;
-		if (pcm_substreams[dev] > MAX_PCM_SUBSTREAMS)
-			pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
 		err = snd_card_dummy_pcm(dummy, idx, pcm_substreams[dev]);
 		if (err < 0)
 			return err;
-- 
2.43.0

