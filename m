Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025B12D6404
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142303; cv=none; b=pFE49azLepnsh3JzywK0oxUUpX9ejvIWPWHZLD8lFlCTh7kOWabB77mSjai02v4ioZrpeJkjWr1BP1C3dAJuRthcM9u13xqzYyl74odGjgH43waWT0ELtiTFWYz2vEOlHu2UtpLdPSOPmakXtAYbkLb/NVXHB3IQDdSMVTKdVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142303; c=relaxed/simple;
	bh=S9UI6fzCSxd9VrkfAlLQC4GI9Rr/yt/8EmPEcQEFz9Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psiUprr14fJg6CYWhaymwYVLjtc1EpPOihbfBfFfI3HYih5Wqo0HlVJCs74LyyAQJ+BJJhfHEnEzMgxlO1ueMmPzcdpe8sMqfo9S3hoKStySvTnSsJLyX68Fc03KALQtaFjM5ibLbhGfHPfrAKwu9Gk5iwJrq7u7BJPoZuzc+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DKwWm3Rg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BpCG/UVr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DKwWm3Rg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BpCG/UVr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DKwWm3Rg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BpCG/UVr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DKwWm3Rg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BpCG/UVr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B4461F789;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x15yMUdwmF+B9yUvr9fQebwbdIOWEGqDnRQpvzneJGk=;
	b=DKwWm3RgJA67YkOCa5Ouf9baqQundAjzeaGeUPnQVsTZ74E8fVZ5qmoAVPLPh1tCYd94Rx
	b3B1odjU47rITeDIhOhXoffalQ5rEIYtILCO0V/WJTF8tLyQRK7wxFV5ZuV8KPHUTWolVy
	kdy+wegqKLwOFPcDwRJjNbVwQqaG/OE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x15yMUdwmF+B9yUvr9fQebwbdIOWEGqDnRQpvzneJGk=;
	b=BpCG/UVr+Z5r0d9VoTNgbekucxB0f/Vl2WyU9yRenzEHLQOLd5IuDuD5gckCUURVfCt72K
	0x2JONG+LK+WI4BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DKwWm3Rg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="BpCG/UVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x15yMUdwmF+B9yUvr9fQebwbdIOWEGqDnRQpvzneJGk=;
	b=DKwWm3RgJA67YkOCa5Ouf9baqQundAjzeaGeUPnQVsTZ74E8fVZ5qmoAVPLPh1tCYd94Rx
	b3B1odjU47rITeDIhOhXoffalQ5rEIYtILCO0V/WJTF8tLyQRK7wxFV5ZuV8KPHUTWolVy
	kdy+wegqKLwOFPcDwRJjNbVwQqaG/OE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x15yMUdwmF+B9yUvr9fQebwbdIOWEGqDnRQpvzneJGk=;
	b=BpCG/UVr+Z5r0d9VoTNgbekucxB0f/Vl2WyU9yRenzEHLQOLd5IuDuD5gckCUURVfCt72K
	0x2JONG+LK+WI4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FC96136DC;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4EXyGfWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 094/103] ALSA: synth: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:16 +0200
Message-ID: <20250710100727.22653-95-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8B4461F789
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/synth/emux/emux_hwdep.c | 2 +-
 sound/synth/emux/emux_oss.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/synth/emux/emux_hwdep.c b/sound/synth/emux/emux_hwdep.c
index 9e98c4c73fd1..14b990cf3b22 100644
--- a/sound/synth/emux/emux_hwdep.c
+++ b/sound/synth/emux/emux_hwdep.c
@@ -121,7 +121,7 @@ snd_emux_init_hwdep(struct snd_emux *emu)
 	if (err < 0)
 		return err;
 	emu->hwdep = hw;
-	strcpy(hw->name, SNDRV_EMUX_HWDEP_NAME);
+	strscpy(hw->name, SNDRV_EMUX_HWDEP_NAME);
 	hw->iface = SNDRV_HWDEP_IFACE_EMUX_WAVETABLE;
 	hw->ops.ioctl = snd_emux_hwdep_ioctl;
 	/* The ioctl parameter types are compatible between 32- and
diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index 5f98d5201ba2..1145c7956afd 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -60,7 +60,7 @@ snd_emux_init_seq_oss(struct snd_emux *emu)
 		return;
 
 	emu->oss_synth = dev;
-	strcpy(dev->name, emu->name);
+	strscpy(dev->name, emu->name);
 	arg = SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	arg->type = SYNTH_TYPE_SAMPLE;
 	arg->subtype = SAMPLE_TYPE_AWE32;
-- 
2.50.0

