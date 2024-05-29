Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6143AA0
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975901; cv=none; b=EeeN3uUisCp/vrtWSV39VGpN8ZJ0Uy9LarxnqpNGxWCSRxfoV+etExUFX1o5Yl/3GlfyXLumA16gsMsohq5gIWXveTjeE4CfxmLakt55xk5/5A2NQmq8ncHSzvhZTSQCVeNm5uNH61/1NYMKfXFYHDvUNCpagcPquNb/UOlEV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975901; c=relaxed/simple;
	bh=T14Q/vFHS3My5yFD5NkahXedEVABzGPK5aEJmS0lMYA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KOPMTu2Z2d1WTeVAT6Dy/qIv+MhoP3tKVifoGlT/Y90Nr6cOnp3xNJ9SuMO9LtUDb9UMbXws5sQhDmqdyMs9hm8gASAF6URatsRfuWFZDw5AktOtwmOC6uvFAgarDNX5Y1ye/awGFnkfymW+iIXqizJTZtalDOQI1vRyg2kMpyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jbN7AgvL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iq/M48uU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jbN7AgvL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iq/M48uU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jbN7AgvL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iq/M48uU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jbN7AgvL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iq/M48uU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40DB722C42;
	Wed, 29 May 2024 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716975898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dY3c8/g2/lpDn82FFirTv+W2MGZ0oCZt9z2BtGlZlxk=;
	b=jbN7AgvL6g9c1EFYss5CSbe0wZH42sTfiB2Jd/VpCi6oDtrks+qfkbWnW2LXwdrNlXKk2g
	t3IVv/OGCg83njHd5/RMImfoc/ybEHmtTVNTPEdBfE4PUTq+fUKX5j1BvHKHDIIgFYNtTD
	Dg46bpZJTT1h52MVBUGgRT2lr8U+h+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716975898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dY3c8/g2/lpDn82FFirTv+W2MGZ0oCZt9z2BtGlZlxk=;
	b=Iq/M48uUf68qXnRvBfu5V6VJebsLk/jbcYXJGKlMHyacS1BhLKNI9BQREygznTrpAunYLr
	V4YVO335t53ogGDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jbN7AgvL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Iq/M48uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716975898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dY3c8/g2/lpDn82FFirTv+W2MGZ0oCZt9z2BtGlZlxk=;
	b=jbN7AgvL6g9c1EFYss5CSbe0wZH42sTfiB2Jd/VpCi6oDtrks+qfkbWnW2LXwdrNlXKk2g
	t3IVv/OGCg83njHd5/RMImfoc/ybEHmtTVNTPEdBfE4PUTq+fUKX5j1BvHKHDIIgFYNtTD
	Dg46bpZJTT1h52MVBUGgRT2lr8U+h+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716975898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dY3c8/g2/lpDn82FFirTv+W2MGZ0oCZt9z2BtGlZlxk=;
	b=Iq/M48uUf68qXnRvBfu5V6VJebsLk/jbcYXJGKlMHyacS1BhLKNI9BQREygznTrpAunYLr
	V4YVO335t53ogGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27E3413A6B;
	Wed, 29 May 2024 09:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jqWYCBr5VmbffwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 09:44:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: ump: Don't accept an invalid UMP protocol number
Date: Wed, 29 May 2024 11:45:10 +0200
Message-ID: <20240529094515.12666-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.00 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 40DB722C42
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.00

When a UMP Stream Configuration message is received, the driver tries
to switch the protocol, but there was no sanity check of the protocol,
hence it can pass an invalid value.  Add the check and bail out if a
wrong value is passed.

Fixes: a79807683781 ("ALSA: ump: Add helper to change MIDI protocol")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index fd6a68a54278..5bd7b77acb95 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -685,10 +685,16 @@ static void seq_notify_protocol(struct snd_ump_endpoint *ump)
  */
 int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol)
 {
+	unsigned int type;
+
 	protocol &= ump->info.protocol_caps;
 	if (protocol == ump->info.protocol)
 		return 0;
 
+	if (type != SNDRV_UMP_EP_INFO_PROTO_MIDI1 &&
+	    type != SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+		return 0;
+
 	ump->info.protocol = protocol;
 	ump_dbg(ump, "New protocol = %x (caps = %x)\n",
 		protocol, ump->info.protocol_caps);
-- 
2.43.0

