Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6117E900
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716823122; cv=none; b=IvoAFi8ceJjkq4kWCJr64NmaWzeuT4qHdyhAJsE+BMQf9FB1sJWpwZs5M3Uyix7puUqNTzB6Jtwv3Qs8EpPsgZERjHbYxZNET0HbdWq1LbVuSXYuQlz5Mm4zbobTgJIUkgJW+5XM120PEAzZ5gjPLyJX/2vZyYPwVMLmASrYfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716823122; c=relaxed/simple;
	bh=n2hqvDVgn9oWpHhs2Bm4qxLtrEh1K4B6VeRMeSkZMQU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cEwZKXJabSNSzGix8BIGsJHksA5lDT+P8rAbMdqBsiN9dYICu7IJLg23XVmrOgqBtgQ/Z2mrR2I5qcksnMTYw4cWBLcgpP2uAF+EQSTJBrSC4xz2tnY/1vPgwQYHH6jmWevFLmoVPAAuHLD/5gK5XcHABzubimhGut7huZPZWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TEZzaRYr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=58Mi9v4+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TEZzaRYr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=58Mi9v4+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TEZzaRYr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="58Mi9v4+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TEZzaRYr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="58Mi9v4+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47C1821E79;
	Mon, 27 May 2024 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716823119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=U5rCj10CuEuskFD3Ok+CJI23iwObxKk0PSBZ7ZnV35w=;
	b=TEZzaRYrBHbvRdBF4W8fs4ytuksTag3cfEXzOFiA7CNzbMgKL04/pbtb+5ITsJ+PvYEXvm
	d4ir2fxQWm+zVzxou2LmdIJilpfaQcCDiPY7u9PZASpBmzucBl8N+4cETyQ1RVQ1I354h3
	xMNtjd3y74tzSz/BPxk2IbiV8OcmjEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716823119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=U5rCj10CuEuskFD3Ok+CJI23iwObxKk0PSBZ7ZnV35w=;
	b=58Mi9v4+iVugAoPM5ZdFelwMSxQtnsx+n5XX6EbqKZytEvVtGXptLBuKrQk7tFmRx/qSXK
	gsyAFwLbWxJeFMBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716823119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=U5rCj10CuEuskFD3Ok+CJI23iwObxKk0PSBZ7ZnV35w=;
	b=TEZzaRYrBHbvRdBF4W8fs4ytuksTag3cfEXzOFiA7CNzbMgKL04/pbtb+5ITsJ+PvYEXvm
	d4ir2fxQWm+zVzxou2LmdIJilpfaQcCDiPY7u9PZASpBmzucBl8N+4cETyQ1RVQ1I354h3
	xMNtjd3y74tzSz/BPxk2IbiV8OcmjEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716823119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=U5rCj10CuEuskFD3Ok+CJI23iwObxKk0PSBZ7ZnV35w=;
	b=58Mi9v4+iVugAoPM5ZdFelwMSxQtnsx+n5XX6EbqKZytEvVtGXptLBuKrQk7tFmRx/qSXK
	gsyAFwLbWxJeFMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AB1513A6B;
	Mon, 27 May 2024 15:18:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8f0kCU+kVGZWPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 May 2024 15:18:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: seq: Fix missing bank setup between MIDI1/MIDI2 UMP conversion
Date: Mon, 27 May 2024 17:18:49 +0200
Message-ID: <20240527151852.29036-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

When a UMP packet is converted between MIDI1 and MIDI2 protocols, the
bank selection may be lost.  The conversion from MIDI1 to MIDI2 needs
the encoding of the bank into UMP_MSG_STATUS_PROGRAM bits, while the
conversion from MIDI2 to MIDI1 needs the extraction from that
instead.

This patch implements the missing bank selection mechanism in those
conversions.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index ee6ac649df83..c21be87f5da9 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -368,6 +368,7 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 	struct snd_seq_ump_event ev_cvt;
 	const union snd_ump_midi1_msg *midi1 = (const union snd_ump_midi1_msg *)event->ump;
 	union snd_ump_midi2_msg *midi2 = (union snd_ump_midi2_msg *)ev_cvt.ump;
+	struct snd_seq_ump_midi2_bank *cc;
 
 	ev_cvt = *event;
 	memset(&ev_cvt.ump, 0, sizeof(ev_cvt.ump));
@@ -387,11 +388,29 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 		midi2->paf.data = upscale_7_to_32bit(midi1->paf.data);
 		break;
 	case UMP_MSG_STATUS_CC:
+		cc = &dest_port->midi2_bank[midi1->note.channel];
+		switch (midi1->cc.index) {
+		case UMP_CC_BANK_SELECT:
+			cc->bank_set = 1;
+			cc->cc_bank_msb = midi1->cc.data;
+			return 0; // skip
+		case UMP_CC_BANK_SELECT_LSB:
+			cc->bank_set = 1;
+			cc->cc_bank_lsb = midi1->cc.data;
+			return 0; // skip
+		}
 		midi2->cc.index = midi1->cc.index;
 		midi2->cc.data = upscale_7_to_32bit(midi1->cc.data);
 		break;
 	case UMP_MSG_STATUS_PROGRAM:
 		midi2->pg.program = midi1->pg.program;
+		cc = &dest_port->midi2_bank[midi1->note.channel];
+		if (cc->bank_set) {
+			midi2->pg.bank_valid = 1;
+			midi2->pg.bank_msb = cc->cc_bank_msb;
+			midi2->pg.bank_lsb = cc->cc_bank_lsb;
+			cc->bank_set = 0;
+		}
 		break;
 	case UMP_MSG_STATUS_CHANNEL_PRESSURE:
 		midi2->caf.data = upscale_7_to_32bit(midi1->caf.data);
@@ -419,6 +438,7 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 	struct snd_seq_ump_event ev_cvt;
 	union snd_ump_midi1_msg *midi1 = (union snd_ump_midi1_msg *)ev_cvt.ump;
 	const union snd_ump_midi2_msg *midi2 = (const union snd_ump_midi2_msg *)event->ump;
+	int err;
 	u16 v;
 
 	ev_cvt = *event;
@@ -443,6 +463,24 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 		midi1->cc.data = downscale_32_to_7bit(midi2->cc.data);
 		break;
 	case UMP_MSG_STATUS_PROGRAM:
+		if (midi2->pg.bank_valid) {
+			midi1->cc.status = UMP_MSG_STATUS_CC;
+			midi1->cc.index = UMP_CC_BANK_SELECT;
+			midi1->cc.data = midi2->pg.bank_msb;
+			err = __snd_seq_deliver_single_event(dest, dest_port,
+							     (struct snd_seq_event *)&ev_cvt,
+							     atomic, hop);
+			if (err < 0)
+				return err;
+			midi1->cc.index = UMP_CC_BANK_SELECT_LSB;
+			midi1->cc.data = midi2->pg.bank_lsb;
+			err = __snd_seq_deliver_single_event(dest, dest_port,
+							     (struct snd_seq_event *)&ev_cvt,
+							     atomic, hop);
+			if (err < 0)
+				return err;
+			midi1->note.status = midi2->note.status;
+		}
 		midi1->pg.program = midi2->pg.program;
 		break;
 	case UMP_MSG_STATUS_CHANNEL_PRESSURE:
-- 
2.43.0

