Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6134D920
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894041; cv=none; b=i+BDTfwyxsM7v9voIekaav7jRtMnI0kfjXBdLtDV2JfMu7TXOS7CeV4d31GqBS9gRB3vdRIPQ+Wd2c9op643OyGX2iQZxIcVt7SLp23hlovv60hdU808iZXnJa/iwhkLUZTljULJs2I8KRJvJL8rJJagJQHFcJLhjhLzepmcCwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894041; c=relaxed/simple;
	bh=CKVzwPFUToYcj8PXt0Qc2oFcsAt3bm9ZPXPSJgfkNL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMd6xIaGt5JbLwUOiA7SyNV5Ncp3zrWDgbahWeQKsRiKrSKXGkpcH9vjG1YN4tJGwwjEkumxGK1DuHgzE6keiyaMNzbb+7bbPcWGVAbZ4pJH/eK4/+mXeH12aiUrZgCfyS2yEyfzpeyBtY10cIC1Olr/4QgJ7NlThzkEGAxB7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vZNyPr38; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+oeTTTen; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vZNyPr38; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+oeTTTen; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vZNyPr38";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+oeTTTen";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vZNyPr38";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+oeTTTen"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27890336B0;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn0ItAg091pt0N2WRjZ+yF0f5cpCC5fKTnQoiHA/s0U=;
	b=vZNyPr38zkfE+jVpopdY5qn/8GnMi6taYx/5zxJNacoGOmXbptNezfqQ8nevVigat/LHbT
	WPb6X/kw/NLfmgMWJPVMl0Ndr/N/I7hk/alU1HmfecvbjlqPq85kPDhzfxxy4ldHC1qLpq
	/Cp02fnvVImQ8+H+OgcGxVGOH8ygyis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn0ItAg091pt0N2WRjZ+yF0f5cpCC5fKTnQoiHA/s0U=;
	b=+oeTTTen6C7TrXXW9TdpNzPOsrbe6ptce1pdvEComGppLAkmqNl2a+Fu5Bj7K5OnYKxT/k
	mYhWlKpoQvkRNqAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vZNyPr38;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+oeTTTen
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn0ItAg091pt0N2WRjZ+yF0f5cpCC5fKTnQoiHA/s0U=;
	b=vZNyPr38zkfE+jVpopdY5qn/8GnMi6taYx/5zxJNacoGOmXbptNezfqQ8nevVigat/LHbT
	WPb6X/kw/NLfmgMWJPVMl0Ndr/N/I7hk/alU1HmfecvbjlqPq85kPDhzfxxy4ldHC1qLpq
	/Cp02fnvVImQ8+H+OgcGxVGOH8ygyis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn0ItAg091pt0N2WRjZ+yF0f5cpCC5fKTnQoiHA/s0U=;
	b=+oeTTTen6C7TrXXW9TdpNzPOsrbe6ptce1pdvEComGppLAkmqNl2a+Fu5Bj7K5OnYKxT/k
	mYhWlKpoQvkRNqAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AE053EA69;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8FkFBnNnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/11] ALSA: usx2y: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:32 +0100
Message-ID: <20251216140634.171890-11-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216140634.171890-1-tiwai@suse.de>
References: <20251216140634.171890-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: 27890336B0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Fixes: 67afec157fe6 ("ALSA: usb-audio: us144mkii: Add MIDI support and mixer controlsj")
Fixes: a2a2210f2c2e ("ALSA: usb-audio: us144mkii: Implement audio playback and feedback")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us144mkii.c          | 4 ++--
 sound/usb/usx2y/us144mkii_controls.c | 4 ++--
 sound/usb/usx2y/us144mkii_pcm.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/usb/usx2y/us144mkii.c b/sound/usb/usx2y/us144mkii.c
index f6572a576c15..bc71968df8e2 100644
--- a/sound/usb/usx2y/us144mkii.c
+++ b/sound/usb/usx2y/us144mkii.c
@@ -412,7 +412,6 @@ static int tascam_probe(struct usb_interface *intf,
 	struct snd_card *card;
 	struct tascam_card *tascam;
 	int err;
-	char *handshake_buf __free(kfree) = NULL;
 
 	if (dev->speed != USB_SPEED_HIGH)
 		dev_info(
@@ -439,7 +438,8 @@ static int tascam_probe(struct usb_interface *intf,
 		return -ENOENT;
 	}
 
-	handshake_buf = kmalloc(1, GFP_KERNEL);
+	char *handshake_buf __free(kfree) =
+		kmalloc(1, GFP_KERNEL);
 	if (!handshake_buf)
 		return -ENOMEM;
 
diff --git a/sound/usb/usx2y/us144mkii_controls.c b/sound/usb/usx2y/us144mkii_controls.c
index 5d69441ef414..62055fb8e7ba 100644
--- a/sound/usb/usx2y/us144mkii_controls.c
+++ b/sound/usb/usx2y/us144mkii_controls.c
@@ -373,7 +373,6 @@ static int tascam_samplerate_get(struct snd_kcontrol *kcontrol,
 {
 	struct tascam_card *tascam =
 		(struct tascam_card *)snd_kcontrol_chip(kcontrol);
-	u8 *buf __free(kfree) = NULL;
 	int err;
 	u32 rate = 0;
 
@@ -384,7 +383,8 @@ static int tascam_samplerate_get(struct snd_kcontrol *kcontrol,
 		}
 	}
 
-	buf = kmalloc(3, GFP_KERNEL);
+	u8 *buf __free(kfree) =
+		kmalloc(3, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
diff --git a/sound/usb/usx2y/us144mkii_pcm.c b/sound/usb/usx2y/us144mkii_pcm.c
index 0c84304d4624..03dfb1f38801 100644
--- a/sound/usb/usx2y/us144mkii_pcm.c
+++ b/sound/usb/usx2y/us144mkii_pcm.c
@@ -115,7 +115,6 @@ void process_capture_routing_us144mkii(struct tascam_card *tascam,
 int us144mkii_configure_device_for_rate(struct tascam_card *tascam, int rate)
 {
 	struct usb_device *dev = tascam->dev;
-	u8 *rate_payload_buf __free(kfree) = NULL;
 	u16 rate_vendor_wValue;
 	int err = 0;
 	const u8 *current_payload_src;
@@ -148,7 +147,8 @@ int us144mkii_configure_device_for_rate(struct tascam_card *tascam, int rate)
 		return -EINVAL;
 	}
 
-	rate_payload_buf = kmemdup(current_payload_src, 3, GFP_KERNEL);
+	u8 *rate_payload_buf __free(kfree) =
+		kmemdup(current_payload_src, 3, GFP_KERNEL);
 	if (!rate_payload_buf)
 		return -ENOMEM;
 
-- 
2.52.0

