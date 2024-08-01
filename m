Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0D157E91
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494490; cv=none; b=h/J0U5ZpVrIgTcuFcA72kSyQD11S4KZDH5QqsyzqrCZxwPwCNFUJ6q7/VHJmiYAauaIk08m8v/UNU9ZO5ZwpucVw+Pb0T6xwgT+cznykyRV6TO7qih1RrGJPBxl2YUl6RGoRwwcYwJX/71Rmc9bXDp4LLahhtXbxrjyqkOJ1cBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494490; c=relaxed/simple;
	bh=IsRfV/U+O0ZAAqrCsj8HfvihLwXiEgAW4LWcqvbYdO8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LhaAEd7D4cCYKEgiSc0SH1KN164RIh0Ne7wLg7as4OAWXc0dXCGlhPq902XeSZl0mt+XEY9mw6HeejhPB70tZy1BywRB24aZEgcQvMXvgZ6vjZLREjJHxCqB0n5Lupij4C7iwJjw3yW90xnfQFsuurpuLhbEnaK7T9Kd/9AO9PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SquK9DUr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e5WyL/LS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SquK9DUr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e5WyL/LS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SquK9DUr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e5WyL/LS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SquK9DUr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e5WyL/LS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 310A021A47;
	Thu,  1 Aug 2024 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7FkVZo75dkzAf/1xFUk/vDZGpTj5Di3j87elH2w3k3o=;
	b=SquK9DUrE+FOalTExQTfrYs61irRLa7BhACqKza4VspVUUwDgm+9a5GrcaBlzSQPXe9l3n
	KGm3dLNxcxXxM8RJ/bUDH58+eD9nnpVO1QV0a+NE2QJ59ATg0wpootUl+WF1VeyA+i0ZUx
	3XNgj/vuPZ/tkIYaDZ3oVj19FjJpn64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7FkVZo75dkzAf/1xFUk/vDZGpTj5Di3j87elH2w3k3o=;
	b=e5WyL/LShj86dM3/tPzIVTV4ZTXLsMaepVFRfVOitkaXNYMt4HPwFlqoX7LdGKw6xfxlTz
	Vd23YHwgPyz8nXAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SquK9DUr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="e5WyL/LS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7FkVZo75dkzAf/1xFUk/vDZGpTj5Di3j87elH2w3k3o=;
	b=SquK9DUrE+FOalTExQTfrYs61irRLa7BhACqKza4VspVUUwDgm+9a5GrcaBlzSQPXe9l3n
	KGm3dLNxcxXxM8RJ/bUDH58+eD9nnpVO1QV0a+NE2QJ59ATg0wpootUl+WF1VeyA+i0ZUx
	3XNgj/vuPZ/tkIYaDZ3oVj19FjJpn64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7FkVZo75dkzAf/1xFUk/vDZGpTj5Di3j87elH2w3k3o=;
	b=e5WyL/LShj86dM3/tPzIVTV4ZTXLsMaepVFRfVOitkaXNYMt4HPwFlqoX7LdGKw6xfxlTz
	Vd23YHwgPyz8nXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09EEB136CF;
	Thu,  1 Aug 2024 06:41:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HInnABcuq2bOcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 06:41:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: control: Fix leftover snd_power_unref()
Date: Thu,  1 Aug 2024 08:42:01 +0200
Message-ID: <20240801064203.30284-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 310A021A47
X-Spam-Score: -2.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]

One snd_power_unref() was forgotten and left at __snd_ctl_elem_info()
in the previous change for reorganizing the locking order.

Fixes: fcc62b19104a ("ALSA: control: Take power_ref lock primarily")
Link: https://github.com/thesofproject/linux/pull/5127
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 2b857757bb19..f668826649b3 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1168,7 +1168,6 @@ static int __snd_ctl_elem_info(struct snd_card *card,
 	info->access = 0;
 #endif
 	result = kctl->info(kctl, info);
-	snd_power_unref(card);
 	if (result >= 0) {
 		snd_BUG_ON(info->access);
 		index_offset = snd_ctl_get_ioff(kctl, &info->id);
-- 
2.43.0

