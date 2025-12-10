Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EE43AA6
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765372560; cv=none; b=Eb2yb7ynujMwYhkib5VsZtfCPNoA52dWw8+FiGMEGAZp2mLLVmb5T7zFOwpaoXtSqg1MHKsU8u+EyGhF3IUj1/v32xIQpJ7bkMAjdwfwcTBCt/ds9ADxmloKSbiKs0BNztCAu7DnL/+u1B21WDJlH+uvhRBrrVGmDDd7ayZPJSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765372560; c=relaxed/simple;
	bh=MpoTXvrfcW5Osj0YfTN7NqcKKnc6FVi7egG/p6IjqmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9T0TV8vX+YBq9sX7CJaIp4NlKTMqn5+7mtOiazDuX6rBhtOmVXLfMK0VGuHlhN6VVUtLKiOvb9Bvk5cE8ZMAiC0CpVBKdUE5pdviFXqK81v/RKeAPUeGmliaQjoC307P49yJumOHyPvPlt2andUrUfnCWeu267VKO66Ej+1Cak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VhcPoQUw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t0kO4UQ8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VhcPoQUw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t0kO4UQ8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VhcPoQUw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t0kO4UQ8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VhcPoQUw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t0kO4UQ8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C47125BD29;
	Wed, 10 Dec 2025 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765372556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zmNcrIE+p3iC58uQaizahh47fUF5inMeEr3Byrv+6M4=;
	b=VhcPoQUw7AoJ/JmcUoMldsBljvZYD0a6tOF34A1PS1xVKME8jGwcdN4oZbV6mMcx98iaMh
	1bKAxlHqyC6doxUX3jH+CxvCCfN1CVaT+Zq8YT0Yb1x8h2Yh17zW7V7heC1V3TzLR5iH90
	JgXq6wJ8O1SwpyeJBVhfiGWzasu7/Ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765372556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zmNcrIE+p3iC58uQaizahh47fUF5inMeEr3Byrv+6M4=;
	b=t0kO4UQ8ea6PSvpJhDLXM5xyTtCbLrhpqBcQrlNjDYpXzuqCNt+9Z07bhcuD1zPF01jmRA
	zS8begxRUIeXqKCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765372556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zmNcrIE+p3iC58uQaizahh47fUF5inMeEr3Byrv+6M4=;
	b=VhcPoQUw7AoJ/JmcUoMldsBljvZYD0a6tOF34A1PS1xVKME8jGwcdN4oZbV6mMcx98iaMh
	1bKAxlHqyC6doxUX3jH+CxvCCfN1CVaT+Zq8YT0Yb1x8h2Yh17zW7V7heC1V3TzLR5iH90
	JgXq6wJ8O1SwpyeJBVhfiGWzasu7/Ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765372556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zmNcrIE+p3iC58uQaizahh47fUF5inMeEr3Byrv+6M4=;
	b=t0kO4UQ8ea6PSvpJhDLXM5xyTtCbLrhpqBcQrlNjDYpXzuqCNt+9Z07bhcuD1zPF01jmRA
	zS8begxRUIeXqKCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94DC43EA63;
	Wed, 10 Dec 2025 13:15:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1GVCI4xyOWkPJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Dec 2025 13:15:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org,
	Askar Safin <safinaskar@gmail.com>
Subject: [PATCH] ALSA: hda: intel-dsp-config: Prefer legacy driver as fallback
Date: Wed, 10 Dec 2025 14:15:51 +0100
Message-ID: <20251210131553.184404-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

When config table entries don't match with the device to be probed,
currently we fall back to SND_INTEL_DSP_DRIVER_ANY, which means to
allow any drivers to bind with it.

This was set so with the assumption (or hope) that all controller
drivers should cover the devices generally, but in practice, this
caused a problem as reported recently.  Namely, when a specific
kconfig for SOF isn't set for the modern Intel chips like Alderlake,
a wrong driver (AVS) got probed and failed.  This is because we have
entries like:

 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
 /* Alder Lake / Raptor Lake */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
 	},
 ....
 #endif

so this entry is effective only when CONFIG_SND_SOC_SOF_ALDERLAKE is
set.  If not set, there is no matching entry, hence it returns
SND_INTEL_DSP_DRIVER_ANY as fallback.  OTOH, if the kconfig is set, it
explicitly falls back to SND_INTEL_DSP_DRIVER_LEGACY when no DMIC or
SoundWire is found -- that was the working scenario.  That being said,
the current setup may be broken for modern Intel chips that are
supposed to work with either SOF or legacy driver when the
corresponding kconfig were missing.

For addressing the problem above, this patch changes the fallback
driver to the legacy driver, i.e. return SND_INTEL_DSP_DRIVER_LEGACY
type as much as possible.  When CONFIG_SND_HDA_INTEL is also disabled,
the fallback is set to SND_INTEL_DSP_DRIVER_ANY type, just to be sure.

Reported-by: Askar Safin <safinaskar@gmail.com>
Closes: https://lore.kernel.org/all/20251014034156.4480-1-safinaskar@gmail.com/
Tested-by: Askar Safin <safinaskar@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/intel-dsp-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
index c401c0658421..0c25e87408de 100644
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -718,7 +718,8 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	/* find the configuration for the specific device */
 	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
 	if (!cfg)
-		return SND_INTEL_DSP_DRIVER_ANY;
+		return IS_ENABLED(CONFIG_SND_HDA_INTEL) ?
+			SND_INTEL_DSP_DRIVER_LEGACY : SND_INTEL_DSP_DRIVER_ANY;
 
 	if (cfg->flags & FLAG_SOF) {
 		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&
-- 
2.52.0

