Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216B021CC43
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906939; cv=none; b=GWHsYtqW0ikuB0A3EDLwI+gyjykv/GLin8Yfxb3OuUhFHY5zp+ArAWeuW5BbndoioYfNpCvc2rrOkBZkEKVxz8o+1Co9vUyHtJnHyfUhB/KoGvkE+tWCLnd3F61Wb825sTrA+e7otFeVUky2mvMywLL/FFKtrcACFwQLQexe9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906939; c=relaxed/simple;
	bh=hTfgu0KzMJ2In9ubudqiVDTpBzdYhQw82Kol0XPkZCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ul4l/Ckfaywh+AzmdNOsXmIPtkBKAFZkpXh+DKaiOG851nJar+1eRzQW8DnjihGFeGA9cve6XxkPSOAZZDkth67lOe8eA5KM/oPYfh005/PG8SiJMhwGQnQpNi3YJ22PdwefWjZrVlkFlt4zGRBoLXjxFRgMUzCsaxTilMLBWQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MjP2d3Oe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/2GXw7k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MjP2d3Oe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/2GXw7k; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MjP2d3Oe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/2GXw7k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MjP2d3Oe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/2GXw7k"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DE6E33E60;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kettwrwHz0gsVmZgJCX4bPZo4WsJ/cCKPX/XotFW/3c=;
	b=MjP2d3Oeav/F8C9PN9e3WSzi9ElGs3hlnae81oYS1LAEHIU1OYVmOci3mPHbNokqngI5ZK
	Luya+yJDXEmF4DoTe30Kghta+WL2Jgy4xGHQsXNpQO+tBuih8acMgFSl6/S/lu5T70JbMs
	AO009lejffcVapaQpqsZ+gFi0a7slMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kettwrwHz0gsVmZgJCX4bPZo4WsJ/cCKPX/XotFW/3c=;
	b=Z/2GXw7kJKT+ZPnxbAtcWziS/9DD5Nx7NbahzeRsoNyPm4qbfwrqkXf4oavHEnGOYfNI+l
	5hAeva6bzfGuNVCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MjP2d3Oe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Z/2GXw7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kettwrwHz0gsVmZgJCX4bPZo4WsJ/cCKPX/XotFW/3c=;
	b=MjP2d3Oeav/F8C9PN9e3WSzi9ElGs3hlnae81oYS1LAEHIU1OYVmOci3mPHbNokqngI5ZK
	Luya+yJDXEmF4DoTe30Kghta+WL2Jgy4xGHQsXNpQO+tBuih8acMgFSl6/S/lu5T70JbMs
	AO009lejffcVapaQpqsZ+gFi0a7slMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kettwrwHz0gsVmZgJCX4bPZo4WsJ/cCKPX/XotFW/3c=;
	b=Z/2GXw7kJKT+ZPnxbAtcWziS/9DD5Nx7NbahzeRsoNyPm4qbfwrqkXf4oavHEnGOYfNI+l
	5hAeva6bzfGuNVCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3321F13479;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eFIqCxDBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 14/25] ALSA: hda/cs8409: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:48 +0200
Message-ID: <20250811100807.7962-15-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6DE6E33E60
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/cs8409.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index e32b462cdc5e..2c02d3be89ee 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -92,13 +92,12 @@ static void cs8409_disable_i2c_clock(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 
-	mutex_lock(&spec->i2c_mux);
+	guard(mutex)(&spec->i2c_mux);
 	if (spec->i2c_clck_enabled) {
 		cs8409_vendor_coef_set(spec->codec, 0x0,
 			       cs8409_vendor_coef_get(spec->codec, 0x0) & 0xfffffff7);
 		spec->i2c_clck_enabled = 0;
 	}
-	mutex_unlock(&spec->i2c_mux);
 }
 
 /*
@@ -204,7 +203,7 @@ static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr)
 	if (scodec->suspended)
 		return -EPERM;
 
-	mutex_lock(&spec->i2c_mux);
+	guard(mutex)(&spec->i2c_mux);
 	cs8409_enable_i2c_clock(codec);
 	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
@@ -219,12 +218,9 @@ static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr)
 	/* Register in bits 15-8 and the data in 7-0 */
 	read_data = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD);
 
-	mutex_unlock(&spec->i2c_mux);
-
 	return read_data & 0x0ff;
 
 error:
-	mutex_unlock(&spec->i2c_mux);
 	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, scodec->addr, addr);
 	return -EIO;
 }
@@ -247,7 +243,7 @@ static int cs8409_i2c_bulk_read(struct sub_codec *scodec, struct cs8409_i2c_para
 	if (scodec->suspended)
 		return -EPERM;
 
-	mutex_lock(&spec->i2c_mux);
+	guard(mutex)(&spec->i2c_mux);
 	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
 	for (i = 0; i < count; i++) {
@@ -264,12 +260,9 @@ static int cs8409_i2c_bulk_read(struct sub_codec *scodec, struct cs8409_i2c_para
 		seq[i].value = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD) & 0xff;
 	}
 
-	mutex_unlock(&spec->i2c_mux);
-
 	return 0;
 
 error:
-	mutex_unlock(&spec->i2c_mux);
 	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", scodec->addr);
 	return -EIO;
 }
@@ -291,7 +284,7 @@ static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigne
 	if (scodec->suspended)
 		return -EPERM;
 
-	mutex_lock(&spec->i2c_mux);
+	guard(mutex)(&spec->i2c_mux);
 
 	cs8409_enable_i2c_clock(codec);
 	cs8409_set_i2c_dev_addr(codec, scodec->addr);
@@ -305,11 +298,9 @@ static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigne
 	if (cs8409_i2c_wait_complete(codec) < 0)
 		goto error;
 
-	mutex_unlock(&spec->i2c_mux);
 	return 0;
 
 error:
-	mutex_unlock(&spec->i2c_mux);
 	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, scodec->addr, addr);
 	return -EIO;
 }
@@ -333,7 +324,7 @@ static int cs8409_i2c_bulk_write(struct sub_codec *scodec, const struct cs8409_i
 	if (scodec->suspended)
 		return -EPERM;
 
-	mutex_lock(&spec->i2c_mux);
+	guard(mutex)(&spec->i2c_mux);
 	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
 	for (i = 0; i < count; i++) {
@@ -353,12 +344,9 @@ static int cs8409_i2c_bulk_write(struct sub_codec *scodec, const struct cs8409_i
 			fsleep(seq[i].delay);
 	}
 
-	mutex_unlock(&spec->i2c_mux);
-
 	return 0;
 
 error:
-	mutex_unlock(&spec->i2c_mux);
 	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", scodec->addr);
 	return -EIO;
 }
-- 
2.50.1

