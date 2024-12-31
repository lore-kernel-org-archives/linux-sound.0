Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBAB2F4A
	for <linux-sound@vger.kernel.org>; Tue, 31 Dec 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735656844; cv=none; b=W3/e3KXu9v/FbfecfDYQ6PV3ntmy9AIvHxDb0bfnmJN+5HJ1r49IeMYWzUrUMavrpRsjoaQaHO8oTomSQnO0UhjT/aTrQ54Vg8W3a5y5fq1kwvzSkEhjJrOWahLwa93KvD1NTCs5KXxyBqpqzOYOcziWNID9QHv3IvFUDAM1xJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735656844; c=relaxed/simple;
	bh=qvpxlMDP3wgmiYQwgvaZYLOwh22YeDciUGt1z0iSZT4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=if4EzrqQ6Jl8+DFEPYgnTPZR6p+01v71MpgBZ1GlP92OojneuysULuUA9gWxZn2HIXjtWc7czBu/zdRC/QAIlDXA4kLU7ovS4CiuioDYgoQJoTAbuVjfI+YmuNrtHal2AkoU31mi6eHI+C1vh0OdY8B23qaIsl+3nOMdBEXMrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ljKOKlqU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zmRlVrol; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ljKOKlqU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zmRlVrol; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ljKOKlqU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmRlVrol";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ljKOKlqU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmRlVrol"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48B8D1F381;
	Tue, 31 Dec 2024 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735656840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bBQnHo7eVYvmfE1OoJ8+WPNwCGi34przGBqxQisXCdk=;
	b=ljKOKlqUKN37ldLej54z/9SMD9Q4ViZs+JoD0uvXum7yHOMc9GNlqQMkGPvaG0cIYfBd09
	80+/SXPJbHPHw8fVv+xAMKp0/TpWlmmmF/OPRvG73Hoah+GwRCI+0exOn8YjwG5CZBy9N5
	pCUweyKZub2Hy3EIeIDbOYjdxyNJ3M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735656840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bBQnHo7eVYvmfE1OoJ8+WPNwCGi34przGBqxQisXCdk=;
	b=zmRlVrolEMJqYYnWEQNqR6tHkQsDlceRuHXoEArMMoixy2SPvVgjEGsufVS4W0mVNGzUpq
	LGl1taWdDI6F63Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ljKOKlqU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zmRlVrol
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735656840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bBQnHo7eVYvmfE1OoJ8+WPNwCGi34przGBqxQisXCdk=;
	b=ljKOKlqUKN37ldLej54z/9SMD9Q4ViZs+JoD0uvXum7yHOMc9GNlqQMkGPvaG0cIYfBd09
	80+/SXPJbHPHw8fVv+xAMKp0/TpWlmmmF/OPRvG73Hoah+GwRCI+0exOn8YjwG5CZBy9N5
	pCUweyKZub2Hy3EIeIDbOYjdxyNJ3M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735656840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bBQnHo7eVYvmfE1OoJ8+WPNwCGi34przGBqxQisXCdk=;
	b=zmRlVrolEMJqYYnWEQNqR6tHkQsDlceRuHXoEArMMoixy2SPvVgjEGsufVS4W0mVNGzUpq
	LGl1taWdDI6F63Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C48513A67;
	Tue, 31 Dec 2024 14:54:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E+9GCYgFdGc/TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Dec 2024 14:54:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Check UMP support for midi_version change
Date: Tue, 31 Dec 2024 15:53:58 +0100
Message-ID: <20241231145358.21946-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 48B8D1F381
X-Spam-Level: 
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
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

When the kernel is built without UMP support but a user-space app
requires the midi_version > 0, the kernel should return an error.
Otherwise user-space assumes as if it were possible to deal,
eventually hitting serious errors later.

Fixes: 46397622a3fa ("ALSA: seq: Add UMP support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index fe2d7f901610..498952161cfb 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1275,10 +1275,16 @@ static int snd_seq_ioctl_set_client_info(struct snd_seq_client *client,
 	if (client->type != client_info->type)
 		return -EINVAL;
 
-	/* check validity of midi_version field */
-	if (client->user_pversion >= SNDRV_PROTOCOL_VERSION(1, 0, 3) &&
-	    client_info->midi_version > SNDRV_SEQ_CLIENT_UMP_MIDI_2_0)
-		return -EINVAL;
+	if (client->user_pversion >= SNDRV_PROTOCOL_VERSION(1, 0, 3)) {
+		/* check validity of midi_version field */
+		if (client_info->midi_version > SNDRV_SEQ_CLIENT_UMP_MIDI_2_0)
+			return -EINVAL;
+
+		/* check if UMP is supported in kernel */
+		if (!IS_ENABLED(CONFIG_SND_SEQ_UMP) &&
+		    client_info->midi_version > 0)
+			return -EINVAL;
+	}
 
 	/* fill the info fields */
 	if (client_info->name[0])
-- 
2.43.0

