Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF9474266
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937995; cv=none; b=K7TxoSEKc1skzqF37Z/wYtHviwSJ1nkRRjRCQrlcjmPu1C6i6Wno/SoPtiUb/isJ5xTlxMSw4YEFD0dgx++usC0xFHaQcLJimwA2xKblmufMdVvV9XHyR4BpxgJoGXE09Vn+uMiRqj67svEYh6A2LPgrxxIS4hc272lOHm7gUJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937995; c=relaxed/simple;
	bh=014VIVlUweb8WByuc3EfBW7Qukln1yt6o9jx4loicH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GswUkm00XJo3VBbLXfiyhsRX5DcTqcTnMad41kQ/7vVYSoXIw43GJC73yddtKNqVoS19EOmfSxyXlsIf6n8SPfAvPIJdQLVULYFKDRwhGNIBgSRCSYq/HpU2z+WgQUNxHbPSpayJVIC0XcjqHsttBgdCAS4xEh3S31fq+rb6W8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aMQCC5rN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XaC87IKu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bBgW0JsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A7zTz3R0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aMQCC5rN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XaC87IKu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bBgW0JsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A7zTz3R0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 080347F0AE;
	Wed,  5 Aug 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=aMQCC5rNY0xhCETTj0yZnP7UR/8eQthx9DHU5KHOT7J/LkunmJUJavGAeZfELw8NDGIIh9
	8MvO8unFapLwyOONLVjldhAQrqGPlHEdkn7WVnBRqEzHZ+X+WxLN+tlRzbkdrDTIrJmP3l
	ag1xkMrgPa3KSbDK6KawrZbl5JK/A3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=XaC87IKuY0c/irsmKpBid+GQ+aKj8iAfAQTfYUiB+7ZcehTuCZFtG7fkd293QrVWDEuTJU
	8ovT5P0ENd6fUvCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=bBgW0JsSDrADRumxabROkhjQlehowSR0+OLNmg3BGYwUjdCZ3IsY28b3LuVMNJg6X7ecuI
	kvN8qG4CVKXNvV1ZdpXDH1/AjrYxv9iE+nDDVpI+4IoU/WG10BFYG2KnJNWqo7Kg/PEiC+
	9uagGtBlpDTfyieDAroTg1A/hlijeDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=A7zTz3R05qUlf5IqcO5NBs18ci1CQfxZGx0Oo+tOzuyq5L50IiCj/1u+nLfZRUrZYYPlWA
	nvKX+k/VC0Zh1jBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5273779F2;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aGUfJzhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 09/31] ASoC: max98390: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:10 +0200
Message-ID: <20260805135247.670693-10-tiwai@suse.de>
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
 sound/soc/codecs/max98390.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 66309e87fdbd..2295fc057c71 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -788,7 +788,6 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	const char *vendor, *product;
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
-	const struct firmware *fw;
 	char *dsm_param;
 
 	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
@@ -805,6 +804,8 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 		snprintf(filename, sizeof(filename), "%s",
 			max98390->dsm_param_name);
 	}
+
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, filename, component->dev);
 	if (ret) {
 		ret = request_firmware(&fw, "dsm_param.bin", component->dev);
@@ -812,7 +813,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 			ret = request_firmware(&fw, "dsmparam.bin",
 				component->dev);
 			if (ret)
-				goto err;
+				return ret;
 		}
 	}
 
@@ -822,8 +823,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
-		ret = -EINVAL;
-		goto err_alloc;
+		return -EINVAL;
 	}
 	dsm_param = (char *)fw->data;
 	param_start_addr = (dsm_param[0] & 0xff) | (dsm_param[1] & 0xff) << 8;
@@ -833,8 +833,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 		fw->size < param_size + MAX98390_DSM_PAYLOAD_OFFSET) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
-		ret = -EINVAL;
-		goto err_alloc;
+		return -EINVAL;
 	}
 	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
 	dsm_param += MAX98390_DSM_PAYLOAD_OFFSET;
@@ -842,10 +841,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 		dsm_param, param_size);
 	regmap_write(max98390->regmap, MAX98390_R23E1_DSP_GLOBAL_EN, 0x01);
 
-err_alloc:
-	release_firmware(fw);
-err:
-	return ret;
+	return 0;
 }
 
 static void max98390_init_regs(struct snd_soc_component *component)
-- 
2.55.0

