Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012352;
	b=YfTLhnWYXCWA8p1+rhyproLw+eQIVbrTzUDl0f9AQS2gB8aDIQrsKJTRokkIbIhMVklB
	 WW1EiF/liLo+A633ZLSMJ0zFY4FvWqChe74vupG9zWatCdaHdC8Un4PBO/ShscK7ni1oU
	 zYRKWnEzB2Nftu37tbP7FiMhT/riwcoErnPF7D4MfoJTGNL7gfmC/wZMX5edUueefKNUp
	 uKKFsz93A5zeACpJZm7FVpIeI6jW5xpamkuZMcbXVc8FAN6ASEk8/uTlTcmEq1zmpgFuX
	 bfjtutX2zxZumRmg+DE8f/DfvZaPD+2m0I+yY2ykDz72OVwBfFsNGcrGRndSSjfVTog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xo82AcSZWrE/b9eOjrvffmbQXg8vjut2UMUh3oGb+l0=;
	b=1UgyZMIq/I5VQ1enJVZeQclKboUrOJqY5xPbdHFky/r68fwnF6ZdQb97TSKNFPaEPo9l
	 k29z78+JgExdV2w4E7b0UlaQVbqDY/hl0mZSryWjfvNHFOJiHJD0610shomRi35bLjbwi
	 zMlzBtGZImOQbYKraOGveQ28s7kxPUF7yzuxChqIv0QdLFoeu2Ej0HfHpHIQwBCGyQZr+
	 8H02NS8Ewc8kx84e2hsoLLHPcehX99IkT8jZ6cm7j94zIrJ0CdFoK0wOJudp1pQclO002
	 oQEvow4ToSv712DTNwBvxhTVUwxaFVvICtchsSU63+SRLZKHdxgQ/PKOKHNc1KoTkNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zvsnjup0;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D9606A32D
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 071D9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zvsnjup0
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so904215a12.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012351; x=1793617151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xo82AcSZWrE/b9eOjrvffmbQXg8vjut2UMUh3oGb+l0=;
        b=Zvsnjup0mAmdkOLj6ijUoPAiRH4ZKyYWiZF0XYD0dcF4A98Td7TZ7P+cSMTjsD3Odg
         3u2rrhvCedJoD7iexWugaZb6Im8TRLbEod3/OO0jXJ7qebYqI4eOytfyYh0OPyYWdiCU
         spmnCzO37Erfw2XunlUFg8cQ5pE79cwTK5svkXWwyYvLFDjWX4vz6C6Y5/H0Ml6Uu7a+
         XKmX8U/jTcSg85aoFqElkxWjc0eOBGOJlwZLKIMh+BfWRjdAVdcOeu8oMHDNxqswg5hi
         VbwryJUjOqBxsiQo2Wr5ExeZnF+8PZb33rmsSNEF0nBg3IOgh17U2lOZtyDj8DtObk/P
         KDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012351; x=1793617151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xo82AcSZWrE/b9eOjrvffmbQXg8vjut2UMUh3oGb+l0=;
        b=zla/Vn/z2mOGcz+md+1U4Vqx7sS7RU6z2JXt/IL3B315ay0n0hihlNWEfnQ0vRLunh
         926VDh2AWnLgq6seAUTN4S8eoEKXH4CcttkbsqLTYyESaQE8NgG2VgpPRrBEs6CpNk4f
         SLNtxNE1nRvT5nb9H0At9CHiJFTmaNCikz5NJ5456QEKMNHimTxmn3SlhwfzNpYl+XjM
         j7P9/S7PdtayxaSCdtZ91nICZ2ZiNGl0jQucyTjaOQhA0RQ9qrclLkVG5gjV+LMkyh5Q
         1qrPrZL15iStjODHdnskKxGsnL8gazeKLbXud5pNHsa1egujJ8gEbTnL56gCVe4da3na
         G1KQ==
X-Forwarded-Encrypted: i=1; AKwUvByBhhJxt/Dx4WQULly5dKxk/Z+Tu6OT0HEJeK1xwU+u2O+5RzPzwidTVc0XQ0N1fPzos1yKO5bkvKrHfQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL03rxMjMLrYSrByCbMI8rqqgypIOHtAnL+BICwJ5hT2/GIi4Vz
	ylzNxotXBBTXjN0jePFYfxv8VRg+gUOD38ui3poY3D6NuX/1vYAwe3ni
X-Gm-Gg: AYBFou3Q6Ed2HF+tctIH+ihMK86h6rBS9yrXtUVsoN3/nh5oSWtLHqRqBDZdMCMqU9D
	cC8fduazA0w9fMGn1pxqAA3hE9T7iJGzLRh65peWGWHIWJfZQQ+zHHzIOd5VKLx32iyKiOzCTUg
	o35Op7cHffQEQwre8hEGC6heM0Pj5OdXIL4eiT4UsvpugTbfqxpR/UJob8AkKop7sy92g6AL8zG
	l88NZAXNCpcVKfW1ot+ukk5JmpvQ5GxL+BEQJLyGX4PrcPp7c/d1jJGxW2rltelZbXwJ+9RLGd/
	3zT8LqK/DiJDyKaekM/JyXuLDWDjvTwfSnzdm14ulgH/aafwG/oeobjLOhV4/iuOVkADnMHI3qa
	zNfZ0jVjgl4H/7IiRbkz/1DC4FWIKMf2MYEpyvoIF47hC19YPeSVlFH1md4Ssc2kgayVYvSvCkg
	aBjABPcZfkzN3F0RSM+80Fx8+q2oJUSCxgmUbfChExGp2uS4dNXQoRSpRDi7q3a2DfnLE4AVPUb
	ezVuPAJolQ/TNQVVRKsQJJDDDHNCCIahAyvileh6QtAFVy1RPj9rXxtMUGMer0D6T+sWgxCu5KA
	sNkW3iCUTVi04hmtaidydjYjn2KKbrv05EQbpNKm8N/WKBD06zZc2QpB0Xq0heiD+7yZvOI=
X-Received: by 2002:a17:90b:2552:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3adea9dab45mr5437389a91.17.1793012351413;
        Mon, 26 Oct 2026 03:59:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:59:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: kirkwood: kirkwood-i2s: Disable clocks in reverse order in remove()
Date: Mon, 26 Oct 2026 17:58:35 +0700
Message-ID: <20261026105835.19052-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Disable the internal clock before the external one in
kirkwood_i2s_dev_remove(), matching the reverse order of enabling and
the error path in kirkwood_i2s_dev_probe().

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index cf6b96054b82..c26326b82c19 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -748,9 +748,9 @@ static void kirkwood_i2s_dev_remove(struct platform_device *pdev)
 	struct kirkwood_dma_data *priv = dev_get_drvdata(&pdev->dev);
 
 	snd_soc_unregister_component(&pdev->dev);
+	clk_disable_unprepare(priv->clk);
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
-	clk_disable_unprepare(priv->clk);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

