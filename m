Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487412F395
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714579812; cv=none; b=gagdAtyCdKoqQaTngOZwoNgcDbrGGL2IX2Wuo2SaI843Tgixnq18J+S5BzvuvWSaNKqL4c3kMvgq8RoeNV+C97dMmfM0CRthxTf6FKqlLbhKPvsOd/WPWzuSqkFmTdtdox2BrN1NpY+MtkgGN0gycJwuCItp0s+YLuHd5IzC3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714579812; c=relaxed/simple;
	bh=+IHe2dtzyfrT/T0Fgt3dpqUiZXUssSo65aE4lEHiHWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3JsKsHixQpKUL4mjo6QuKLf0ysAh0iJvV0Xqfsh1PVf9eXO3dSHX2hQYUHGpeyL0/Sm8Q1m31Tw0QOW8zmsnSZlOmnwXo6d8k529RqLTN7lIk2xVlCPmljcGEpcMB62FWghMM65jpw76gfbe+xFEbFjtyW1ZiXlYCnSaHjX5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OnFaakYa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GsP3qV86; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OnFaakYa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GsP3qV86; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OnFaakYa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GsP3qV86";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OnFaakYa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GsP3qV86"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B4A65349B2;
	Wed,  1 May 2024 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714579808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ErjhkV5CSFQcN1p1KBvzKh5k4j0ccLEvIgfgm6HQVlk=;
	b=OnFaakYa9gywlPr1Oh2qJMY44mQh2xZYZv3F1S4p/x4xPS45LVpikB2uHzN2zoCaMPYSTe
	Z/2ryY2c0I8Ers6fUKkQe1jl3+iLbdTZOr6EszYD6oVzJT7NniUog0IwyF3nAB0xJY+beS
	G6ytI1Iq2wxkPL7AnV0vkGvINLVQ2go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714579808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ErjhkV5CSFQcN1p1KBvzKh5k4j0ccLEvIgfgm6HQVlk=;
	b=GsP3qV86p1CPNRRG0CVFVdqE0Hl7Va6zLds/UdgP67OdKBySpBzASGvEK/wDc/b2rdAnbX
	KgR0YTjqKvHfXmAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OnFaakYa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GsP3qV86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714579808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ErjhkV5CSFQcN1p1KBvzKh5k4j0ccLEvIgfgm6HQVlk=;
	b=OnFaakYa9gywlPr1Oh2qJMY44mQh2xZYZv3F1S4p/x4xPS45LVpikB2uHzN2zoCaMPYSTe
	Z/2ryY2c0I8Ers6fUKkQe1jl3+iLbdTZOr6EszYD6oVzJT7NniUog0IwyF3nAB0xJY+beS
	G6ytI1Iq2wxkPL7AnV0vkGvINLVQ2go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714579808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ErjhkV5CSFQcN1p1KBvzKh5k4j0ccLEvIgfgm6HQVlk=;
	b=GsP3qV86p1CPNRRG0CVFVdqE0Hl7Va6zLds/UdgP67OdKBySpBzASGvEK/wDc/b2rdAnbX
	KgR0YTjqKvHfXmAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FBF113942;
	Wed,  1 May 2024 16:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u2doIWBpMmY6YwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 May 2024 16:10:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kailang Yang <kailang@realtek.com>
Subject: [PATCH] ALSA: hda/realtek: Fix build error without CONFIG_PM
Date: Wed,  1 May 2024 18:10:10 +0200
Message-ID: <20240501161019.8373-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.37 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	BAYES_HAM(-0.36)[76.73%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -0.37
X-Spamd-Bar: /
X-Rspamd-Queue-Id: B4A65349B2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

The alc_spec.power_hook is defined only with CONFIG_PM, and the recent
fix overlooked it, resulting in a build error without CONFIG_PM.
Fix it with the simple ifdef.

We may drop the whole CONFIG_PM dependency there, but it should be
done in a separate cleanup patch later.

Fixes: 1e707769df07 ("ALSA: hda/realtek - Set GPIO3 to default at S4 state for Thinkpad with ALC1318")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405012104.Dr7h318W-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e704425788eb..723b35842347 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7219,7 +7219,9 @@ static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
 
 	if (action != HDA_FIXUP_ACT_PRE_PROBE)
 		return;
+#ifdef CONFIG_PM
 	spec->power_hook = alc287_s4_power_gpio3_default;
+#endif
 	spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
 }
 
-- 
2.43.0

