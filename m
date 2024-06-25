Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8824B34
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719309099; cv=none; b=RmCzQMPzz3W97wpeotnXDeRKK6RiNAsgGRmtoJ9Jk5YGsCXTUY8/vu2Juym2RfzO1BT8wEsmobqdeUgcpxMoPOsG/99q+9BTOXmFgOSx+O5nSMZaBiTH2snDALTrsDkdZzN4nxGeRe1OZ4bwOaXpbXboHdeuhPIVr8W4s2P3XRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719309099; c=relaxed/simple;
	bh=7LwmaKNBoMTYFd8KgE8grDm+N6P5ZRz20cVd2zmYOX4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=chajX4ApDAKrBK+SWrNjpaP+XcQpXTMJWo7/VNf5EWL06WJsM4l0ZOdE/q+//Y/81TT8GEO8K3fgDrt7ItCBohHRGnS1o+waGWV/3+faxa7A0KZT3dXhgaTYvwnGraona1VWM2+3BwUody0OcEHUuJn7W0j3NU01iLiuf7t+ZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rQn6YEEC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Hzjwmbo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rQn6YEEC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Hzjwmbo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rQn6YEEC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Hzjwmbo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rQn6YEEC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Hzjwmbo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 89ECD219D2;
	Tue, 25 Jun 2024 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719309095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4LmDCbr4d12riFSQMM+/MKMk0Oz5Ar1FTN0f2TyVNaU=;
	b=rQn6YEEC4YrJ2KSMx3E9tkPO+0uBBM8VhD84hTmE/kTsTmo4fR1VOlvUFKQFZa1iqOU3iz
	qyfcjzoNTKQJNy6giRYeuLc5icnqd/pEOhtObUUEexrUBchn2n60JS+92+8BiPP6yyhfqs
	HXuw5rDdDD73rWZVdveI4B24RhoxLaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719309095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4LmDCbr4d12riFSQMM+/MKMk0Oz5Ar1FTN0f2TyVNaU=;
	b=6HzjwmboIitqoTgEHxY7/b3eV/Awk+eSQ0yYdFHz2/BVYAWWahTdIwRvLdZ3B+2Lo6GdND
	GLpCqbv2BPrMQbCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rQn6YEEC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6Hzjwmbo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719309095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4LmDCbr4d12riFSQMM+/MKMk0Oz5Ar1FTN0f2TyVNaU=;
	b=rQn6YEEC4YrJ2KSMx3E9tkPO+0uBBM8VhD84hTmE/kTsTmo4fR1VOlvUFKQFZa1iqOU3iz
	qyfcjzoNTKQJNy6giRYeuLc5icnqd/pEOhtObUUEexrUBchn2n60JS+92+8BiPP6yyhfqs
	HXuw5rDdDD73rWZVdveI4B24RhoxLaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719309095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4LmDCbr4d12riFSQMM+/MKMk0Oz5Ar1FTN0f2TyVNaU=;
	b=6HzjwmboIitqoTgEHxY7/b3eV/Awk+eSQ0yYdFHz2/BVYAWWahTdIwRvLdZ3B+2Lo6GdND
	GLpCqbv2BPrMQbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B36113A9A;
	Tue, 25 Jun 2024 09:51:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7vRxHSeTemYqUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 09:51:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix missing channel at encoding RPN/NRPN MIDI2 messages
Date: Tue, 25 Jun 2024 11:51:58 +0200
Message-ID: <20240625095200.25745-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 89ECD219D2
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The conversion from the legacy event to MIDI2 UMP for RPN and NRPN
missed the setup of the channel number, resulting in always the
channel 0.  Fix it.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index d81f776a4c3d..6687efdceea1 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -791,7 +791,8 @@ static int paf_ev_to_ump_midi2(const struct snd_seq_event *event,
 
 /* set up the MIDI2 RPN/NRPN packet data from the parsed info */
 static void fill_rpn(struct snd_seq_ump_midi2_bank *cc,
-		     union snd_ump_midi2_msg *data)
+		     union snd_ump_midi2_msg *data,
+		     unsigned char channel)
 {
 	if (cc->rpn_set) {
 		data->rpn.status = UMP_MSG_STATUS_RPN;
@@ -808,6 +809,7 @@ static void fill_rpn(struct snd_seq_ump_midi2_bank *cc,
 	}
 	data->rpn.data = upscale_14_to_32bit((cc->cc_data_msb << 7) |
 					     cc->cc_data_lsb);
+	data->rpn.channel = channel;
 	cc->cc_data_msb = cc->cc_data_lsb = 0;
 }
 
@@ -855,7 +857,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_data_lsb = val;
 		if (!(cc->rpn_set || cc->nrpn_set))
 			return 0; // skip
-		fill_rpn(cc, data);
+		fill_rpn(cc, data, channel);
 		return 1;
 	}
 
@@ -957,7 +959,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_data_lsb = lsb;
 		if (!(cc->rpn_set || cc->nrpn_set))
 			return 0; // skip
-		fill_rpn(cc, data);
+		fill_rpn(cc, data, channel);
 		return 1;
 	}
 
-- 
2.43.0

