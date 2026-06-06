Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D262DEA93
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762321; cv=none; b=pLVl9IyTIGoueZcKMLj+1XJ59CkSXzs5bmpMNFPnh71u3MBpwUw3+2V4kk/BhAn2DRl2iOSniawXx72nMMIxigafuKUDUFaXAhG5OfCH/z+8daO6f/8uVLP3YNP43Oeb4SRBgjuC2dl5L8Q0y8tj8hQLEp0VmOhryoxxjCGoK9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762321; c=relaxed/simple;
	bh=QcrWQvRHQ5QIjtzNV+T6va0lyK9S7TaMBLianHP4/bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3G/0LMyUM6tJQojPUKptz3I2vNro3bmCQJresE30hpQ1x27YxzMx25sRpBv0+18pX92sss3hNCc6r4PqtxYMXvaJfes5TXUhk/wproGa2ePeJjaNJmSBiQombj2tbkObMLY7Io5DYk53k853Lr9T6hX/B7aeHDHN9KACHZLuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EbLVKPMr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K0hn0eiF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q+eczVFJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vzx0AjxB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EbLVKPMr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0hn0eiF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q+eczVFJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vzx0AjxB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB8EC75BE8;
	Sat,  6 Jun 2026 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj+RMw9XS3XOb21FippNB6XsgGBVdvgKBxlS6a5/zN8=;
	b=EbLVKPMrPpSUJS2856ychgb3bYI6bFtt6tkwda0UVQpZRcdbPuONxSCvhf041BqZMZWG57
	zczGONCQKKMFyGHcSBoGQJ+c+CLvZf/QHqLwvMEVb9PlDffj9XeyJ9OvYdCANkn/B5yZtl
	ysEnKCJ+ZKmd/W5Tb2s4F1vb5BlPNKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj+RMw9XS3XOb21FippNB6XsgGBVdvgKBxlS6a5/zN8=;
	b=K0hn0eiFhoq8JN7bmw60RIjq15WmZM54XVPgMXlfSqD2tA5YefJiDD+aFzyKIhn6Uh1Q1f
	GahjM7mrXrQstFCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q+eczVFJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vzx0AjxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj+RMw9XS3XOb21FippNB6XsgGBVdvgKBxlS6a5/zN8=;
	b=q+eczVFJsLW0dYCDNmH4iaW+LdE8mDHfpZFLZKeKX2Mlq/enDs4itBNX+KzV/zRokns0O2
	Ak5OxT9/mYZQC2lv9G8pQ8swyy1KnIh+aSzT5k9yS57YlIM3MpSQ6C21SKjTXhpG3aTB6T
	nsmm6gjeAm0uKk2+sFvsS9ffx5xQE54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj+RMw9XS3XOb21FippNB6XsgGBVdvgKBxlS6a5/zN8=;
	b=vzx0AjxBJzthFlR1zDR4FSvOARxbugK+oquWzmuZ1o68vwLcXy9Yy7IfxQ5TEM/PQN8z86
	QUgq3KgSjwIu1iDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C90FC779A7;
	Sat,  6 Jun 2026 16:11:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QMvnL8NGJGpbbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jun 2026 16:11:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: timer: Fix UAF at snd_timer_user_params()
Date: Sat,  6 Jun 2026 18:11:41 +0200
Message-ID: <20260606161145.1933447-2-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606161145.1933447-1-tiwai@suse.de>
References: <20260606161145.1933447-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EB8EC75BE8
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

At releasing a timer object, e.g. when a userspace timer
(CONFIG_SND_UTIMER) gets closed and snd_timer_free() is called, it
tries to detach the timer instances and release the resources.
However, it's still possible that other in-flight tasks are holding
the timer instance where the to-be-deleted timer object is associated,
and this may lead to racy accesses.

Fortunately, most of ioctls dealing with the timer instance list
already have the protection with register_mutex, and this also avoids
such races.  But, SNDRV_TIMER_IOCTL_PARAMS isn't protected, hence the
concurrent ioctl may lead to use-after-free.

This patch just adds the guard with register_mutex to protect
snd_timer_user_params() for covering the code path as a quick
workaround.  It's no hot-path but rather a rarely issued ioctl, so the
performance penalty doesn't matter.

Reported-by: Kyle Zeng <kylebot@openai.com>
Tested-by: Kyle Zeng <kylebot@openai.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 67fb1ecb33f0..3d72379e57a8 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1811,6 +1811,7 @@ static int snd_timer_user_params(struct file *file,
 	struct snd_timer *t;
 	int err;
 
+	guard(mutex)(&register_mutex);
 	tu = file->private_data;
 	if (!tu->timeri)
 		return -EBADFD;
-- 
2.54.0

