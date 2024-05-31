Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045C7441F
	for <linux-sound@vger.kernel.org>; Fri, 31 May 2024 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141854; cv=none; b=c0oe7r8XWRBWEg+hNKOJUwha9uLSIr/OBJzB770ReLpz+p0Ew5guN+F/f2xb1D7BzLIHp0RrWIZiqiGWYFICUsGvNWzWJyoA0oBfH3o0Pk2iOprhZQkgAKlLlQLJWbMyJiwodF1CEpX2f8DJiF2yu1/lhM9fnL1q6q9HeJjYZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141854; c=relaxed/simple;
	bh=xK/hkqJZXqj5CLHlCyE34K+f02JFmWFkhgFwHAWaH6k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UZ20FgpUwM7lt33aF5ZeAAVM00rqV+6nq7uDsS+f/IAziyOLLTfMbtRYEDXBvWUOKF2tOZOnOF+I6YVtx7X6aUC5NHxuFSbwAqBL36inRgk2+aCh6BqOyV/hxnzi62BBRzdDK5ZoLms0rbO8zErcQr8YsQxhMddxlZzddKHFhkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pwkiDBfI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mGO68tDq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pwkiDBfI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mGO68tDq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pwkiDBfI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mGO68tDq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pwkiDBfI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mGO68tDq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 610B721AB0;
	Fri, 31 May 2024 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717141850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7Wq0PIzhIAqe5Va3AlQZhsvJR81mxQigRXPXrd8s6Gc=;
	b=pwkiDBfIU/ENDuGyqf9isoAyDrbC85j+aOGODynp4ZAUr7JBAdi8PTDHzamzxgIfl2aydV
	R2gr1QJOaINMgvYJvfey/le7E3495atMWFqAeXB+QrlgpNqIaajwjksmO+1y5nAfvOOL2o
	VYGmspLqb71rGNYACvFPLMew9dSSM7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717141850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7Wq0PIzhIAqe5Va3AlQZhsvJR81mxQigRXPXrd8s6Gc=;
	b=mGO68tDqi0yHxc3ovyoMl9WjdNZLT7+A6fJXbBCIvc7OAvqFTUb7x1Vxl02ykCggSL08TA
	+go4cISjCHOM9mDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717141850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7Wq0PIzhIAqe5Va3AlQZhsvJR81mxQigRXPXrd8s6Gc=;
	b=pwkiDBfIU/ENDuGyqf9isoAyDrbC85j+aOGODynp4ZAUr7JBAdi8PTDHzamzxgIfl2aydV
	R2gr1QJOaINMgvYJvfey/le7E3495atMWFqAeXB+QrlgpNqIaajwjksmO+1y5nAfvOOL2o
	VYGmspLqb71rGNYACvFPLMew9dSSM7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717141850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7Wq0PIzhIAqe5Va3AlQZhsvJR81mxQigRXPXrd8s6Gc=;
	b=mGO68tDqi0yHxc3ovyoMl9WjdNZLT7+A6fJXbBCIvc7OAvqFTUb7x1Vxl02ykCggSL08TA
	+go4cISjCHOM9mDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43B16132C2;
	Fri, 31 May 2024 07:50:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CWAzD1qBWWbjewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 May 2024 07:50:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: ump: Fix swapped song position pointer data
Date: Fri, 31 May 2024 09:51:07 +0200
Message-ID: <20240531075110.3250-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.77
X-Spam-Level: 
X-Spamd-Result: default: False [-2.77 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.17)[-0.850];
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

At converting between the legacy event and UMP, the parameters for
MIDI Song Position Pointer are incorrectly stored.  It should have
been LSB -> MSB order while it stored in MSB -> LSB order.
This patch corrects the ordering.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index f0f332017e66..171fb75267af 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -157,7 +157,7 @@ static void ump_system_to_one_param_ev(const union snd_ump_midi1_msg *val,
 static void ump_system_to_songpos_ev(const union snd_ump_midi1_msg *val,
 				     struct snd_seq_event *ev)
 {
-	ev->data.control.value = (val->system.parm1 << 7) | val->system.parm2;
+	ev->data.control.value = (val->system.parm2 << 7) | val->system.parm1;
 }
 
 /* Encoders for 0xf0 - 0xff */
@@ -754,8 +754,8 @@ static int system_2p_ev_to_ump_midi1(const struct snd_seq_event *event,
 {
 	data->system.type = UMP_MSG_TYPE_SYSTEM; // override
 	data->system.status = status;
-	data->system.parm1 = (event->data.control.value >> 7) & 0x7f;
-	data->system.parm2 = event->data.control.value & 0x7f;
+	data->system.parm1 = event->data.control.value & 0x7f;
+	data->system.parm2 = (event->data.control.value >> 7) & 0x7f;
 	return 1;
 }
 
-- 
2.43.0

