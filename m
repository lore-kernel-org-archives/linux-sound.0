Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9D1F3B98
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906933; cv=none; b=sl7uTo7ELs6y0f8LeUNFE3tEA0xduEj7QaO+EjWLG3vixCQUCtYoH1c8CDTV3ssovJyzoSmeN2bWT5CO5Oa/RbNeQCakUnrR0YnZBVU2Nzs9jAsblFr+7ks99iqNKxI0hf4XbLGOuXkGPFBMUa6Ht2wwan0nkhWKlN2gJ7PvHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906933; c=relaxed/simple;
	bh=sHUlO4SoK+DIqFRthbMvMzhlqOPcFz60LZ4HS2q1PFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIVsGfV9ueG/ZneUTH+fk6iKrzH/lqgpVd/fpJV7MqwOptMpc/Zn60Ji9+hdYmstbD2P89Yqjdibwjc/xMr83/kB0nTUp07pGrGzXApKt3oBSlV+xaqxyFL9QYXihWPTQpzjmyM0Taz2SHOZhL0+UmRhMcLDntkV5r9806iSckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SYlghJ4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S5uFRBWu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SYlghJ4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S5uFRBWu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SYlghJ4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S5uFRBWu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SYlghJ4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S5uFRBWu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E59C433E4C;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upa9Ph9N9XdOXlZTygGzizr2+Pw09R0mNnDhxKp+ezk=;
	b=SYlghJ4L07zvGDYSahYv8CbSzEaoU2slcAsd6PtTLTWIQ56C1fm0YZgT+TM6I/esVOT2hz
	bWVpXKREPK2wiiVASZ92Kqoa6vcVFGLNk6vYDdDUWrRdxTCjZ5Io8k5rgrJbogDNb3Dd+e
	r45rni+SpQjpLJOi4Yxi1OkIxMRyOXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upa9Ph9N9XdOXlZTygGzizr2+Pw09R0mNnDhxKp+ezk=;
	b=S5uFRBWu7truegBKv4vGSblE9GBaUYvo9IBK3mQhD9WwN9K7XBupvLzAef2GeJDpT6ZIq2
	501zXHVmDyPr5dCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upa9Ph9N9XdOXlZTygGzizr2+Pw09R0mNnDhxKp+ezk=;
	b=SYlghJ4L07zvGDYSahYv8CbSzEaoU2slcAsd6PtTLTWIQ56C1fm0YZgT+TM6I/esVOT2hz
	bWVpXKREPK2wiiVASZ92Kqoa6vcVFGLNk6vYDdDUWrRdxTCjZ5Io8k5rgrJbogDNb3Dd+e
	r45rni+SpQjpLJOi4Yxi1OkIxMRyOXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upa9Ph9N9XdOXlZTygGzizr2+Pw09R0mNnDhxKp+ezk=;
	b=S5uFRBWu7truegBKv4vGSblE9GBaUYvo9IBK3mQhD9WwN9K7XBupvLzAef2GeJDpT6ZIq2
	501zXHVmDyPr5dCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADD8913479;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CONUKQ/BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 12/25] ALSA: hda/cs35l41: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:46 +0200
Message-ID: <20250811100807.7962-13-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 110 +++++++++------------
 1 file changed, 47 insertions(+), 63 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 37f2cdc8ce82..c04208e685a0 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -624,11 +624,10 @@ static void cs35l41_remove_dsp(struct cs35l41_hda *cs35l41)
 
 	cancel_work_sync(&cs35l41->fw_load_work);
 
-	mutex_lock(&cs35l41->fw_mutex);
+	guard(mutex)(&cs35l41->fw_mutex);
 	cs35l41_shutdown_dsp(cs35l41);
 	cs_dsp_remove(dsp);
 	cs35l41->halo_initialized = false;
-	mutex_unlock(&cs35l41->fw_mutex);
 }
 
 /* Protection release cycle to get the speaker out of Safe-Mode */
@@ -790,9 +789,9 @@ static void cs35l41_hda_pre_playback_hook(struct device *dev, int action)
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_CLEANUP:
-		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_pause_start(dev);
-		mutex_unlock(&cs35l41->fw_mutex);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			cs35l41_hda_pause_start(dev);
+		}
 		break;
 	default:
 		break;
@@ -813,24 +812,24 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
-		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_play_start(dev);
-		mutex_unlock(&cs35l41->fw_mutex);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			cs35l41_hda_play_start(dev);
+		}
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
-		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_pause_done(dev);
-		mutex_unlock(&cs35l41->fw_mutex);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			cs35l41_hda_pause_done(dev);
+		}
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		mutex_lock(&cs35l41->fw_mutex);
-		if (!cs35l41->cs_dsp.running && cs35l41->request_fw_load &&
-		    !cs35l41->fw_request_ongoing) {
-			dev_info(dev, "Requesting Firmware Load after HDA_GEN_PCM_ACT_CLOSE\n");
-			cs35l41->fw_request_ongoing = true;
-			schedule_work(&cs35l41->fw_load_work);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			if (!cs35l41->cs_dsp.running && cs35l41->request_fw_load &&
+			    !cs35l41->fw_request_ongoing) {
+				dev_info(dev, "Requesting Firmware Load after HDA_GEN_PCM_ACT_CLOSE\n");
+				cs35l41->fw_request_ongoing = true;
+				schedule_work(&cs35l41->fw_load_work);
+			}
 		}
-		mutex_unlock(&cs35l41->fw_mutex);
 
 		/*
 		 * Playback must be finished for all amps before we start runtime suspend.
@@ -849,9 +848,9 @@ static void cs35l41_hda_post_playback_hook(struct device *dev, int action)
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_PREPARE:
-		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_play_done(dev);
-		mutex_unlock(&cs35l41->fw_mutex);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			cs35l41_hda_play_done(dev);
+		}
 		break;
 	default:
 		break;
@@ -917,13 +916,12 @@ static int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, u
 
 static int cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
 {
-	mutex_lock(&cs35l41->fw_mutex);
+	guard(mutex)(&cs35l41->fw_mutex);
 	if (cs35l41->cs_dsp.running) {
 		cs35l41->cs_dsp.running = false;
 		cs35l41->cs_dsp.booted = false;
 	}
 	regcache_mark_dirty(cs35l41->regmap);
-	mutex_unlock(&cs35l41->fw_mutex);
 
 	return 0;
 }
@@ -939,10 +937,9 @@ static int cs35l41_system_suspend_prep(struct device *dev)
 		return 0; /* don't block the whole system suspend */
 	}
 
-	mutex_lock(&cs35l41->fw_mutex);
+	guard(mutex)(&cs35l41->fw_mutex);
 	if (cs35l41->playback_started)
 		cs35l41_hda_pause_start(dev);
-	mutex_unlock(&cs35l41->fw_mutex);
 
 	return 0;
 }
@@ -959,10 +956,10 @@ static int cs35l41_system_suspend(struct device *dev)
 		return 0; /* don't block the whole system suspend */
 	}
 
-	mutex_lock(&cs35l41->fw_mutex);
-	if (cs35l41->playback_started)
-		cs35l41_hda_pause_done(dev);
-	mutex_unlock(&cs35l41->fw_mutex);
+	scoped_guard(mutex, &cs35l41->fw_mutex) {
+		if (cs35l41->playback_started)
+			cs35l41_hda_pause_done(dev);
+	}
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret) {
@@ -1047,13 +1044,12 @@ static int cs35l41_system_resume(struct device *dev)
 		return ret;
 	}
 
-	mutex_lock(&cs35l41->fw_mutex);
+	guard(mutex)(&cs35l41->fw_mutex);
 
 	if (cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
 		cs35l41->fw_request_ongoing = true;
 		schedule_work(&cs35l41->fw_load_work);
 	}
-	mutex_unlock(&cs35l41->fw_mutex);
 
 	return ret;
 }
@@ -1070,7 +1066,7 @@ static int cs35l41_runtime_idle(struct device *dev)
 static int cs35l41_runtime_suspend(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	int ret = 0;
+	int ret;
 
 	dev_dbg(cs35l41->dev, "Runtime Suspend\n");
 
@@ -1079,13 +1075,13 @@ static int cs35l41_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	mutex_lock(&cs35l41->fw_mutex);
+	guard(mutex)(&cs35l41->fw_mutex);
 
 	if (cs35l41->cs_dsp.running) {
 		ret = cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap,
 					      cs35l41->hw_cfg.bst_type);
 		if (ret)
-			goto err;
+			return ret;
 	} else {
 		cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 	}
@@ -1093,17 +1089,14 @@ static int cs35l41_runtime_suspend(struct device *dev)
 	regcache_cache_only(cs35l41->regmap, true);
 	regcache_mark_dirty(cs35l41->regmap);
 
-err:
-	mutex_unlock(&cs35l41->fw_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int cs35l41_runtime_resume(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	unsigned int regid, reg_revid;
-	int ret = 0;
+	int ret;
 
 	dev_dbg(cs35l41->dev, "Runtime Resume\n");
 
@@ -1112,7 +1105,7 @@ static int cs35l41_runtime_resume(struct device *dev)
 		return 0;
 	}
 
-	mutex_lock(&cs35l41->fw_mutex);
+	guard(mutex)(&cs35l41->fw_mutex);
 
 	regcache_cache_only(cs35l41->regmap, false);
 
@@ -1120,13 +1113,13 @@ static int cs35l41_runtime_resume(struct device *dev)
 		ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
 		if (ret) {
 			dev_warn(cs35l41->dev, "Unable to exit Hibernate.");
-			goto err;
+			return ret;
 		}
 	}
 
 	ret = cs35l41_verify_id(cs35l41, &regid, &reg_revid);
 	if (ret)
-		goto err;
+		return ret;
 
 	/* Test key needs to be unlocked to allow the OTP settings to re-apply */
 	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
@@ -1134,7 +1127,7 @@ static int cs35l41_runtime_resume(struct device *dev)
 	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
 	if (ret) {
 		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
@@ -1142,22 +1135,14 @@ static int cs35l41_runtime_resume(struct device *dev)
 
 	dev_dbg(cs35l41->dev, "CS35L41 Resumed (%x), Revision: %02X\n", regid, reg_revid);
 
-err:
-	mutex_unlock(&cs35l41->fw_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int cs35l41_hda_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 				unsigned int alg, void *buf, size_t len)
 {
-	int ret;
-
-	mutex_lock(&dsp->pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
-	mutex_unlock(&dsp->pwr_lock);
-
-	return ret;
+	guard(mutex)(&dsp->pwr_lock);
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
 }
 
 static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
@@ -1272,16 +1257,15 @@ static void cs35l41_fw_load_work(struct work_struct *work)
 
 	pm_runtime_get_sync(cs35l41->dev);
 
-	mutex_lock(&cs35l41->fw_mutex);
+	scoped_guard(mutex, &cs35l41->fw_mutex) {
+		/* Recheck if playback is ongoing, mutex will block playback during firmware loading */
+		if (cs35l41->playback_started)
+			dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback. Retrying...\n");
+		else
+			cs35l41_load_firmware(cs35l41, cs35l41->request_fw_load);
 
-	/* Recheck if playback is ongoing, mutex will block playback during firmware loading */
-	if (cs35l41->playback_started)
-		dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback. Retrying...\n");
-	else
-		cs35l41_load_firmware(cs35l41, cs35l41->request_fw_load);
-
-	cs35l41->fw_request_ongoing = false;
-	mutex_unlock(&cs35l41->fw_mutex);
+		cs35l41->fw_request_ongoing = false;
+	}
 
 	pm_runtime_put_autosuspend(cs35l41->dev);
 }
-- 
2.50.1

