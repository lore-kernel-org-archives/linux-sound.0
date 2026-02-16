Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD41FF1B4
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251160; cv=none; b=IENgcyovsjDkmTkoeTLd124VLLtY0FrsSexw3EpGDQpRXTCmuQEgylcpYyXUS/tS/vjLBGythdqwPZ8HSDnCDUp4TbjNWG+G6Y11A0Z7xqYwBQFW/WnSp2Al9LWuV7IEIebloPYRgMJO2DjcCXe3yEml3ImqXw6r4Q6oRQ00aVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251160; c=relaxed/simple;
	bh=Qwe9CxKCFzkFSGAis45V/5MQkDSwrqYkinmfDnpaRis=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksBKumB27WJb2wGmWm7HkE3XO7j66lGqjk8UwEV9HUv+koq8wa8XcNZH9jlN3pHN33FeVjdzPMtygTNikMKTtr8x5OGmbbnMCwLjHOnF2/NDdJ7zRqMBJZ3xHI5kFH42WleWDG5vRVlLl28YVSuidRdUFlT2U+C+lO90NElnskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HxJH5jyf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q9NgjrVr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HxJH5jyf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q9NgjrVr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HxJH5jyf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9NgjrVr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HxJH5jyf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9NgjrVr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 243463E859;
	Mon, 16 Feb 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgTDuVdnCphFaZbU2goiywef3uCxA5YuBaLR9TS9mlo=;
	b=HxJH5jyf4qoAcuFr4eMEAAD+kYXWrzep6bVeIY/+uFNRkMc0QSN1W9KP6d3LtuYtxmR332
	uv14meg99bMDE1ae7nRrCPV65H++S46WvbduIWxl/VqAhHy7S0uNfFrzjLDVMjZOdNSpmP
	yDpnKvXpisGl5yUCk520zL/yIs7BXqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgTDuVdnCphFaZbU2goiywef3uCxA5YuBaLR9TS9mlo=;
	b=q9NgjrVr8mF/7zHChWv4F5CCx/Kpr5AyIqcaSnCkWaedDf/MNBDX0j7crsJUvlvxLm1Jqm
	ZNuCmqg3+Q75nBAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HxJH5jyf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=q9NgjrVr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgTDuVdnCphFaZbU2goiywef3uCxA5YuBaLR9TS9mlo=;
	b=HxJH5jyf4qoAcuFr4eMEAAD+kYXWrzep6bVeIY/+uFNRkMc0QSN1W9KP6d3LtuYtxmR332
	uv14meg99bMDE1ae7nRrCPV65H++S46WvbduIWxl/VqAhHy7S0uNfFrzjLDVMjZOdNSpmP
	yDpnKvXpisGl5yUCk520zL/yIs7BXqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgTDuVdnCphFaZbU2goiywef3uCxA5YuBaLR9TS9mlo=;
	b=q9NgjrVr8mF/7zHChWv4F5CCx/Kpr5AyIqcaSnCkWaedDf/MNBDX0j7crsJUvlvxLm1Jqm
	ZNuCmqg3+Q75nBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1A0F3EA62;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YInDOb8lk2kTGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Feb 2026 14:12:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ALSA: usb-audio: Avoid potentially repeated XRUN error messages
Date: Mon, 16 Feb 2026 15:12:08 +0100
Message-ID: <20260216141209.1849200-5-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216141209.1849200-1-tiwai@suse.de>
References: <20260216141209.1849200-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 243463E859
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Some XRUN-related error messages may repeat themselves, because there
can be multiple pending packets.  Modify notify_xrun() function to
return whether it's being stopped or not, and show the error message
only once when the XRUN is actually handled.

Along with it, fix a typo of word package to packet in the error
message.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 6e443f762de8..a855b2cc60c7 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -402,18 +402,21 @@ static int prepare_inbound_urb(struct snd_usb_endpoint *ep,
 }
 
 /* notify an error as XRUN to the assigned PCM data substream */
-static void notify_xrun(struct snd_usb_endpoint *ep)
+static bool notify_xrun(struct snd_usb_endpoint *ep)
 {
 	struct snd_usb_substream *data_subs;
 	struct snd_pcm_substream *psubs;
 
 	data_subs = READ_ONCE(ep->data_subs);
 	if (!data_subs)
-		return;
+		return false;
 	psubs = data_subs->pcm_substream;
 	if (psubs && psubs->runtime &&
-	    psubs->runtime->state == SNDRV_PCM_STATE_RUNNING)
+	    psubs->runtime->state == SNDRV_PCM_STATE_RUNNING) {
 		snd_pcm_stop_xrun(psubs);
+		return true;
+	}
+	return false;
 }
 
 static struct snd_usb_packet_info *
@@ -594,8 +597,9 @@ static void snd_complete_urb(struct urb *urb)
 		return;
 
 	if (!atomic_read(&ep->chip->shutdown)) {
-		usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
-		notify_xrun(ep);
+		if (notify_xrun(ep))
+			usb_audio_err(ep->chip,
+				      "cannot submit urb (err = %d)\n", err);
 	}
 
 exit_clear:
@@ -1779,10 +1783,11 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 		spin_lock_irqsave(&ep->lock, flags);
 		if (ep->next_packet_queued >= ARRAY_SIZE(ep->next_packet)) {
 			spin_unlock_irqrestore(&ep->lock, flags);
-			usb_audio_err(ep->chip,
-				      "next package FIFO overflow EP 0x%x\n",
-				      ep->ep_num);
-			notify_xrun(ep);
+			if (notify_xrun(ep)) {
+				usb_audio_err(ep->chip,
+					      "next packet FIFO overflow EP 0x%x\n",
+					      ep->ep_num);
+			}
 			return;
 		}
 
-- 
2.53.0

