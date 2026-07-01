Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404753AEB2D;
	Wed,  1 Jul 2026 06:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888703; cv=none; b=gLZFy7xTVLgJ7o0aBhrsNQ4+fNjoZIW56qasr4oML/CEFNEj5Q2MeIhlgnxBR/sSjyvDLQRjj4n1GgIViaTMKMf/pTkJ3uENKS0UnJ7NV8olmOfLzNOWiZAf7H2kwoJpAuWHzk+CGQngm6WX4H9E7uIcFOW89FKiJYW5F6LV5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888703; c=relaxed/simple;
	bh=5LlHU1gnCFO4r+FtOV6J058O20nB5rDNop9ezrjQJDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHH46O86xWlk7hKA2rEwpAlCSKOmELN5UUaRpam1HsoMMwf+Z1Pe1kkYERSpq6O7lCgxe+UV/WETnk3gLr1Zrr0sPCxy08+F8UQp26vFsunydTs34Lzg8vMdaAUr6/u5y+ko4P8+la9PT8g+fNJYgVQrJJaksGnhqotmb8qWs3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nR27QHxZ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nR27QHxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4s
	f9VLCjsYY2gV4Rjoh4jOhFfL/RURFUPTNbat4BrpM=; b=nR27QHxZXkBxoazhhe
	t09+QWhazIow6I/Erjwkye7BUQIndZdi6tvXJ8T0zmT6LhnNm+xP1GckJVsFrEq4
	L8VYBLibXFiGkS9p0FKxktK2bqSUM95d4gml6nFmFId1ZHMQfpP4j4Bh4fceH4Gd
	f9ZKpeWL3xeqENR8V1U3OPn6Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn6YbeuERqQXGfGg--.31791S4;
	Wed, 01 Jul 2026 14:51:13 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com,
	wangdicheng@kylinos.cn
Cc: david.rhodes@cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in cs35l56_hda_fw_load()
Date: Wed,  1 Jul 2026 14:51:07 +0800
Message-Id: <20260701065108.596046-3-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701065108.596046-1-wangdich9700@163.com>
References: <20260701065108.596046-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn6YbeuERqQXGfGg--.31791S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFy8GF18Kw4rKr4fGw4kWFg_yoW7CFWfpF
	WrJay7Gr43X3WfArZxZF1UXr1YvwsY9rZ5u340yr1rZrsIvryqyry0qFn7XFnYqrWkC3W7
	ZFW7JryrJa1UKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMv31AUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6AESYWpEuOGlswAA37

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
index a0ea08eb96a9..2d9d75053293 100644
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
+				goto err_fw_release;
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
+			goto err_fw_release;
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
-
-	/* Disable auto-hibernate so that runtime_pm has control */
-	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
-	if (ret)
-		goto err_powered_up;
-
-	regcache_sync(cs35l56->base.regmap);
+		regcache_sync(cs35l56->base.regmap);
 
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

