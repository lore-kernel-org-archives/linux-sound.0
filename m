Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5C2D47EF
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325075; cv=none; b=dbarGiaTnswd7b83WUsMmgTrSrYgUZQr7yKaE8tG3xd218MMjSBM3BaBRJLErP6kz/gpd7BaxM/jUiXySiobvL65Dv0+mqMy7DA86UpOXi7p1s5hwH5SuJYDJmfHnkNiSQ9WSBUfwGs09geO/ZbI49Vu4YpJhxHu2F6vUW7saU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325075; c=relaxed/simple;
	bh=JyydnjPwejq3PlYWyEqMnZK8U9ZgZLberX4/b6HSYi0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lz9ylttthn/yzDVtRBF//B8tazNLRXZ4T9fOI5OTmrF72MClB4oJklDN3vKvfFZPjkQ5z6p7HkB+Ef0ECu9yIfFCixJTQkkEyucQGtSEIWkvf7UwtFalTtV1u07OBuJohy3S4ejuvus4fDum4xGYzuFmpYAOLRsunmtiOxLnz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vYpya3vw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CcJQ2OtZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vYpya3vw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CcJQ2OtZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vYpya3vw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CcJQ2OtZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vYpya3vw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CcJQ2OtZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 300FA5BF75;
	Tue, 17 Feb 2026 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771325072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i19bYgI1n3ltfaW7THjCEFpJpwUTx6Byjw6obEADo9w=;
	b=vYpya3vwjtazfz4Fv8gwKxMSbKNyMQ8unoanY54CpnCBhRFO28jh2opz9GFmbWBvHdgGxb
	l7IuoStpPN4dgWwntsy6DI7UcC/0nvPqLS3WiTOxb8+TEeBL6lfuw9WcEJsLfS7ADT9tX1
	w4ovn7JIdUdbeMezGiTgePStwEzQqNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771325072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i19bYgI1n3ltfaW7THjCEFpJpwUTx6Byjw6obEADo9w=;
	b=CcJQ2OtZ8de6ydTVaI2PK5VxzSdm5D9i9NKaYA717YVXNM8s2QEuBldncvBrLz6jz5nZF+
	ieu3aOl/KT6r+7Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771325072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i19bYgI1n3ltfaW7THjCEFpJpwUTx6Byjw6obEADo9w=;
	b=vYpya3vwjtazfz4Fv8gwKxMSbKNyMQ8unoanY54CpnCBhRFO28jh2opz9GFmbWBvHdgGxb
	l7IuoStpPN4dgWwntsy6DI7UcC/0nvPqLS3WiTOxb8+TEeBL6lfuw9WcEJsLfS7ADT9tX1
	w4ovn7JIdUdbeMezGiTgePStwEzQqNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771325072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i19bYgI1n3ltfaW7THjCEFpJpwUTx6Byjw6obEADo9w=;
	b=CcJQ2OtZ8de6ydTVaI2PK5VxzSdm5D9i9NKaYA717YVXNM8s2QEuBldncvBrLz6jz5nZF+
	ieu3aOl/KT6r+7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 127A23EA65;
	Tue, 17 Feb 2026 10:44:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v40NA5BGlGnccQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Feb 2026 10:44:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314
Date: Tue, 17 Feb 2026 11:44:11 +0100
Message-ID: <20260217104414.62911-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Level: 
X-Spam-Flag: NO

Acer Swift SF314 (SSID 1025:136d) needs a bit of tweaks of the pin
configurations for NID 0x16 and 0x19 to make the headphone / headset
jack working.  NID 0x17 can remain as is for the working speaker, and
the built-in mic is supported via SOF.

Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221086
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/conexant.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5623d8c0a0f7..f71123a47546 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -299,6 +299,7 @@ enum {
 	CXT_PINCFG_SWS_JS201D,
 	CXT_PINCFG_TOP_SPEAKER,
 	CXT_FIXUP_HP_A_U,
+	CXT_FIXUP_ACER_SWIFT_HP,
 };
 
 /* for hda_fixup_thinkpad_acpi() */
@@ -1024,6 +1025,14 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_hp_a_u,
 	},
+	[CXT_FIXUP_ACER_SWIFT_HP] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x16, 0x0321403f }, /* Headphone */
+			{ 0x19, 0x40f001f0 }, /* Mic */
+			{ }
+		},
+	},
 };
 
 static const struct hda_quirk cxt5045_fixups[] = {
@@ -1073,6 +1082,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x1025, 0x0543, "Acer Aspire One 522", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x054c, "Acer Aspire 3830TG", CXT_FIXUP_ASPIRE_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x054f, "Acer Aspire 4830T", CXT_FIXUP_ASPIRE_DMIC),
+	SND_PCI_QUIRK(0x1025, 0x136d, "Acer Swift SF314", CXT_FIXUP_ACER_SWIFT_HP),
 	SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
-- 
2.53.0

