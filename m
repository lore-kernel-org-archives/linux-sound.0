Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED733EC
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279973; cv=none; b=aAaJ2K/KHduH02tLyHjBDo+1xo8rH0BKYnUo5WP9ixh8OV0dvwG2z9zRAL1LEvQ9JLl43eojKOMmx9vfAE38gSHo4NT6Xe4puwBbQ26gOKnZKZZ192ZQ0XSDtbvNKqcejdAAcLl/0yG+2vorT1ASUvhWsWZyjhxeeXGvvLKAvTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279973; c=relaxed/simple;
	bh=qcdICol530EXph7zyRwwwE+5Gxb+620FcIL4dvhKhvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7b/vo2G6tsW2ZvjaJrRPQY/2ANltKh5YWR34z3NvSPmYG8zKvD2oYMCbq8khfVqLnLsrVMO7hALJN11uZgOsvIiEN+KdzEWK9hyAhjlpA3GYIgDFQtJtnRxt0L/7Y7M24/NDyR0T/eJeCgJ89C18+IkXEkhkO0iUFRl/fXO76Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MieiP4YN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oYMi4ImQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MieiP4YN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oYMi4ImQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MieiP4YN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oYMi4ImQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MieiP4YN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oYMi4ImQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBE0E223DE;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=MieiP4YNvR84CcYZQFErn0YiaMCZ/EYwjHwrGrqyZXaNqq85x+y7WcMgc17iMv7m+02UaA
	BJlgFhFfiQwb7ZUm5dfAi9qoED3cqagjC0Ij+OwChtJMukjusk/14tW0/p+O/yg3xZM4Az
	9g/++HidLQmSH9EKxUV+s+FwNaUIz20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=oYMi4ImQugwQRpn7lwJI5rabVtnj0EQ686hgqwnmIg3rnAasSaWnOLULE02WhKtceimrY4
	e+j6GsxMFp98PDDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MieiP4YN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oYMi4ImQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=MieiP4YNvR84CcYZQFErn0YiaMCZ/EYwjHwrGrqyZXaNqq85x+y7WcMgc17iMv7m+02UaA
	BJlgFhFfiQwb7ZUm5dfAi9qoED3cqagjC0Ij+OwChtJMukjusk/14tW0/p+O/yg3xZM4Az
	9g/++HidLQmSH9EKxUV+s+FwNaUIz20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=oYMi4ImQugwQRpn7lwJI5rabVtnj0EQ686hgqwnmIg3rnAasSaWnOLULE02WhKtceimrY4
	e+j6GsxMFp98PDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C31F713A31;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IEJlLtGzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 17/25] ALSA: hda/analog: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 09:28:57 +0200
Message-ID: <20250827072916.31933-18-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
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
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DBE0E223DE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/analog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/analog.c b/sound/hda/codecs/analog.c
index 33aaeb44c4dc..357ad5a6c0db 100644
--- a/sound/hda/codecs/analog.c
+++ b/sound/hda/codecs/analog.c
@@ -727,7 +727,7 @@ static int ad1988_auto_smux_enum_put(struct snd_kcontrol *kcontrol,
 	if (spec->cur_smux == val)
 		return 0;
 
-	mutex_lock(&codec->control_mutex);
+	guard(mutex)(&codec->control_mutex);
 	path = snd_hda_get_path_from_idx(codec,
 					 spec->smux_paths[spec->cur_smux]);
 	if (path)
@@ -736,7 +736,6 @@ static int ad1988_auto_smux_enum_put(struct snd_kcontrol *kcontrol,
 	if (path)
 		snd_hda_activate_path(codec, path, true, true);
 	spec->cur_smux = val;
-	mutex_unlock(&codec->control_mutex);
 	return 1;
 }
 
-- 
2.50.1

