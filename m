Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB547426F
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937997; cv=none; b=JoHr2AphfdaSFQ+j8SZvfd+p9VYty13jDZYWhp9gu4dG3JVeNSnevHnmmvfah+i5esDyAXZ+aDNEkIS3rVKYrIfja11ptrbsUpMkIjwP9BBv2UlMx5/5Zlc4+bmwoNGh5O8fJpvjoRYa3JZH9Z1DEOeUHgAdszRG56BPZK7JRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937997; c=relaxed/simple;
	bh=/4zG1mCZttfS9yXHJrlRKJqVJmwqcRROy5XmN7LtYXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cco2aSxEdozNvX4uVEEOXAa76gb9SmXvuLFEM27CopsUezhVriYD7q/XDJq/uwN6ERunfEEnBlLNctfESHaGKkLQVMRT0XDXI6jx576eEDk71021L7uJJqLiB+IiLKmn3HIlFb3pVvuoxwqVoJDPYcOVWvgIOsNwBfvcKOS+F6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ow18RH6q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UzsJknL6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cjjgq7ga; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PrULrs3O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ow18RH6q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UzsJknL6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cjjgq7ga";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrULrs3O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5434B3DFE;
	Wed,  5 Aug 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NS7snwglNP7epkaVmjyrLTQ+SnmRoqe/5LNJQnISm44=;
	b=ow18RH6qhlomJW05tUxoH1TmYMm5AhTfGe8rak36XplJCqKLbYqg1T87Grk31rbxWyZpAh
	XRECCjPYf5NawwhVK5uR+ZE5VsABqSwEvwlJCzn9ZbzIFL8TIVmsk5QRBZDyfLWqlPOtJV
	7Y/h6QCsHLKnZ0olYF0OIPwiQA8IX5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NS7snwglNP7epkaVmjyrLTQ+SnmRoqe/5LNJQnISm44=;
	b=UzsJknL6xSJtF5YOoa5/SQ9cH/4T7tFZpZmHR2BY3bpEGiU6rMMRGgoH+6GFPiMGMdiw5t
	JuQb1tbpmnWuUiAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NS7snwglNP7epkaVmjyrLTQ+SnmRoqe/5LNJQnISm44=;
	b=cjjgq7gav460J522FNUShqnySJFOb/Z7k+WWFEUB2+CvGWNvZfBOwKWgn2SZljSQi4u7mX
	B5UMYE8FOlGGD2zwP9Q+Ra9xJUBbUA0kE9SYv/acX3IFDpdBvn+Due9O4PWU4//x0DFvG5
	1dzehIL9lLKYuXSPM8irhuOnEQ1AenM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NS7snwglNP7epkaVmjyrLTQ+SnmRoqe/5LNJQnISm44=;
	b=PrULrs3O9W20YYfsj0CrxQUBSG+reZgbVbsSjH56oh80CSAzbkcCk7oTNPV7pc0SGrOpJW
	f38WoTjZxcMWtjBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46A4C779F6;
	Wed,  5 Aug 2026 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0E8REDlAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:14 +0200
Message-ID: <20260805135247.670693-14-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,realtek.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt1320-sdw.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 3a5eebcfefdd..0af4bfc875e5 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1786,7 +1786,6 @@ static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
 static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 {
 	struct sdw_slave *slave = rt1320->sdw_slave;
-	const struct firmware *patch;
 	const char *filename;
 	unsigned int addr, val, min_addr, max_addr;
 	const unsigned char *ptr;
@@ -1815,6 +1814,7 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 	}
 
 	/* load the patch code here */
+	const struct firmware *patch __free(firmware) = NULL;
 	ret = request_firmware(&patch, filename, &slave->dev);
 	if (ret) {
 		dev_err(&slave->dev, "%s: Failed to load %s firmware", __func__, filename);
@@ -1840,17 +1840,15 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 
 				if (addr > max_addr || addr < min_addr) {
 					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
-					goto _exit_;
+					return;
 				}
 				if (val > 0xff) {
 					dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
-					goto _exit_;
+					return;
 				}
 				regmap_write(rt1320->regmap, addr, val);
 			}
 		}
-_exit_:
-		release_firmware(patch);
 	}
 }
 
@@ -1924,7 +1922,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	struct device *dev = &rt1320->sdw_slave->dev;
 	static const char func_tag[] = "FUNC";
 	static const char xu_tag[] = "XU";
-	const struct firmware *rae_fw = NULL;
 	unsigned int fw_offset;
 	unsigned char *fw_data;
 	unsigned char *param_data;
@@ -1960,6 +1957,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
 	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
 
+	const struct firmware *rae_fw __free(firmware) = NULL;
 	request_firmware(&rae_fw, rae_filename, dev);
 	if (rae_fw) {
 
@@ -1977,7 +1975,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			}
 			if (!retry && !(value & 0x40)) {
 				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
-				release_firmware(rae_fw);
 				return -ETIMEDOUT;
 			}
 			break;
@@ -1998,7 +1995,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			}
 			if (!retry && !(value & 0x40)) {
 				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
-				release_firmware(rae_fw);
 				return -ETIMEDOUT;
 			}
 			break;
@@ -2057,7 +2053,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 		}
 
 		regcache_cache_bypass(rt1320->regmap, false);
-		release_firmware(rae_fw);
 
 	} else {
 		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
@@ -2124,7 +2119,6 @@ struct rt1320_dspfwheader {
 	struct rt1320_dspfwheader *fwheader;
 	struct rt1320_imageinfo *ptr_img;
 	struct sdw_bpt_section sec[10];
-	const struct firmware *fw = NULL;
 	unsigned char *fw_data;
 	bool dev_fw_match = false;
 	static const char hdr_sig[] = "AFX";
@@ -2170,6 +2164,7 @@ struct rt1320_dspfwheader {
 		goto _exit_;
 	}
 
+	const struct firmware *fw __free(firmware) = NULL;
 	request_firmware(&fw, filename, dev);
 	if (fw) {
 		fwheader = (struct rt1320_dspfwheader *)fw->data;
@@ -2178,7 +2173,6 @@ struct rt1320_dspfwheader {
 
 		if (fwheader->sync != 0x0a1c5679) {
 			dev_err(dev, "%s: FW sync error\n", __func__);
-			release_firmware(fw);
 			goto _exit_;
 		}
 
@@ -2256,7 +2250,6 @@ struct rt1320_dspfwheader {
 		}
 
 		regcache_cache_bypass(rt1320->regmap, false);
-		release_firmware(fw);
 
 		if (!dev_fw_match) {
 			dev_err(dev, "%s: FW file doesn't match to device\n", __func__);
-- 
2.55.0

