Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D433322774
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480446; cv=none; b=LmGxqnTuOUNVBfK0et8tG05xUftT24MOSWUXCYYQ2XpDVl1UDADsaLxu0yoqCxjvGz/yX65bd88oAZWXGBJOCLd32c4c8eo2P9wNiDPfJALp/U7UfffPJNi0BCYtabQp5epDwnYowIOdMgAhQssz71N6J2i1QXEopr9+2iXLXeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480446; c=relaxed/simple;
	bh=E3do/8qN7XEasxJcnr6v8ksThrkyYO3ulFZ2EAfCNFc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9c9TlNB45Z/4cuBzxD+f+MBaFMLlx4TzcdKimHrVCRGbiFHjyVbou9msep8cCNlnQjuUcMQOV7KZMvFIlQZ0RigcD9AU3/nrGOC0jvao40+T412m/B1uCLOPbquD9nJxTdgz9wfI8OOSjxs3qJ41yvvKWyP5+514gNnOkvdR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qYGzEaJw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vu8P2adp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qYGzEaJw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vu8P2adp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qYGzEaJw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vu8P2adp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qYGzEaJw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vu8P2adp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 723C05C26A;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXUTL7WyaadOiDTiaWfpXSqe5Le413UdyUI211McMFQ=;
	b=qYGzEaJwpxo71pVCAFi+dlAOTBxUIh37blFTi9+9jtm2zIR6FBmk/HmzRFf5hucPYlEz6d
	patokZRJQQ0ZZsn0yMSx8Di0nLxNvcbMLWyHE2dQbVQkLsrdkA69HXcYRSoSHCSYpi+lNr
	HjvKrZMC7dR9iUBeVbQ4noPFvZLK4E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXUTL7WyaadOiDTiaWfpXSqe5Le413UdyUI211McMFQ=;
	b=vu8P2adpvwDy14HA49SwTnC56qIFlcWVdfB9+JggzSr1IIvVhj4nS79jVnzgjczZ2CC/cA
	6byypfoNd9yV1eBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qYGzEaJw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vu8P2adp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXUTL7WyaadOiDTiaWfpXSqe5Le413UdyUI211McMFQ=;
	b=qYGzEaJwpxo71pVCAFi+dlAOTBxUIh37blFTi9+9jtm2zIR6FBmk/HmzRFf5hucPYlEz6d
	patokZRJQQ0ZZsn0yMSx8Di0nLxNvcbMLWyHE2dQbVQkLsrdkA69HXcYRSoSHCSYpi+lNr
	HjvKrZMC7dR9iUBeVbQ4noPFvZLK4E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXUTL7WyaadOiDTiaWfpXSqe5Le413UdyUI211McMFQ=;
	b=vu8P2adpvwDy14HA49SwTnC56qIFlcWVdfB9+JggzSr1IIvVhj4nS79jVnzgjczZ2CC/cA
	6byypfoNd9yV1eBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5756013326;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mCIJFKbDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/19] ALSA: at73c213: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:23 +0200
Message-ID: <20250829151335.7342-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 723C05C26A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/spi/at73c213.c | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index a0a7f90b6146..0ece7ccbd55f 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -401,7 +401,7 @@ static int snd_at73c213_mono_get(struct snd_kcontrol *kcontrol,
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 
-	mutex_lock(&chip->mixer_lock);
+	guard(mutex)(&chip->mixer_lock);
 
 	ucontrol->value.integer.value[0] =
 		(chip->reg_image[reg] >> shift) & mask;
@@ -410,8 +410,6 @@ static int snd_at73c213_mono_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.integer.value[0] =
 			mask - ucontrol->value.integer.value[0];
 
-	mutex_unlock(&chip->mixer_lock);
-
 	return 0;
 }
 
@@ -431,14 +429,12 @@ static int snd_at73c213_mono_put(struct snd_kcontrol *kcontrol,
 		val = mask - val;
 	val <<= shift;
 
-	mutex_lock(&chip->mixer_lock);
+	guard(mutex)(&chip->mixer_lock);
 
 	val = (chip->reg_image[reg] & ~(mask << shift)) | val;
 	change = val != chip->reg_image[reg];
 	retval = snd_at73c213_write_reg(chip, reg, val);
 
-	mutex_unlock(&chip->mixer_lock);
-
 	if (retval)
 		return retval;
 
@@ -473,7 +469,7 @@ static int snd_at73c213_stereo_get(struct snd_kcontrol *kcontrol,
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	int invert = (kcontrol->private_value >> 22) & 1;
 
-	mutex_lock(&chip->mixer_lock);
+	guard(mutex)(&chip->mixer_lock);
 
 	ucontrol->value.integer.value[0] =
 		(chip->reg_image[left_reg] >> shift_left) & mask;
@@ -487,8 +483,6 @@ static int snd_at73c213_stereo_get(struct snd_kcontrol *kcontrol,
 			mask - ucontrol->value.integer.value[1];
 	}
 
-	mutex_unlock(&chip->mixer_lock);
-
 	return 0;
 }
 
@@ -514,29 +508,20 @@ static int snd_at73c213_stereo_put(struct snd_kcontrol *kcontrol,
 	val1 <<= shift_left;
 	val2 <<= shift_right;
 
-	mutex_lock(&chip->mixer_lock);
+	guard(mutex)(&chip->mixer_lock);
 
 	val1 = (chip->reg_image[left_reg] & ~(mask << shift_left)) | val1;
 	val2 = (chip->reg_image[right_reg] & ~(mask << shift_right)) | val2;
 	change = val1 != chip->reg_image[left_reg]
 		|| val2 != chip->reg_image[right_reg];
 	retval = snd_at73c213_write_reg(chip, left_reg, val1);
-	if (retval) {
-		mutex_unlock(&chip->mixer_lock);
-		goto out;
-	}
+	if (retval)
+		return retval;
 	retval = snd_at73c213_write_reg(chip, right_reg, val2);
-	if (retval) {
-		mutex_unlock(&chip->mixer_lock);
-		goto out;
-	}
-
-	mutex_unlock(&chip->mixer_lock);
+	if (retval)
+		return retval;
 
 	return change;
-
-out:
-	return retval;
 }
 
 #define snd_at73c213_mono_switch_info	snd_ctl_boolean_mono_info
@@ -549,7 +534,7 @@ static int snd_at73c213_mono_switch_get(struct snd_kcontrol *kcontrol,
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 
-	mutex_lock(&chip->mixer_lock);
+	guard(mutex)(&chip->mixer_lock);
 
 	ucontrol->value.integer.value[0] =
 		(chip->reg_image[reg] >> shift) & 0x01;
@@ -558,8 +543,6 @@ static int snd_at73c213_mono_switch_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.integer.value[0] =
 			0x01 - ucontrol->value.integer.value[0];
 
-	mutex_unlock(&chip->mixer_lock);
-
 	return 0;
 }
 
@@ -583,15 +566,13 @@ static int snd_at73c213_mono_switch_put(struct snd_kcontrol *kcontrol,
 		val = mask - val;
 	val <<= shift;
 
-	mutex_lock(&chip->mixer_lock);
+	guard(mutex)(&chip->mixer_lock);
 
 	val |= (chip->reg_image[reg] & ~(mask << shift));
 	change = val != chip->reg_image[reg];
 
 	retval = snd_at73c213_write_reg(chip, reg, val);
 
-	mutex_unlock(&chip->mixer_lock);
-
 	if (retval)
 		return retval;
 
-- 
2.50.1

