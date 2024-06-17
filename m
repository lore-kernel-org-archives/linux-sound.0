Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24CF190682
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618708; cv=none; b=AgHW/wcQuE4wJPpMezg0SMXsrXKAnP+X9UebvuV9TX7xKw6HFZjX6grt8ijVf/cK5Hj0G5PZ8Pac9jMdoRIenZFl7vShZzePBt0UNQVbdM3cDcjnMwXKcTUjf5j3f6zj9jegI6CdBEEzMrxJ0NN5KQ0+m5QRnqsb2FWhnkg3xtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618708; c=relaxed/simple;
	bh=0MHpYgIx6ad588In1TCr3DXy3wEgZxTNVNMQ3FIL7WA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb27efZLSdtvfStSMTzDc+kDyRYFpsWDBZeF2ZzIUlHj8CEoXSjS+vKum8HVuhctL0JMuy12AX9zQbZctL14nbkHKgyWcHob+Gh/Be6qA6oA04w1eKYwRzJHxtpBw4xCPgwEjEJl772y0eEQ9T1bwoqkl1rbECyr22X+10IUwOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MPAp1O7R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V+HSCnY2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MPAp1O7R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V+HSCnY2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MPAp1O7R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V+HSCnY2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MPAp1O7R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V+HSCnY2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BF4637FCF;
	Mon, 17 Jun 2024 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBh0gYve4T3U5Br9133HFh4LoR0k6JYig8NSngfVLTg=;
	b=MPAp1O7RsJ2rCJf14jbmzDOi5U++1ypEcB95N+fmR/QVECn+SPCgEgs8PFiKhvJNyrvb0B
	y6S7SSwukWF7y+IawKYvDQmydGDYHnui8afE3nJWX9ZLIHwlQVizqZWqbStUZX87TJW6cD
	8P7RC6W2iM9Sg6E8tOgzKYJA60U+Tws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBh0gYve4T3U5Br9133HFh4LoR0k6JYig8NSngfVLTg=;
	b=V+HSCnY24xv8Mvv/uMObqZ8Ea/SF9C6ZjbAbAcBbADDQOXR4q/lg5yNCn9iRmTT6YEHB4m
	rrpus6aZ8GBxgoAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MPAp1O7R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V+HSCnY2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBh0gYve4T3U5Br9133HFh4LoR0k6JYig8NSngfVLTg=;
	b=MPAp1O7RsJ2rCJf14jbmzDOi5U++1ypEcB95N+fmR/QVECn+SPCgEgs8PFiKhvJNyrvb0B
	y6S7SSwukWF7y+IawKYvDQmydGDYHnui8afE3nJWX9ZLIHwlQVizqZWqbStUZX87TJW6cD
	8P7RC6W2iM9Sg6E8tOgzKYJA60U+Tws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBh0gYve4T3U5Br9133HFh4LoR0k6JYig8NSngfVLTg=;
	b=V+HSCnY24xv8Mvv/uMObqZ8Ea/SF9C6ZjbAbAcBbADDQOXR4q/lg5yNCn9iRmTT6YEHB4m
	rrpus6aZ8GBxgoAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E603C139AB;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cAjxNlAKcGYfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Jun 2024 10:05:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/5] ALSA: spi: Drop NULL check for snd_ctl_remove()
Date: Mon, 17 Jun 2024 12:05:27 +0200
Message-ID: <20240617100529.6667-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617100529.6667-1-tiwai@suse.de>
References: <20240617100529.6667-1-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0BF4637FCF
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Since snd_ctl_remove() accepts the NULL kcontrol argument now, we can
drop the check in the caller side.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/spi/at73c213.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index 5648d744aa79..8f6929ced2c8 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -726,12 +726,8 @@ static int snd_at73c213_mixer(struct snd_at73c213 *chip)
 	return 0;
 
 cleanup:
-	for (idx = 1; idx < ARRAY_SIZE(snd_at73c213_controls) + 1; idx++) {
-		struct snd_kcontrol *kctl;
-		kctl = snd_ctl_find_numid(card, idx);
-		if (kctl)
-			snd_ctl_remove(card, kctl);
-	}
+	for (idx = 1; idx < ARRAY_SIZE(snd_at73c213_controls) + 1; idx++)
+		snd_ctl_remove(card, snd_ctl_find_numid(card, idx));
 	return errval;
 }
 
-- 
2.43.0

