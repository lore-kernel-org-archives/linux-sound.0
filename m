Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A377F22DC38
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851639; cv=none; b=WlsgoK9x5SGXcvSx3+6+w8RI14IGvKsONFSwnPLmUhIJeYmrWUAvKswDF3nG7MPsL22CjzK/RA52paBbirrV8pMMXvw8+RsXOBQ1Tz4T2G51WQd5jUgLePNyDkb0ibNOkn3HbID1FWLSGk5HbEI4OAJf2v9l2Gjehpja0CzGmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851639; c=relaxed/simple;
	bh=G1qHtj3Pht6XH7FKBR3u+bLhBNlgygXE9B3+1O3S0wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ChG7G2qtFBSuyt06D5RzAn3+it2HKTW2xBbNCrahF8/MSq/aIV5EQuq8SHhr8rZhmn8O5kiULFfhj8osZjC/id5A+n71xZsnjdnEVzVxuexDTcRHvkIpCWh7kiJrZC43a3gO1J4PXxhkkWo9nZWFhKknaNd9ho5QVsDf2rBjtOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UAIRZDvi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7vIvpPlH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UAIRZDvi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7vIvpPlH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UAIRZDvi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7vIvpPlH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UAIRZDvi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7vIvpPlH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA9422116C;
	Tue, 14 Jan 2025 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736851635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gs7UKz5mmOZzW2Dt9elzmJu49DQQ6sbKN86rIjHR1o=;
	b=UAIRZDvipcXbIBzhhVHyNETSYlmCzbp/0MGfr6+NLj0iIsR1yQMM5zPuhmZpPzAGLOHCRS
	BdUey5NUNtPWnvvV0tbnnPpigOs/+cioDPS3HCPtiULOl6dTi98EvqGmn1AsYo+N3vfvax
	ZdaVdSz+FeOGxeOJWM09pdM/ZF9ZPT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736851635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gs7UKz5mmOZzW2Dt9elzmJu49DQQ6sbKN86rIjHR1o=;
	b=7vIvpPlHTHDH2NO1YeFzP/Owojwr7dpAHjqvy1QHRHO6YWztw38RvVgf5/HswmuSCZlVmp
	SVHc8DleZAasawBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UAIRZDvi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7vIvpPlH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736851635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gs7UKz5mmOZzW2Dt9elzmJu49DQQ6sbKN86rIjHR1o=;
	b=UAIRZDvipcXbIBzhhVHyNETSYlmCzbp/0MGfr6+NLj0iIsR1yQMM5zPuhmZpPzAGLOHCRS
	BdUey5NUNtPWnvvV0tbnnPpigOs/+cioDPS3HCPtiULOl6dTi98EvqGmn1AsYo+N3vfvax
	ZdaVdSz+FeOGxeOJWM09pdM/ZF9ZPT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736851635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gs7UKz5mmOZzW2Dt9elzmJu49DQQ6sbKN86rIjHR1o=;
	b=7vIvpPlHTHDH2NO1YeFzP/Owojwr7dpAHjqvy1QHRHO6YWztw38RvVgf5/HswmuSCZlVmp
	SVHc8DleZAasawBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A8211384C;
	Tue, 14 Jan 2025 10:47:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id egcjJbNAhmeyEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 10:47:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: rawmidi: Make tied_device=0 as default / unknown
Date: Tue, 14 Jan 2025 11:47:01 +0100
Message-ID: <20250114104711.19197-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA9422116C
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

In the original change, rawmidi_info.tied_device showed -1 for the
unknown or untied device.  But this would require the user-space to
check the protocol version and judge the value conditionally, which
is rather error-prone.

Instead, set the tied_device = 0 to be default as unknown, and
indicate the real device with the offset 1, for achieving more
backward compatibility.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h     | 9 +++++++++
 include/uapi/sound/asound.h | 2 +-
 sound/core/rawmidi.c        | 1 -
 sound/core/ump.c            | 3 +--
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 6f2e95298fc7..6916f7133597 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -191,4 +191,13 @@ long snd_rawmidi_kernel_read(struct snd_rawmidi_substream *substream,
 long snd_rawmidi_kernel_write(struct snd_rawmidi_substream *substream,
 			      const unsigned char *buf, long count);
 
+/* set up the tied devices */
+static inline void snd_rawmidi_tie_devices(struct snd_rawmidi *r1,
+					   struct snd_rawmidi *r2)
+{
+	/* tied_device field keeps the device+1 (so that 0 being unknown) */
+	r1->tied_device = r2->device + 1;
+	r2->tied_device = r1->device + 1;
+}
+
 #endif /* __SOUND_RAWMIDI_H */
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 000b36c0e2b9..5a049eeaecce 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -730,7 +730,7 @@ enum {
 #define SNDRV_RAWMIDI_INFO_UMP			0x00000008
 #define SNDRV_RAWMIDI_INFO_STREAM_INACTIVE	0x00000010
 
-#define SNDRV_RAWMIDI_DEVICE_UNKNOWN		-1
+#define SNDRV_RAWMIDI_DEVICE_UNKNOWN		0
 
 struct snd_rawmidi_info {
 	unsigned int device;		/* RO/WR (control): device number */
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 8a681bff4f7f..70a958ac1112 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1837,7 +1837,6 @@ int snd_rawmidi_init(struct snd_rawmidi *rmidi,
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT].substreams);
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams);
 	rmidi->info_flags = info_flags;
-	rmidi->tied_device = SNDRV_RAWMIDI_DEVICE_UNKNOWN;
 
 	if (id != NULL)
 		strscpy(rmidi->id, id, sizeof(rmidi->id));
diff --git a/sound/core/ump.c b/sound/core/ump.c
index ff3cc2386ece..8d8681a42ca5 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1382,8 +1382,7 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	ump_legacy_set_rawmidi_name(ump);
 	update_legacy_names(ump);
 
-	rmidi->tied_device = ump->core.device;
-	ump->core.tied_device = rmidi->device;
+	snd_rawmidi_tie_devices(rmidi, &ump->core);
 
 	ump_dbg(ump, "Created a legacy rawmidi #%d (%s)\n", device, id);
 	return 0;
-- 
2.43.0

