Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AE229B13
	for <linux-sound@vger.kernel.org>; Sun, 11 May 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746972714; cv=none; b=tR5w2bItQhPxtqGMxItyfKrOJcfLqhFAEquk1o3F6WAAnuKuUUrKe9r25tFteRJlEHhBAvT3Hk7eGulatyESW0CdrFVHww3DGd8qlvzxppRGM/pTkbKR5qy9uYZma1FXXVAPMKckTL43IEIRDnehtNdnFyv1TtDdlx5KD7k/zS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746972714; c=relaxed/simple;
	bh=UChLeBjes3pn1COnkbtTm7noOqjagOmTvZINDcFo7bA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVb5OI2V4/Z7pLfWbSa7Nukv+B9lbf/3k65MFO9mrNBG1SqZzVnKI925qizxHGlVp0/4tQOl1RkrBtNLrBLGu80oSm0kwnipYQbvYKbpPiSTD5ORIQ1Z8C2Nnz/3QNs3fEPRtz4l5vClvQrUV7rRPCNvsAh5CtU3CglPUtw7jDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iB6SGIvT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tI7PRF6Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ed1trGbp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8TyaVVaK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iB6SGIvT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tI7PRF6Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ed1trGbp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8TyaVVaK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6D7F1F451;
	Sun, 11 May 2025 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xf+Zg4BWpkusM+g3H4cUL54rj42Po6AqbitRrig9KEI=;
	b=iB6SGIvTUhK2KsNhCHkT5jX8DFq8emx6PED/RPLzu+xljeQapHYnT6nkDiuM/tgCjw1pgo
	5r8S8XpOIwcKHFRicRAARUDU1JPCbWkWxH9q6vkSg17FZq/EVh/Eb65N5Y3pzKHr1Xtkju
	xAZIvHAzXa4V2lkgUUleAl0qKSHz3aI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972710;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xf+Zg4BWpkusM+g3H4cUL54rj42Po6AqbitRrig9KEI=;
	b=tI7PRF6QeBuoPCGBshE8Dy9qRz5FOOJAF0Raq09qfN0tKzG0+2zD38AJrr0xvDcJZrORNY
	MUjYjYf9ChPkmlCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xf+Zg4BWpkusM+g3H4cUL54rj42Po6AqbitRrig9KEI=;
	b=Ed1trGbpDa6jOcgnGQsqwG1LpvlNMJMLxwYEFm4PnhProowyM9T5Y//f9Zgp1OAHhwW29D
	cGByOY7lipUkYC3TIXOfxPHUbXffp0LH+RlKZUQQoiT4k1f4NGEZbMEb53gKvW053fNiUj
	6LILRxPiuf33xRQkvjZVAjcUTkA5ykg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xf+Zg4BWpkusM+g3H4cUL54rj42Po6AqbitRrig9KEI=;
	b=8TyaVVaKcqx/7PgGJkPAZpXIRnIjwhq+XV4CqZxcLbZc8XbmbZd4BRqKUp7aQtDtHpjW8H
	+Ym/apd7HZnCk5Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8487813690;
	Sun, 11 May 2025 14:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IrGhHiWwIGgwbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:11:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info
Date: Sun, 11 May 2025 16:11:45 +0200
Message-ID: <20250511141147.10246-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]

s/devince/device/

It's used only internally, so no any behavior changes.

Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Greg, I'll take this via sound git tree if you don't mind.

 drivers/usb/gadget/function/f_midi2.c | 2 +-
 include/sound/ump_msg.h               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index 12e866fb311d..0a800ba53816 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -475,7 +475,7 @@ static void reply_ump_stream_ep_info(struct f_midi2_ep *ep)
 /* reply a UMP EP device info */
 static void reply_ump_stream_ep_device(struct f_midi2_ep *ep)
 {
-	struct snd_ump_stream_msg_devince_info rep = {
+	struct snd_ump_stream_msg_device_info rep = {
 		.type = UMP_MSG_TYPE_STREAM,
 		.status = UMP_STREAM_MSG_STATUS_DEVICE_INFO,
 		.manufacture_id = ep->info.manufacturer,
diff --git a/include/sound/ump_msg.h b/include/sound/ump_msg.h
index 72f60ddfea75..9556b4755a1e 100644
--- a/include/sound/ump_msg.h
+++ b/include/sound/ump_msg.h
@@ -604,7 +604,7 @@ struct snd_ump_stream_msg_ep_info {
 } __packed;
 
 /* UMP Stream Message: Device Info Notification (128bit) */
-struct snd_ump_stream_msg_devince_info {
+struct snd_ump_stream_msg_device_info {
 #ifdef __BIG_ENDIAN_BITFIELD
 	/* 0 */
 	u32 type:4;
@@ -754,7 +754,7 @@ struct snd_ump_stream_msg_fb_name {
 union snd_ump_stream_msg {
 	struct snd_ump_stream_msg_ep_discovery ep_discovery;
 	struct snd_ump_stream_msg_ep_info ep_info;
-	struct snd_ump_stream_msg_devince_info device_info;
+	struct snd_ump_stream_msg_device_info device_info;
 	struct snd_ump_stream_msg_stream_cfg stream_cfg;
 	struct snd_ump_stream_msg_fb_discovery fb_discovery;
 	struct snd_ump_stream_msg_fb_info fb_info;
-- 
2.49.0

