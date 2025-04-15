Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EF284688
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705929; cv=none; b=tn2iPHWjENy94i0xu0XDhOeLUimTv8W0QgldB/UM6uDOuFC9JEQ/WZKRP9AZiuRngSbrVyhyBVAyzXxLijgjOyDWH3Va04leNcDqwq+oB0NV84p80OaXCNw9yggnWQMG+5GITXYb0Ft8/+vM7tvHNfb4Oq0mmmm4kdFBmF8NVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705929; c=relaxed/simple;
	bh=B6CRPicg3FfVbD6jPJAhUbGozcNHzl+idfBDkH6mso4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAZiiaXZ1WWjIEEVrMgwBGYl5ycLXic9oHhKb3+Tr1uVOp8I5rikmvBDerXhmeCmLbxJA8h2NsZyHK53yqQBhxIgbV0S8BMZayQKC267hQksWUtWI2Fx3cgzrAxPdDlWP3bgxhsggZXHx5+8vaTpMA/pG2HMzC1I3PscyKMLem4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L9agb1+R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8cvVrE7T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L9agb1+R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8cvVrE7T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L9agb1+R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8cvVrE7T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L9agb1+R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8cvVrE7T"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 45C261F390;
	Tue, 15 Apr 2025 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFmZwDFRN08jjD5/3YR64+N33/I/A0nAT9M2PPRUdL0=;
	b=L9agb1+RThiId7RaFDF+yVj/k5pUhVOV1VJsnhPI4dPtXDOtplePfq1eULxqvOqsptDoL4
	ARUCtngFVWZxQt+GugEVD59UHgEKQVnkZwebBPnbNTs3zdKINKsrlQcstXWxL4WGcglP3V
	qRbVJ/LJl//xlnKgzbKKwgJvhErbLZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFmZwDFRN08jjD5/3YR64+N33/I/A0nAT9M2PPRUdL0=;
	b=8cvVrE7T/kdLgDLe8wWDwgpBhFxp/H7SykuE2t7BYYyyKgo+njgzmRV0wnDRJF2ewaO053
	38vQylo/5LJvO2AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFmZwDFRN08jjD5/3YR64+N33/I/A0nAT9M2PPRUdL0=;
	b=L9agb1+RThiId7RaFDF+yVj/k5pUhVOV1VJsnhPI4dPtXDOtplePfq1eULxqvOqsptDoL4
	ARUCtngFVWZxQt+GugEVD59UHgEKQVnkZwebBPnbNTs3zdKINKsrlQcstXWxL4WGcglP3V
	qRbVJ/LJl//xlnKgzbKKwgJvhErbLZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFmZwDFRN08jjD5/3YR64+N33/I/A0nAT9M2PPRUdL0=;
	b=8cvVrE7T/kdLgDLe8wWDwgpBhFxp/H7SykuE2t7BYYyyKgo+njgzmRV0wnDRJF2ewaO053
	38vQylo/5LJvO2AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2230413A9F;
	Tue, 15 Apr 2025 08:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cH4tB3MZ/mfjRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 08:31:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ASoC: Intel: bytcr_rt5651: Avoid OOB array read from the map name
Date: Tue, 15 Apr 2025 10:31:39 +0200
Message-ID: <20250415083144.6588-4-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415083144.6588-1-tiwai@suse.de>
References: <20250415083144.6588-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
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
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Since the quirk bits can be passed arbitrarily via a module option, it
may lead to the OOB access over the map name string array.
Fix it by conditionally reading the array, instead.

Fixes: 64484ccee7af ("ASoC: Intel: bytcr_rt5651: Set card long_name based on quirks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 67c62844ca2a..53f64f01fb22 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -881,10 +881,15 @@ struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 	u64 mclock_value;    /* usually 25MHz (0x17d7940), ignored */
 };
 
+static const char *mic_name(int n)
+{
+	static const char * const mic_names[] = { "dmic", "in1", "in2", "in12" };
+	return n < ARRAY_SIZE(mic_names) ? mic_names[n] : "none";
+}
+
 static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	static const char * const mic_name[] = { "dmic", "in1", "in2", "in12" };
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct byt_rt5651_private *priv;
 	const char *platform_name;
@@ -1071,7 +1076,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	snprintf(byt_rt5651_components, sizeof(byt_rt5651_components),
 		 "cfg-spk:%s cfg-mic:%s%s",
 		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ? "1" : "2",
-		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)],
+		 mic_name(BYT_RT5651_MAP(byt_rt5651_quirk)),
 		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
 			" cfg-hp:lrswap" : "");
 	byt_rt5651_card.components = byt_rt5651_components;
@@ -1080,7 +1085,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		 "bytcr-rt5651-%s-spk-%s-mic%s",
 		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ?
 			"mono" : "stereo",
-		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)],
+		 mic_name(BYT_RT5651_MAP(byt_rt5651_quirk)),
 		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
 			"-hp-swapped" : "");
 	byt_rt5651_card.long_name = byt_rt5651_long_name;
-- 
2.49.0

