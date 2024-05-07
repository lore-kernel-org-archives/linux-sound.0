Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0270A16E888
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=GU9xW+X6Ufz65AEa8XghPNyre+n716i2XOsKJ7JaoyPkRjzdBjqAs2HK+aBjKuCILXsuEpnNBdbbmdlkZuydhnHxhD3Et2h0Zvqsw4E/8Snbq9/bNRvnaDvac3NvJrUyjJD4DUPbmZEL+Ccf94uDwQRu9vnAzOoAUEZu0qkcBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=Cbxlg6TSLkl6e1SAEv9rcQP6OWBFdo94+zV9kfxH4a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHqAoFGGGtxaGng97YF+2wOdgPCPl9rhn162NTFEfj0vRb7PvMIr29qzq4/rtWjUZ/w9oFTXxjd2CObG18Sc5hTBwjcfp/NsOODubORT4/NDmlx4ANpjXmJc8rPyNVBerKb5acmrhTUlK8gh5RV/rTZmwcKcAlKm657rHwqk+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kVWmCHG2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OvyaIvMY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kVWmCHG2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OvyaIvMY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kVWmCHG2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OvyaIvMY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kVWmCHG2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OvyaIvMY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FB842209D;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJntn7+6FWMCDXzLYgkIOf8t6Ja7h7SkcdnTRQLY4s8=;
	b=kVWmCHG2u0Jg/9bASu1P6+o7/8wixNv3bPbz6hLqcLgFVoxzgF6Ez8Kk0c8NpmmOfJ3JjF
	ikzLdRTAhS7ilPI0CzuPNcZWMk0BFKV0D0iuLlWGIYZJ9OXkh6KFQZkZWQoTCGjWvn9iyp
	+6dty6Gg0QlrtMX4CcA6ShG0mJwa0dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJntn7+6FWMCDXzLYgkIOf8t6Ja7h7SkcdnTRQLY4s8=;
	b=OvyaIvMY+YWH9RxpL8Ss6QEo/S6XI6sMMJ1YhPaI/bDgd2wPq2bhlkC+dl6lFlf5uTYx2N
	jPRc1bcPSEbNAqDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJntn7+6FWMCDXzLYgkIOf8t6Ja7h7SkcdnTRQLY4s8=;
	b=kVWmCHG2u0Jg/9bASu1P6+o7/8wixNv3bPbz6hLqcLgFVoxzgF6Ez8Kk0c8NpmmOfJ3JjF
	ikzLdRTAhS7ilPI0CzuPNcZWMk0BFKV0D0iuLlWGIYZJ9OXkh6KFQZkZWQoTCGjWvn9iyp
	+6dty6Gg0QlrtMX4CcA6ShG0mJwa0dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJntn7+6FWMCDXzLYgkIOf8t6Ja7h7SkcdnTRQLY4s8=;
	b=OvyaIvMY+YWH9RxpL8Ss6QEo/S6XI6sMMJ1YhPaI/bDgd2wPq2bhlkC+dl6lFlf5uTYx2N
	jPRc1bcPSEbNAqDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F5AA13A3A;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IFo/CvVOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 17/34] ASoC: meson: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:21 +0200
Message-ID: <20240507155540.24815-18-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/meson/Makefile | 50 ++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index e446bc980481..24078e4396b0 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -1,30 +1,30 @@
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
-snd-soc-meson-aiu-objs := aiu.o
-snd-soc-meson-aiu-objs += aiu-acodec-ctrl.o
-snd-soc-meson-aiu-objs += aiu-codec-ctrl.o
-snd-soc-meson-aiu-objs += aiu-encoder-i2s.o
-snd-soc-meson-aiu-objs += aiu-encoder-spdif.o
-snd-soc-meson-aiu-objs += aiu-fifo.o
-snd-soc-meson-aiu-objs += aiu-fifo-i2s.o
-snd-soc-meson-aiu-objs += aiu-fifo-spdif.o
-snd-soc-meson-axg-fifo-objs := axg-fifo.o
-snd-soc-meson-axg-frddr-objs := axg-frddr.o
-snd-soc-meson-axg-toddr-objs := axg-toddr.o
-snd-soc-meson-axg-tdm-formatter-objs := axg-tdm-formatter.o
-snd-soc-meson-axg-tdm-interface-objs := axg-tdm-interface.o
-snd-soc-meson-axg-tdmin-objs := axg-tdmin.o
-snd-soc-meson-axg-tdmout-objs := axg-tdmout.o
-snd-soc-meson-axg-sound-card-objs := axg-card.o
-snd-soc-meson-axg-spdifin-objs := axg-spdifin.o
-snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
-snd-soc-meson-axg-pdm-objs := axg-pdm.o
-snd-soc-meson-card-utils-objs := meson-card-utils.o
-snd-soc-meson-codec-glue-objs := meson-codec-glue.o
-snd-soc-meson-gx-sound-card-objs := gx-card.o
-snd-soc-meson-g12a-toacodec-objs := g12a-toacodec.o
-snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
-snd-soc-meson-t9015-objs := t9015.o
+snd-soc-meson-aiu-y := aiu.o
+snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
+snd-soc-meson-aiu-y += aiu-codec-ctrl.o
+snd-soc-meson-aiu-y += aiu-encoder-i2s.o
+snd-soc-meson-aiu-y += aiu-encoder-spdif.o
+snd-soc-meson-aiu-y += aiu-fifo.o
+snd-soc-meson-aiu-y += aiu-fifo-i2s.o
+snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-axg-fifo-y := axg-fifo.o
+snd-soc-meson-axg-frddr-y := axg-frddr.o
+snd-soc-meson-axg-toddr-y := axg-toddr.o
+snd-soc-meson-axg-tdm-formatter-y := axg-tdm-formatter.o
+snd-soc-meson-axg-tdm-interface-y := axg-tdm-interface.o
+snd-soc-meson-axg-tdmin-y := axg-tdmin.o
+snd-soc-meson-axg-tdmout-y := axg-tdmout.o
+snd-soc-meson-axg-sound-card-y := axg-card.o
+snd-soc-meson-axg-spdifin-y := axg-spdifin.o
+snd-soc-meson-axg-spdifout-y := axg-spdifout.o
+snd-soc-meson-axg-pdm-y := axg-pdm.o
+snd-soc-meson-card-utils-y := meson-card-utils.o
+snd-soc-meson-codec-glue-y := meson-codec-glue.o
+snd-soc-meson-gx-sound-card-y := gx-card.o
+snd-soc-meson-g12a-toacodec-y := g12a-toacodec.o
+snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
+snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
-- 
2.43.0

