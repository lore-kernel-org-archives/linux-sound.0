Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0513331A57
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198374; cv=none; b=VFy7f5JfcTTuHmlsf5WOzc6SIcEQ1/OFI6+cIQhaD4hG05v9xpaV0SqYVWha1nLZhCJqtHiZLW3cfNkZ0BGM4cxS3V4FxetM1seyuCtYKV+dOtXLYDVPM47GnLc9vQDqEOqbc4ZFtPAhMRz8qGA5V7ow1+p46UKDX29SX6/AFjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198374; c=relaxed/simple;
	bh=RLI1cm6vDJ/qvHX01qZ5rV7ItrD31X33omgghTgOklQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPSvtQYk5W7hHIh0YfQ2IWbjjrjiNonFm4BWUQmtPXcKzkdrKagtG+cDl3jX/jENqpqA+FYkqduPHs/7sPAD/jMGZz0ZXWW9AWgOzAubmbJpORrdilD+sj3UJIkoyLXxfF9BPEQEnv4/scd7BlWDJD0Fr6owxyq/fpB2Nh2SQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJENy9pt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJENy9pt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8453427d3f4so5825789b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198372; x=1784803172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W80Qi/i0Jf8/TxgRoeUGM/YWj0mtv1cGhzixKatKYRY=;
        b=AJENy9pt4MTkwYyDBe8SU1J4ZpvRcorXyNfsTFXTTc+s3QMpH/hpVa3t8imByrAQs8
         lh3pF6l6cSsA7b1E6GR0GudG8pZVCzhSbRhTpNl27e2C3sJaPz+jd4aBmXkZjuDpp9p6
         eNNA8MzK0d9D/lYGdWp97I6cGc/PIPvPR6NElcI+9ZHILQrBe+khFfFW1MLqoYp19uNq
         Dg/mNNkr7gJqTYMlldglJsmnSeyNIDdKBN1xvO/V9eZm57GUpUPl4iTSRIyPDVHVAMSf
         7OBCwMPxa2vXsYj4Ss5X/JN5LNObFP524BHH+nk4d0jIqy64Qgkc099fMNFbuP7M9QyP
         L8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198372; x=1784803172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W80Qi/i0Jf8/TxgRoeUGM/YWj0mtv1cGhzixKatKYRY=;
        b=YKlC7vahw/WQTKyJZZRTzU4Rf1yUzyySN06zKYBs9EdLYWN1O5arnNtYs+jnNvszr6
         WFshkWM4JFVP39c5/72W61pMCAT0lKG9+YhHmahORPhHI8cLbPsQVOBWSn6XGLKIFTbt
         5/ZyVJNtPCbs4JuA99uSdy64uIgG3nTQ0eEOY7l7SeqgYrXmKqAvAjKhrmf1HseuOj0T
         vbxTHleEFlBV4TyMCCiJpaZk2qV+EdJ87YkiDDDQfyZzOUmXTSyOz7LJKIQHy14iR0iY
         ll+udbc0IntxRTYVJB7GgiKvJxWlkU5VJBDYwhNwlxPBF0Ynp6UQkAFE8uDn0pZ6wtbG
         IgyA==
X-Forwarded-Encrypted: i=1; AHgh+RrMqOUmGsqeFIz8dzld9m5lt7LTtbg08vqYMaZY91omXoQSJinGKlxECrlr6HcINk3wY6POfNxS/NXtwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYalkjddDhfKqakwfUrkIosIlxclJCnvuLbijOO80xoVeWPO6g
	l8UmCIZ/SyWzm1WBz8P/Dr+Tu/YW3vjxrsHetmJ2cjorjNBJNY2cK7A5
X-Gm-Gg: AfdE7clthbJCJLKWrh4zbIz8fihxwlkvDr3ETqbdrAitfrerzsoByI2iZcYZxSnmlzU
	MJDRAU4gsihrwhta4gdgTm9YXJTxTg5tQBnDNtp0OU9ytdmb8eeq1JnmUVMCbNk8iR6+J2vD28s
	g61FiH+wdE2HFyIDgJOr3zenpdxuVuXxaaFIBGonTuQJflQJ/gVOQsVnBboflz+nyikRwFq7MuA
	E8WnEgv+kAkub5AaDq8cGiWNYnscwidLat3qTxM9Er8BUDixlUHo7yplh85RRn0wL1Z4ooRAp0z
	Z7uE9QQbJISKQk+x9UzlMvx2V786To30pBhsCGwE5jEV0smW07qNqCmKrLM+U9jRjkIo60+Ecg0
	8vny9jCt6rjAPfSocbpHxstFTowxwWfMvqov8L7xpY90PZJSfJFm+ed0pgEMH4QgcwlxXuJtz0z
	mrjZg5dCbinI8IV7x3fEw1aMxPIPFxXKjjDH4phWI7Mwb7uaM=
X-Received: by 2002:a05:6a00:2303:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84a672eab57mr6647502b3a.54.1784198372351;
        Thu, 16 Jul 2026 03:39:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 01/10] ASoC: ti: ams-delta: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:02 +0700
Message-ID: <20260716103911.77652-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to replace dev_err() followed by returning
the error code. This keeps the error handling concise and
suppresses log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add missing parentheses to `snd_soc_register_card()` (Christophe).

 sound/soc/ti/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 61252359d5cb..2759b39c4ebe 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -574,9 +574,9 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
 		card->dev = NULL;
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "snd_soc_register_card() failed\n");
 	}
 	return 0;
 }
-- 
2.43.0

