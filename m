Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA7032143F
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478886; cv=none; b=epIhgVM5tIDpIDyTjakVrCcppyJhPGE/bYEWNOPkP5bhNvnbWVfAcGH9nfvaS8afshM4QqWzF6fqXaxA3JohNwGMFy6XmCMUP6hDbnr4Ip+Vfr1vDC4y6fKq9DcemdpOOeqHQDvtJJtrZqfRvKTTv+8S8pMaPyGCigcMzwmoVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478886; c=relaxed/simple;
	bh=wgs+nGg2WAxZp4+/UmsWZHZ0Ur+utT5LQXat9XgYzAE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AK9BQAMOlG4VadkcQ6fwybZw5Qc95o7ugNRu+7kIQacNypc243A5ZKRmvvuM3u73bFIkKDGa2INZnA+GG/gtxnVcQIAv5k+F7VXQjQmRBQ4J8zHyjsd1H40IRiWiI5mI1RF+s0cfk7b4YzgPOg2Rk1BeCr0kxf4uv/MyerxofcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oHhLmHMY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PaZZWg3t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oHhLmHMY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PaZZWg3t; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oHhLmHMY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PaZZWg3t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oHhLmHMY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PaZZWg3t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5900E5C247;
	Fri, 29 Aug 2025 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpP8k/fmCHUMqe7f0LzT30ODisexZAGM+Ll5qPUWJXA=;
	b=oHhLmHMYdaiJON8CiFDQ6IX0Ys80TZ7AW38VVQr/pe613nOgeXZIglItsZWaxCN/hL5iR7
	4Bq9KeXn3OW90HrZsq/8010u2O9gNpLfPOf6zJm34CILmDBzOQxD9FDun/cX5adZw62ucI
	rDeqmNiXlv6hvcXI7WspN6M7zMhl29w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpP8k/fmCHUMqe7f0LzT30ODisexZAGM+Ll5qPUWJXA=;
	b=PaZZWg3txMtQ6vmrs9OFPM61/VqZlIETZlakkzmR/Rli7eitCOJ8T5e0bLyzGhC3OSyASz
	CR5TsQnxVzVr8HDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpP8k/fmCHUMqe7f0LzT30ODisexZAGM+Ll5qPUWJXA=;
	b=oHhLmHMYdaiJON8CiFDQ6IX0Ys80TZ7AW38VVQr/pe613nOgeXZIglItsZWaxCN/hL5iR7
	4Bq9KeXn3OW90HrZsq/8010u2O9gNpLfPOf6zJm34CILmDBzOQxD9FDun/cX5adZw62ucI
	rDeqmNiXlv6hvcXI7WspN6M7zMhl29w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpP8k/fmCHUMqe7f0LzT30ODisexZAGM+Ll5qPUWJXA=;
	b=PaZZWg3txMtQ6vmrs9OFPM61/VqZlIETZlakkzmR/Rli7eitCOJ8T5e0bLyzGhC3OSyASz
	CR5TsQnxVzVr8HDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3873B13A54;
	Fri, 29 Aug 2025 14:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MBatDLS8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 60/61] ALSA: vx222: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:35 +0200
Message-ID: <20250829144342.4290-61-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/vx222/vx222_ops.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index 3e7e928b24f8..b6459dbdb1b0 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -868,10 +868,10 @@ static int vx_input_level_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 {
 	struct vx_core *_chip = snd_kcontrol_chip(kcontrol);
 	struct snd_vx222 *chip = to_vx222(_chip);
-	mutex_lock(&_chip->mixer_mutex);
+
+	guard(mutex)(&_chip->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->input_level[0];
 	ucontrol->value.integer.value[1] = chip->input_level[1];
-	mutex_unlock(&_chip->mixer_mutex);
 	return 0;
 }
 
@@ -885,16 +885,14 @@ static int vx_input_level_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	if (ucontrol->value.integer.value[1] < 0 ||
 	    ucontrol->value.integer.value[1] > MIC_LEVEL_MAX)
 		return -EINVAL;
-	mutex_lock(&_chip->mixer_mutex);
+	guard(mutex)(&_chip->mixer_mutex);
 	if (chip->input_level[0] != ucontrol->value.integer.value[0] ||
 	    chip->input_level[1] != ucontrol->value.integer.value[1]) {
 		chip->input_level[0] = ucontrol->value.integer.value[0];
 		chip->input_level[1] = ucontrol->value.integer.value[1];
 		vx2_set_input_level(chip);
-		mutex_unlock(&_chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&_chip->mixer_mutex);
 	return 0;
 }
 
@@ -923,14 +921,12 @@ static int vx_mic_level_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	if (ucontrol->value.integer.value[0] < 0 ||
 	    ucontrol->value.integer.value[0] > MIC_LEVEL_MAX)
 		return -EINVAL;
-	mutex_lock(&_chip->mixer_mutex);
+	guard(mutex)(&_chip->mixer_mutex);
 	if (chip->mic_level != ucontrol->value.integer.value[0]) {
 		chip->mic_level = ucontrol->value.integer.value[0];
 		vx2_set_input_level(chip);
-		mutex_unlock(&_chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&_chip->mixer_mutex);
 	return 0;
 }
 
-- 
2.50.1

