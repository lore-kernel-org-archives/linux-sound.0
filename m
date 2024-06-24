Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9779DE
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719233662; cv=none; b=DNKckTDZh+gYKdjzzHXtj6JFjnF2r9rx2I9cVnYnB7cvOhEa9Edos+BE/FEQZfm5NOJk5CA8GP0JKnRjxB6B27/hcyGZ1SNf7BuJusMzPAG61sKJFqTPfGys7gvYGyUsxf6cVVBNa9FeiK6SRZtXbXgXzCjZ4NAvv9+92KzWMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719233662; c=relaxed/simple;
	bh=CQhPpA3CfJODlY7jR1FImUZVd4cmEtwEQq2h8V6pPYs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=g8Om9MhoqYwfy8VYFRMYAdVW6stAuNOvK3rV2PZRYx5U4HS5SaMqCoa+7WD7oEVlY4uY2CuzX6fCogTXncpcprp048wdd0BCfppL0fqkAJ902JClo8BfXOPVPWatNsFmcz601QaKTYL+LL2aKPXWk+f1P/TXHzRQCsgbQcLsEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pl/UK5ga; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AYSwRtCX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XxdtAcqD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mUMQWWw/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pl/UK5ga";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AYSwRtCX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XxdtAcqD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mUMQWWw/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7400A1F7D9;
	Mon, 24 Jun 2024 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719233658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dKqOQRr6+O6TrNcK4OmXpySj0HCMzSfhyAPF+pXnSLA=;
	b=pl/UK5ga1QS+anZzal27SifOrYFZOm4wnGPxanDmq1H2EtGH8Oq5EFXHmhiKeXGXcFVFyc
	257wsUGp6jyIF53b+gwAN1S/zkDI8oKdwbYQjBpBPBnxp1EJU3aORAO6BLOSR8IKQ1e13C
	QTFLITbMyh8p7ZPq5230CkYIfPUC8tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719233658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dKqOQRr6+O6TrNcK4OmXpySj0HCMzSfhyAPF+pXnSLA=;
	b=AYSwRtCXsEyXPIjqNfT6xJM2Xl6+q5SyfzXfp7HUOHRsJT6vEQKwWas3+XiFRUQo10HSSC
	x8Q9st/nIe5XBdAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XxdtAcqD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="mUMQWWw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719233657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dKqOQRr6+O6TrNcK4OmXpySj0HCMzSfhyAPF+pXnSLA=;
	b=XxdtAcqDSfTvGnYcV4b6L3ba1k2NiMbE4XvAwdUl74zhhftdsjEyUKN9F6YBYh4W8Fjq9S
	XoX9THq3lfej4jwbtdVN3kC4mYb23tymvXPRD5Z+YrCL2X2I0/z5TPubtNgEbcSbkK6G1x
	MLmo41mAFD8yK0vpWXvD1X/rDIY/pVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719233657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dKqOQRr6+O6TrNcK4OmXpySj0HCMzSfhyAPF+pXnSLA=;
	b=mUMQWWw/mxHfmdIWyCJoo9l7CZyiywtRc0xHZAUOH5F8FtcTy4YUPqY12hceGA4cy2TmVX
	wYEXgp6ZKNnKzjBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FC7513ACD;
	Mon, 24 Jun 2024 12:54:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RJA3EnlseWYMagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Jun 2024 12:54:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: PCM: Allow resume only for suspended streams
Date: Mon, 24 Jun 2024 14:54:34 +0200
Message-ID: <20240624125443.27808-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7400A1F7D9
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

snd_pcm_resume() should bail out if the stream isn't in a suspended
state.  Otherwise it'd allow doubly resume.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 521ba56392a0..c152ccf32214 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1775,6 +1775,8 @@ static int snd_pcm_pre_resume(struct snd_pcm_substream *substream,
 			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	if (runtime->state != SNDRV_PCM_STATE_SUSPENDED)
+		return -EBADFD;
 	if (!(runtime->info & SNDRV_PCM_INFO_RESUME))
 		return -ENOSYS;
 	runtime->trigger_master = substream;
-- 
2.43.0

