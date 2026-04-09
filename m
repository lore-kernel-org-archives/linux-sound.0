Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6D438F93B
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745459; cv=none; b=SsICIDsD7H/3GJcxeK1eLhM3uhowQ+4Pl9mz/yhKislu23uSFevE3ePv4HPjMq0kcoE4r2IKvsXLgsOg66XCRp96MQQwfbzQ4PSxz3FD/LyR2If8RV/5h8ApRj0EZ2yKLRe8ykFIIiaKXW48sn4phhJ5XDZ/t37quhNvcEHz4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745459; c=relaxed/simple;
	bh=GtPvGYEJJmfuEHBXj+nWsxUVU6RA/QpRMnc649cMHDw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tBZgyu6Q9cbqT2bpXTmBLSmv1tI8XcjYT6msBTAzfVZHMrN66/RAHjMmy5lH6eleqZvZ+6p+OneeW89FeylYN98fDYNNURezzvxikz2/AkEz7RRRBiX6yNhAlCx4UPjxh+ZIDrdlSfyXmKZpnQ7MR5qolO8WFYKdhKUc6/w4nPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=widGGQA/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SnCnMnAP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=widGGQA/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SnCnMnAP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="widGGQA/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SnCnMnAP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="widGGQA/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SnCnMnAP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A84375BD28;
	Thu,  9 Apr 2026 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8T622RgZuRvJluCzkhfrU26PrYDU02Hz/Uj17DT6nuo=;
	b=widGGQA/IqoWGa4iqJS8JtaJIygSo5FmpxXgadvIOEgnZ2oABJ9Q4AMImaBZZ6xjFflTsX
	mIDWuH4ZMWtZPmSiAg1w5vL37Bq2SBVsbcEN7yoT2lKknrN9fmNkfQffSgtqjWEYem1zal
	BAQHUY/DtlHbaA/1T8OGipyESHY0nFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8T622RgZuRvJluCzkhfrU26PrYDU02Hz/Uj17DT6nuo=;
	b=SnCnMnAP8PM2X/ekn0X1i6RCpFNDIPTKb/hhIvklHOWYVRGKDHxV3ELg5TRzjJ8BX4j2Cn
	BNXk3ZVlJzJA84AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8T622RgZuRvJluCzkhfrU26PrYDU02Hz/Uj17DT6nuo=;
	b=widGGQA/IqoWGa4iqJS8JtaJIygSo5FmpxXgadvIOEgnZ2oABJ9Q4AMImaBZZ6xjFflTsX
	mIDWuH4ZMWtZPmSiAg1w5vL37Bq2SBVsbcEN7yoT2lKknrN9fmNkfQffSgtqjWEYem1zal
	BAQHUY/DtlHbaA/1T8OGipyESHY0nFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8T622RgZuRvJluCzkhfrU26PrYDU02Hz/Uj17DT6nuo=;
	b=SnCnMnAP8PM2X/ekn0X1i6RCpFNDIPTKb/hhIvklHOWYVRGKDHxV3ELg5TRzjJ8BX4j2Cn
	BNXk3ZVlJzJA84AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 895054A0B3;
	Thu,  9 Apr 2026 14:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2h00ILC512lUCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 14:37:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/alc269: Drop superfluous GPIO write at resume
Date: Thu,  9 Apr 2026 16:37:29 +0200
Message-ID: <20260409143735.1412134-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

alc269_resume() has an extra code to write GPIO data, but this is
basically already done in the standard alc_init(), hence it's
superfluous.  Let's drop the code.

Since all external callers of alc_write_gpio_data() are gone after
this, fold the only usage of alc_write_gpio_data() into the caller and
drop the export as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c  |  7 -------
 sound/hda/codecs/realtek/realtek.c | 12 ++----------
 sound/hda/codecs/realtek/realtek.h |  1 -
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 9a799919e0c8..0a5eadec3ef6 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1004,13 +1004,6 @@ static int alc269_resume(struct hda_codec *codec)
 	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 
-	/* on some machine, the BIOS will clear the codec gpio data when enter
-	 * suspend, and won't restore the data after resume, so we restore it
-	 * in the driver.
-	 */
-	if (spec->gpio_data)
-		alc_write_gpio_data(codec);
-
 	if (spec->has_alc5505_dsp)
 		alc5505_dsp_resume(codec);
 
diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index d9b2f1993eaf..db365a746b1a 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -99,15 +99,6 @@ void alc_setup_gpio(struct hda_codec *codec, unsigned int mask)
 }
 EXPORT_SYMBOL_NS_GPL(alc_setup_gpio, "SND_HDA_CODEC_REALTEK");
 
-void alc_write_gpio_data(struct hda_codec *codec)
-{
-	struct alc_spec *spec = codec->spec;
-
-	snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
-			    spec->gpio_data);
-}
-EXPORT_SYMBOL_NS_GPL(alc_write_gpio_data, "SND_HDA_CODEC_REALTEK");
-
 void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
 			  bool on)
 {
@@ -119,7 +110,8 @@ void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
 	else
 		spec->gpio_data &= ~mask;
 	if (oldval != spec->gpio_data)
-		alc_write_gpio_data(codec);
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
+				    spec->gpio_data);
 }
 EXPORT_SYMBOL_NS_GPL(alc_update_gpio_data, "SND_HDA_CODEC_REALTEK");
 
diff --git a/sound/hda/codecs/realtek/realtek.h b/sound/hda/codecs/realtek/realtek.h
index 2ca15a6c2a08..de95642bb648 100644
--- a/sound/hda/codecs/realtek/realtek.h
+++ b/sound/hda/codecs/realtek/realtek.h
@@ -168,7 +168,6 @@ void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw);
  * GPIO helpers
  */
 void alc_setup_gpio(struct hda_codec *codec, unsigned int mask);
-void alc_write_gpio_data(struct hda_codec *codec);
 void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
 			  bool on);
 
-- 
2.53.0

