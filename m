Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821A28150F
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024837; cv=none; b=PBfRuxQ22Jtgb++bVczj0dMFMtoYP1XCv/9PUqqEkZrVKCeTwm3yvnCbdVhT+DVQcKbbSbY2/1iQKvvGWvzVQxf8NCM8m5ffOsc5SFWVmKS6Ajppr+hauFVEXaD1BapGxRxOqNJl1yOt2supPOTX4YJGJIYxwgTVtN+Cq7GyMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024837; c=relaxed/simple;
	bh=GYxBl0/XhEc2Al397BN/c15Vpc9rFQGP5S3f0AZmrEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gczj66pSthtG6k8N+MibEFUzlqxaIbxC7bxRZKzjdgAdwWB3Wbc45CyPDJ9DrelM1s8c/sRoL4XkVs/hCJwICNnTdKPBb3Ue2dPqkaWyrHuhJWf/FFs3Ugq0eCt0NnZFSiDH6OJZ6YcPX5749bqrGcR3H9N/4U0vUYj8uG7+tjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XKzQGpkR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LntH3rOA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oQzs9C6J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=coMNKyEe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XKzQGpkR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LntH3rOA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oQzs9C6J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="coMNKyEe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD1D03E1B;
	Thu,  6 Aug 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=XKzQGpkRVLd1P0WzkrvpW9kwsA4jV5S8ebJTOzPBovSMCtIwFc8UvW69QXJhStoaUNRzKl
	fUrljeqNejmeUTsts7BpOO0+WBeqrT1N6wvij79aaGzJDE9HXfEzUQVnBwhXPFMxbu+0y/
	RzNnAUl5kYsIt1fUIJy+vGiRpYyIJ2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=LntH3rOAPcegWWNNnW3EoR3ZhN4/DbfQ+FISZ+iYGTcUy1d5ttBVZU7QtYWEssPopa70q3
	CSAz1dhYsdGx2RBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=oQzs9C6J7DFT6VGUOa9VQrRGDWMI/vxaZWABbFzUV10bUhvuti8VYq5Qj50w64qE4Dx0Ox
	zEAzkjIRIOVcZwHAvUltg5QlZTbUd9F1zGWH3hMa85IRumfdfIIkoBULU13HUI6M54Fy46
	OHmmvF/z08KQkEEEm4snL/DUSIRaijg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMcv5V5U3fMRzx1WM3mn6CRmpveaFUPEpcEQIR+HDE=;
	b=coMNKyEesj5kWHFpoe66T1dr13HSJ3fQGpcoZjjXGD18gBJ4TWbH7Rzs3vZM6r0NdV0z74
	bUVUSN5+7PH80wBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CF4E779FB;
	Thu,  6 Aug 2026 14:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qJA8DW2TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v2 16/31] ASoC: rt722-sdca: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:48 +0200
Message-ID: <20260806140006.1412298-17-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,realtek.com:email,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

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

