Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1C2D5A19
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142194; cv=none; b=V9+O41UJ/5Z0vPl0l2N5Ij6kC9sTrmUBwOno9ndut59rv0H3hww4KKFGZvjP4+NyA8IAQKMf/SsIIdJ0vfO2+MCJOgkyceiyxXDNDtUpDvsJhTr5tYhC5HgsGv50dKNZHu0ft1R9L/4008V8rlyfGuqWQB3swcWDB744nnofs0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142194; c=relaxed/simple;
	bh=0aW6OsVZuN5FfBFOJz+BXkR1I3bkJgR+xb1HUSBkE2s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIfDxtzaA6ky+0cXN21ejxV5aa3U6DiD1X5A1rMbUEakPildu0Z0TOYK8ecrTYriRWmNFWmbhpPtBplAb9Fxi9S6lweMHgWATJGWLMduzaVNNVUjGgFt3S79LdtBKv9HWWvLZq4RfM7e8fGZjE4LVmp999Y14XSqYdQiyZ5otCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cFMKT5lL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=frRtu1ls; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cFMKT5lL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=frRtu1ls; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cFMKT5lL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="frRtu1ls";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cFMKT5lL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="frRtu1ls"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0ED91F455;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgAYHbAaLt6dyXMdNB5aCHvVXLSoCU1HRnE1kU6AVH8=;
	b=cFMKT5lLMXaEefmQCBpuRV/oMOrYaQ6s6rC2j8i1enjf8/njq3bddomYh7Y+9DFryNAjCQ
	5XWuxSz6YAxgUvzhgRqYBnQIUqNbqjF6NvodG840PM7DDM6WDPvjlC+mLxO23dWFJN2cZz
	Mk2ye++F4fLc37NwDcy9Ama6xk2xlzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgAYHbAaLt6dyXMdNB5aCHvVXLSoCU1HRnE1kU6AVH8=;
	b=frRtu1lsrdgfnZc10cjIwSwF0GeKQhBxcsyUwZcIU5ufWilxaZU+wcpuvuTNs9xQoQD2uK
	VETpFT7iQvMXeaAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cFMKT5lL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=frRtu1ls
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgAYHbAaLt6dyXMdNB5aCHvVXLSoCU1HRnE1kU6AVH8=;
	b=cFMKT5lLMXaEefmQCBpuRV/oMOrYaQ6s6rC2j8i1enjf8/njq3bddomYh7Y+9DFryNAjCQ
	5XWuxSz6YAxgUvzhgRqYBnQIUqNbqjF6NvodG840PM7DDM6WDPvjlC+mLxO23dWFJN2cZz
	Mk2ye++F4fLc37NwDcy9Ama6xk2xlzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgAYHbAaLt6dyXMdNB5aCHvVXLSoCU1HRnE1kU6AVH8=;
	b=frRtu1lsrdgfnZc10cjIwSwF0GeKQhBxcsyUwZcIU5ufWilxaZU+wcpuvuTNs9xQoQD2uK
	VETpFT7iQvMXeaAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D8DA13AAB;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eJhZHfCQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 059/103] ALSA: ctxfi: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:41 +0200
Message-ID: <20250710100727.22653-60-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: A0ED91F455
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctmixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/ctmixer.c b/sound/pci/ctxfi/ctmixer.c
index 6797fde3d788..496682613db5 100644
--- a/sound/pci/ctxfi/ctmixer.c
+++ b/sound/pci/ctxfi/ctmixer.c
@@ -1219,7 +1219,7 @@ int ct_alsa_mix_create(struct ct_atc *atc,
 	if (err)
 		return err;
 
-	strcpy(atc->card->mixername, device_name);
+	strscpy(atc->card->mixername, device_name);
 
 	return 0;
 }
-- 
2.50.0

