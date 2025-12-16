Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09233067D
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894350; cv=none; b=R1d0Tcp5zT3l1UisCnobWyufMuohAUvcNOSl9QDDdwUeETkKpcKOeOqkqfo5+Z75cS542oTuXwqPZFg9IBhNfXicKsAHa8BBZwF7Pieh5144H8PHwsCfRamX0nMpWciCFwQhyJj044X/4YFHx7U3vDIIQ/ey54e/F6mgEtDzSv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894350; c=relaxed/simple;
	bh=KuHkg4BYVcbKN5IzkFpmue5CskNQTOLLB+jxSGmy+lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+qzd/+Ppwb+Lquh204obxIJC8d8eVKwhI/HrZ87VpNszw6pVh7ljuAAFPJc1J1XfY+Ma3/VSnyk5VAU1+M4Ln1ge+4jncrI6OBZaLmWqg3zskdN1fj0DY3Nd/UNavEfw7TYji4+gkFK7jNHSmYdFOCuDSL94s1tVjoXJdRhiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tq2eLtRx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F6l0yyIP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QsogZRQD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eEMixff5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tq2eLtRx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F6l0yyIP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QsogZRQD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eEMixff5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF0295BCE3;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fP314ktdFj7Xk90JKszIJfI2zY5oGdI7hBVeo2/hyU=;
	b=Tq2eLtRxWkCu+mHCrl/YnD+0pivodwMeqDuE5zL+3n+Zja7Uw5oJg+uK32R9BKsJx6/3JF
	NFRSTsNpAXe/sKLk9nvcgQtFxjeDBkwy2ZaxeeuQRDOAsa/deSMEBXe/t62JFycwaCdGPD
	udQFfDYYe8kSf4A1e0umWo5dPuT2F7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fP314ktdFj7Xk90JKszIJfI2zY5oGdI7hBVeo2/hyU=;
	b=F6l0yyIPybKfZco7ObBWZh5K4bi/RkAK928Qbf5Sb6qkh5N9AZcIUNxxpfu221QrjGC5mW
	VonD4vff3rkcBtDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QsogZRQD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eEMixff5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fP314ktdFj7Xk90JKszIJfI2zY5oGdI7hBVeo2/hyU=;
	b=QsogZRQDCPSNHOk+W6BF4BMTNHwFZw+/nCu847uGnwBb0jzgS0aG5Ujd1x2pXwfzmB4HsS
	Vn2+lCAeEO7qU0NBiwWGcgdRr/PItGtGDSED9PZ435rdnxsSdMeTvnjD8avwJbdLnuL8S0
	PkAkCPjLVJQn23WC5nr743QktIiLvfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fP314ktdFj7Xk90JKszIJfI2zY5oGdI7hBVeo2/hyU=;
	b=eEMixff50a6ntQeeApAPgy3uIR5XmlZNP+dVVZ+tGM6veK2ra1JMVg1hXyVloadgFRLAGS
	7WPSCY30WuZ4zFCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97ABA3EA63;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4I96JLZoQWk7OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:12:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/5] ALSA: x86: Clean up locks and runtime PM with guard() and co
Date: Tue, 16 Dec 2025 15:11:50 +0100
Message-ID: <20251216141154.172218-6-tiwai@suse.de>
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
X-Rspamd-Queue-Id: AF0295BCE3
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
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

Use PM_RUNTIME_ACQUIRE_*() and guard() for replacing the manual calls
of runtime PM and mutex lock in had_audio_wq().

Merely code cleanups and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 8e2a007311d3..f5807fc73c54 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1517,13 +1517,12 @@ static void had_audio_wq(struct work_struct *work)
 		container_of(work, struct snd_intelhad, hdmi_audio_wq);
 	struct intel_hdmi_lpe_audio_pdata *pdata = ctx->dev->platform_data;
 	struct intel_hdmi_lpe_audio_port_pdata *ppdata = &pdata->port[ctx->port];
-	int ret;
 
-	ret = pm_runtime_resume_and_get(ctx->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(ctx->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
 		return;
 
-	mutex_lock(&ctx->mutex);
+	guard(mutex)(&ctx->mutex);
 	if (ppdata->pipe < 0) {
 		dev_dbg(ctx->dev, "%s: Event: HAD_NOTIFY_HOT_UNPLUG : port = %d\n",
 			__func__, ctx->port);
@@ -1564,9 +1563,6 @@ static void had_audio_wq(struct work_struct *work)
 		/* Restart the stream if necessary */
 		had_process_mode_change(ctx);
 	}
-
-	mutex_unlock(&ctx->mutex);
-	pm_runtime_put_autosuspend(ctx->dev);
 }
 
 /*
-- 
2.52.0

