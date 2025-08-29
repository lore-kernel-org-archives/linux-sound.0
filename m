Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8CC31CA73
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479647; cv=none; b=gvIphwRoGLnyjxSi45nnrxD/oj3NcLIGP1PgMvI1fhqHvGhgODUoAAxY0P3kKAYN6SSfq2z1M+S5Zrdl+s/E6shiNEAWvrPMikSAfZ/3WoBJkxtTxqNCJJXWgQHrxNfnw6lzFNMzIhWDQuXN0I7ULU+stjj0QRpaZTXk5UFFotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479647; c=relaxed/simple;
	bh=k4x89Hb+HKNwO+K9QYcLdonJ3RvGeFgOoV9FWNxTpW4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pycYUoEvFSg/XuC3PD5Qbf4i+tE32mb5WRwmB6AIGPXuZ0PDid3ATY0Hkn46BhpM1kOT84kColNLrLds8ycsudfqPcnTUJxPz/cN3QoeUsfqcGCKqV4y94z1lRyG9VBjAa+BW+p7M8b8mXFXU3hQ9JBqJz1MY5e7DqK0fapkKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+Ggxk6L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nvBTVfgT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+Ggxk6L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nvBTVfgT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+Ggxk6L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nvBTVfgT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+Ggxk6L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nvBTVfgT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B759533EDD;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n70W6K27TpttTC27zZEcvGbFFLrVzOveNr4ajeySSsw=;
	b=k+Ggxk6Lw78jyUdI/ltl2xspmf058/HRpFvuz1XKVT0Pcoj0MweGa9YhYloSLSyBzJRXlT
	e+1FjbDeul7UG1oUmsfdFkv9LmFjGJJHIfOOPiuYzAHAzn13jgOLD6UTEjacehxv80K6MS
	kK/xb25EZMTBPR0CpBBJsSKozBx0hGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n70W6K27TpttTC27zZEcvGbFFLrVzOveNr4ajeySSsw=;
	b=nvBTVfgTvR2FOvfcY022TdMFAuGYfIOy7fhry3ysws84RlDSRUlKPnHirYePwcdaWPbCcD
	+qvW8pt+oKuE0GDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n70W6K27TpttTC27zZEcvGbFFLrVzOveNr4ajeySSsw=;
	b=k+Ggxk6Lw78jyUdI/ltl2xspmf058/HRpFvuz1XKVT0Pcoj0MweGa9YhYloSLSyBzJRXlT
	e+1FjbDeul7UG1oUmsfdFkv9LmFjGJJHIfOOPiuYzAHAzn13jgOLD6UTEjacehxv80K6MS
	kK/xb25EZMTBPR0CpBBJsSKozBx0hGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n70W6K27TpttTC27zZEcvGbFFLrVzOveNr4ajeySSsw=;
	b=nvBTVfgTvR2FOvfcY022TdMFAuGYfIOy7fhry3ysws84RlDSRUlKPnHirYePwcdaWPbCcD
	+qvW8pt+oKuE0GDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CF8713A54;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6AoGJY/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/13] ALSA: opl3: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:00:14 +0200
Message-ID: <20250829150026.6379-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_seq.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index 9fc78b7fb780..8db77a81476c 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -40,13 +40,11 @@ int snd_opl3_synth_setup(struct snd_opl3 * opl3)
 	int idx;
 	struct snd_hwdep *hwdep = opl3->hwdep;
 
-	mutex_lock(&hwdep->open_mutex);
-	if (hwdep->used) {
-		mutex_unlock(&hwdep->open_mutex);
-		return -EBUSY;
+	scoped_guard(mutex, &hwdep->open_mutex) {
+		if (hwdep->used)
+			return -EBUSY;
+		hwdep->used++;
 	}
-	hwdep->used++;
-	mutex_unlock(&hwdep->open_mutex);
 
 	snd_opl3_reset(opl3);
 
@@ -81,9 +79,9 @@ void snd_opl3_synth_cleanup(struct snd_opl3 * opl3)
 
 	snd_opl3_reset(opl3);
 	hwdep = opl3->hwdep;
-	mutex_lock(&hwdep->open_mutex);
-	hwdep->used--;
-	mutex_unlock(&hwdep->open_mutex);
+	scoped_guard(mutex, &hwdep->open_mutex) {
+		hwdep->used--;
+	}
 	wake_up(&hwdep->open_wait);
 }
 
-- 
2.50.1

