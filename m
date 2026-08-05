Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0114756A0
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938005; cv=none; b=E6oFB4v2Sh5mG6/K6ICLx3fbFNqEEOETzGIy5kIw9sjhpA6R6FCsHxhzSDLn3b5Mq8Y5acsAo1wN6vVwvedo9qv9HQZJ03+U4ZaYD28Or/kV8lckIxm2t7nxWQBdaDKhE2I3Xv/ZfoRo7yc4jdH7T65+Rs3V9++1rLLST0Xz5VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938005; c=relaxed/simple;
	bh=GYxBl0/XhEc2Al397BN/c15Vpc9rFQGP5S3f0AZmrEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+UjNmD8gV3Iswr5yoMu37y+FuQyRVb0u/oDt80KP7ZADqXiBw5w0IXFsCoNCOsEs14Lh8BPY1bBgh6vCHmj82zp9Vy5zz7vFJvzACCUg82zY8ZgfDCaIy18t9sH6sI7u4djRQ6Q/nSmEcTNaEp41lv1EIJPk2/JunQS36kYsm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eb9m4JnI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LNT3rIgk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPexEoGN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ff35Dtiv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eb9m4JnI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LNT3rIgk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPexEoGN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ff35Dtiv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39CA57F0C8;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=Eb9m4JnI/gr1+Z9HIS15GjHHyH/2xL1zNcP6zz9jVp667Nw+a/P4XMEXOIDD7vY6vYCDXM
	B+Tm6LrovyO3/bsYdO82GBZ5bPyDpzZaxcnWqGazhgk+M515sbKftb0y7NAP9vKAOSeq97
	us8iO7KRuIUD2gp7PeLc+nOc75oLYII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=LNT3rIgknbJZ5J/abs/SMJ73hj4yqNI9eq/EsDdnA5EVym8Qzum7QcKZj6zEyz/kpvigJn
	J8xC1flmJ5z/rwDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=BPexEoGNeaIyS2MrLRSfLM3QGcqUV9GidbLQ8rcrsPzNLtoGw7mpdGZzsC/t0Zlb85w396
	VbEMu3//J3faxCaqZepZhEPWcoIFbpe0oxp9Y41gkFSzGQsn3kiBaUnHAAAJ0Hy5KAeOsb
	ldtxxNDKbfRdniL8w7Jr4Z1Iee95S2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=Ff35Dtiv9bdVQZROnQHp2/tENUYuDm3uxH+Ul+t3QsjsEMF9QFRwjFnV3dWvfomDYw6+1B
	MmcOudH/FJcWBHAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C344B779F9;
	Wed,  5 Aug 2026 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qJuDLjlAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 16/31] ASoC: rt722-sdca: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:17 +0200
Message-ID: <20260805135247.670693-17-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,realtek.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup, as well as the firmware file name being released with
__free(kfree).

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt722-sdca.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 27bb0eb1ece7..4cbe9e909585 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -352,8 +352,6 @@ static int rt722_cae_load(struct rt722_sdca_priv *rt722)
 	static const char func_tag[] = "FUNC";
 	static const char xu_tag[] = "XU";
 	const char *dmi_vendor, *dmi_product, *dmi_sku;
-	char *cae_filename;
-	const struct firmware *cae_fw = NULL;
 	unsigned int cae_st_spk, cae_st_hp, cae_st_mic;
 	unsigned int func, value;
 	unsigned int combined_val;
@@ -385,7 +383,8 @@ static int rt722_cae_load(struct rt722_sdca_priv *rt722)
 	space = strchr(dmi_sku, ' ');
 	s_len = space ? space - dmi_sku : strlen(dmi_sku);
 
-	cae_filename = kasprintf(GFP_KERNEL,
+	char *cae_filename __free(kfree) =
+		kasprintf(GFP_KERNEL,
 				 "realtek/rt722/rt722_RAE_%.*s_%.*s_%.*s.dat",
 				 v_len, dmi_vendor,
 				 p_len, dmi_product,
@@ -399,8 +398,8 @@ static int rt722_cae_load(struct rt722_sdca_priv *rt722)
 	regmap_write(rt722->regmap, RT722_MIC_CAE_PARAM39, 0x5f);
 	usleep_range(50000, 60000);
 
+	const struct firmware *cae_fw __free(firmware) = NULL;
 	request_firmware(&cae_fw, cae_filename, dev);
-	kfree(cae_filename);
 	if (!cae_fw) {
 		dev_err(dev, "%s: Failed to load CAE firmware\n", __func__);
 		return -ENOENT;
@@ -555,7 +554,6 @@ static int rt722_cae_load(struct rt722_sdca_priv *rt722)
 	regcache_cache_bypass(rt722->regmap, false);
 	rt722->cae_update_done = 1;
 	dev_dbg(dev, "%s: CAE FW update done.\n", __func__);
-	release_firmware(cae_fw);
 	return 0;
 
 verify_abort:
@@ -565,7 +563,6 @@ static int rt722_cae_load(struct rt722_sdca_priv *rt722)
 out_release:
 	rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
 			RT722_MISC_CTRL1, 0x8000, 0x0000);
-	release_firmware(cae_fw);
 	dev_err(dev, "%s: CAE FW update aborted (ret=%d).\n", __func__, ret);
 	return ret;
 }
-- 
2.55.0

