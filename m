Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC297BB17
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713521083; cv=none; b=cuiOYKLcm6VHqToMdtgPZCCSclTKX4G3CdwOBqypPBe7RekvPs5YTc/igGZ+Id845dZFWRB3PmFxQvQbYT94x8C/rHA+25WOdWJhhryXuRKryHZfRjSuM2o7MfAU3Rgz5lhh3uALTbbpeuPRttdvGC8Pwodqc434DL4bgIXhQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713521083; c=relaxed/simple;
	bh=juL5TPVtjVPwQM2tR5RPd1BwZuu4NhwxNIRHkrBKSrk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rM/feMge2VdtlhF//IFJQ0QkQvkCr/VwmOVaeDSerbXSF1nWifXqsTl/eCzVDk8gBi2qUofScTZOmnfyNVelBqqlIt4xbrSDk7nXeJU14cZc2ttQCsZ0/k6Jql+x/Un0BePcMszMX912A2cb+FSx+khTdPdGRXbMmS3W5GebkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x3LwElir; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eU+nTVyl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x3LwElir; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eU+nTVyl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x3LwElir";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eU+nTVyl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x3LwElir";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eU+nTVyl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 68ECD5C0DC;
	Fri, 19 Apr 2024 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713521079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Js5eQf7RGjcaHvBQ0mc9d7WMJ/U656Qu903niBV1THg=;
	b=x3LwElirvZRB6aaAjElTxf8+JJfXEQFePCNY6ytlag6A89s9quSFiELdLah+xRM7CGTsTv
	+XKNc0rPsxHdgnYWP3Oww0+TGsliPx54fKlDkS3wt7T2z3VYP77oMkahvhaoiQtoiCP43c
	vXfdiLr6c37F8T4ISfsLTZNO+Ao7dQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713521079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Js5eQf7RGjcaHvBQ0mc9d7WMJ/U656Qu903niBV1THg=;
	b=eU+nTVylzO4ymn5w4UrDcIk1t6AaJXGS5QND1OkTpFocM4SL3xQ9+3TV17xCw/jf3+7HHK
	GG14Pdm033ccT2Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x3LwElir;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eU+nTVyl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713521079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Js5eQf7RGjcaHvBQ0mc9d7WMJ/U656Qu903niBV1THg=;
	b=x3LwElirvZRB6aaAjElTxf8+JJfXEQFePCNY6ytlag6A89s9quSFiELdLah+xRM7CGTsTv
	+XKNc0rPsxHdgnYWP3Oww0+TGsliPx54fKlDkS3wt7T2z3VYP77oMkahvhaoiQtoiCP43c
	vXfdiLr6c37F8T4ISfsLTZNO+Ao7dQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713521079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Js5eQf7RGjcaHvBQ0mc9d7WMJ/U656Qu903niBV1THg=;
	b=eU+nTVylzO4ymn5w4UrDcIk1t6AaJXGS5QND1OkTpFocM4SL3xQ9+3TV17xCw/jf3+7HHK
	GG14Pdm033ccT2Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EBCB136CF;
	Fri, 19 Apr 2024 10:04:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gf7lEbdBImYGDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Apr 2024 10:04:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: ump: Fix conversion from MIDI2 to MIDI1 UMP messages
Date: Fri, 19 Apr 2024 12:04:39 +0200
Message-ID: <20240419100442.14806-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.42 / 50.00];
	BAYES_HAM(-2.41)[97.32%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 68ECD5C0DC
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.42

The conversion from MIDI2 to MIDI1 UMP messages had a leftover
artifact (superfluous bit shift), and this resulted in the bogus type
check, leading to empty outputs.  Let's fix it.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: <stable@vger.kernel.org>
Link: https://github.com/alsa-project/alsa-utils/issues/262
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index b141024830ec..ee6ac649df83 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -428,7 +428,7 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 	midi1->note.group = midi2->note.group;
 	midi1->note.status = midi2->note.status;
 	midi1->note.channel = midi2->note.channel;
-	switch (midi2->note.status << 4) {
+	switch (midi2->note.status) {
 	case UMP_MSG_STATUS_NOTE_ON:
 	case UMP_MSG_STATUS_NOTE_OFF:
 		midi1->note.note = midi2->note.note;
-- 
2.43.0

