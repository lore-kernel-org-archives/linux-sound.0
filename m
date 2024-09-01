Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080AD61FEB
	for <linux-sound@vger.kernel.org>; Sun,  1 Sep 2024 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725198293; cv=none; b=DBnlffvXiiGZJGZqBryNZEJnfkMxS5rfS954kqw6Qiu3Ey4sHF2gu1gqdfPk02jt4a1LenVQtDtiBJcn3MnKP0bTjuSTiqxSR6d26be7E0Lzwi6OFJZ299rCFit+sJqTxlg/auI38BsVz4bXlRxXnqglqQHxUSeOSGAyJ4Oj4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725198293; c=relaxed/simple;
	bh=lpVvoPQclkTwbc84rbM7vBO2iHMBMESQbgXAec02hC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMzWmFU4MG3DzVyF5G1fFSVaC5HnpVTWATeJEqa9+Nna1UGpYvtZ7tePJI3sQFM1LnKE6Ao/PkRiGiSfLreR7TGidx8JwRza8vnqRrX9Xs87myk6pQYeHdz9ZYkYz3WBcKr5+pz4oJD2un9632qrrD1jbQNjfC0ir3Oa9tjffdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyVnmy2j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qILRm6DS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyVnmy2j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qILRm6DS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyVnmy2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qILRm6DS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyVnmy2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qILRm6DS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 09D5C21AF2;
	Sun,  1 Sep 2024 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725198289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UC3KTMuX2tFuoGqwY71GISOh3kE9po4T8yo1eHJmyy4=;
	b=nyVnmy2jZe/AZBihwqmRdmbrxB1SQwPf0anN/Ab5rwJHp9vvyp2rEIb8Nni2vLpr6Zz95m
	CMO+KiwMUc8JAQj0mJRF2cvT+4Pd8rbTtAZZnnEzjMkaVXGDWL7E5U+yMrK5TFJtxR3qDQ
	ZrVLc69MYcJV6xwuQLdwXeShm1a0d08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725198289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UC3KTMuX2tFuoGqwY71GISOh3kE9po4T8yo1eHJmyy4=;
	b=qILRm6DSPEf9Jmqgijd2Kt6GRriYyVqITkZLwomBviXUIcifUqbyPVZhK6VSn1As6ZHbUQ
	xVfgv9hTWJpB+8CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725198289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UC3KTMuX2tFuoGqwY71GISOh3kE9po4T8yo1eHJmyy4=;
	b=nyVnmy2jZe/AZBihwqmRdmbrxB1SQwPf0anN/Ab5rwJHp9vvyp2rEIb8Nni2vLpr6Zz95m
	CMO+KiwMUc8JAQj0mJRF2cvT+4Pd8rbTtAZZnnEzjMkaVXGDWL7E5U+yMrK5TFJtxR3qDQ
	ZrVLc69MYcJV6xwuQLdwXeShm1a0d08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725198289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UC3KTMuX2tFuoGqwY71GISOh3kE9po4T8yo1eHJmyy4=;
	b=qILRm6DSPEf9Jmqgijd2Kt6GRriYyVqITkZLwomBviXUIcifUqbyPVZhK6VSn1As6ZHbUQ
	xVfgv9hTWJpB+8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7B1F139D4;
	Sun,  1 Sep 2024 13:44:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k/PfMtBv1GaiIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 01 Sep 2024 13:44:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Hongbo Li <lihongbo22@huawei.com>
Subject: [PATCH] ALSA: pcm: Fix the previous conversion to kstrtoul()
Date: Sun,  1 Sep 2024 15:45:12 +0200
Message-ID: <20240901134524.27107-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The previous replacement from simple_strtoul() to kstrtoul() forgot
that the passed pointer must be an unsigned long int pointer, while
the value used there is a sized_t pointer.  Fix it.

Fixes: 61bc4deff033 ("ALSA: pcm: replace simple_strtoul to kstrtoul")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409010425.YPS7cWeJ-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 73d4fc49a0ca..5001181208df 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -183,7 +183,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 	struct snd_pcm_substream *substream = entry->private_data;
 	struct snd_card *card = substream->pcm->card;
 	char line[64], str[64];
-	size_t size;
+	unsigned long size;
 	struct snd_dma_buffer new_dmab;
 
 	guard(mutex)(&substream->pcm->open_mutex);
-- 
2.43.0

