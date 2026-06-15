Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C494C12CD8B;
	Mon, 15 Jun 2026 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535298; cv=pass; b=XkHW1ES+F/z7J3ZbCyNLPhpaQjCNu0E7dIpjaQ2sITTp79k87ShXz/0CHNcrlRPNGhraR5g1HttIP3mX5wnpxfTT2x6BHrSnP+bOn9a2glpILrtjlax3rwHaG3P39ofWYfY+yOoV+PvGF60ZnPEly9cMVi+x5coQK6ZmC/F15CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535298; c=relaxed/simple;
	bh=p1AikPQsegmm/8lc9dyXr/qrNTxVTswc/zcaBdYD/Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LBp2rhpWY4lNvEPz2xM1aOJASMRt2FPd1Ii8TeDARyFm4EIW0gccb8/7eMA/O/e2sBvCTiK36yJgOemaFq+GKC6uE+qkznHRE5YnthT4NlsFjYM6MTHhUYYNZKXWKuFMj8HwiI1hWAbH77mQIosTw9EOrZPQ+f68vzZ0JXf27vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=WFOwNHwy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="WFOwNHwy"
ARC-Seal: i=1; a=rsa-sha256; t=1781535276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fEWhRxCQxLhfJYoyqaRCX4DmtErjXLB8XrjIZhWU6jsuxce+Gpho8jvaiXEdca1WpAKSlYm1Hbich3y5a58lGVxugJLdzYdEagnzG/SZ8EakHrZrqKWjUwxXkPoFBiKHjoG17ZPPMy+aDEL+G2Zm3jCD4Bnmh0YZvpgOgt72NfM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781535276; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pn12vlchHjVQB8lOnbgObSwAzbQoyOOc+YMsyec1nsc=; 
	b=J8b5FHr0sYPf0N9quizEwe4SNi2gnZ5gD3t3WvNRVSa+q6EUicfKOua9sMn+5KQAOVo5OxqGTtdz3cen5BbuZutXSUp5kYAaQSmVp9qXfzQFmOAGZkkCgl0Tkc9xZe4Ab4icP+sq8FFdi68fEiFKQllSUUkxUgbaZ3fWwhBvdYE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781535276;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=Pn12vlchHjVQB8lOnbgObSwAzbQoyOOc+YMsyec1nsc=;
	b=WFOwNHwyAK+gEXB/INZZAVODr7+XqO+SlOhoTjIp/H0/OyjgErlZSbUZ7dVCTBjd
	MIiBx5MIx92jWIp6upfg1aVDrlgRge5WiDOIDR+39vFpQUkiwsXcxc0GeEVoa5D6dvM
	w/4ibM+pZlVpy2cNglNFV0hAo1bP64tPM7auSxsU=
Received: by mx.zohomail.com with SMTPS id 1781535274044738.1958510421996;
	Mon, 15 Jun 2026 07:54:34 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 15 Jun 2026 10:54:10 -0400
Subject: [PATCH] ASoC: cs35l41: Restore register state after system sleep
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
X-B4-Tracking: v=1; b=H4sIABESMGoC/x3M3QpAQBBA4VfRXJuy1k+8ilysMZgS2w5S8u42l
 9/FOQ8oB2GFNnkg8CUq+xZh0gRocdvMKGM05FleZZUpkdSWa2FQC9TT+z0c6ByZxo410eAghj7
 wJPc/7fr3/QDM2WT8ZAAAAA==
X-Change-ID: 20260615-cs35l41-s4-support-aac193d7ccba
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

Currently, on the Steam Deck LCD when the system goes into hibernation
and resumes back, the speakers are silent when playing with:

  aplay -D plughw:acp5x,1 /usr/share/sounds/alsa/Front_Left.wav

A crude workaround was to, after resuming the system, bypassing the
regmap cache on the cs35l41 devices, before playing:

  echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:00/cache_bypass
  echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:01/cache_bypass

That indicated that the hardware registers had gone out of sync with
the regmap cache due to the power down in system hibernation.

Fix the issue by, before system sleep, marking the regcache as cache
only, and after system sleep, resetting the hardware and restoring the
hardware registers from the regcache.

This gets the sound working on the Steam Deck LCD after resume from S4.

While the issue was only observed on S4 on this platform, the callbacks
for suspend/resume are also set in the same way to account for platforms
that might power down the chip on S3 as well.

Note that this change does not take care of restoring the DSP state,
since the affected platform does not use the DSP and it couldn't be
tested, so it is only shut down on resume so it can be reinitialized in
a future DSP preload event.

Assisted-by: Copilot:claude-sonnet-4.6
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/cs35l41.c | 127 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b2a076706c79..231341a7eb44 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1199,9 +1199,41 @@ static int cs35l41_get_system_name(struct cs35l41_private *cs35l41)
 	return ret;
 }
 
+static int cs35l41_boot(struct cs35l41_private *cs35l41)
+{
+	u32 int_status;
+	int ret;
+
+	if (cs35l41->reset_gpio) {
+		/* satisfy minimum reset pulse width spec */
+		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
+		usleep_range(2000, 2100);
+		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
+	}
+
+	usleep_range(2000, 2100);
+
+	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4,
+				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
+				       1000, 100000);
+	if (ret) {
+		dev_err_probe(cs35l41->dev, ret,
+			      "Failed waiting for OTP_BOOT_DONE\n");
+		return ret;
+	}
+
+	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
+	if (int_status & CS35L41_OTP_BOOT_ERR) {
+		dev_err(cs35l41->dev, "OTP Boot error\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
-	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
+	u32 regid, reg_revid, i, mtl_revid, chipid_match;
 	int irq_pol = 0;
 	int ret;
 
@@ -1242,29 +1274,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 			goto err;
 		}
 	}
-	if (cs35l41->reset_gpio) {
-		/* satisfy minimum reset pulse width spec */
-		usleep_range(2000, 2100);
-		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
-	}
-
-	usleep_range(2000, 2100);
-
-	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4,
-				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
-				       1000, 100000);
-	if (ret) {
-		dev_err_probe(cs35l41->dev, ret,
-			      "Failed waiting for OTP_BOOT_DONE\n");
-		goto err;
-	}
 
-	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
-	if (int_status & CS35L41_OTP_BOOT_ERR) {
-		dev_err(cs35l41->dev, "OTP Boot error\n");
-		ret = -EINVAL;
+	ret = cs35l41_boot(cs35l41);
+	if (ret)
 		goto err;
-	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
 	if (ret < 0) {
@@ -1450,7 +1463,20 @@ static int cs35l41_sys_suspend(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 
-	dev_dbg(cs35l41->dev, "System suspend, disabling IRQ\n");
+	dev_dbg(cs35l41->dev, "System suspend, saving state\n");
+	disable_irq(cs35l41->irq);
+
+	regcache_cache_only(cs35l41->regmap, true);
+	regcache_mark_dirty(cs35l41->regmap);
+
+	return 0;
+}
+
+static int cs35l41_sys_poweroff(struct device *dev)
+{
+	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l41->dev, "System poweroff, disabling IRQ\n");
 	disable_irq(cs35l41->irq);
 
 	return 0;
@@ -1476,20 +1502,71 @@ static int cs35l41_sys_resume_noirq(struct device *dev)
 	return 0;
 }
 
+static int cs35l41_sys_thaw(struct device *dev)
+{
+	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l41->dev, "System thaw, reenabling IRQ\n");
+	enable_irq(cs35l41->irq);
+
+	return 0;
+}
+
 static int cs35l41_sys_resume(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
+	int ret;
+
+	dev_dbg(cs35l41->dev, "System resume, restoring state\n");
+
+	regcache_cache_only(cs35l41->regmap, false);
+
+	ret = cs35l41_boot(cs35l41);
+	if (ret)
+		return ret;
+
+	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+	ret = regcache_sync(cs35l41->regmap);
+	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+	if (ret) {
+		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
+		return ret;
+	}
+
+	ret = cs35l41_init_boost(cs35l41->dev, cs35l41->regmap,
+				 &cs35l41->hw_cfg);
+	if (ret)
+		return ret;
 
-	dev_dbg(cs35l41->dev, "System resume, reenabling IRQ\n");
 	enable_irq(cs35l41->irq);
 
+	if (!cs35l41->dsp.cs_dsp.running)
+		return 0;
+
+	/*
+	 * DSP firmware is gone after a full power cycle. Reset the DSP
+	 * software state so that firmware is reloaded on next DSP preload event
+	 */
+	wm_adsp_stop(&cs35l41->dsp);
+
+	if (!cs35l41->dsp.cs_dsp.booted)
+		return 0;
+
+	wm_adsp_power_down(&cs35l41->dsp);
+
 	return 0;
 }
 
 EXPORT_GPL_DEV_PM_OPS(cs35l41_pm_ops) = {
 	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
 
-	SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend, cs35l41_sys_resume)
+	.suspend  = pm_sleep_ptr(cs35l41_sys_suspend),
+	.resume   = pm_sleep_ptr(cs35l41_sys_resume),
+	.freeze   = pm_sleep_ptr(cs35l41_sys_suspend),
+	.thaw     = pm_sleep_ptr(cs35l41_sys_thaw),
+	.poweroff = pm_sleep_ptr(cs35l41_sys_poweroff),
+	.restore  = pm_sleep_ptr(cs35l41_sys_resume),
+
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend_noirq, cs35l41_sys_resume_noirq)
 };
 

---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-cs35l41-s4-support-aac193d7ccba

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

