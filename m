Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDFE220F24
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906957; cv=none; b=has/XoSjSLYucPLhXz1s6N2gSxx3Hhql+FigUJIUJpitpHeLkuX4vCT1NJfMN2PCpgx+jiA2TC7NuIKw60pqDvRbNeNFXpm+b8QeZUeL5tvOxpNhR9ahnO0QcHa/bu0HHwjpG9u8DMRNUve8SdhbQIQkPmdnkH/PL1koN9VlLR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906957; c=relaxed/simple;
	bh=qcdICol530EXph7zyRwwwE+5Gxb+620FcIL4dvhKhvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AiYnMoNVYIHEBbASaqpVONso09o294VWasZBQwlU0SBbYvnlVJY+DRJDXLUfj4s10DIjrQIueyzDD8j+kf3Q+NeYFt+M6ilymp5fKU6SsD92dzTDvzfis5DI7i3xsPrcjxQkI8iH/L2kNDHvFxuQiIM6vOcidubJ63UvYXaYitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F2kHSWbm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MAqexyqD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F2kHSWbm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MAqexyqD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F2kHSWbm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MAqexyqD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F2kHSWbm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MAqexyqD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 304A45BE3C;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=F2kHSWbm/uV/Ki0qMFPF5fywxRuQJKjS0FKZZFfL3+UykHqw8bgYJmzRt1EthSLB1UmClO
	6zUhNO6f8LzYgFecB5TNxX77XRRcT4M4gIMM+VDHhOsg7cbMyksZ1wbXF/WLuIsv9rOdIL
	YH+95FVcNOYGfNd5gR//umnevmo02Vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=MAqexyqDfEawe0T0J9UvVLo20rEWh+pYQirJjbrz/pOPg8qs/N1r292zOhxS9BBoJfahEG
	6tCLMDKEmjdiRgDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=F2kHSWbm/uV/Ki0qMFPF5fywxRuQJKjS0FKZZFfL3+UykHqw8bgYJmzRt1EthSLB1UmClO
	6zUhNO6f8LzYgFecB5TNxX77XRRcT4M4gIMM+VDHhOsg7cbMyksZ1wbXF/WLuIsv9rOdIL
	YH+95FVcNOYGfNd5gR//umnevmo02Vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG8lnLFmK1t502mRKuj8sshg8xgByyePPn4sC2I3VY0=;
	b=MAqexyqDfEawe0T0J9UvVLo20rEWh+pYQirJjbrz/pOPg8qs/N1r292zOhxS9BBoJfahEG
	6tCLMDKEmjdiRgDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECAA113A7E;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sDakOBDBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 17/25] ALSA: hda/analog: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:51 +0200
Message-ID: <20250811100807.7962-18-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

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

