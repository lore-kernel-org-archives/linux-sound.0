Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B96C331EA8
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=jkg6n3uvGWtJDrdmggA13Xuob34YvjQ7Vn501oyqmXu9PHyYBrz00aGKfYrN9/XPAhu9S2pLrMpysg6Hkln2fAmDQYFtEJUHex+sqlKxjI7ONgh4ZMfQakoXFtpzNLkDPf88AZ8MlA+DXvYJ2Jkk2Le6Jhyp+FUIVbKAGlU2vD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=bhdT/jtSrrwOY/l7+d5esFUSgdtaPF6VqK/5pLiWDWU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qc+SVFdRjlu95VfFiBbcjVqu2nPfYpDRpjLbn2s5CAb497ff9Y5DOkFtsI+V86051LlgEQn1UNFMQGlmhPQKHthLYNNC9VU0RXoQB56zRayQ9Y6feQYtp5nquKtcwgLwSFZSCYi99PrDd24eiJz+mgItugcJG+iS+KeEK3xaiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HdSKro8u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2iU1+LYJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=05IEzlyt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B6p4/m3J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HdSKro8u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2iU1+LYJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="05IEzlyt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B6p4/m3J"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FB8C820E1;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWr6uHAUrwWgL8A2xu+dfgULQG71fT5vrxTjx9aXMGw=;
	b=HdSKro8uvAUbuVAy0R4E2iXE+tTET/JV7dMOTHOUcT7YseEEA8nXybmyhuAWl9yPi0xd1t
	e0gGSzgti6Ts20JWLrTjSZ1JiAGp154dvg+5uZXkO3BcHso37D+Gq3GdzFKqiPMk+5mCpr
	2gHGHnHdtPCNp14xXtzt4jLk6CmBhrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWr6uHAUrwWgL8A2xu+dfgULQG71fT5vrxTjx9aXMGw=;
	b=2iU1+LYJXLzqtle6UxLjincOpzmDZRQggKFFQll4JYKLsRf0DiwZ0vWljKJdUV48JRJyZT
	6aNnGY0lFx6mRpDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=05IEzlyt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="B6p4/m3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWr6uHAUrwWgL8A2xu+dfgULQG71fT5vrxTjx9aXMGw=;
	b=05IEzlyt32ic/eg1zFxqYyzieGTORvBM5881SZYMf9Bzun1gbiooy0okHrioYBGiPXrYvn
	WHIyhalDMMzpr9ijpyzIQJbn5/zYnzvpwCfkjcBs7/UfyF8zkNOWDmf0R8MrJO8g85pjSX
	pFTjTscmhKvY+SRtsbqhd6pGffb1qJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWr6uHAUrwWgL8A2xu+dfgULQG71fT5vrxTjx9aXMGw=;
	b=B6p4/m3J8S4mwudW26RTEag2na1EIkyAZ3ewBPVLhmTbuXm8Z1KBcNfXf+GgD2kmTgEsCA
	Mw/OG+jPQOz30hCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6404A779C0;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GAcGF1QNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/14] ALSA: aloop: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:39 +0200
Message-ID: <20260812060557.80445-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 1FB8C820E1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 92ef821ddbeb..4e3ea23ca913 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1603,7 +1603,7 @@ static int loopback_format_info(struct snd_kcontrol *kcontrol,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = (__force int)SNDRV_PCM_FORMAT_LAST;
+	uinfo->value.integer.max = SNDRV_PCM_FORMAT_LAST;
 	uinfo->value.integer.step = 1;
 	return 0;
 }                                  
@@ -1614,7 +1614,7 @@ static int loopback_format_get(struct snd_kcontrol *kcontrol,
 	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
 	
 	ucontrol->value.integer.value[0] =
-		(__force int)loopback->setup[kcontrol->id.subdevice]
+		loopback->setup[kcontrol->id.subdevice]
 			       [kcontrol->id.device].format;
 	return 0;
 }
-- 
2.55.0

