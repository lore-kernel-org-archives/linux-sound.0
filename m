Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E736C3AC0EF
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692843; cv=none; b=HQOFCtPro0kc2l0dsnvKQHQl6m830HROBFSxWP70UfXHbOzJTCldqsHUypUPnf7OYuJImpberoqEgnQcpbxJYkC8yjgNPKOH6lppUdXHLddxclFALqdXhRFJvgMdGtQXovxETjhGnNn5Xub7/ML2fmWw4ITZFBf71Wp5YnhK6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692843; c=relaxed/simple;
	bh=S6aLS5mgsSniYkFOaIn0mgYqQ7t9JX1w7TYL5UAjCLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0HjD0jeIJxw3S+8yDpTOiibBlF+zT+ZGWQCqxMVX3H81w60rTwkW4UnlzPhjPVYW+sxes+OtnP+hFgG6acNg7iVZTIoEIdiG4e8lIhOftRhTOZWcRFSoQmGK6bSKgLtECUfyarLu2Os1AdnRqdZQVM38e/ONazxZmLZuSL4MrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbepd/0M; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbepd/0M"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2731687eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692840; x=1782297640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=sbepd/0McaSmYnLTS9yRDH37Mk3SQQw7ER5PQ0lEtwTgwOJkxN3q5LaLQ6rYn3scJC
         J8NLbzcUemZlOpPOS35itv0EajeD0yUKkoAeKZpLtfdJZabCPtOfHLjiGfz4+dJPS8MG
         EdmVeHZ7RMDVoUb5GbIDavMbk/AajFvJGZiN0mXjrpU7WLjcp6yTxiSWdW/SsuMdyp/r
         TrtVCGChOA9piXtHmSpRuwXN3wjdmgvM1tEggXE/u8Hzo2WwZjBg4/c4o35B1/wMHELH
         AkjPrhRks0WcTQ+IzuIInPXVXSltS3C/BIB7Lm7VDhiOKBrDCnMEshopRAzeNgLXanvh
         3dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692840; x=1782297640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=Jb4pUZq6fSWtdU2MsAbHvtL09iSPly0LghddblH3YRW1HS9LJgFoGXmfVxh2uVgSWA
         MbyfXb2XuEW0YUA9bP9Fy4rf1K3AkY6JmcsagTfutjtsCNQ3vbBSPThKF8BM9+G5MgNh
         gDPUHojQ7FuPzTveM4G3vfAlhgpdPXEAPYPkvq/v9W2HuUDV/dPWZCeYD0vfNkdyVx12
         Z4efQ9bs4lNyjRIHaXNGJg9GVllwlZkyDEkUzdH0moxzxz9JQTzobtEg3Vc1Uj3/WoqD
         /gQE4Y9cguT0KBZJqFAkrj6VJ/mHHDkW9kqerRu2cch3ESBO+FaxZkog1bE45LTNTw3t
         exPA==
X-Forwarded-Encrypted: i=1; AFNElJ+AXVkyBTt0wBGAHw96zGHI212XYuiAl5q4WoYJKnF3yPg8N6VdQRvP/Uj57K7hgKlb2ME4iljmEgNLvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPy3/Vj+HzSMeUPFCiyY3zUofSGn2y4/2Fd5c7vjKBbtJ2Dz7
	IrnIXI+Ue6Xy56bxKIGvZ8gK7wA9acFVYgg5qv9i/byx60Lb7PgrwY/z
X-Gm-Gg: AfdE7cmPDO/HaHLgNGOBSoVEtGlKPwQTcvKKL+95nIkspi/ZEcv9Q7+RDx7Gr0LsooX
	OF7DDDDc6xaE0zkFT1usUhb2zxbYB2vYzOS/uogdVcxtcE1Pq3sKnjQwj2R5LacEMTRUL08XOJl
	nCrgCjDFqKL9gckKeyMJkF025AXttGyGNeWJVIqaPgE8OA9907ITQUgxefVZT5CiNZ3V3UmBWYT
	C2qVuv9EnwImeqTIkNPxqZXBMXrnPngMPNXgn1f3Ey/EiRTUGkyxmi3q4/Y8tD133+ibJ5CW093
	iG936WAZ/bCni5WdWKUhjX7TkH2z/nBqtQqLD7NHeEHFNXwyRk6IcZguxONQKiU5CUNbVkM8UZ5
	UOhlLAnCDG8XN/8h1JOrssDSzfZtO1/AK8cmMZXmKfiTQf6+U1MiGMydOSyXnNfBMf8g6BkvD2i
	PPBUy6/V1IgQixYQSnl/frLUEzISUyfCijvENaYDhBBLbD+ckD26DQzS/Q1w==
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1722160eec.29.1781692840150;
        Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 49/78] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:06 +0700
Message-ID: <20260617103235.449609-50-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 34 +++++++++++++++----------------
 sound/soc/codecs/rt712-sdca.c     |  7 ++-----
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 581732180473..066d15399bd9 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -277,7 +277,7 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt712->disable_irq_lock);
+	guard(mutex)(&rt712->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -341,12 +341,9 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt712->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt712->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt712->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -428,13 +425,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +453,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5db478633f17 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -79,7 +79,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +126,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +402,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +449,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

