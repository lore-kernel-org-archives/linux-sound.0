Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27311C5D5E
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441387; cv=none; b=sUj0ZlpHBkgHDELweBBUgO5xj7sHhxXcsczUdiHhmS+baSSrWPrYEOHUVetT2IHqY6d7OGbV7tEKvM0RvpAEEV0InEzN0gUvIrGY+r5GPeU5OdT0y8O5qNyuGb0ByzGmqXvd/0+3sbst7jlj8lFDeC/DQOx0N41wlZ8pWEKUZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441387; c=relaxed/simple;
	bh=j0ZME6UkT+TUpxqMYHq3RoiMowWJfE+ssy9ejwJiIMY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=N+XDL1g+Xy4DDkFVzzvKo+miMFPDPjgjYSF1ssCu/MIIQncTBscCsPGvEe5BUyo9t0ZkUCrr+g5mN9cJ5tTrFSbkIi/yziHDsLfl0VrDT5MJCIDyTWlRjTL/i530yOXls61ZS/DpJ4E38Oy/zEz5+iNVWSa3s2KuJEBP7JSPr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=koFF4OVp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=twQQDbPJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=koFF4OVp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=twQQDbPJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="koFF4OVp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="twQQDbPJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="koFF4OVp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="twQQDbPJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7CA56A862;
	Fri, 17 Apr 2026 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776441383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AgRkPR+5hiK3DehMXlC7LFbpIB1wZsfW2609LhmikhM=;
	b=koFF4OVpfU2faYDrJzDE8/qjvqaHDjEzbmOyifEN93lmFz9lEewI5zL1EAZtv04ulasNC+
	U1p2zIt7rM1x6VtK8/BXkNjszcuAk8GiYx5h3E0l9bhBvElXvF4bdkUmmXmr4pzZK7Raum
	5xlJXq2aPPn+qt/WgBy8/fLx+RDFJx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776441383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AgRkPR+5hiK3DehMXlC7LFbpIB1wZsfW2609LhmikhM=;
	b=twQQDbPJ0+t18no0RSiKHVtdW4+VLequugTpV9DtiPgrbiAmbOpjcuoHBAs29LpeDSk/bc
	vJI5zxodrRX1K/AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=koFF4OVp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=twQQDbPJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776441383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AgRkPR+5hiK3DehMXlC7LFbpIB1wZsfW2609LhmikhM=;
	b=koFF4OVpfU2faYDrJzDE8/qjvqaHDjEzbmOyifEN93lmFz9lEewI5zL1EAZtv04ulasNC+
	U1p2zIt7rM1x6VtK8/BXkNjszcuAk8GiYx5h3E0l9bhBvElXvF4bdkUmmXmr4pzZK7Raum
	5xlJXq2aPPn+qt/WgBy8/fLx+RDFJx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776441383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AgRkPR+5hiK3DehMXlC7LFbpIB1wZsfW2609LhmikhM=;
	b=twQQDbPJ0+t18no0RSiKHVtdW4+VLequugTpV9DtiPgrbiAmbOpjcuoHBAs29LpeDSk/bc
	vJI5zxodrRX1K/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89EA9593AE;
	Fri, 17 Apr 2026 15:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y/FfICdY4mlcewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 15:56:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] Revert "ALSA: usb-audio: Add quirk entries for NexiGo N930W webcam"
Date: Fri, 17 Apr 2026 17:56:19 +0200
Message-ID: <20260417155622.2768703-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A7CA56A862

This reverts commit 17bc5dd49214b50c9eb6df0fad1d1aea287dd078.

Juan reported that the patch didn't work as expected at the later
check, failing to create PCM capture devices that has worked
beforehand.  Drop the change again for addressing the regression,
and we'll continue developing a proper fix later.

Reported-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
Closes: https://lore.kernel.org/20260417150748.6684-1-jpfuentealbabizama@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7b803ad58487..8fc36d1cfb9d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2474,8 +2474,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
-	DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
-		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
-- 
2.53.0

