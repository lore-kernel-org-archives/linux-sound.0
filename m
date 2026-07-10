Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D453F0A88;
	Fri, 10 Jul 2026 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672849; cv=none; b=PVu3VgkEvhwPUzA0MGYLAkzNZAjx5OCKphsUoNylXD0zAiOD+WNfAkS6/KUDNNgsylRB5qUYXTlZqO9Bhiwcy5NxXuOpJiSqfzuek7rj50cJc6UH0EeW9cvl2kRgMcMPn9tnOUD0bGpE03yWg85nc80z+iPY2NUdcm/edYPZFoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672849; c=relaxed/simple;
	bh=qulgJOzogO+UC/G/OlNCEqkBZJY/Q9VNjzFQ9x/hxkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nwFCWLhMNa+lJo3dQPsY2A17YPZJopJiveRuFtepfWjXqempxL4k3o3SSSgBP2kXDGSI7ijMoHJn3R0jshkb8HIklorlrpuDbc68e6H4Z19HiGdsn/7QyW0qwOYV39Z4d01lnRyOMG2K+82jxaaCbYr3mD5R5tRlLLHl440/Fo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HzEa0trw; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HzEa0trw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=YK
	c7xw1ZYgEOFIA8/efahX17jcyqGbPE1YxLM6TLLNs=; b=HzEa0trwQsR95XneCN
	TIfVTeaXYtQd4M8BXzrKmSeU3FRJ+j12WZjdecZPvGW2WnGLOS94GkacfkgU6wVG
	Y/Xl3g6YRvtRV7FuKYY4uGcDVIMfrURYhziKrNXmWVmQLy1jwEprINAuf8P+qJfr
	5nx8R0PQM9CrkVTbWlPxhxaMw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAn6Ozsr1BqBwqkHg--.166S4;
	Fri, 10 Jul 2026 16:40:27 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	david.rhodes@cirrus.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2 2/3] ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in cs35l56_hda_fw_load()
Date: Fri, 10 Jul 2026 16:40:08 +0800
Message-Id: <20260710084009.665814-3-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260710084009.665814-1-wangdich9700@163.com>
References: <20260710084009.665814-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn6Ozsr1BqBwqkHg--.166S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFy8Jw45Kry5Gw4xXw18Krg_yoW7CFWfpF
	WrJay7Gr43X3WfArZxZF4UXF1YvwsY9rZ5u340kr1rZrsxZryqvry0vFnrXFnYqrWkC3W7
	ZFW7JryrJa1UKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE2QDUUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xzZKWpQr-yqhQAA3N

From: wangdicheng <wangdicheng@kylinos.cn>

Replace the manual mutex_lock/mutex_unlock of irq_lock with
scoped_guard(). This lets the compiler guarantee the lock is
released on all exit paths, eliminating the err label that
previously existed only to reach the unlock call.

No functional changes.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 104 ++++++++++-----------
 1 file changed, 51 insertions(+), 53 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index a0ea08eb96a9..4f74397ea06f 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -625,74 +625,72 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		goto err_fw_release;
 	}
 
-	mutex_lock(&cs35l56->base.irq_lock);
+	scoped_guard(mutex, &cs35l56->base.irq_lock) {
+		/*
+		 * If the firmware hasn't been patched it must be shutdown before
+		 * doing a full patch and reset afterwards. If it is already
+		 * running a patched version the firmware files only contain
+		 * tunings and we can use the lower cost reinit sequence instead.
+		 */
+		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
+			ret = cs35l56_firmware_shutdown(&cs35l56->base);
+			if (ret)
+				goto err_powered_up;
+		}
 
-	/*
-	 * If the firmware hasn't been patched it must be shutdown before
-	 * doing a full patch and reset afterwards. If it is already
-	 * running a patched version the firmware files only contain
-	 * tunings and we can use the lower cost reinit sequence instead.
-	 */
-	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
-		ret = cs35l56_firmware_shutdown(&cs35l56->base);
-		if (ret)
-			goto err;
-	}
+		ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
+				      coeff_firmware, coeff_filename, "misc");
+		if (ret) {
+			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
+			goto err_powered_up;
+		}
 
-	ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
-			      coeff_firmware, coeff_filename, "misc");
-	if (ret) {
-		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
-		goto err;
-	}
+		if (wmfw_filename)
+			dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
+
+		if (coeff_filename)
+			dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
 
-	if (wmfw_filename)
-		dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
+		/* If we downloaded firmware, reset the device and wait for it to boot */
+		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
+			cs35l56_system_reset(&cs35l56->base, false);
+			regcache_mark_dirty(cs35l56->base.regmap);
+			ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
+			if (ret)
+				goto err_powered_up;
 
-	if (coeff_filename)
-		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
+			regcache_cache_only(cs35l56->base.regmap, false);
+		}
 
-	/* If we downloaded firmware, reset the device and wait for it to boot */
-	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
-		cs35l56_system_reset(&cs35l56->base, false);
-		regcache_mark_dirty(cs35l56->base.regmap);
-		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
+		/* Disable auto-hibernate so that runtime_pm has control */
+		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
 		if (ret)
 			goto err_powered_up;
 
-		regcache_cache_only(cs35l56->base.regmap, false);
-	}
+		regcache_sync(cs35l56->base.regmap);
 
-	/* Disable auto-hibernate so that runtime_pm has control */
-	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
-	if (ret)
-		goto err_powered_up;
-
-	regcache_sync(cs35l56->base.regmap);
-
-	regmap_clear_bits(cs35l56->base.regmap,
-			  cs35l56->base.fw_reg->prot_sts,
-			  CS35L56_FIRMWARE_MISSING);
-	cs35l56->base.fw_patched = true;
+		regmap_clear_bits(cs35l56->base.regmap,
+				  cs35l56->base.fw_reg->prot_sts,
+				  CS35L56_FIRMWARE_MISSING);
+		cs35l56->base.fw_patched = true;
 
-	ret = cs_dsp_run(&cs35l56->cs_dsp);
-	if (ret)
-		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
+		ret = cs_dsp_run(&cs35l56->cs_dsp);
+		if (ret)
+			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
 
-	/* Don't need to check return code, it's not fatal if this fails */
-	cs35l56_hda_apply_calibration(cs35l56);
+		/* Don't need to check return code, it's not fatal if this fails */
+		cs35l56_hda_apply_calibration(cs35l56);
 
-	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
-	if (ret)
-		cs_dsp_stop(&cs35l56->cs_dsp);
+		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+		if (ret)
+			cs_dsp_stop(&cs35l56->cs_dsp);
 
-	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
+		cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
 
 err_powered_up:
-	if (!cs35l56->base.fw_patched)
-		cs_dsp_power_down(&cs35l56->cs_dsp);
-err:
-	mutex_unlock(&cs35l56->base.irq_lock);
+		if (!cs35l56->base.fw_patched)
+			cs_dsp_power_down(&cs35l56->cs_dsp);
+	}
 err_fw_release:
 	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
 					   coeff_firmware, coeff_filename);
-- 
2.25.1

