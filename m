Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC63171BD
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643291; cv=none; b=XDOJZ8/PKrGeFhThP+gfaAJCsIeJxx81dZehjXwOAeZxUCv/TTTx3D6MqfTm8unnyBEIFUqa2I9M/pfW3Fu8jFUjQ6FujOBO9tZYhuCLf9zK4rLEvCT8Sm9Z/M5M8AEV/Jt6GYiAz8djRrAj6xh3b5OBEzxkE3ZxExo44hoogUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643291; c=relaxed/simple;
	bh=fL3psJDyXP3LQ2ucivvqexrgQXZH68AK5noGVs/NIm0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/FLaR+NtjVcwsgi6Ls1GUulhWD6yIHk8sspCAOsDgAF9LDr5d64whuOJC2DNZ2nGOwdRDPPfnkyDl7WRER5hgQWiD4VUNnFUbM+ynVZr3g2EgD8wOk+vt4EQRUr+9EO/2Ld60Q7HlpxiLQmf27k5B788Kk7ElFalDyFjW4Fo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sTs1qfIl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yE+n4WvX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sTs1qfIl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yE+n4WvX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sTs1qfIl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yE+n4WvX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sTs1qfIl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yE+n4WvX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B44161FEE1;
	Wed, 14 Aug 2024 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723643287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bkxdi4MuRN+uTGGMOTOJ6vvgrbZHunabNmybUVVcfvA=;
	b=sTs1qfIlyNRmMFHUc9r5nuAdEJ/uOWnpS8oc/OTRwCep72fkqA7V7u2tt9i2hQ+7BfsSyc
	lFpJE/z7vRrvVoubxoy6hXDdKkW9jdSakLHu7OjqgN6SaE2PJOW1qkJSGtuLeX0gEj0M/4
	iFtJi9Ao+4FT9CRX+/TON3rw4tzjJXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723643287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bkxdi4MuRN+uTGGMOTOJ6vvgrbZHunabNmybUVVcfvA=;
	b=yE+n4WvXy2UZNYFiC0TLm7TTBftw7o9L6wuieA/s9YkePUP13vjrmEBYvM3fYctXWlJ4Zv
	XnR/17sz6vkzKsDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sTs1qfIl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yE+n4WvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723643287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bkxdi4MuRN+uTGGMOTOJ6vvgrbZHunabNmybUVVcfvA=;
	b=sTs1qfIlyNRmMFHUc9r5nuAdEJ/uOWnpS8oc/OTRwCep72fkqA7V7u2tt9i2hQ+7BfsSyc
	lFpJE/z7vRrvVoubxoy6hXDdKkW9jdSakLHu7OjqgN6SaE2PJOW1qkJSGtuLeX0gEj0M/4
	iFtJi9Ao+4FT9CRX+/TON3rw4tzjJXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723643287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bkxdi4MuRN+uTGGMOTOJ6vvgrbZHunabNmybUVVcfvA=;
	b=yE+n4WvXy2UZNYFiC0TLm7TTBftw7o9L6wuieA/s9YkePUP13vjrmEBYvM3fYctXWlJ4Zv
	XnR/17sz6vkzKsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A19B13A15;
	Wed, 14 Aug 2024 13:48:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2C1TJJe1vGZ1RwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Aug 2024 13:48:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: Define macros for quirk table entries
Date: Wed, 14 Aug 2024 15:48:41 +0200
Message-ID: <20240814134844.2726-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814134844.2726-1-tiwai@suse.de>
References: <20240814134844.2726-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: B44161FEE1
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO

Many entries in the USB-audio quirk tables have relatively complex
expressions.  For improving the readability, introduce a few macros.
Those are applied in the following patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index f13a8d63a019..9443ada51539 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -35,6 +35,83 @@
 	.bInterfaceClass = USB_CLASS_AUDIO, \
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
 
+/* Quirk .driver_info, followed by the definition of the quirk entry;
+ * put like QUIRK_DRIVER_INFO { ... } in each entry of the quirk table
+ */
+#define QUIRK_DRIVER_INFO \
+	.driver_info = (unsigned long)&(const struct snd_usb_audio_quirk)
+
+/*
+ * Macros for quirk data entries
+ */
+
+/* Quirk data entry for ignoring the interface */
+#define QUIRK_DATA_IGNORE(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_IGNORE_INTERFACE
+/* Quirk data entry for a standard audio interface */
+#define QUIRK_DATA_STANDARD_AUDIO(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_AUDIO_STANDARD_INTERFACE
+/* Quirk data entry for a standard MIDI interface */
+#define QUIRK_DATA_STANDARD_MIDI(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_MIDI_STANDARD_INTERFACE
+/* Quirk data entry for a standard mixer interface */
+#define QUIRK_DATA_STANDARD_MIXER(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_AUDIO_STANDARD_MIXER
+
+/* Quirk data entry for Yamaha MIDI */
+#define QUIRK_DATA_MIDI_YAMAHA(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_MIDI_YAMAHA
+/* Quirk data entry for Edirol UAxx */
+#define QUIRK_DATA_EDIROL_UAXX(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_AUDIO_EDIROL_UAXX
+/* Quirk data entry for raw bytes interface */
+#define QUIRK_DATA_RAW_BYTES(_ifno) \
+	.ifnum = (_ifno), .type = QUIRK_MIDI_RAW_BYTES
+
+/* Quirk composite array terminator */
+#define QUIRK_COMPOSITE_END	{ .ifnum = -1 }
+
+/* Quirk data entry for composite quirks;
+ * followed by the quirk array that is terminated with QUIRK_COMPOSITE_END
+ * e.g. QUIRK_DATA_COMPOSITE { { quirk1 }, { quirk2 },..., QUIRK_COMPOSITE_END }
+ */
+#define QUIRK_DATA_COMPOSITE \
+	.ifnum = QUIRK_ANY_INTERFACE, \
+	.type = QUIRK_COMPOSITE, \
+	.data = &(const struct snd_usb_audio_quirk[])
+
+/* Quirk data entry for a fixed audio endpoint;
+ * followed by audioformat definition
+ * e.g. QUIRK_DATA_AUDIOFORMAT(n) { .formats = xxx, ... }
+ */
+#define QUIRK_DATA_AUDIOFORMAT(_ifno)	    \
+	.ifnum = (_ifno),		    \
+	.type = QUIRK_AUDIO_FIXED_ENDPOINT, \
+	.data = &(const struct audioformat)
+
+/* Quirk data entry for a fixed MIDI endpoint;
+ * followed by snd_usb_midi_endpoint_info definition
+ * e.g. QUIRK_DATA_MIDI_FIXED_ENDPOINT(n) { .out_cables = x, .in_cables = y }
+ */
+#define QUIRK_DATA_MIDI_FIXED_ENDPOINT(_ifno) \
+	.ifnum = (_ifno),		      \
+	.type = QUIRK_MIDI_FIXED_ENDPOINT,    \
+	.data = &(const struct snd_usb_midi_endpoint_info)
+/* Quirk data entry for a MIDIMAN MIDI endpoint */
+#define QUIRK_DATA_MIDI_MIDIMAN(_ifno) \
+	.ifnum = (_ifno),	       \
+	.type = QUIRK_MIDI_MIDIMAN,    \
+	.data = &(const struct snd_usb_midi_endpoint_info)
+/* Quirk data entry for a EMAGIC MIDI endpoint */
+#define QUIRK_DATA_MIDI_EMAGIC(_ifno) \
+	.ifnum = (_ifno),	      \
+	.type = QUIRK_MIDI_EMAGIC,    \
+	.data = &(const struct snd_usb_midi_endpoint_info)
+
+/*
+ * Here we go... the quirk table definition begins:
+ */
+
 /* FTDI devices */
 {
 	USB_DEVICE(0x0403, 0xb8d8),
-- 
2.43.0

