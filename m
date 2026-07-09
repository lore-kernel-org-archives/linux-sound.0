Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED21404BDC
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590984; cv=none; b=iRhrVVkKLHShmW5dTB9S1I8gfD01GRgw2IrCn1FHqw8f0OfDJ5ND4AIQqgfoKeW29o+LkdSiNI/jieX9fGD78Vo9gxOuGQnyGNDtlFLvSL14/5+C063hUvXTEioW9uSqWwioRuFwXkHEpj35vSyD4S1GDKfOyEscqC70O5y5v4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590984; c=relaxed/simple;
	bh=YLNgUevrFRdJD56mWbUbHC42xCoxEN5kuR7q1dzthpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8GFqAG6HwrM7f/qOnIvSjjqSA6Mlty9oR0r7LL1lg+L766i750fCqoFf9z5bcI2+XdSX8Rf3MVtGq/xKrS111kq+GYZYv1nnCnqNzxUg9JdpxTR17n+I62iZVOk862KeYqDcS5Y5plzQAhM8U4iKaWXdBgZrSYTgjQOdqN7Zh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YXsYCMx4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5xtJIRT9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YXsYCMx4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5xtJIRT9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YXsYCMx4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xtJIRT9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YXsYCMx4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xtJIRT9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 553ED760E2;
	Thu,  9 Jul 2026 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783590981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Vyz/DcqGVKGttPNG/gMtf4+qYf9WYLeYVjQBHKx128Y=;
	b=YXsYCMx4AD0G6cXtUXl0ZKzklGxglfAXc3ov7esEmbU8sxnfUu0wg8oPEtzPWIsmWKK2T/
	ZztBgFVWK79D+Sb4cWerfMMcTZAqadsybqwnTmhrXrQKsP4BC1G6N72Eb2rCOz+/a5aQAU
	Tzx4/+F34ta9T1ifD0jb1c3ZsLAM0cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783590981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Vyz/DcqGVKGttPNG/gMtf4+qYf9WYLeYVjQBHKx128Y=;
	b=5xtJIRT9B85zWo8fG9EmZYAtWqW6mwVpnIu9Uy8h7fIcsc5Lsq3n06EWMSeD+7CgunsV8b
	AapZJ0LC23aPbHCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783590981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Vyz/DcqGVKGttPNG/gMtf4+qYf9WYLeYVjQBHKx128Y=;
	b=YXsYCMx4AD0G6cXtUXl0ZKzklGxglfAXc3ov7esEmbU8sxnfUu0wg8oPEtzPWIsmWKK2T/
	ZztBgFVWK79D+Sb4cWerfMMcTZAqadsybqwnTmhrXrQKsP4BC1G6N72Eb2rCOz+/a5aQAU
	Tzx4/+F34ta9T1ifD0jb1c3ZsLAM0cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783590981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Vyz/DcqGVKGttPNG/gMtf4+qYf9WYLeYVjQBHKx128Y=;
	b=5xtJIRT9B85zWo8fG9EmZYAtWqW6mwVpnIu9Uy8h7fIcsc5Lsq3n06EWMSeD+7CgunsV8b
	AapZJ0LC23aPbHCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C0F8779AA;
	Thu,  9 Jul 2026 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gvuECUVwT2oNWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 09:56:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Salvador Blaya <tiniebla6@gmail.com>,
	Jussi Laako <jussi@sonarnerd.net>
Subject: [PATCH] ALSA: usb-audio: Skip DSD quirk for Musical Fidelity M6s DAC
Date: Thu,  9 Jul 2026 11:56:06 +0200
Message-ID: <20260709095614.1418838-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sonarnerd.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

Salvador reported that the recent fix for applying the DSD quirk to
Musical Fidelity devices broke for his M6s DAC model (2772:0502).

Although this is basically a firmware bug, the model in question is
fairly old, and no further firmware update can be expected, so it'd be
better to address in the driver side.

As an ad hoc workaround, skip the DSD quirk for this device by adding
an empty quirk entry of 2772:0502; this essentially skips the later
DSD quirk entry by the match with the vendor 2772.

Fixes: da3a7efff64e ("ALSA: usb-audio: Update for native DSD support quirks")
Reported-by: Salvador Blaya <tiniebla6@gmail.com>
Closes: https://lore.kernel.org/CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2949a0d2d961..d98825f9697c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2463,6 +2463,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
+		   0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor match */
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2a70, 0x1881, /* OnePlus Technology (Shenzhen) Co., Ltd. BE02T */
-- 
2.54.0

