Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4C471265
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938004; cv=none; b=P6SBBNJVGozLKDFiLbcZtsLVLKyXoCAKgmrJdeClKIUpitHV5rHqOPJKNENw89Y5QqkHkhgg2FYaQrOIaZ67jQWheYQ7pbr7ktxS0Blvz/iAsotNRA8jO6AdopTaHzoiI0GiD3rRyy3pbjtAoNqr6l7vdSOcdCM2AuHUHSiIyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938004; c=relaxed/simple;
	bh=Z5vTQXL0DyFAMV9P8WrYd1McfGvHY3rxFARvMv2ThyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BU1Da6QIMGDSJDyxfVldWYnU+NRrDsqWn5Im7L0vyJL7tfF7W3zeK9NfDtv79ZsRAskY4JzRyHq276Qat4PJf+GBdXMBVywOqAeSYb7LAgJN871SKRgvP+55kzxjDRMgC3FgeNLYUI208m06FYJ4WA8oIOaAM1UYTnWFSawqoQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P4S8CJnH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/ED3s2LI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ztt5hJbE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LchEQBdE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P4S8CJnH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/ED3s2LI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ztt5hJbE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LchEQBdE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 579713DF6;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aESw7jWzD1PeesfW15EuYsAj1ucwNnxxEOWVPMtM0VA=;
	b=P4S8CJnHMyfEtMf7+Rm2jL3rKZBKZ7aujZkGtAX0V9MwKOTUuXbTfxNMmB55Q3R1o3Yiv/
	MoiDsMaZa/dKABz9LR/AqV1aKwqcV1Sc2fviHfDCoYCQiq1VfOe+hJM7OnepbhDUdOiDOg
	9s5Nt0y7vm6b8QokCQn13TjkClfqEDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aESw7jWzD1PeesfW15EuYsAj1ucwNnxxEOWVPMtM0VA=;
	b=/ED3s2LIOARODDtIERypqBLjQdnfyuCl9og9zCz7i9CiiWldDS17e7qapH3fA0VZr5nJIm
	hVuuHLHx+ojZHfBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aESw7jWzD1PeesfW15EuYsAj1ucwNnxxEOWVPMtM0VA=;
	b=Ztt5hJbE+qUrDyUf/Zm6pTl/MTvujyj1fOZoNTItGaANAyz/34paoJJZgftAPcUoMclTr6
	osj2FZeAyECWxZ4jEyeMb/32lSNq3wNIoVqsX7ywBimiK48F0n6eluENmP8OcEMCROIDwg
	RqGwxyDPAk1QpvLAEwnI3y2XIeC3L3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aESw7jWzD1PeesfW15EuYsAj1ucwNnxxEOWVPMtM0VA=;
	b=LchEQBdEqkI3g77GdoCEgggfEke1jWVF56mzjfqeayvfXwum428NTVOVi7Y0/RmWMRTYFG
	hhDbvV9GrRXN22Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A15E77A00;
	Wed,  5 Aug 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EKw0BTtAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 23/31] ASoC: wm2000: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:24 +0200
Message-ID: <20260805135247.670693-24-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm2000.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 897b0acac5f3..36ca86a7306b 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -796,7 +796,6 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 	struct wm2000_priv *wm2000;
 	struct wm2000_platform_data *pdata;
 	const char *filename;
-	const struct firmware *fw = NULL;
 	int ret, i;
 	unsigned int reg;
 	u16 id;
@@ -814,7 +813,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(wm2000->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		goto out;
+		return ret;
 	}
 
 	for (i = 0; i < WM2000_NUM_SUPPLIES; i++)
@@ -876,6 +875,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 			filename = pdata->download_file;
 	}
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, filename, &i2c->dev);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to acquire ANC data: %d\n", ret);
@@ -908,9 +908,6 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 
 err_supplies:
 	regulator_bulk_disable(WM2000_NUM_SUPPLIES, wm2000->supplies);
-
-out:
-	release_firmware(fw);
 	return ret;
 }
 
-- 
2.55.0

