Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884CA12B93
	for <linux-sound@vger.kernel.org>; Sat, 30 Nov 2024 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732957222; cv=none; b=Ir4Mt0VB3YfTvR9R153mtzCxiSmljbBblbPZEpKBxLBEzzkt/BE+6TDRfm0mcifEt9fHbjp4PCeiRUEetm+hS8OntVNbpc0hklBc3QcC9/nt6Pa/6swEo3D9KGKkdHm0I5jk1zeknwIi8q9qDd0nJPnzaYqrop1w/lvswNb7g7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732957222; c=relaxed/simple;
	bh=qy3XWszO/HvVzBxHygARM6ao5Fk8IQCgjHxOYCZ6Edo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AeCnHsT9xx+nZL3BvsU2hNI8I76GUGffB+6h6N3Qrc63sZM0QGsE2BEOb7i/4Gdc4sEWM5lF1rmUfqsLxYAOb97eDCDt6kDwRFQXmA9vmmbP4FpZ3vR//M+glvwt3YpUkbGeHk/gUEGqnfZ53gkR5SiWHRZHd0f3tPvUoJWL27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xj5MXH3f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UHZmDlT1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xj5MXH3f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UHZmDlT1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xj5MXH3f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UHZmDlT1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xj5MXH3f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UHZmDlT1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D83621173;
	Sat, 30 Nov 2024 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732957211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DSUkOfr4ht+5TGXOuMwjBHckN//fLdhk6RDvT0yD90g=;
	b=Xj5MXH3fwihhe1UByepRxpFGd/5ZiPKDi+NKEaERszSdDQgC9iu4vIvNyTeHO7BRBvwuSL
	whiGB4rpj7trzk+ZFM6vVo+md4ldDnHFh6nRIRTgP+qu2AI5AbCYj74qjt7veLVNU+g33l
	uOg5eVr+fVFdGyox5bG8XU8aysGBYXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732957211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DSUkOfr4ht+5TGXOuMwjBHckN//fLdhk6RDvT0yD90g=;
	b=UHZmDlT11eahAIJrIWTwXJw0WD1iFZS3MZghlECBsdPYow+tEQPfopZWjr8Oube10YmPHG
	LU4KNOOHi9hy8nDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xj5MXH3f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UHZmDlT1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732957211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DSUkOfr4ht+5TGXOuMwjBHckN//fLdhk6RDvT0yD90g=;
	b=Xj5MXH3fwihhe1UByepRxpFGd/5ZiPKDi+NKEaERszSdDQgC9iu4vIvNyTeHO7BRBvwuSL
	whiGB4rpj7trzk+ZFM6vVo+md4ldDnHFh6nRIRTgP+qu2AI5AbCYj74qjt7veLVNU+g33l
	uOg5eVr+fVFdGyox5bG8XU8aysGBYXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732957211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DSUkOfr4ht+5TGXOuMwjBHckN//fLdhk6RDvT0yD90g=;
	b=UHZmDlT11eahAIJrIWTwXJw0WD1iFZS3MZghlECBsdPYow+tEQPfopZWjr8Oube10YmPHG
	LU4KNOOHi9hy8nDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ECB9139C2;
	Sat, 30 Nov 2024 09:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 10j6ERvUSmfVcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Nov 2024 09:00:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Shut up truncated string warning
Date: Sat, 30 Nov 2024 10:00:08 +0100
Message-ID: <20241130090009.19849-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D83621173
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

The recent change for the legacy substream name update brought a
compile warning for some compilers due to the nature of snprintf().
Use scnprintf() to shut up the warning since the truncation is
intentional.

Fixes: e29e504e7890 ("ALSA: ump: Indicate the inactive group in legacy substream names")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411300103.FrGuTAYp-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index d2b810eb84bc..fe4d39ae1159 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1262,9 +1262,9 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 		name = ump->groups[idx].name;
 		if (!*name)
 			name = ump->info.name;
-		snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
-			 idx + 1, name,
-			 ump->groups[idx].active ? "" : " [Inactive]");
+		scnprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
+			  idx + 1, name,
+			  ump->groups[idx].active ? "" : " [Inactive]");
 	}
 }
 
-- 
2.43.0

