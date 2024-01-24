Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793BA43154
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706111726; cv=none; b=JO+rYLe72qNnKWSN2gcEgNzjZh6+kR+nmOoLLVI77zi0bLHY9ZWnPyupOs+mgMX4Onz2ULUfg8HoL+BxbMNEmkYSQ5WvaaAe7QiVv1jOvMUfSIukIlekkDXToR/0iBrE6sxYf98mmxrFtqm7ljmDNi4NZHiHaYjRO9NNC/9nChQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706111726; c=relaxed/simple;
	bh=DIkuWa/NwcVIeLPvHCdVP+fzWmaBqy8WTJcB3dljtgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C3aiqufnpti3t8Z7i7alrT9jerwrE2Q2YO6S+kAbMte3zUEvp+A/s7d4bejJFG+3mM1zX1Y+Re62ZP/ga36T6td204h+kyg4VzO5m09dM5PO301sFy1pb3TRlP5qPRynAod5fMngGdY4GMZh3LSevXb6ShXWQ3QznZPTQG2eDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QgPA/UqV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NPB5tTcJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QgPA/UqV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NPB5tTcJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QgPA/UqV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NPB5tTcJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QgPA/UqV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NPB5tTcJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93A3521FC7;
	Wed, 24 Jan 2024 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706111722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GApVfAvW9r4EyYaHsvf00hA3URdt2Yxmz/t164SCP5w=;
	b=QgPA/UqV9ElYN8bZ0KUNEwhlsGo4RpzAq6bVooiklEIDRVM1f8FOfnzJyni9FrhO68VepD
	N1+kiVmYKOAfvP5ujRQWMV4v4xMT3sA0IT6PMcYWKuxneyRcoSP8KSFq+bud1XkHTp4rAS
	cke609NsVhugxWvddCY3cE5qvXB59tQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706111722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GApVfAvW9r4EyYaHsvf00hA3URdt2Yxmz/t164SCP5w=;
	b=NPB5tTcJSN9wjsF22RBEIsV4SKl6G6qAJXMq1lTNWabOVmHrPgvGoqwSbvmyZ0k5rIzvtY
	tJSUcLRaxep+2TDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706111722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GApVfAvW9r4EyYaHsvf00hA3URdt2Yxmz/t164SCP5w=;
	b=QgPA/UqV9ElYN8bZ0KUNEwhlsGo4RpzAq6bVooiklEIDRVM1f8FOfnzJyni9FrhO68VepD
	N1+kiVmYKOAfvP5ujRQWMV4v4xMT3sA0IT6PMcYWKuxneyRcoSP8KSFq+bud1XkHTp4rAS
	cke609NsVhugxWvddCY3cE5qvXB59tQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706111722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GApVfAvW9r4EyYaHsvf00hA3URdt2Yxmz/t164SCP5w=;
	b=NPB5tTcJSN9wjsF22RBEIsV4SKl6G6qAJXMq1lTNWabOVmHrPgvGoqwSbvmyZ0k5rIzvtY
	tJSUcLRaxep+2TDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7016C1333E;
	Wed, 24 Jan 2024 15:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DX3xGeoysWX/GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Jan 2024 15:55:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Sort quirk table entries
Date: Wed, 24 Jan 2024 16:53:07 +0100
Message-Id: <20240124155307.16996-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="QgPA/UqV";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NPB5tTcJ
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: 1.49
X-Rspamd-Queue-Id: 93A3521FC7
X-Spam-Flag: NO

The quirk table entries should be put in the USB ID order, but some
entries have been put in random places.  Re-sort them.

Fixes: bf990c102319 ("ALSA: usb-audio: add quirk to fix Hamedal C20 disconnect issue")
Fixes: fd28941cff1c ("ALSA: usb-audio: Add new quirk FIXED_RATE for JBL Quantum810 Wireless")
Fixes: dfd5fe19db7d ("ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum610 Wireless")
Fixes: 4a63e68a2951 ("ALSA: usb-audio: Fix microphone sound on Nexigo webcam.")
Fixes: 7822baa844a8 ("ALSA: usb-audio: add quirk for RODE NT-USB+")
Fixes: 4fb7c24f69c4 ("ALSA: usb-audio: Add quirk for Fiero SC-01")
Fixes: 2307a0e1ca0b ("ALSA: usb-audio: Add quirk for Fiero SC-01 (fw v1.0.0)")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 591c3a354696..09712e61c606 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2037,6 +2037,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR | QUIRK_FLAG_CTL_MSG_DELAY_5M),
+	DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
+		   QUIRK_FLAG_IFACE_SKIP_CLOSE),
 	DEVICE_FLG(0x054c, 0x0b8c, /* Sony WALKMAN NW-A45 DAC */
 		   QUIRK_FLAG_SET_IFACE_FIRST),
 	DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
@@ -2083,8 +2085,14 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
+		   QUIRK_FLAG_FIXED_RATE),
+	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
+		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */
@@ -2117,6 +2125,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x19f7, 0x0035, /* RODE NT-USB+ */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
@@ -2159,6 +2171,12 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x2b53, 0x0023, /* Fiero SC-01 (firmware v1.0.0 @ 48 kHz) */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x2b53, 0x0024, /* Fiero SC-01 (firmware v1.0.0 @ 96 kHz) */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
@@ -2167,24 +2185,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
-	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
-	DEVICE_FLG(0x2b53, 0x0023, /* Fiero SC-01 (firmware v1.0.0 @ 48 kHz) */
-		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
-	DEVICE_FLG(0x2b53, 0x0024, /* Fiero SC-01 (firmware v1.0.0 @ 96 kHz) */
-		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
-	DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
-		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
-	DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
-		   QUIRK_FLAG_IFACE_SKIP_CLOSE),
-	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
-		   QUIRK_FLAG_FIXED_RATE),
-	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
-		   QUIRK_FLAG_FIXED_RATE),
-	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
-	DEVICE_FLG(0x19f7, 0x0035, /* RODE NT-USB+ */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.35.3

