Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E041EEE6
	for <linux-sound@vger.kernel.org>; Thu, 30 Jan 2025 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738240388; cv=none; b=oK+ppwlcKTPtgV1QcXkyYFUVFo1MiLErmFhHj6GLxUkPxAG89wGPfdPM/jjSgm5+LTgxYYiujCzCOdMvsXiXftHDpXgPb7nSuRJQUsp1Lt5edVvxJI0lRvwht0BObuHczKnfVKWOWowpoBcdw+k2EFXjruhKnT1ZO4HpVV8CBFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738240388; c=relaxed/simple;
	bh=UeavEXYZpa+OrgeOUD7jDuzEvB8pLQNEyKqW3Yb/3cc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VuEHPXVbFSgBgM6dcH62Tc7ZRYCDC1RdI6aN7JchxubPdFqP8rAj/bKXNMrEw5C7QhU2461Bb9oDQxljmzFpsEr/qm+RYsEQnX2WVCHWxJ1udtLeXe688Fck3tVBg6HNbDRhoR9Oi/RIXoYDWcBm7B2lztcgnH9U1M+aq48H1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fWYaS0SJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FrahcR6Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fWYaS0SJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FrahcR6Y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fWYaS0SJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FrahcR6Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fWYaS0SJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FrahcR6Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 374FD21162;
	Thu, 30 Jan 2025 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738240385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxnKZxAmlqAYNAdG/SwJSeidj4m6Tghw4igcHRKh3Mg=;
	b=fWYaS0SJtZD1TwKQ8lTI9V8sYR8vfjwAqKNCEN3x/Oiir3PCfQYLXsKbFJWEVLV/hKx89F
	naN9Wp5ZmbspgXbPVbWeg+LHNCDBKPKHCClfBPf0tWjXhR+YEgXFUcsHFRsf2dl/YFQMKx
	AD4ajewSBCRCvPFQNnt7QNgR+FW5cwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738240385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxnKZxAmlqAYNAdG/SwJSeidj4m6Tghw4igcHRKh3Mg=;
	b=FrahcR6YfcyCLe2u3IOIvkoMn2PqBCzovarT66XYULD1UuJumiS83ngK9nkV6bb1viLvZ+
	8vXXhEjgYrRL8ABQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738240385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxnKZxAmlqAYNAdG/SwJSeidj4m6Tghw4igcHRKh3Mg=;
	b=fWYaS0SJtZD1TwKQ8lTI9V8sYR8vfjwAqKNCEN3x/Oiir3PCfQYLXsKbFJWEVLV/hKx89F
	naN9Wp5ZmbspgXbPVbWeg+LHNCDBKPKHCClfBPf0tWjXhR+YEgXFUcsHFRsf2dl/YFQMKx
	AD4ajewSBCRCvPFQNnt7QNgR+FW5cwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738240385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxnKZxAmlqAYNAdG/SwJSeidj4m6Tghw4igcHRKh3Mg=;
	b=FrahcR6YfcyCLe2u3IOIvkoMn2PqBCzovarT66XYULD1UuJumiS83ngK9nkV6bb1viLvZ+
	8vXXhEjgYrRL8ABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 292261364B;
	Thu, 30 Jan 2025 12:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kSNTCYFxm2eiTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jan 2025 12:33:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Workaround for resume on Dell Venue 11 Pro 7130
Date: Thu, 30 Jan 2025 13:32:59 +0100
Message-ID: <20250130123301.8996-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.953];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO

It was reported that the headphone output on Dell Venue 11 Pro 7130
becomes mono after PM resume.  The cause seems to be the BIOS setting
up the codec COEF 0x0d bit 0x40 wrongly by some reason, and restoring
the original value 0x2800 fixes the problem.

This patch adds the quirk entry to perform the COEF restore.

Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219697
Link: https://bugzilla.opensuse.org/show_bug.cgi?id=1235686
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d36a79a8ecbf..8192be394d0d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7497,6 +7497,16 @@ static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
 	spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
 }
 
+/*
+ * Clear COEF 0x0d (PCBEEP passthrough) bit 0x40 where BIOS sets it wrongly
+ * at PM resume
+ */
+static void alc283_fixup_dell_hp_resume(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_INIT)
+		alc_write_coef_idx(codec, 0xd, 0x2800);
+}
 
 enum {
 	ALC269_FIXUP_GPIO2,
@@ -7799,6 +7809,7 @@ enum {
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
 	ALC294_FIXUP_BASS_SPEAKER_15,
+	ALC283_FIXUP_DELL_HP_RESUME,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10143,6 +10154,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
 	},
+	[ALC283_FIXUP_DELL_HP_RESUME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc283_fixup_dell_hp_resume,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10203,6 +10218,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x05f4, "Dell", ALC269_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x05f5, "Dell", ALC269_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x05f6, "Dell", ALC269_FIXUP_DELL1_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1028, 0x0604, "Dell Venue 11 Pro 7130", ALC283_FIXUP_DELL_HP_RESUME),
 	SND_PCI_QUIRK(0x1028, 0x0615, "Dell Vostro 5470", ALC290_FIXUP_SUBWOOFER_HSJACK),
 	SND_PCI_QUIRK(0x1028, 0x0616, "Dell Vostro 5470", ALC290_FIXUP_SUBWOOFER_HSJACK),
 	SND_PCI_QUIRK(0x1028, 0x062c, "Dell Latitude E5550", ALC292_FIXUP_DELL_E7X),
-- 
2.43.0

