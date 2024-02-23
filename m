Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE384FB2
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705705; cv=none; b=LVIbwnu+DYJ3+05yWKbNXm6V6FRCpasNB0Iv9Ooc9U5c4wwYPym5JixmsHKMfcjgt2EsB3n9VnQ/lNGZoTA+G4NWnsmuldCoaS3MJRncFOO4DAtG7HY2uzaJgafM6+XLVgeynWQJlpzc+UKe8JOuY29y4dQBEVgOXTTmBKC0kk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705705; c=relaxed/simple;
	bh=StSRseVduxz2CzYVmw15vcm84+58r95yzclWyvAb9Kg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=InfbUiyCeojRy79iGoADtmhwhrRgAelPbkvCcM73NkCBBRYArwYEiOk19xYrUZvgMkonV2f4WN/9uRHWAHO01sV1zQvFVI5S7rPxelLQktMIu5DKyYgbNKiMyOYk2Xsb0gASfzMTqTcGFnVbem9qLxCOA4+KkL+eBfsAcdaoQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15aVt1Wk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JP18qEFp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15aVt1Wk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JP18qEFp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15aVt1Wk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JP18qEFp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15aVt1Wk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JP18qEFp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12EBE2210D;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=15aVt1Wk+ZjoHPT5jVJpmUrZxVs+Su67c/+PF78Y7vOyaHhxo+SDHNaYKBv9L3kyDhelZf
	oITrWwCRZh4Irh9N1AqieEHyuR8GiGApLEWMWyz2XBY4VmeeKNfIRPdqp9yc0axBuJloKS
	tk+MBSday0qTYA69mPoEP1Gxt5/qlJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=JP18qEFp5QMBAKDx9o7mN+qJa/JWwvICPWCk7aZBJ5U0xEBcaHdb40h3rAMRGEjKzTdBED
	S8CcnjUbm0HDvZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=15aVt1Wk+ZjoHPT5jVJpmUrZxVs+Su67c/+PF78Y7vOyaHhxo+SDHNaYKBv9L3kyDhelZf
	oITrWwCRZh4Irh9N1AqieEHyuR8GiGApLEWMWyz2XBY4VmeeKNfIRPdqp9yc0axBuJloKS
	tk+MBSday0qTYA69mPoEP1Gxt5/qlJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=JP18qEFp5QMBAKDx9o7mN+qJa/JWwvICPWCk7aZBJ5U0xEBcaHdb40h3rAMRGEjKzTdBED
	S8CcnjUbm0HDvZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB3FD133DC;
	Fri, 23 Feb 2024 16:28:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6C4LOKTH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 18/24] ALSA: seq: ump: Use guard() for locking
Date: Fri, 23 Feb 2024 17:28:04 +0100
Message-Id: <20240223162810.32302-19-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223162810.32302-1-tiwai@suse.de>
References: <20240223162810.32302-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.71
X-Spamd-Result: default: False [0.71 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.19)[-0.964];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%]
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index ccac2d3a9fbc..c627d72f7fe2 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -115,21 +115,19 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
-	int err = 0;
+	int err;
 
-	mutex_lock(&ump->open_mutex);
+	guard(mutex)(&ump->open_mutex);
 	if (dir == STR_OUT && !client->opened[dir]) {
 		err = snd_rawmidi_kernel_open(&ump->core, 0,
 					      SNDRV_RAWMIDI_LFLG_OUTPUT |
 					      SNDRV_RAWMIDI_LFLG_APPEND,
 					      &client->out_rfile);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	client->opened[dir]++;
- unlock:
-	mutex_unlock(&ump->open_mutex);
-	return err;
+	return 0;
 }
 
 /* close the rawmidi */
@@ -137,11 +135,10 @@ static int seq_ump_client_close(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
 
-	mutex_lock(&ump->open_mutex);
+	guard(mutex)(&ump->open_mutex);
 	if (!--client->opened[dir])
 		if (dir == STR_OUT)
 			snd_rawmidi_kernel_release(&client->out_rfile);
-	mutex_unlock(&ump->open_mutex);
 	return 0;
 }
 
-- 
2.35.3

