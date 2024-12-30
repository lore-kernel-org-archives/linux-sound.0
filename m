Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331A1632C8
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735558830; cv=none; b=b0qJVYhKgkregmGAYWer4JjvWDqU5uznj2ydgg0G4l0oG2X1vgJNmmpJ95txz3OlDYBcc5YK0/lRxrpKdbpVP7vMDdKHgps/rurmh/IwsSHBIG9Yo1I3nS6l3RkxfbkXdhkpfdIO6Qqt8dM2dzWqg9AJrf8RDCu8WRkMhhtTsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735558830; c=relaxed/simple;
	bh=aLBNgY1H61LL10taR+2d1LMChUhzvWG6EB92JlLbeqw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Hx0pJ6Bxmt/Uk3E6FaGTxa4rNr2Wgyxa8RXYlH9fTFkyagnjCCVpiqfNhv9M62PKklrEv5/zX7YwiEyF5xIWbWrGtNQ4mXJCpTbUxUSrfhMlobAhhsjtoT1AtKuipyw7x1Q0TNir9qv4UqpANipgMYG7kVqvwqCGiIXZOvTZ3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yn3kWk0v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jRVkhAGf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yn3kWk0v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jRVkhAGf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yn3kWk0v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRVkhAGf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yn3kWk0v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRVkhAGf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61A0E2116F;
	Mon, 30 Dec 2024 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735558826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g32yvEFUioQF81dqYF4Thahc7w2DxUTZ88sJnTNwRA4=;
	b=Yn3kWk0vqpUyPdoLcJuvtYm5hVJYlCcf+sakSDoCEKk4seGTOb7sE70hv415qOe3MA7UC1
	QOeTVfX6iG7Bj4gJxt+uzQSWxgqCeo22dfCxT/1JW4+XPoec9Hrv2pMR54kk/NQhLsPB+Q
	MhtaJjRnhhpPW9DHRlvulTbOGk9ovio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735558826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g32yvEFUioQF81dqYF4Thahc7w2DxUTZ88sJnTNwRA4=;
	b=jRVkhAGfPkqzDd8m3OaG1DFG3y1i0Mbr3Euyi3V2ZtlzegRb6dFs1OfCI8S4urmsrxo0L+
	K83JNris7K+NJ3DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yn3kWk0v;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jRVkhAGf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735558826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g32yvEFUioQF81dqYF4Thahc7w2DxUTZ88sJnTNwRA4=;
	b=Yn3kWk0vqpUyPdoLcJuvtYm5hVJYlCcf+sakSDoCEKk4seGTOb7sE70hv415qOe3MA7UC1
	QOeTVfX6iG7Bj4gJxt+uzQSWxgqCeo22dfCxT/1JW4+XPoec9Hrv2pMR54kk/NQhLsPB+Q
	MhtaJjRnhhpPW9DHRlvulTbOGk9ovio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735558826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g32yvEFUioQF81dqYF4Thahc7w2DxUTZ88sJnTNwRA4=;
	b=jRVkhAGfPkqzDd8m3OaG1DFG3y1i0Mbr3Euyi3V2ZtlzegRb6dFs1OfCI8S4urmsrxo0L+
	K83JNris7K+NJ3DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42A7813A6C;
	Mon, 30 Dec 2024 11:40:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mqEEDqqGcmc6dgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 11:40:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] Revert "ALSA: ump: Don't enumeration invalid groups for legacy rawmidi"
Date: Mon, 30 Dec 2024 12:40:22 +0100
Message-ID: <20241230114023.3787-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 61A0E2116F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This reverts commit c2d188e137e77294323132a760a4608321a36a70.

Although it's fine to filter the invalid UMP groups at the first probe
time, this will become a problem when UMP groups are updated and
(re-)activated.  Then there is no way to re-add the substreams
properly for the legacy rawmidi, and the new active groups will be
still invisible.

So let's revert the change.  This will move back to showing the full
16 groups, but it's better than forever lost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index fe4d39ae1159..9198bff4768c 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1244,7 +1244,7 @@ static int fill_legacy_mapping(struct snd_ump_endpoint *ump)
 
 	num = 0;
 	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++)
-		if ((group_maps & (1U << i)) && ump->groups[i].valid)
+		if (group_maps & (1U << i))
 			ump->legacy_mapping[num++] = i;
 
 	return num;
-- 
2.43.0

