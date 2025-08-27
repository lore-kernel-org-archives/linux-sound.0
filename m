Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0D1D5CC9
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279814; cv=none; b=MN/wP+nMII/TvE0/FNGO0QhwhrToUx/nHDdKbom+FoOjMguTu67k0tGfbeDVq6s/Bcl8qV7ePd1xoOeFqj0Vs0fHsKGtFwmeo75k8wSC9Qx9dXZix4KoPNx7MjQmwcObpUbfxE139IxcfOYN3NlDU3IvWbjWrRczcoHhuX8OuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279814; c=relaxed/simple;
	bh=/FH/J9t5TLMbWO2ZDYxVB/Wd9ZJqVXL+/ldAOUnfdQg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZFiOMGjshKfy5mu9MwxRNOGmY5ZgF21TAVJZGmuN4bDrA2SVzvia3lG2BHakvCBNnJD8tkQBhMUgW7JgkkD+ACyu9tnp4G/j5IfBY8P90xVyy6ewr/ljNBsW1educcD6gwFHczq+BLk3EEAnynTPl50B3dNMD2POhJg/Af3jVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fsY4FJTK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ALWnEwvz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fsY4FJTK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ALWnEwvz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fsY4FJTK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ALWnEwvz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fsY4FJTK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ALWnEwvz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C4CB1FE7C;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaI+n1fkC8OIfub4yXUdeBeeDTKSrVidbOhh7QBlIAs=;
	b=fsY4FJTKFKudz95aLXmCE3UMdZQCo03v2WSSEJM04x13aSbKw5M4ZzcSkIHM1WUtjU9/Rw
	pYFp27S1W506FHfW36MUcXhdvyn37CubeF3oYLVkRirrqEJNsGzMLk1QWBrdXcGACUseoW
	WpeLMLINqlpsSXzM1BfHjnbeLZzBxqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaI+n1fkC8OIfub4yXUdeBeeDTKSrVidbOhh7QBlIAs=;
	b=ALWnEwvzK2GBsoBt7wrAO86jx4V5INoa8pgPLsG1R3M2CUrYDGArkGRN+D9UghuADbhemw
	TyHuNzPL4ZG8r3Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaI+n1fkC8OIfub4yXUdeBeeDTKSrVidbOhh7QBlIAs=;
	b=fsY4FJTKFKudz95aLXmCE3UMdZQCo03v2WSSEJM04x13aSbKw5M4ZzcSkIHM1WUtjU9/Rw
	pYFp27S1W506FHfW36MUcXhdvyn37CubeF3oYLVkRirrqEJNsGzMLk1QWBrdXcGACUseoW
	WpeLMLINqlpsSXzM1BfHjnbeLZzBxqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaI+n1fkC8OIfub4yXUdeBeeDTKSrVidbOhh7QBlIAs=;
	b=ALWnEwvzK2GBsoBt7wrAO86jx4V5INoa8pgPLsG1R3M2CUrYDGArkGRN+D9UghuADbhemw
	TyHuNzPL4ZG8r3Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A25113867;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eC/9D9KzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 20/25] ALSA: hda/realtek: Use auto cleanup for temporary buffers
Date: Wed, 27 Aug 2025 09:29:00 +0200
Message-ID: <20250827072916.31933-21-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The release of temporary kmalloced buffers can be nicely handled via
the standard __free(kfree).

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/realtek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index d40de0e8a9a3..ca377a5adadb 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -215,7 +215,7 @@ void alc_update_knob_master(struct hda_codec *codec,
 {
 	unsigned int val;
 	struct snd_kcontrol *kctl;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 
 	kctl = snd_hda_find_mixer_ctl(codec, "Master Playback Volume");
 	if (!kctl)
@@ -229,7 +229,6 @@ void alc_update_knob_master(struct hda_codec *codec,
 	uctl->value.integer.value[0] = val;
 	uctl->value.integer.value[1] = val;
 	kctl->put(kctl, uctl);
-	kfree(uctl);
 }
 EXPORT_SYMBOL_NS_GPL(alc_update_knob_master, "SND_HDA_CODEC_REALTEK");
 
-- 
2.50.1

