Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116503128DA
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387718; cv=none; b=tIM6w2EuHcGVeLnEHjAx7L1OQENiZd2qk7S+Wtim1VSOLwI+50iGUyd1N2l0QQzkxByhMDtMgRky7EjOyTFyBdDBFb2Vt0UhnaLauM272Bj6slbFZkp77qp1yr9JTUCP5jTrEjjCszwwNguJ/nIb4dp1d+JCbLSJXLrI2sBr8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387718; c=relaxed/simple;
	bh=PKyPXxUTx7BYCPVc+XrH8B2SFcbi78oGZvLUEOLzCOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyxzVi4LSk/GEzLE0XCvivWD4bVck09NdbQbsIYqy/2cEJI4ld2JebgAswVxmtyo6Fp5SivwXJqIkKBZmv2OViDW8FdA6rbeG5cvJ6vfBr7w2/eoyvdoYk12eCqRi4sVbTjHiwvfHqQyrZT9fXTsG0fY5JutPrqz1I38PKa7Wpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vqNWzssS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MOfcm+tK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vqNWzssS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MOfcm+tK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vqNWzssS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MOfcm+tK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vqNWzssS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MOfcm+tK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5D2922DB6;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=vqNWzssSKrDppojP5cA9XMrGn2GlWlTYrb80ON4UyAqo5qYoKLcmQMno17t/p2XEah3zOD
	bW09HqC69zVWdpZx8uDf3DXzPyB3ZWC3lnhkMJGToB5NpthvvrRdDofWPINV6G/CyRmO/8
	ME2pIRxSJmXaWRL0RUtb2OymerN6Hlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=MOfcm+tKUl0kia27Uk3TSvRk+mrTOpZMhjcF6VGtw3aWOFEvHoXZYlWD+yxqqfFYVK6WDQ
	jqviSqNeE8SmYXBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vqNWzssS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MOfcm+tK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=vqNWzssSKrDppojP5cA9XMrGn2GlWlTYrb80ON4UyAqo5qYoKLcmQMno17t/p2XEah3zOD
	bW09HqC69zVWdpZx8uDf3DXzPyB3ZWC3lnhkMJGToB5NpthvvrRdDofWPINV6G/CyRmO/8
	ME2pIRxSJmXaWRL0RUtb2OymerN6Hlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsE2jkOzpn9k0lwga3q+t86VS3GDphu7jF6tc41MSrI=;
	b=MOfcm+tKUl0kia27Uk3TSvRk+mrTOpZMhjcF6VGtw3aWOFEvHoXZYlWD+yxqqfFYVK6WDQ
	jqviSqNeE8SmYXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1D1B1368B;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aEBAJmpZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 09/19] ALSA: firewire: isight: Use guard() for mutex locks
Date: Thu, 28 Aug 2025 15:27:13 +0200
Message-ID: <20250828132802.9032-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828132802.9032-1-tiwai@suse.de>
References: <20250828132802.9032-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C5D2922DB6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/isight.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index ee574b5d7406..2b7f071d593b 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -327,9 +327,8 @@ static int isight_hw_free(struct snd_pcm_substream *substream)
 
 	WRITE_ONCE(isight->pcm_active, false);
 
-	mutex_lock(&isight->mutex);
+	guard(mutex)(&isight->mutex);
 	isight_stop_streaming(isight);
-	mutex_unlock(&isight->mutex);
 
 	return 0;
 }
@@ -400,16 +399,12 @@ static int isight_start_streaming(struct isight *isight)
 static int isight_prepare(struct snd_pcm_substream *substream)
 {
 	struct isight *isight = substream->private_data;
-	int err;
 
 	isight->buffer_pointer = 0;
 	isight->period_counter = 0;
 
-	mutex_lock(&isight->mutex);
-	err = isight_start_streaming(isight);
-	mutex_unlock(&isight->mutex);
-
-	return err;
+	guard(mutex)(&isight->mutex);
+	return isight_start_streaming(isight);
 }
 
 static int isight_trigger(struct snd_pcm_substream *substream, int cmd)
@@ -677,9 +672,8 @@ static void isight_bus_reset(struct fw_unit *unit)
 	if (fw_iso_resources_update(&isight->resources) < 0) {
 		isight_pcm_abort(isight);
 
-		mutex_lock(&isight->mutex);
+		guard(mutex)(&isight->mutex);
 		isight_stop_streaming(isight);
-		mutex_unlock(&isight->mutex);
 	}
 }
 
@@ -691,9 +685,9 @@ static void isight_remove(struct fw_unit *unit)
 
 	snd_card_disconnect(isight->card);
 
-	mutex_lock(&isight->mutex);
-	isight_stop_streaming(isight);
-	mutex_unlock(&isight->mutex);
+	scoped_guard(mutex, &isight->mutex) {
+		isight_stop_streaming(isight);
+	}
 
 	// Block till all of ALSA character devices are released.
 	snd_card_free(isight->card);
-- 
2.50.1

