Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426481;
	b=J5d7Ge7snSUkIse+fbOHzcNKrXclOyC+J1lOvUC0KXYvD9U8pRLF8ht3wxZZmyRS5+h0
	 xD8BthPhiQTuee/ECmbC7A971YxM/+bHyBQTUfOMqudvQzMgyu53ubYNhNj69ayox0oYv
	 m7OH6Ep4J+396/N/d1sgs5H29g539qxBDLm4KAAnvn+r5nvqzxFxvCKTKs6iPWDlU0Zy8
	 XWUrMH7907hE0iFmECS9GXXFeGmNdkXyA++NSQLRtiqkBJ4iJ0rGEBi3mvMp07BK5wobB
	 2LUZjfX4xL5Lar3+dVv5H3moGUuiLNFXJ6zmtelENmDadRjIK683YMd1hXc2W+mzbGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426481;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=7GZtMo2qEJ1TwMXSJTOKbe+9Eexx98ekfUvocnPjINs=;
	b=bE8Aizgep00XU/ahao1CrJTkVzBhLC1U0LFDnXSy0I/eTvNid8VMw0Y7mcMQ8/Y7nrS6
	 FWqjArryxh9Fw3VHaDonIVku2H5Q7WengQCDib3q2utyljcx5IqeKkWubJzBQZBdkbEHa
	 XrP3g76x+9FIDDM00NDu0i+H6aLbicGLk9WPME7bQJyd8QIa8y9WK+neJ4H8KbQ74aYGK
	 PplqbKGxrYJsjVGeMXrVX6bfnp31nMsxTiINt1ALGTvVjwiLk562hJKzIY2fgu2x75hJ0
	 ypIU8c11cXObVoa85GSpe1v+2fMdv5E8FsboGvUAt2dJ8BovysxXUGQXzwlR7ZHeGhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YjOsSJKr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XAlsmth3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awEyr4vD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I40GEZFB;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37D606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB37D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YjOsSJKr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XAlsmth3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awEyr4vD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I40GEZFB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1F742207B;
	Mon, 23 Nov 2026 09:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795426479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7GZtMo2qEJ1TwMXSJTOKbe+9Eexx98ekfUvocnPjINs=;
	b=YjOsSJKrj2egEeBXW3DIXyFCVA1RsN8MRi/sfgX4jqH9qZVl73fE86jgzgDMvEvyxsFASz
	J/Vbsc/s/BFMfa9MZLZvSBO69aB2pOBSPIr9ESD16YMV5dalVMfTSL5/7Tlfan+lSlB0M0
	iksIeDncHJz200VtrEUm9QgoQx6vxMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795426479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7GZtMo2qEJ1TwMXSJTOKbe+9Eexx98ekfUvocnPjINs=;
	b=XAlsmth335MZbzX9PbTvvbmHxGRi+h1p1/hF/7RvDK7mtqj+agdT+AOW43jeAb+qflFTCE
	V8I91U1bN4q3Z5Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795426478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7GZtMo2qEJ1TwMXSJTOKbe+9Eexx98ekfUvocnPjINs=;
	b=awEyr4vDkQlf/jIiCi12VoszHlW5dRLVZMPw8psMiPzRFZ6zPIHs1+cMxpiA3sFtwHkZre
	yefDVCelUn6oCFi8H7MJw1hvvqh1VOgFjo3DnWNLHnlP49dd60OddwgCjoBM4kevanS3WW
	Bm5o1/6T0uXkZXiNGxXXulX/lvKJOr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795426478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7GZtMo2qEJ1TwMXSJTOKbe+9Eexx98ekfUvocnPjINs=;
	b=I40GEZFBe4NbvHLt76fUbIQzW5ZKyXWiaDQQQdvA/nm0BuHB1aUND/vPWI1NknJFH46Yao
	+RXeqZfIUQ+JCkAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8F0E1352B;
	Mon, 23 Nov 2026 09:34:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zgfYI64IBGsaKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:34:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] Revert "ALSA: hda/realtek: Fix silent speaker on Higole F9B"
Date: Mon, 23 Nov 2026 10:34:26 +0100
Message-ID: <20261123093436.48511-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

This reverts commit 2a8ee6897302ca12ff39e8eb180503956797c60c.

We've received a regression report due to this commit, and it turned
out that the PCI SSID for this quirk entry is too generic (10ec:111e)
that may match with several different models.

Usually a workaround would be to apply the quirk for a more unique ID
such as codec SSID, but in this case, unfortunately, the codec SSID is
also 10ec:111e, so BIOS is in a premature state.

For addressing the regression, revert the change for now.

Fixes: 2a8ee6897302 ("ALSA: hda/realtek: Fix silent speaker on Higole F9B")
Reported-by: Cristian-Marian Fotache <cristianmarianfotache@gmail.com>
Closes: https://lore.kernel.org/CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dfdcf8b98c9e..87a47f238e4c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8363,7 +8363,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
 	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
 	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
-	SND_PCI_QUIRK(0x10ec, 0x111e, "Higole F9B", ALC290_FIXUP_MONO_SPEAKERS),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.53.0

