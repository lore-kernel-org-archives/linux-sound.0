Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B53EBF04
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540582; cv=none; b=qiA+Ynql/G7jU/wCm775ZpXX5dG/cPPUbHYvXmNnYd9ksc1/wmzsQki3p3YPfR8rpedKwwYNvkLaeWMoaNyBFXKPshbBWnwmBw7r5SCdS6dT7ltj1glZ2Vb3jrxvEMDWS/IUZkzjB/J80VhOklbk8D6c33MCti2tOCLTtB0ukMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540582; c=relaxed/simple;
	bh=GKIwRkZCm8Zv8iawV0UlTiF2MPtg/vkJSReYRTAWhUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DP/9eGXOQqqhRL/7kmTMzEYG6yFkrkRTdYtLs+6YXRB0ZKlRXji4r9pKgsuNDDaAiJx4A1gRwR6agaHNCCa4mWtX0BNVKwCz2YBJ9WbQnVGkUVep1hjkjGueG4BBiX1TWPJSWdvfPDhhStcfBq8P6TL6oCb+QVKI2XqeDQJZ6tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSIu7pbZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSIu7pbZ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso5098745ad.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 23:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540580; x=1790145380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4WYQWILag3Li3+uZK8NQbU2ARL1MJngd+OqezkcRd4=;
        b=MSIu7pbZTI2F2Wtk9RO8e6Iy+7cuIdsMJquYzq64cssYtaiRUnpzHTBUDQ8ycVltcw
         BJVCzhFa3gS5NqMBt5BFNwimqOeXC2DntQwuIWp/Wobx/BVQVoxAQf/W3jIRfOMLJ1Xi
         p+Sq4WpJP4zaer37in7WuNJzISp9s5O7HxTjkRCt+w2CwK7ag/vUVmKA3GOrCgQTGH/0
         fqkgvVFCS2uj6yKSCdoP+hmEuMO9VZlAclrd+uOK6XreGqOrQQ4BDhRN3ykpCuNCOAPY
         2wsUqJqowvRJzfy18995rXY6OhvQq/MWUeJWK71Cc8kVbvnoznqpIcCrOOh0P8bOIHhH
         SqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540580; x=1790145380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4WYQWILag3Li3+uZK8NQbU2ARL1MJngd+OqezkcRd4=;
        b=ASrUmqzXfOPureQJPHLXzJOwvyN0J/Kswrm/Ie9TryP/tA/N4WQG3AcL1ypMfFomwi
         FYgHMRv+3txyoClcBhFOjei0ONSmtsMvzDZRLoV13/jB2Xcjnyfc4pImfRqf/KBaSpcT
         GGeEKrFscIPC7veEcbEAcdigNHLUFlzKnuvTWtbPAxwqYLTXy8PCvZPmAy436Jz9NlM6
         JiWkx0Pa1g/P9GgVyaXpEc4UqXqUDfQzYyEZZadjcefO7294XT4NZdCa3QFR8RyeQRsF
         /vnFngR5Xzmsb7JorAcu7wWWhPzhRLJ6VyjlE13vNOAYlNIPac+xQt5efc51CtwQglc3
         dEvQ==
X-Forwarded-Encrypted: i=1; AKwUvBznAPi4b1DpBYxqPUHDLCdSDrL5onu78byO/DHPGxklzyqa+IFLr1y4SKSIR11A8D2jG589Yw86r++d3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kl9iJwKiy3SK7kuLFO9+uiUyFOf6joBMrnniSW6djN7x9zLiSC
	MFs6f5piQJVvH0OtmgIyngCz0C2/CjLf0f9MzZCIhqa44ZG4dqqNZ+1E
X-Gm-Gg: AYBFou0JlCJlAn5z8SxzGHxjXH5ks2eknHCEg9YRGldsLsaNkXlD5N2qQthMrsdRaAo
	bV8qqFjgjJjNRWYGoTuTJpC8jLR5dpCno2ov5VqPV3VBirBmQM/5gTZuaeq0pX17x1zI1qOr8c5
	9fXABeYPO4+uYU4Llhehdeq4MRYVqXSroR79LjK4MzORU6PIPTTQGD0fH3jdRh6AXkm08+Wo6e7
	MWgyDj40u8ioaht0/5xS3b2AtgqOaSWc6O5NNHl/ajINMs+emodK/9TtoKWYElDmZXu5udBHNIc
	EYmaaytBw1GDH9OwEe4I8heErin7Hf+VRv4KCCVmbjQcYm88COKSF5LCqp19B3+NxEpToGdG4ce
	EHuT+hD7wt+SWj6DwBoxK7jy2LzCBQnC2KjN02p0f9bG8zVBqzu5RI0wMu3gzrieg13WU9Up58h
	xxSN+nIogvPZ/yXO3CT/A2n7fc/7OSCvqk21UOl3Sf6OmH/NnlqDpL1DKZzj+CrbQJdyAJfosky
	cEJDRdXtcY+/oYophvBA6jtd5ANIOAAAojvj75cOFaVIp2ny84xM1V7nuOBQXugbOSVL1kysDDI
	AuPtJg7lLR6iMWL5bDm8rSgH2g==
X-Received: by 2002:a17:90b:380f:b0:39e:1494:1863 with SMTP id 98e67ed59e1d1-39e1e56b3f6mr3444619a91.25.1789540579242;
        Tue, 15 Sep 2026 23:36:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b6fe1b1sm3081767a91.7.2026.09.15.23.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:36:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Rosen Penev <rosenp@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: codecs: pcm6240: Return 0 explicitly on success
Date: Wed, 16 Sep 2026 13:36:01 +0700
Message-ID: <20260916063601.23625-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The return value of pcmdev_dev_read() is already checked, and
errors are returned immediately. Therefore, the remaining paths
are successful paths and should return 0 explicitly instead of
returning ret.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/all/aqfHiX3pE-0BiCt9@stanley.mountain/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/pcm6240.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index db85ae2f8aed..4b5569a5b062 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -620,12 +620,12 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			return ret;
+			return 0;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			return ret;
+			return 0;
 		}
 	}
 
@@ -641,7 +641,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
 
-	return ret;
+	return 0;
 }
 
 static int pcmdevice_get_volsw(struct snd_kcontrol *kcontrol,
-- 
2.43.0

