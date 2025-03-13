Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639B15748F
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885687; cv=none; b=ZCwTXOeVqBti5t4tf+WJvClWhvhaToFfEwPBc8jy9DXmXX+UfYy5YavWMFOUlZ49AOgx26/6sHnIWWPJIq7qNQVz5ZnlcrfSIgKzh9R2gGESnbN+ezpoTsECA0vISkfkHmJbOP6sh6PDQmHub91WyAe6xyAmuI4HMTy7nOWOBco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885687; c=relaxed/simple;
	bh=hOddHI8wBa7MHUBXCYQGAdjw49wHbyMwm/WfuDUXUKc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJmuURCymOlISsJDDR9GiiF2VsMnkL+wKO68S62u2HmbyIeTXlSivEmKTCveILmi+PFQUG1Snhk7KLmqd9fu2pK0Fb2y2+NND2PctV2ZWJQlaNHKsb/cWFbcwyq7VxkIWGxZNNe0ek5mLwc8ryVdkJT/SoIvmsI2kvKl9sxMPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oVaz/FX3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=av6Qvjqr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oVaz/FX3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=av6Qvjqr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oVaz/FX3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="av6Qvjqr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oVaz/FX3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="av6Qvjqr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5541A1F786;
	Thu, 13 Mar 2025 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8ZWZo0UZhF4YB7OSeiqMLZnrUSNvOsG0pX3ImaUuUE=;
	b=oVaz/FX3H/FKAWOskXCrGirOLpWn9HdBs1fGdYv5eJP8A7jv/KrOgr9U7gIAEa4PBaqoIL
	vPSONKk7HctlWtZ0qicn8eApKeq6LAoO1QV/v+azB5kFydmZAxWcaJgUs1td82WMMKUyMX
	mLbj2WHqcu95l2fHHBDyDFO1Wvuy+OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8ZWZo0UZhF4YB7OSeiqMLZnrUSNvOsG0pX3ImaUuUE=;
	b=av6QvjqrFyQbcykTzb9YOtbCQPxTWrSbnSK5837Fn7mcDWHU7ksHz9EgZMynbUTwL41EoI
	UsaOY1Ktdad0XuAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8ZWZo0UZhF4YB7OSeiqMLZnrUSNvOsG0pX3ImaUuUE=;
	b=oVaz/FX3H/FKAWOskXCrGirOLpWn9HdBs1fGdYv5eJP8A7jv/KrOgr9U7gIAEa4PBaqoIL
	vPSONKk7HctlWtZ0qicn8eApKeq6LAoO1QV/v+azB5kFydmZAxWcaJgUs1td82WMMKUyMX
	mLbj2WHqcu95l2fHHBDyDFO1Wvuy+OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8ZWZo0UZhF4YB7OSeiqMLZnrUSNvOsG0pX3ImaUuUE=;
	b=av6QvjqrFyQbcykTzb9YOtbCQPxTWrSbnSK5837Fn7mcDWHU7ksHz9EgZMynbUTwL41EoI
	UsaOY1Ktdad0XuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B48413797;
	Thu, 13 Mar 2025 17:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IEFMDNkQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: intel-hdmi-audio: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:07:27 +0100
Message-ID: <20250313170731.26943-10-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unused attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index d41ea09ffbe5..7fcc528a0204 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1617,7 +1617,7 @@ static int had_create_jack(struct snd_intelhad *ctx,
  * PM callbacks
  */
 
-static int __maybe_unused hdmi_lpe_audio_suspend(struct device *dev)
+static int hdmi_lpe_audio_suspend(struct device *dev)
 {
 	struct snd_intelhad_card *card_ctx = dev_get_drvdata(dev);
 
@@ -1626,7 +1626,7 @@ static int __maybe_unused hdmi_lpe_audio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused hdmi_lpe_audio_resume(struct device *dev)
+static int hdmi_lpe_audio_resume(struct device *dev)
 {
 	struct snd_intelhad_card *card_ctx = dev_get_drvdata(dev);
 
@@ -1833,13 +1833,13 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops hdmi_lpe_audio_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(hdmi_lpe_audio_suspend, hdmi_lpe_audio_resume)
+	SYSTEM_SLEEP_PM_OPS(hdmi_lpe_audio_suspend, hdmi_lpe_audio_resume)
 };
 
 static struct platform_driver hdmi_lpe_audio_driver = {
 	.driver		= {
 		.name  = "hdmi-lpe-audio",
-		.pm = &hdmi_lpe_audio_pm,
+		.pm = pm_ptr(&hdmi_lpe_audio_pm),
 	},
 	.probe          = hdmi_lpe_audio_probe,
 };
-- 
2.43.0

