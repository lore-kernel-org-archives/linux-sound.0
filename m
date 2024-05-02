Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C791C6AE
	for <linux-sound@vger.kernel.org>; Thu,  2 May 2024 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714631077; cv=none; b=RX2VEjSlz0XxnuplNNbgBGcxWmTnvf4WUAQM/EAYZ2ePQmB2pnmKR2t5azqMpYcvXcUz/dGxz3YWOOdvnJdR93rpw1SjYq8DwubRvreuciZQNNdbE0bHWEGTpSMhmcRig2lVZ26+JRgsJn9wYbVt/70SgJO5Oyi3TwqtFIgj7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714631077; c=relaxed/simple;
	bh=cWS5F88k+QHRV4iBcBOq6dql56KtqZwyiEDobMulaz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rplLhwZbIxqLp7IXuWJwE/6THx5VRvBqWLyKs+N3freGpt5B+sDodnXAaSXsccd32OF0odTNIJdThbIrH6rq5QKd5/AhU4/JAJy49QRqb5Gm8sYlFRWZonc1dfmP8ldZ2cGTzx09jG46pF8sTn1rWBRDP+1MITsTqke2b3+U5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qXioxU1b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d8QqicPh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L1fhICeI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SxNHxWu6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qXioxU1b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8QqicPh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L1fhICeI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SxNHxWu6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C205E35018;
	Thu,  2 May 2024 06:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714631073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jfnop1axcFZ6gH9KOUcYnspcg0C1uDNwt0YnMmBj2rw=;
	b=qXioxU1bwtE5xfF21QqutuhsHPD99PzFNJdCamf+nFBE+g+u4/jZhs5KNRNI6D4duBRn8v
	oEYbfZj9pA/d2IQT3vs+c7v95COkYfv1lzopHWgAJbqkOi6Hv0I+K0UpBH0wka+/WAfJP6
	aMWrvfPCsW9mYxyFWK+qSKhQmY0GuKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714631073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jfnop1axcFZ6gH9KOUcYnspcg0C1uDNwt0YnMmBj2rw=;
	b=d8QqicPhpZNIVb8zbbL1TFSXL7P+J57YEkRdRIUur18MGbTUkFLZCYEe79Th+UoBqz+yGt
	j6rRsoZQqH4QQ1Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L1fhICeI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SxNHxWu6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714631071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jfnop1axcFZ6gH9KOUcYnspcg0C1uDNwt0YnMmBj2rw=;
	b=L1fhICeICZdt43zVZjJ7JgxuL8p7J0ZasbEoTYTgb7Vib+Ngoyjzr0MmrVSB8oiw3jR7rf
	GeesmOk8E/cOY4Tbof+o1rfwI4/H1XV9TcrJD/rRThLnMrGiPF5XBGGXpFMcTREnq/v8HT
	2dHyEtGfyUGTS35zd0VpURiqrOb57+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714631071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jfnop1axcFZ6gH9KOUcYnspcg0C1uDNwt0YnMmBj2rw=;
	b=SxNHxWu6r7+TR4hG3LOmCQYO8k5LtLfFbsmJSjEqdquUVk7Kw+G06mPxmp7HG793KS5GVT
	QXyXByrvCUsCmhAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DB231386E;
	Thu,  2 May 2024 06:24:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QNn3JJ8xM2ZzOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 May 2024 06:24:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kailang Yang <kailang@realtek.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix build error without CONFIG_PM
Date: Thu,  2 May 2024 08:24:42 +0200
Message-ID: <20240502062442.30545-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-0.10 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.09)[64.46%];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: C205E35018
X-Spam-Flag: NO
X-Spam-Score: -0.10
X-Spamd-Bar: /

The alc_spec.power_hook is defined only with CONFIG_PM, and the recent
fix overlooked it, resulting in a build error without CONFIG_PM.
Fix it with the simple ifdef and set __maybe_unused for the function.

We may drop the whole CONFIG_PM dependency there, but it should be
done in a separate cleanup patch later.

Fixes: 1e707769df07 ("ALSA: hda/realtek - Set GPIO3 to default at S4 state for Thinkpad with ALC1318")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405012104.Dr7h318W-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: add __maybe_unused for another warning

 sound/pci/hda/patch_realtek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e704425788eb..b29739bd330b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7204,7 +7204,7 @@ static void alc287_alc1318_playback_pcm_hook(struct hda_pcm_stream *hinfo,
 	}
 }
 
-static void alc287_s4_power_gpio3_default(struct hda_codec *codec)
+static void __maybe_unused alc287_s4_power_gpio3_default(struct hda_codec *codec)
 {
 	if (is_s4_suspend(codec)) {
 		alc_write_coef_idx(codec, 0x10, 0x8806); /* Change MLK to GPIO3 */
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

