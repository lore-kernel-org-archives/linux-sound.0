Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F64D1C3C1F
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737535682; cv=none; b=porUhPJXNP3axTQLi7xcPNNdH8+uGDlUFXHw6t+U+Z/Dg/I0trXnwGAl4480WSs7zgzouPtLSfusAzDUPh8A2FkM0bRawnozKq8Dysn3ocXmWe4t92ZSB7XOYFwEk+x1Bja7UkXkpkXrE/uj/sZTEQLZ4cZSOXtvjZysw2tXUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737535682; c=relaxed/simple;
	bh=w5dGvTo5pKY52xXX0ESzR635ULjeaRFZGJMOuayGeAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VM+POg4I4fbmNRhTzpz9GJp4K7U5Zl6NNqIQE8MQcZ5G0fZ6TA7k89jf+Td9wBLWpRlfODVVU88MCaCQEt/mvTpuYZb0MFcFbRR2oKogVzPJb8wqsGjAu2spz9Wuw6szI9MLxbOaoOPeFwdO97ONVSA1df8Q1H4FEhmxywuZ4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xfDF386v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Oes4h+gB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xfDF386v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Oes4h+gB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xfDF386v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oes4h+gB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xfDF386v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oes4h+gB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97F2021228;
	Wed, 22 Jan 2025 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737535678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gx5vqWAZ1QE0EY2CcrvGj5y1gs7ccDY5Vyb4T+3/uk=;
	b=xfDF386vZEZ3vPEStQcwQd2pV431P7WvMPpKORd/IKBStUiaIgVLoGvI/svOazh8nDNKk6
	r6HN2BMfanuQtf/H/sPHdBGTu/Xuc3iRf5z1ufRicTxoAlkhy916clOid0/GmJlI1U6z1U
	48h3Vqvd2AKQ4x1+TYongRgSkMddzUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737535678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gx5vqWAZ1QE0EY2CcrvGj5y1gs7ccDY5Vyb4T+3/uk=;
	b=Oes4h+gB0grJa1V0Fs9E9TwpzYWVyeteEA++/3VfxlpdZMSDLsUSWU244MiO7RJUCH7wrb
	30e1YBxvcSnhbVCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737535678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gx5vqWAZ1QE0EY2CcrvGj5y1gs7ccDY5Vyb4T+3/uk=;
	b=xfDF386vZEZ3vPEStQcwQd2pV431P7WvMPpKORd/IKBStUiaIgVLoGvI/svOazh8nDNKk6
	r6HN2BMfanuQtf/H/sPHdBGTu/Xuc3iRf5z1ufRicTxoAlkhy916clOid0/GmJlI1U6z1U
	48h3Vqvd2AKQ4x1+TYongRgSkMddzUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737535678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0gx5vqWAZ1QE0EY2CcrvGj5y1gs7ccDY5Vyb4T+3/uk=;
	b=Oes4h+gB0grJa1V0Fs9E9TwpzYWVyeteEA++/3VfxlpdZMSDLsUSWU244MiO7RJUCH7wrb
	30e1YBxvcSnhbVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72CFE136A1;
	Wed, 22 Jan 2025 08:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YpacGr6wkGfhVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jan 2025 08:47:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH] ALSA: hda: tas2781-spi: Fix bogus error handling in tas2781_hda_spi_probe()
Date: Wed, 22 Jan 2025 09:47:55 +0100
Message-ID: <20250122084756.23876-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The error handling in tas2781_hda_spi_probe() has quite a few
problems, as reported by Dan Carpenter.  The code jumps to err label
and calls tas2781_hda_remove(), but this call would rather crash.
In some places, no error code is set properly, and the runtime PM
setup is doubly done.

This patch tries to address those bogus error handling.  Basically we
can return immediately at each error before adding the component.
Also, the error code should be set properly for the unmatched SPI
device name.  And finally, component_add() should be added before
enabling the runtime PM.

Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/ae5fcd48-58ac-49a8-a434-5f779bad0fb7@stanley.mountain
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_spi.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index eba9c3a3b944..a42fa990e7b9 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -1101,7 +1101,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 
 	tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
 	if (!tas_priv)
-		goto err;
+		return -ENOMEM;
 	tas_priv->dev = &spi->dev;
 	tas_hda->priv = tas_priv;
 	tas_priv->regmap = devm_regmap_init_spi(spi, &tasdevice_regmap);
@@ -1109,14 +1109,16 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 		ret = PTR_ERR(tas_priv->regmap);
 		dev_err(tas_priv->dev, "Failed to allocate regmap: %d\n",
 			ret);
-		goto err;
+		return ret;
 	}
 	if (strstr(dev_name(&spi->dev), "TXNW2781")) {
 		device_name = "TXNW2781";
 		tas_priv->save_calibration = tas2781_save_calibration;
 		tas_priv->apply_calibration = tas2781_apply_calib;
 	} else {
-		goto err;
+		dev_err(tas_priv->dev, "Unmatched spi dev %s\n",
+			dev_name(&spi->dev));
+		return -ENODEV;
 	}
 
 	tas_priv->irq = spi->irq;
@@ -1129,6 +1131,12 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 
 	tasdevice_spi_init(tas_priv);
 
+	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
+	if (ret) {
+		dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
+		return ret;
+	}
+
 	pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
 	pm_runtime_use_autosuspend(tas_priv->dev);
 	pm_runtime_mark_last_busy(tas_priv->dev);
@@ -1138,17 +1146,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 
 	pm_runtime_put_autosuspend(tas_priv->dev);
 
-	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
-	if (ret) {
-		dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
-		pm_runtime_disable(tas_priv->dev);
-	}
-
-err:
-	if (ret)
-		tas2781_hda_remove(&spi->dev);
-
-	return ret;
+	return 0;
 }
 
 static void tas2781_hda_spi_remove(struct spi_device *spi)
-- 
2.43.0

