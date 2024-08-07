Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171681EA0BC
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=Kf9TjHPps4WiWbKkSr6vU/9uHJvivZoC/zenVvldI/04CIfkSD0j8PGPaCPdKEuMPeI7Fqv6G3n/5DVVvpqQZ7aUVLYO+HiJn92kfIeJU11WGWAmTGFEA+L/TTIm4Uwr9Uf8KCJP/pj4NZFbiRyeJPFQGwYsyIgjVi3oFVFME68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=PUDQCYGDGr2M8M/XLMqOgpYJ+vzjA4ipCVUG4rGEvBw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZU2GHJdtelC8A8UgBmRH+Sx1DH+YVgbOoif2tNvI3gs5sfUDKzXPaJYq67t/SPnRa0CY5uu5tLEAjm6Xih9LpeiyGBoWKk+cJQWLEENgizWEtGyVTEku1hqS38y5cFGRUVgfGKy4e88NnXVYhjpSEc5lWG4g/RgRyy9qnxuQzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jiqr5dN8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k2g6pwq7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jiqr5dN8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k2g6pwq7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jiqr5dN8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k2g6pwq7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jiqr5dN8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k2g6pwq7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 387DC1FB58;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8ChBBPGaXH0JtYYfLS3gscWORmcTbDUSUg+R089KAQ=;
	b=jiqr5dN8tUwJ4Ruxr8QHpLP07ahpynJl0qPceD1h5w6pqyDEOEvs9njxNmxb2GflDiEgoG
	kJx9mYiRCCpSvd+5Y56+KGeX9XewaXA5FJMIbp4RYBkUMtdOE/FaUoDqqNhdLL/GKkZres
	D12G48ysxT4hywrAJKkwqXGki2xUARU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8ChBBPGaXH0JtYYfLS3gscWORmcTbDUSUg+R089KAQ=;
	b=k2g6pwq76WYfpy1Cz0EaO+sA+UshFqgWHvQ8bRSEtDNYxdqUt1PJty/0/+5q7oortjA9hY
	33dr4s079UlYgjBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jiqr5dN8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k2g6pwq7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8ChBBPGaXH0JtYYfLS3gscWORmcTbDUSUg+R089KAQ=;
	b=jiqr5dN8tUwJ4Ruxr8QHpLP07ahpynJl0qPceD1h5w6pqyDEOEvs9njxNmxb2GflDiEgoG
	kJx9mYiRCCpSvd+5Y56+KGeX9XewaXA5FJMIbp4RYBkUMtdOE/FaUoDqqNhdLL/GKkZres
	D12G48ysxT4hywrAJKkwqXGki2xUARU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8ChBBPGaXH0JtYYfLS3gscWORmcTbDUSUg+R089KAQ=;
	b=k2g6pwq76WYfpy1Cz0EaO+sA+UshFqgWHvQ8bRSEtDNYxdqUt1PJty/0/+5q7oortjA9hY
	33dr4s079UlYgjBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2150B13A7D;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yO4KB953s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 41/54] ALSA: emu10k1: Use dev_warn()
Date: Wed,  7 Aug 2024 15:34:31 +0200
Message-ID: <20240807133452.9424-42-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 387DC1FB58
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Replace an open-coded printk warning with dev_warn() for code
simplicity and consistency.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1_patch.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_patch.c
index dbfa89435ac2..806b4f95cad1 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -40,8 +40,9 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_sf_sample *sp,
 
 	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP | SNDRV_SFNT_SAMPLE_REVERSE_LOOP)) {
 		/* should instead return -ENOTSUPP; but compatibility */
-		printk(KERN_WARNING "Emu10k1 wavetable patch %d with unsupported loop feature\n",
-		       sp->v.sample);
+		dev_warn(emu->card->dev,
+			 "Emu10k1 wavetable patch %d with unsupported loop feature\n",
+			 sp->v.sample);
 	}
 
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS) {
-- 
2.43.0

