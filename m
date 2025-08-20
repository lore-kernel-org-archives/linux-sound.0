Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5742A8C
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755667153; cv=none; b=mmlSvsjqD7gYIu8bZr6mw01GVEosnnuphtM402uw8tFrvb4/lhBngsHRn8zCjWJnyHyVF5hJXwMvS3K8XtsHfasDA6PfqK7AQnL8b81XgHXeEtu1wgZQJ4lBXVmenM9UjSEWyZ9ew3upf94xzYiMc5Brn7nFZI8CFOqrVS+nEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755667153; c=relaxed/simple;
	bh=/WGWK1bqyerwNLh2qox6QrhPgAnCzFUuMlfhLWizvJ4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iunlDuIP34wZkni1dlDvXA6s0+vq1zI3+3Mw4MM12EIqd0pCdY5HJW1LPQiKTfyUY0hAgjXdaBdDRosx7ak/cT4JOF6kii7bczAnlnPz5/TykOS0/ZBpM8CwIoLddylolfq6DuiW5+LZS/G/aZMsshK8dFlDMjsvjUl7tS63Ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d9bTsIe4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X0nfQw+8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d9bTsIe4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X0nfQw+8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d9bTsIe4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X0nfQw+8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d9bTsIe4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X0nfQw+8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47B9D21280;
	Wed, 20 Aug 2025 05:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755667144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DuJ0hxuDMX31RSURrxMyMa4gSDqRQtHmTf4N5195BjQ=;
	b=d9bTsIe4tQp5nRW9ofe/D5GyTC5mu6aOOpNEQ0XIy7hd6sq55WD3M2s32Sl9Gj7cy61HE8
	dX0p2NUNvnBRXuRfsL4U9SqHX4+8EPnZEwSi5SfY/lWpMJzX6RLzHS0hnvFAj7qxSK4OoJ
	mN+QNbScnHWLwZMa//bkEybPW/nvq6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755667144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DuJ0hxuDMX31RSURrxMyMa4gSDqRQtHmTf4N5195BjQ=;
	b=X0nfQw+82WVO+SU8dMQV8HI4wKp/RevWqDq8ShaQWEGmRFU3zehXvvvmCoaKohyomntZnN
	ipVzf1WYFeKpRoAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d9bTsIe4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X0nfQw+8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755667144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DuJ0hxuDMX31RSURrxMyMa4gSDqRQtHmTf4N5195BjQ=;
	b=d9bTsIe4tQp5nRW9ofe/D5GyTC5mu6aOOpNEQ0XIy7hd6sq55WD3M2s32Sl9Gj7cy61HE8
	dX0p2NUNvnBRXuRfsL4U9SqHX4+8EPnZEwSi5SfY/lWpMJzX6RLzHS0hnvFAj7qxSK4OoJ
	mN+QNbScnHWLwZMa//bkEybPW/nvq6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755667144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DuJ0hxuDMX31RSURrxMyMa4gSDqRQtHmTf4N5195BjQ=;
	b=X0nfQw+82WVO+SU8dMQV8HI4wKp/RevWqDq8ShaQWEGmRFU3zehXvvvmCoaKohyomntZnN
	ipVzf1WYFeKpRoAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A52B13867;
	Wed, 20 Aug 2025 05:19:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NoKgCMhapWg0MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Aug 2025 05:19:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: tas2781: Fix wrong reference of tasdevice_priv
Date: Wed, 20 Aug 2025 07:19:01 +0200
Message-ID: <20250820051902.4523-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,suse.com:url];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 47B9D21280
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

During the conversion to unify the calibration data management, the
reference to tasdevice_priv was wrongly set to h->hda_priv instead of
h->priv.  This resulted in memory corruption and crashes eventually.
Unfortunately it's a void pointer, hence the compiler couldn't know
that it's wrong.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1248270
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index b91fff3fde97..e34b17f0c9b9 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -305,7 +305,7 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 	efi_char16_t efi_name[TAS2563_CAL_VAR_NAME_MAX];
 	unsigned long max_size = TAS2563_CAL_DATA_SIZE;
 	unsigned char var8[TAS2563_CAL_VAR_NAME_MAX];
-	struct tasdevice_priv *p = h->hda_priv;
+	struct tasdevice_priv *p = h->priv;
 	struct calidata *cd = &p->cali_data;
 	struct cali_reg *r = &cd->cali_reg_array;
 	unsigned int offset = 0;
-- 
2.50.1

