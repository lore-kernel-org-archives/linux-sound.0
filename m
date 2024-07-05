Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89A17995
	for <linux-sound@vger.kernel.org>; Fri,  5 Jul 2024 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720161331; cv=none; b=bxS8WzYWzHcyWFGdrEqPl9bw/ukzqMqOf7mWjByBrKNkgsKZDWF22dN0DufDgCrA9tU+G7fYdnxJdCow7jpX4PRrT75ClViG91ZaSaJ4QL19vUSd5ieSYefIsipFmbvgpl8Y7bbN4hAbS9iaQFpjn/o3QforPzo+wFm99YJQ7Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720161331; c=relaxed/simple;
	bh=v6v5zgj2iE/PhAYiwtYfmw8HiPV3+x3K7NNXWVH9ljg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnrrQ3jJImDPLJ6cl2up3QJ1dpSWWkAcRI9B8JK49dDo9kVBtpGWZedD6WkNgJijSCW/V7Bm7IxwQ1FnwYo9uTlYg067jydpP1MLEwrW3kVbVUlp26/R8fTfCvI/iBhN+8SP6diCpSOAFXzKEgxML9w120zJX2gzpK7ojkCKzFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dEJ65gsP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k4eb4Vgj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SUsrT+OH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iV0KBcUD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dEJ65gsP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k4eb4Vgj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SUsrT+OH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iV0KBcUD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC4981F818;
	Fri,  5 Jul 2024 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720161328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oKYAMEVyO4j7CKgEFqhWXsq0PTkGCfjsK/i3MN2HeFU=;
	b=dEJ65gsPkyigKs1sK7TdhdWK+gKOJiA/fImaYWYkhckvMLOusN78TXKxi/YzVi5wX07ppP
	UEAfzGBYW8Rt7DJdTLD6XPXWQr6B6/qs1HxDPp/jK6dLbx1WsUmGMfkoM5lhMUGM+lV3Zu
	siKV9Pgv0ZrpBu52olbiBYG8IyLPmmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720161328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oKYAMEVyO4j7CKgEFqhWXsq0PTkGCfjsK/i3MN2HeFU=;
	b=k4eb4VgjZT+qONxqt65qC2w/o+PTaseirmA1P0Bt79zxjhulCKbjvNOzoCuoBPzZfRjALs
	y1d7QeY2XYX7S3Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720161326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oKYAMEVyO4j7CKgEFqhWXsq0PTkGCfjsK/i3MN2HeFU=;
	b=SUsrT+OHGfzX4BGeszsv1q3BgSq4RM/qG7Ok3ZYGBRPP1iqlXMXPpNpVR2VwD/yUsVRmfK
	f5EvsPHKgWUdaxPVoizE4lITkUpR/7d+UX3XSXbk4iFHy+4OQ7FLC0SkiX2dpuSefyGjtv
	PsVEs8ef9jxiWp52uNiBKoyrDL3dK/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720161326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oKYAMEVyO4j7CKgEFqhWXsq0PTkGCfjsK/i3MN2HeFU=;
	b=iV0KBcUDu5fU+BGM5OzGvjDeYYDmu1KVmIB0Xx6l+K4QcMKyFr+o2Z+na6AasM/0dR8ffv
	1tWHA5UZeI8S1JBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B72A1396E;
	Fri,  5 Jul 2024 06:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2eejJC6Uh2bZGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jul 2024 06:35:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: pcm: Fix missing export of snd_pcm_set_sync_per-card()
Date: Fri,  5 Jul 2024 08:35:53 +0200
Message-ID: <20240705063555.17220-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,intel.com:email];
	RCVD_TLS_ALL(0.00)[]

The recent change for the PCM sync API forgot to export a new API
function that is currently used in emu10k1 driver.

This patch adds the missing export.

Fixes: d712c58c55d9 ("ALSA: pcm: optimize and clarify stream synchronization ID API")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407051343.1Sz8AKFt-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index e48a84f8e977..66683656fb13 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -547,6 +547,7 @@ void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
 	strncpy(params->sync + 4, id, len);
 	memset(params->sync + 4 + len, 0, 12 - len);
 }
+EXPORT_SYMBOL_GPL(snd_pcm_set_sync_per_card);
 
 /*
  *  Standard ioctl routine
-- 
2.43.0

