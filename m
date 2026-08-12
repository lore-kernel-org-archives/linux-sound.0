Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8EB3242BD
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=H2FB6LPvGHa69hJfBJ1oirWjRVh+HivQUHGrfKaItk+OVSfuuwg01JWakDtK2bjG0YqBg1nM1mbKvbMYIK9GK8OeDvSdrk4aijqkanSMtju/Sk3CQD7aK2GkRc94X9enIjMojSxnRPx3aMRqjuGK80FNQKykz6//JpCcDaUnfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=uUR7ZRz+EqXAK0mTOSHdJMHI2f8Jf0/4jCAjqObSNzs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKkr0ZEBTMJCQZQbU9STOEXkD5mfbclSCIUQrlX7yBUJWNM11RNPzpeaphpwvwDhAyZBiFAjYHBu5Kn/6QuAlDBOeSHp1FPw0OufhgrbUbDLDGoF3SYNZjFIJ3yjZCexftNMcHi9bBqvIX7qf13970s+c49iRIGNlkLRezX3sSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FLsP4Kyq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hOhTJQlo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bURLqkB/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bohqxt87; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FLsP4Kyq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hOhTJQlo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bURLqkB/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bohqxt87"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 236A3820E5;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olGXQcBiAu0ldx14b6yLxGPPiIGKcCHG20jXkZyu068=;
	b=FLsP4Kyq5Q9YIxsv79YLBtYPvJhE97SOmdw1kC4UH1VDkZ5pEiNY5GKR2F5nvV37Q4034p
	5FdN9PrQv4UXkXhaXMheBRS+B+NuCAGDet7EzEt2CckUV8BdN2Y4RTJ9pRhoHesEZP5ZAY
	eV/P5lcobWBC6+t2uhp2VAvNZbEToB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olGXQcBiAu0ldx14b6yLxGPPiIGKcCHG20jXkZyu068=;
	b=hOhTJQloj+UMwIBlp1AHaLHRVm9WSvrlcXkXA2gq8/a4epwsT+nn2VtA7n3u8S1is6P6AI
	Ugl3QukprsHfrlDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olGXQcBiAu0ldx14b6yLxGPPiIGKcCHG20jXkZyu068=;
	b=bURLqkB/wEsBnxmlyuoyBelxIw2uo1aRkuCZ1m8CcqjwQzOGD55AWIw3XsYq3gYPUNj9j9
	ORch6emObJPMv5GFOzCyibo+Rp8qBbNSyn/Ek/0CuPmkIMJHzXUN5VXn7MiJq05J6AHwcG
	7HvW39drXoQWbA9upoITtsu6D5FENwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olGXQcBiAu0ldx14b6yLxGPPiIGKcCHG20jXkZyu068=;
	b=Bohqxt87mp+zlhxQs2Lq8Zds17G7H5/CQvosHR3J2P839ICVBAqI+xdjrBENFHQTlZYTiJ
	zF/pD4A8iAim2DDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83747779C3;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ECbYHlQNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/14] ALSA: hda: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:40 +0200
Message-ID: <20260812060557.80445-9-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Now that the bitwise parameter definitions are gone for PCM and
control parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c | 2 +-
 sound/hda/core/device.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 641083c2376f..7d17d773cfbf 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -3379,7 +3379,7 @@ int snd_hda_add_new_ctls(struct hda_codec *codec,
 	for (; knew->name; knew++) {
 		struct snd_kcontrol *kctl;
 		int addr = 0, idx = 0;
-		if (knew->iface == (__force snd_ctl_elem_iface_t)-1)
+		if (knew->iface == -1)
 			continue; /* skip this codec private value */
 		for (;;) {
 			kctl = snd_ctl_new1(knew, codec);
diff --git a/sound/hda/core/device.c b/sound/hda/core/device.c
index 160c8d0453b0..832494035f0a 100644
--- a/sound/hda/core/device.c
+++ b/sound/hda/core/device.c
@@ -765,7 +765,7 @@ unsigned int snd_hdac_stream_format_bits(snd_pcm_format_t format, snd_pcm_subfor
 
 	params_set_format(&params, snd_hdac_format_normalize(format));
 	snd_mask_set(hw_param_mask(&params, SNDRV_PCM_HW_PARAM_SUBFORMAT),
-		     (__force unsigned int)subformat);
+		     subformat);
 
 	bits = snd_pcm_hw_params_bits(&params);
 	if (maxbits)
-- 
2.55.0

