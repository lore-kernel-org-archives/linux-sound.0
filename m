Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969D31A57D
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502616; cv=none; b=ghO/78DjMc3dmoPkk6DKWyI2wwLS+sVSHlhLH8FlB9u6f5hAm6IMegb5bHAMAXq3SeZQwQJtb4XIl3ivgdTqkprz9oWP6tHIu+qzft40QBoW081bxEfGWZhBXpaUm6OzBF+JUfWD1VmFA96Q78bdQCgTSyp18nTiLQUZZ5pDN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502616; c=relaxed/simple;
	bh=hCbd4HyML+9B5igkmgsbU+LoBQChPNqr8Pnrph0a8IE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keNnlnX6OezjCIdJn2f5/adxvEWFeE5rS1ndtUsucC2o6suHS0iOBNhBRdBxI3c8wWssDCqKGDk3XrqW/iXqmNCjoqucgfbTJcy8jdC8IefOyP5QoEHfXTP0LWZreHra8uPs2/emc3X2YatCZ/SNgv67eHaBz+jMzgiSdKwCctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OAFCIvOC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=reds2M0c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OAFCIvOC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=reds2M0c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OAFCIvOC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="reds2M0c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OAFCIvOC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="reds2M0c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1852A378A1;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ULzo6WXSj3KuRMFqZpsqB7IuNNGyxxvP3RZtzApKcA=;
	b=OAFCIvOCGxSZ9E6fwydf+30nKyl4k0DXh2u6emCV1isY55MgBvfFXUmq/HVA/WpQEEtZ4V
	YFgrWMm3XMirdfWQ2yxsUPDJVTMxNUDh+a3YwpW4UF3mDSZxibo0V5mai8WtrsscE4oLet
	LFSHJ9ZFy57bXqmBSChqrVyskqnbYaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ULzo6WXSj3KuRMFqZpsqB7IuNNGyxxvP3RZtzApKcA=;
	b=reds2M0cVK2svXG4yDkpCfzXQG++5EMmlwws3vg4k9pgq8lSuyLu9bVH1DmLzhXuxH/h0u
	EALHIqFT4rE3yoBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OAFCIvOC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=reds2M0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ULzo6WXSj3KuRMFqZpsqB7IuNNGyxxvP3RZtzApKcA=;
	b=OAFCIvOCGxSZ9E6fwydf+30nKyl4k0DXh2u6emCV1isY55MgBvfFXUmq/HVA/WpQEEtZ4V
	YFgrWMm3XMirdfWQ2yxsUPDJVTMxNUDh+a3YwpW4UF3mDSZxibo0V5mai8WtrsscE4oLet
	LFSHJ9ZFy57bXqmBSChqrVyskqnbYaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ULzo6WXSj3KuRMFqZpsqB7IuNNGyxxvP3RZtzApKcA=;
	b=reds2M0cVK2svXG4yDkpCfzXQG++5EMmlwws3vg4k9pgq8lSuyLu9bVH1DmLzhXuxH/h0u
	EALHIqFT4rE3yoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF0A113A54;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gNIyOXlcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/14] ALSA: usb: fcp: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:25 +0200
Message-ID: <20250910110932.15234-11-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910110932.15234-1-tiwai@suse.de>
References: <20250910110932.15234-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1852A378A1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/fcp.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 98f9964311a7..5ee8d8b66058 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -820,7 +820,6 @@ static long fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
 {
 	struct usb_mixer_interface *mixer = hw->private_data;
 	struct fcp_data *private = mixer->private_data;
-	unsigned long flags;
 	long ret = 0;
 	u32 event;
 
@@ -832,10 +831,10 @@ static long fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&private->notify.lock, flags);
-	event = private->notify.event;
-	private->notify.event = 0;
-	spin_unlock_irqrestore(&private->notify.lock, flags);
+	scoped_guard(spinlock_irqsave, &private->notify.lock) {
+		event = private->notify.event;
+		private->notify.event = 0;
+	}
 
 	if (copy_to_user(buf, &event, sizeof(event)))
 		return -EFAULT;
@@ -946,11 +945,9 @@ static void fcp_notify(struct urb *urb)
 	}
 
 	if (data) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&private->notify.lock, flags);
-		private->notify.event |= data;
-		spin_unlock_irqrestore(&private->notify.lock, flags);
+		scoped_guard(spinlock_irqsave, &private->notify.lock) {
+			private->notify.event |= data;
+		}
 
 		wake_up_interruptible(&private->notify.queue);
 	}
-- 
2.50.1

