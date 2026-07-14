Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785E38F630
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030528; cv=none; b=cvvWIPVZOW4wW15svW5FpU0qONRg+z0lj0xIQ5LTOrH9EQCVtsmRv2v5y6cIavE39eDHqf9TryILXZrTjxBKVf+poBpf1bEHoHXERdipYXO4Beden0ttUUbMHmM6CQWHeg1BHEsAGytrOs8lIJY8CQc0daWsnzAZcN01R9JaoG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030528; c=relaxed/simple;
	bh=evBDQ8LUTdIbeMm3xfd3E5UnVCKuP9AXVeeKznBrDQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JH9Wd85OH055owNlhQB4bvPCt/6WQs0wNvtCNfOjWylovq5dxzIkuVatiMuOTWC8RAkul5xRvC0WDFrP6dQuCnhcJMRGMHcdGV6m26orLSfrmA2+OtAay9q7WnY080jUTkLssIuLWmWK4GKJOAj8nZS2PV4QUnBPgonLfON1MlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWBN1Iay; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWBN1Iay"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38deea72eebso2103179a91.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030527; x=1784635327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6457K6STfYP0yfng2102Li6Fjdx/uvYow/tpgSviBkc=;
        b=aWBN1IayDiVe3EwuzvKBJcJgxpAx4Bwb+5U0/3dRAQbahphBSOsH2ZRUHmAuPL3KYM
         fYuqw8BOt9NqL2bzFNspFZqEEZ7I2NbvqVJZ25kMYNygf8OQgnt5zO9zpvyNneoh8q7o
         8v7JyzDJL91LTGBLwKxj/1IGdQx0WsRFG/IaW9f3mHfZ6t/GhCf8ypIP5F45vHJVQJdX
         G0KqCzYTR9n3uS6A+Db0SibjEOPJItM/P14LXB3SXL0sJ+GKEkEx8ULrW2WOfTdoPRlz
         QIwRM+YOU55RK1Hu5H5kcVQDnA3t3wTZI8FoCw5n8DCHMj9KuYggS9+BYEXipygXuCH4
         XMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030527; x=1784635327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6457K6STfYP0yfng2102Li6Fjdx/uvYow/tpgSviBkc=;
        b=BqMypZO/OEXeiLvqnSPCTyPdohJLM7Rm5V6TTP+sbd2jYgZ7F7O9QWPMvvfKbQ4hnv
         us4km0L5tLgWpZcwQt/C4ThuxWyKp7TU5AD/q7nQpmDKnzCjEYbivyHIhDqXT0KR8xMJ
         u75UyVemJKtab3iOQGPdGyW9qjJs0xPo5bKi9nElvhSsY3B0MQtRas3V9geY+nR9DAH0
         ESNbAuFosv9RSYls6OGxpPkei2oIGOoI/+YhzWbP15R2Ig6EUhXe7Ubq+T41zzW0OaT+
         IX3DoAXoPYBaErDhxX84ju0sEtioeIKECQ/MwiosJi4xHuJKtCgejqdIiybgxMSoloCp
         jvLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6XyqjtwPwUF4drFVnA6ATwY9hZan4DuUmDxSd0iBm4ulm2TRbIhRnDNdqD7EhZih91NWau0JpvjTz1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbGTOaRrMhZNnNwMQT5fb+rtuhMkANgXiyb2EkfmUJp3E91csm
	s5KK4P0iY1dn/BKycVz7jeKc9isNooFlW97K1gTlw/uqx7brI5nhjP5L
X-Gm-Gg: AfdE7cmEjPtXG3dzw7O/3erunBHmKSCN5HT+twNNnq/toMkVOIcDVywcFhCoVuoB+5i
	tETI18zfroApejAecnGB9vr0SIpoMuiCiwcAzwFmKOqHg8Brzxwbo8szQjfEu+QzhxutRuk+oFu
	PWAYdY3eOqTSwnJxi7g9/1qvzFVratwELboEyByCvZ67aQSDngfFSAddzXETgA8hHVRtsTVDu5H
	XRR0iF50kvoMMf52EIpaVmSP2Wg0qavuuD4LqJVZjFcz0ac/B9ZW4OHcrp5DIqnvvnP/CR/GJzm
	7WIdN2LWhe4TjuGqR1m0heuZpq/Zs2OYztQX24ieOcZ6oes6qLEw3egjtXkiHnt0zaPz6/LiR9R
	DL+KO5nTuEbmXJ36SYSYaQGvs/54mm7LQ13cOf8otjWtpNrpdbYC4vUwgX5PjgnAR9RGlWOlS4O
	7hMD9zWZ+RIk6wKEIpE4Y6A0l7MtF5I0H8oLHclMG3cP/ycaRAN7V378zTvw==
X-Received: by 2002:a17:90b:58ce:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-38dc7769df5mr12509755a91.25.1784030526404;
        Tue, 14 Jul 2026 05:02:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:02:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/10] ASoC: ti: omap-twl4030: Use dev_err_probe() for error handling
Date: Tue, 14 Jul 2026 19:00:41 +0700
Message-ID: <20260714120042.491712-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when reporting
devm_snd_soc_register_card() failures. This suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-twl4030.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 2a80e44035d7..576f4d3615e8 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -306,11 +306,9 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		dev_err(&pdev->dev, "devm_snd_soc_register_card() failed: %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "devm_snd_soc_register_card() failed\n");
 
 	return 0;
 }
-- 
2.43.0

