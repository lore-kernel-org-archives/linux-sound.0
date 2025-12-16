Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93522579E
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894329; cv=none; b=fvmMw5uiIkUKUfNilWqUiuwQe6MyKNeOyQwJYIYUeX5eu5/Fl7IfF0NYcQ+KcAmtDV2QQxotzR5W8WWX/F1JltZFDZM4aP4iey9hTbec2FNPCYJK0BdW1bG5hitFcWgtPTHqlzSB6jdJWuHnN1BI4KODLgnjAWl/JTd0EumwRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894329; c=relaxed/simple;
	bh=CQlmKHo0HXrPY/D1CuaCh+yyLbTR7gATEQ0GozQI0p0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfedosBcDJ6IzirwgP1SJLhf9vy82nRW4OcCdcOXp4FB0PEvDnOuV3WUldAcZtS/WtexLThW0LfMsAlfPkfRSq5m4+FjaOKg5Ga0clVb6+iAq8X/sf53C4oU8KUEziA9DXsph/p0uhS2FUwFLjUYlNAxNZGwtIVG7THvsvdBIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xo0ethsO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=auw2vEof; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xo0ethsO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=auw2vEof; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xo0ethsO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="auw2vEof";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xo0ethsO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="auw2vEof"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FF9B5BCDE;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYCqxTz7319UfCGeqx/Q4avfW0UkfayXllTxF0TShcI=;
	b=xo0ethsOooQJWQORg2asR3HjG2svBOHnqCsivrxG0SUigQQXowUQWL5cU5h73Rn8BUZpBd
	Jf+D5wUomlpkT2eJU5yB7H6ljUUUhoPfg0Erip7D7pu9u/UI86Fqk69UrUZXWqIJdFfbCZ
	E5yb4LfJ/EDf81H5fLmXHL8lsgiZ8Ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYCqxTz7319UfCGeqx/Q4avfW0UkfayXllTxF0TShcI=;
	b=auw2vEofoT8Vccrwh/RxOsUv04yWZzOE5PM516/tICCbUJwWVLSXAWPf78qjbZSLwl64tJ
	j3s6dB/MaC/3alAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xo0ethsO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=auw2vEof
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYCqxTz7319UfCGeqx/Q4avfW0UkfayXllTxF0TShcI=;
	b=xo0ethsOooQJWQORg2asR3HjG2svBOHnqCsivrxG0SUigQQXowUQWL5cU5h73Rn8BUZpBd
	Jf+D5wUomlpkT2eJU5yB7H6ljUUUhoPfg0Erip7D7pu9u/UI86Fqk69UrUZXWqIJdFfbCZ
	E5yb4LfJ/EDf81H5fLmXHL8lsgiZ8Ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYCqxTz7319UfCGeqx/Q4avfW0UkfayXllTxF0TShcI=;
	b=auw2vEofoT8Vccrwh/RxOsUv04yWZzOE5PM516/tICCbUJwWVLSXAWPf78qjbZSLwl64tJ
	j3s6dB/MaC/3alAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12F143EA65;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cFYcBLZoQWk7OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:12:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ALSA: hda/cs35l41: Clean up runtime PM with guard()
Date: Tue, 16 Dec 2025 15:11:46 +0100
Message-ID: <20251216141154.172218-2-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216141154.172218-1-tiwai@suse.de>
References: <20251216141154.172218-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: 1FF9B5BCDE
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

Replace the manual pm_runtime_get_sync() and
pm_runtime_put_autosuspend() calls with the new
guard(pm_runtime_active_auto) for code simplification.

Along with this change, the former scoped_guard(mutex) can be set back
to the plain guard(mutex), and the indent level is taken back, too.

Merely code cleanups, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 23 +++++++++-------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 21e00055c0c4..b64890006bb7 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1255,19 +1255,16 @@ static void cs35l41_fw_load_work(struct work_struct *work)
 {
 	struct cs35l41_hda *cs35l41 = container_of(work, struct cs35l41_hda, fw_load_work);
 
-	pm_runtime_get_sync(cs35l41->dev);
+	guard(pm_runtime_active_auto)(cs35l41->dev);
 
-	scoped_guard(mutex, &cs35l41->fw_mutex) {
-		/* Recheck if playback is ongoing, mutex will block playback during firmware loading */
-		if (cs35l41->playback_started)
-			dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback. Retrying...\n");
-		else
-			cs35l41_load_firmware(cs35l41, cs35l41->request_fw_load);
+	guard(mutex)(&cs35l41->fw_mutex);
+	/* Recheck if playback is ongoing, mutex will block playback during firmware loading */
+	if (cs35l41->playback_started)
+		dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback. Retrying...\n");
+	else
+		cs35l41_load_firmware(cs35l41, cs35l41->request_fw_load);
 
-		cs35l41->fw_request_ongoing = false;
-	}
-
-	pm_runtime_put_autosuspend(cs35l41->dev);
+	cs35l41->fw_request_ongoing = false;
 }
 
 static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
@@ -1455,7 +1452,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	if (comp->dev)
 		return -EBUSY;
 
-	pm_runtime_get_sync(dev);
+	guard(pm_runtime_active_auto)(dev);
 
 	mutex_lock(&cs35l41->fw_mutex);
 
@@ -1499,8 +1496,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		dev_warn(dev, "Unable to create device link\n");
 	unlock_system_sleep(sleep_flags);
 
-	pm_runtime_put_autosuspend(dev);
-
 	dev_info(cs35l41->dev,
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
 		 cs35l41->acpi_subsystem_id, cs35l41->hw_cfg.bst_type,
-- 
2.52.0

