Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFF2FABEB
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807001; cv=none; b=QZf+TR4M2KKTL1U64NKsLPvgTDiDq4nBp8RAXINQ6lgvV8bqxnShfJym3CyHhotGEnPCUSAOzjXOU6hnP2aIIlWkQNdj9vljP+BMt/0QDTcyCFmCuJQ9vSAaJ1eCbWh4JNWzsGm6467KtAkrBWHMi0qsCebuZpLDk6HgskPj4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807001; c=relaxed/simple;
	bh=3paAJu+GFVLpcdQbR2Hh+q1aZA7nx6+uhTUmGBklY1w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=etFHo2bBAT5jyYdhn55Rl7uyjlQKd2f++Cf7xPUup1GTfpaZoRV37b25nyJu31mCEXBVw/VRnpuEttbE27Iqadvgnbk66VcLiaqgMseL+3ecqlGFjeFiU04nN0mxt6WCq1QG/gbhMTm+m+2w5h8W8aBxrmSDQWjt537syj7/hxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aQrtnDbs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QUWL9awS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qs0C6vFX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h2jkiVEj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aQrtnDbs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QUWL9awS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qs0C6vFX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2jkiVEj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC7CB1F456;
	Tue,  2 Sep 2025 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756806998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nU/BdWCav08gkjuN31RTpUzDfpG+iyp9WLLnBMqpWFQ=;
	b=aQrtnDbs5OEofbnp7HqrBs4D8RDUJoM9F3shbDrZwi/6sqTnuf0A8HcfiRcdE4khR4W2YI
	ikTjgD0659+EVjc2QlFkiXgTR6b6dppkiVW1xDUWO+sxg5oBQ6t2hv8A7KnZkhExspI7lS
	N/BCrl7j+G1Xcmck1foC7AOZZrKVwZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756806998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nU/BdWCav08gkjuN31RTpUzDfpG+iyp9WLLnBMqpWFQ=;
	b=QUWL9awSsO6ZBnOk2rXU+g3QkIY8gO3VeIPAvUJdavLggaApLyUbcmce2ibFjvrM9COMkd
	qtqKOMDlekMkAgBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qs0C6vFX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h2jkiVEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756806997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nU/BdWCav08gkjuN31RTpUzDfpG+iyp9WLLnBMqpWFQ=;
	b=qs0C6vFXwd/JNbDSWUVbHrnRxqqr//PPqq0BMNq0a+lN9VSd82Jgb8hdwau9tWY3qSNioW
	IX3fhsf6CaZuJA6BaUSBDigVUaMPI8D8CUwmbyc5FQZ27/j+RvPlKmsbKBsYQqNzzonjxN
	+lDfENjmPemviK4cirp76fVeHzQsXwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756806997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nU/BdWCav08gkjuN31RTpUzDfpG+iyp9WLLnBMqpWFQ=;
	b=h2jkiVEjON4lOJGiW/0emk3JgJBQIIvofWwWoGrFOjxyDo83RRWZN1nEnxeTMxnbU6nOpY
	4umIUyp8AuWu4VCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF59C13882;
	Tue,  2 Sep 2025 09:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7KUCMlW/tmggFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Sep 2025 09:56:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Use is_s4_resume() macro
Date: Tue,  2 Sep 2025 11:56:35 +0200
Message-ID: <20250902095636.21462-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DC7CB1F456
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use the given macro for determining the resume state instead of
referring to the raw value.

Only a cleanup for now.  The infrastructure might be changed in
future, though.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 26ccd8d7c6d8..02ed1ac27d47 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -872,8 +872,7 @@ static void alc294_init(struct hda_codec *codec)
 	struct alc_spec *spec = codec->spec;
 
 	/* required only at boot or S4 resume time */
-	if (!spec->done_hp_init ||
-	    codec->core.dev.power.power_state.event == PM_EVENT_RESTORE) {
+	if (!spec->done_hp_init || is_s4_resume(codec)) {
 		alc294_hp_init(codec);
 		spec->done_hp_init = true;
 	}
-- 
2.50.1

