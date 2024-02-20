Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDF73198
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708441729; cv=none; b=nvy8JfgSPOslol8snNPxmLjjeusKy6zsk1JeYC+dYy/5ZsN3+YT0q8OEBQpnanpadgS2z0fuh5a7IQ5qgPXNeH1DMaD5er0MTloj6/zKNF0QxFuimi89tFnoe9viegp0/MTtEKY8AvcQMnH4pT4wBxS91BOhqKdtzuA43ojT6IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708441729; c=relaxed/simple;
	bh=Zxx7LuzbjQKvkiH/ublU4XJw2PzIgnT7aZy8DBIQQG0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=kjP96Tjh2gpDZu9LShw7BJ6t2LtvPccFmE3XmHwFAJemEjUExi1dyr77AOR5sMVagESMjzve18MYNWkS1OZE45JawRgv2q4BXGY5sadDpFDijbEGecxdUU8udj2XICzbLhcKGMXFC11whkIMv4TsY8h4hhDhzOo+FSUlvK9UutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L7YsCtZ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VWYvzbKr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L7YsCtZ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VWYvzbKr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L7YsCtZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VWYvzbKr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L7YsCtZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VWYvzbKr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D8651F8A4;
	Tue, 20 Feb 2024 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708441725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hhDAe4meeLLd6ISoy7pjM6oHbvs7qwHroM3RsTBW0wU=;
	b=L7YsCtZ7810A6DymPl4dgDl+0hlyRCHBPM7jTkNBV0m3HrmlKTZYF0ZAVXiQXRwmh8RxOY
	/rzjCSCzetbGPCqpC5iFhcfg1IbyNhjvEk3EGDLVRX5RaSpyokJz62Sx4J+dF37lcSNvaJ
	SP9j6y15HbDfEJwXG53IPJK+KjGiTFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708441725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hhDAe4meeLLd6ISoy7pjM6oHbvs7qwHroM3RsTBW0wU=;
	b=VWYvzbKrGXXkO34ONZCXm31qBlu8tBiq6AtUi65csZomOFG5Oe06GcMJ5yRuqIiXsthiDL
	7TBQoWO4PcQeGcBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708441725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hhDAe4meeLLd6ISoy7pjM6oHbvs7qwHroM3RsTBW0wU=;
	b=L7YsCtZ7810A6DymPl4dgDl+0hlyRCHBPM7jTkNBV0m3HrmlKTZYF0ZAVXiQXRwmh8RxOY
	/rzjCSCzetbGPCqpC5iFhcfg1IbyNhjvEk3EGDLVRX5RaSpyokJz62Sx4J+dF37lcSNvaJ
	SP9j6y15HbDfEJwXG53IPJK+KjGiTFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708441725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hhDAe4meeLLd6ISoy7pjM6oHbvs7qwHroM3RsTBW0wU=;
	b=VWYvzbKrGXXkO34ONZCXm31qBlu8tBiq6AtUi65csZomOFG5Oe06GcMJ5yRuqIiXsthiDL
	7TBQoWO4PcQeGcBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EBAE139D0;
	Tue, 20 Feb 2024 15:08:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UAfHDn3A1GWnQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Feb 2024 15:08:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Fix the discard error code from snd_ump_legacy_open()
Date: Tue, 20 Feb 2024 16:08:43 +0100
Message-Id: <20240220150843.28630-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L7YsCtZ7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VWYvzbKr
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-0.996];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[41.64%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: 3.49
X-Rspamd-Queue-Id: 4D8651F8A4
X-Spam-Flag: NO

snd_ump_legacy_open() didn't return the error code properly even if it
couldn't open.  Fix it.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 3bef1944e955..fe7911498cc4 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -985,7 +985,7 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 	struct snd_ump_endpoint *ump = substream->rmidi->private_data;
 	int dir = substream->stream;
 	int group = ump->legacy_mapping[substream->number];
-	int err;
+	int err = 0;
 
 	mutex_lock(&ump->open_mutex);
 	if (ump->legacy_substreams[dir][group]) {
@@ -1009,7 +1009,7 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 	spin_unlock_irq(&ump->legacy_locks[dir]);
  unlock:
 	mutex_unlock(&ump->open_mutex);
-	return 0;
+	return err;
 }
 
 static int snd_ump_legacy_close(struct snd_rawmidi_substream *substream)
-- 
2.35.3

