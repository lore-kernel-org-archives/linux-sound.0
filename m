Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D481B81CC
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388903; cv=none; b=F1q/pSuYEzgF4n9EYgnxYf36oqjltG64mVuGbqWa3+w4bQlE+CAU742XMGRTyyofkyHK1LD2h29lUdgv/tz50vh/n3W19CxqOfLFYluJu1ecj1KIDPojI4er7l5JSndWwsSRQIg/EGKOVHnRZUvK17F6XseFf8xoX034THcj5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388903; c=relaxed/simple;
	bh=nCqU+cwLi541HsA6seGWpZk9tJHmLfQSz5nJdewEbCw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uifbyTJHD3ixlkmWJhEllVeG32A9t9sgfn2vUpEd0tbgtjuj93jW2KhEfwA07tG1klz3CwneYMnyrJFmuj52X9OBfDUTQJToLKWHRc/WYzNffzh9McNBQ/Ocv6N+xid4nG8Z+ulwhm7Ea5Ugpc/KZ9Y4fRQ4zOZUOfkio4RVFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w4yjJS6W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=paAgnuPi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w4yjJS6W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=paAgnuPi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w4yjJS6W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="paAgnuPi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w4yjJS6W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="paAgnuPi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5963C1FF3C;
	Tue,  8 Oct 2024 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728388900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prFEfBehfL6r+Wzc2AL3n2W1X0wqw31WhBLlhTUFd34=;
	b=w4yjJS6WBV418CiNxAftCPyEJGbFh/ITagallsz2A13Y+cgqKfwmMzzJ7bb14yLQZvkpWN
	Qw5lsITUs6G27jqlL4LgqgPal6iqkAdiXrpMFttJ4Vs1F+907VM/pbJCeYU7FH2msMEzCJ
	ibZZWxk2Mn09IIQw+VJC4v6XA9lNt6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728388900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prFEfBehfL6r+Wzc2AL3n2W1X0wqw31WhBLlhTUFd34=;
	b=paAgnuPiThbHs9XnUQZkUv7q4CBCgk6dhAaQUcQ1EyrBByUVPydtgxrrJ5r/DdvVxVqrj8
	vtNRmeDR61nOh4DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728388900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prFEfBehfL6r+Wzc2AL3n2W1X0wqw31WhBLlhTUFd34=;
	b=w4yjJS6WBV418CiNxAftCPyEJGbFh/ITagallsz2A13Y+cgqKfwmMzzJ7bb14yLQZvkpWN
	Qw5lsITUs6G27jqlL4LgqgPal6iqkAdiXrpMFttJ4Vs1F+907VM/pbJCeYU7FH2msMEzCJ
	ibZZWxk2Mn09IIQw+VJC4v6XA9lNt6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728388900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prFEfBehfL6r+Wzc2AL3n2W1X0wqw31WhBLlhTUFd34=;
	b=paAgnuPiThbHs9XnUQZkUv7q4CBCgk6dhAaQUcQ1EyrBByUVPydtgxrrJ5r/DdvVxVqrj8
	vtNRmeDR61nOh4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47EFA13AA0;
	Tue,  8 Oct 2024 12:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uE0MESQfBWdObAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Oct 2024 12:01:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: hda/conexant: Use the new codec SSID matching
Date: Tue,  8 Oct 2024 14:02:30 +0200
Message-ID: <20241008120233.7154-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008120233.7154-1-tiwai@suse.de>
References: <20241008120233.7154-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.976];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Now we can perform the codec ID matching primarily, and reduce the
conditional application of the quirk for conflicting PCI SSID between
System76 and Tuxedo devices.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 02cfd6ae4036..7c61e81c40e0 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -816,23 +816,6 @@ static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
 	{}
 };
 
-/* pincfg quirk for Tuxedo Sirius;
- * unfortunately the (PCI) SSID conflicts with System76 Pangolin pang14,
- * which has incompatible pin setup, so we check the codec SSID (luckily
- * different one!) and conditionally apply the quirk here
- */
-static void cxt_fixup_sirius_top_speaker(struct hda_codec *codec,
-					 const struct hda_fixup *fix,
-					 int action)
-{
-	/* ignore for incorrectly picked-up pang14 */
-	if (codec->core.subsystem_id == 0x278212b3)
-		return;
-	/* set up the top speaker pin */
-	if (action == HDA_FIXUP_ACT_PRE_PROBE)
-		snd_hda_codec_set_pincfg(codec, 0x1d, 0x82170111);
-}
-
 static const struct hda_fixup cxt_fixups[] = {
 	[CXT_PINCFG_LENOVO_X200] = {
 		.type = HDA_FIXUP_PINS,
@@ -993,8 +976,11 @@ static const struct hda_fixup cxt_fixups[] = {
 		.v.pins = cxt_pincfg_sws_js201d,
 	},
 	[CXT_PINCFG_TOP_SPEAKER] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = cxt_fixup_sirius_top_speaker,
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1d, 0x82170111 },
+			{ }
+		},
 	},
 };
 
@@ -1092,8 +1078,8 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
-	SND_PCI_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
-	SND_PCI_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
+	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
+	HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
 	{}
 };
 
-- 
2.43.0

