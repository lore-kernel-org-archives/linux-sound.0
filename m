Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9337417C
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639135; cv=none; b=DopvSXWo+azKG9B+vWrhIeBylXG8b4yca8F+UB6sUbHa9MNd3e3/xxGitHiPlgaNaYp0K/GNo+iQuwdjs5Fn9HQHTF9+5GaHPR7T0BpFKsTB7RLf2apMhAfO2DSZKwgP8xst0e7RuJK3YIvFWTZZZvaiJe1Exiqw78BX5kmSz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639135; c=relaxed/simple;
	bh=e5ZrUWoC4s0jW+wtQXg3ruYGFxtXbIpuAJLnuey941U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rkN3pHMTC+WYkd0bZQ1v6GcprV0G3Agj5LUaTTgh6JK3sqyJBfZpz2q3W9i9QQHVSvabrMlY6mvMrNhMn9B5y1Ku1PgeRsojcMTOH27/ZgQ6snepCoMdYjff1u5Do6zE7QkMVOUMKLvjjgBwUxhukTrris7DeIBGAB27VLlDL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cVPa8HvQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RXP7LsyV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cVPa8HvQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RXP7LsyV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cVPa8HvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RXP7LsyV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cVPa8HvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RXP7LsyV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A97513E707;
	Mon,  9 Feb 2026 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770639133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3137jRT+OGVBjRSlVLxC4ZBC1xo9OwhtVMSYGaVwsyo=;
	b=cVPa8HvQCPV1LRAw3aP9yxz4hhb++5VIxnQ2fdRYXZFgLBQGakLsEezwe2qq5SE+34qnRj
	QlUbgHwT2/XZ0urVyUj8d+Z6xEulXL9kvfDnLIYhZ3DgnLP4fe0peZrPH10/1JvYak5noI
	vpZ5lQkC4heE0kZUbN04mgkv7FsVCqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770639133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3137jRT+OGVBjRSlVLxC4ZBC1xo9OwhtVMSYGaVwsyo=;
	b=RXP7LsyVeEgZWEDQE1xAkNoxy/a8kpEXoHjadXmuhsdBMQfvO10zvFLkub/uCyFbVCBw6n
	nZTdGbLrLjFK0JCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770639133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3137jRT+OGVBjRSlVLxC4ZBC1xo9OwhtVMSYGaVwsyo=;
	b=cVPa8HvQCPV1LRAw3aP9yxz4hhb++5VIxnQ2fdRYXZFgLBQGakLsEezwe2qq5SE+34qnRj
	QlUbgHwT2/XZ0urVyUj8d+Z6xEulXL9kvfDnLIYhZ3DgnLP4fe0peZrPH10/1JvYak5noI
	vpZ5lQkC4heE0kZUbN04mgkv7FsVCqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770639133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3137jRT+OGVBjRSlVLxC4ZBC1xo9OwhtVMSYGaVwsyo=;
	b=RXP7LsyVeEgZWEDQE1xAkNoxy/a8kpEXoHjadXmuhsdBMQfvO10zvFLkub/uCyFbVCBw6n
	nZTdGbLrLjFK0JCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 839EA3EA63;
	Mon,  9 Feb 2026 12:12:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JYzeHh3PiWnPEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 12:12:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: mixer: oss: Add card disconnect checkpoints
Date: Mon,  9 Feb 2026 13:12:11 +0100
Message-ID: <20260209121212.171430-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

ALSA OSS mixer layer calls the kcontrol ops rather individually, and
pending calls might be not always caught at disconnecting the device.

For avoiding the potential UAF scenarios, add sanity checks of the
card disconnection at each entry point of OSS mixer accesses.  The
rwsem is taken just before that check, hence the rest context should
be covered by that properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 8d2d46d03301..f4ad0bfb4dac 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -523,6 +523,8 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
+	if (card->shutdown)
+		return;
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
@@ -557,6 +559,8 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
+	if (card->shutdown)
+		return;
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
@@ -618,6 +622,8 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
+	if (card->shutdown)
+		return;
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
@@ -656,6 +662,8 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
+	if (card->shutdown)
+		return;
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
@@ -796,6 +804,8 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
 	guard(rwsem_read)(&card->controls_rwsem);
+	if (card->shutdown)
+		return -ENODEV;
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (!kctl)
 		return -ENOENT;
@@ -839,6 +849,8 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
 	guard(rwsem_read)(&card->controls_rwsem);
+	if (card->shutdown)
+		return -ENODEV;
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (!kctl)
 		return -ENOENT;
@@ -885,6 +897,8 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 	if (!info)
 		return -ENOMEM;
 	scoped_guard(rwsem_read, &card->controls_rwsem) {
+		if (card->shutdown)
+			return -ENODEV;
 		kcontrol = snd_mixer_oss_test_id(mixer, name, index);
 		if (kcontrol == NULL)
 			return 0;
@@ -1006,6 +1020,8 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	if (snd_mixer_oss_build_test_all(mixer, ptr, &slot))
 		return 0;
 	guard(rwsem_read)(&mixer->card->controls_rwsem);
+	if (mixer->card->shutdown)
+		return -ENODEV;
 	kctl = NULL;
 	if (!ptr->index)
 		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
-- 
2.53.0

