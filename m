Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575731C9DDC
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022555; cv=none; b=PE0Kr5LVfSderMFA5xkuagkwPn03hFkRnG3GJ5+IHsGaPeQKSaMSKB3xD43fFRaCcdIH36iJWiq9VxIKhG9d+vg9tKAtL7Lm5lCBBu+bjGi/JvDRQ4gCqM/3+RUFMvx7ar8K1FzqDmtnLXM1pDMKaWsa0yPV6Nxzpi8nSIZO3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022555; c=relaxed/simple;
	bh=PnP5yq/DuvOAJEyQ0DVBS+GasIYCWxfM1jRK3m5B4tk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6BXrMCSwk30u9ynGgaihtxNfKqTBG44YGd5Rxu7rHfSN3JTy/oFtwGQf+DCNmMK0GgbtM2lnaibdDjMMmhDQX//PWiDrx1dlCbKz+w6esnI6cwxljar+hx+Zb6mgpeI0BWjOTX+Obt4O0uPcuqJbvDlsZWz3rQGeQ0QIhZ1Ubo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cZldRHzT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jT5Kxuu5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cZldRHzT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jT5Kxuu5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cZldRHzT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jT5Kxuu5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cZldRHzT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jT5Kxuu5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 41D9B1FB7A;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdqNKRQ/qbXfhVOYMezjVVJpB0U0Ehb0Xy1JNMNAcHI=;
	b=cZldRHzTqqKJkUFZbw/UlSptrDmPcyos6aw7Cgsm1ZolNC98Z3RlzVmZ4cJXrfB/OxRZEi
	fLFCPR6xSr/tA9BlmNJTvJJuSVrw0szsOr8/4pqf9D+mm3wqi6uwzZxXWamrrqlku908YC
	bD52l6IZC0hXUd96NCIEmFCi2JleFXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdqNKRQ/qbXfhVOYMezjVVJpB0U0Ehb0Xy1JNMNAcHI=;
	b=jT5Kxuu51wbzm5ZE6hNDLwkX7WMTO8rEMFPaevMJUjG1IGMXYmmDpYdOkbFvA6Nksx8HSn
	gUTUbrwp5dnrq4AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdqNKRQ/qbXfhVOYMezjVVJpB0U0Ehb0Xy1JNMNAcHI=;
	b=cZldRHzTqqKJkUFZbw/UlSptrDmPcyos6aw7Cgsm1ZolNC98Z3RlzVmZ4cJXrfB/OxRZEi
	fLFCPR6xSr/tA9BlmNJTvJJuSVrw0szsOr8/4pqf9D+mm3wqi6uwzZxXWamrrqlku908YC
	bD52l6IZC0hXUd96NCIEmFCi2JleFXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdqNKRQ/qbXfhVOYMezjVVJpB0U0Ehb0Xy1JNMNAcHI=;
	b=jT5Kxuu51wbzm5ZE6hNDLwkX7WMTO8rEMFPaevMJUjG1IGMXYmmDpYdOkbFvA6Nksx8HSn
	gUTUbrwp5dnrq4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D92F13B06;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kLYNBtM8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/6] ALSA: usb-audio: Set MIDI1 flag appropriately for GTB MIDI 1.0 entry
Date: Wed,  7 Aug 2024 11:22:58 +0200
Message-ID: <20240807092303.1935-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807092303.1935-1-tiwai@suse.de>
References: <20240807092303.1935-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.987];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

When a MIDI 1.0 protocol is specified in a GTB entry while others are
set in MIDI 2.0, it should be seen as a legacy MIDI 1.0 port.  Since
recently we allow drivers to set a flag SNDRV_UMP_BLOCK_IS_MIDI1 to a
FB for that purpose.  This patch tries to set that flag when the
device shows such a configuration.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index fa655aa4a56f..4fb43d9743d7 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -863,9 +863,23 @@ static int create_gtb_block(struct snd_usb_midi2_ump *rmidi, int dir, int blk)
 		fb->info.flags |= SNDRV_UMP_BLOCK_IS_MIDI1 |
 			SNDRV_UMP_BLOCK_IS_LOWSPEED;
 
+	/* if MIDI 2.0 protocol is supported and yet the GTB shows MIDI 1.0,
+	 * treat it as a MIDI 1.0-specific block
+	 */
+	if (rmidi->ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI2) {
+		switch (desc->bMIDIProtocol) {
+		case USB_MS_MIDI_PROTO_1_0_64:
+		case USB_MS_MIDI_PROTO_1_0_64_JRTS:
+		case USB_MS_MIDI_PROTO_1_0_128:
+		case USB_MS_MIDI_PROTO_1_0_128_JRTS:
+			fb->info.flags |= SNDRV_UMP_BLOCK_IS_MIDI1;
+			break;
+		}
+	}
+
 	usb_audio_dbg(umidi->chip,
-		      "Created a UMP block %d from GTB, name=%s\n",
-		      blk, fb->info.name);
+		      "Created a UMP block %d from GTB, name=%s, flags=0x%x\n",
+		      blk, fb->info.name, fb->info.flags);
 	return 0;
 }
 
-- 
2.43.0

