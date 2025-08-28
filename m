Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078183148B3
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756390267; cv=none; b=eEvCDHBCyk0MloNM9NMTX9PTb7dBR7ShaWNvxylEkyKH0ooWs26seWso/Yfvksq2vYhpbuqb1Nq+pfRPyBPufdTVnH7wTS92Oe3GUdulBFhdB9s7dt7xmbglS7Mo+/FHaK7BKAU+LrKX6uEjWi4z/yPenyVIuh7BKmsvs3uiA2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756390267; c=relaxed/simple;
	bh=ToFwQPXj7wlX9IiCD4CWnE5uuKqBJRJkps57HxIwDqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwQQcX4cPJBEzMOUtHnfXIlsyoFJI4brHFk2b9MFhZhgQWXqZk39KBnv8NyXetI8/z8AuCE6Lg4MiJvhsep4a/E00SisVqzy+k22OyvLeNq2stCOklUgOj2+kLXYLfdapXUt2dZ9xXuYr+bSCS+p7Ka7G37LvkuE2GXiGj6XePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stlAiMsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dQtuTn4+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stlAiMsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dQtuTn4+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stlAiMsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dQtuTn4+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stlAiMsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dQtuTn4+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1993322346;
	Thu, 28 Aug 2025 14:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756390264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=58mxFmMguwsx7jD1f018UtPdoNTvGeunGMaci5UD/7k=;
	b=stlAiMsrLkBqwVfk9SPvbql80SlSEDG8qEQOJzXLN91jpXd45gpz8PeSjqEXIH5KVFelzL
	yXQjPbo5rBz/aysYqafAb3Uz85V/zOOO5lIp39V4Dcmg5yUWw0uOYWXh6Zru3mftMB+so8
	M0DnVashsfW/cL+VhyjRLYHzIpF3HQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756390264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=58mxFmMguwsx7jD1f018UtPdoNTvGeunGMaci5UD/7k=;
	b=dQtuTn4+pf3IU9g7a+6qo2n0I1sCCaavR/pT+BIwwkKlTVHYncs6Ej2gfu4eXpHzlYnHzp
	BafG/Dm/zD0kxdCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756390264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=58mxFmMguwsx7jD1f018UtPdoNTvGeunGMaci5UD/7k=;
	b=stlAiMsrLkBqwVfk9SPvbql80SlSEDG8qEQOJzXLN91jpXd45gpz8PeSjqEXIH5KVFelzL
	yXQjPbo5rBz/aysYqafAb3Uz85V/zOOO5lIp39V4Dcmg5yUWw0uOYWXh6Zru3mftMB+so8
	M0DnVashsfW/cL+VhyjRLYHzIpF3HQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756390264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=58mxFmMguwsx7jD1f018UtPdoNTvGeunGMaci5UD/7k=;
	b=dQtuTn4+pf3IU9g7a+6qo2n0I1sCCaavR/pT+BIwwkKlTVHYncs6Ej2gfu4eXpHzlYnHzp
	BafG/Dm/zD0kxdCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9A451368B;
	Thu, 28 Aug 2025 14:11:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jdvMN3djsGjDGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 14:11:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ALSA: hda: Avoid binding with SOF for SKL/KBL platforms
Date: Thu, 28 Aug 2025 16:11:00 +0200
Message-ID: <20250828141101.16294-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,suse.com:url];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

For Intel SKL and KBL platforms, it may be bound with one of three
HD-audio drivers (AVS, SOF and legacy).  AVS is the preferred one when
DMIC is detected, and that's how it's defined in the snd-intel-dspcfg
config table.

But, when AVS driver is disabled (CONFIG_SND_SOC_INTEL_AVS=n), the
device may be bound freely with either SOF or legacy driver.
Before 6.17, the legacy driver took it primarily, but on 6.17, likely
due to the recent code shuffling, SOF driver seems taking it at first,
and fails to probe.  For avoiding the regression, we should enforce to
bind those with the legacy HD-audio drvier when AVS is disabled.

This patch adds the extra two entries in intel-dspcfg table that are
applied only when CONFIG_SND_SOC_INTEL_AVS=n, for binding with the
legacy driver.

Note that there are entries for APL in that config table block, but
APL may be supported by SOF for certain setups, so the choice can't be
exclusive.  Hence this patch includes only SKL and KBL.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1248121
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/intel-dsp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
index 00f184917623..c15284742899 100644
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -116,6 +116,13 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SST,
 		.device = PCI_DEVICE_ID_INTEL_HDA_FCL,
 	},
+#else /* AVS disabled; force to legacy as SOF doesn't work for SKL or KBL */
+	{
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
+	},
+	{
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
+	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
-- 
2.50.1

