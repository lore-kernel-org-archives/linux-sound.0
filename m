Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A333ADAC
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024830; cv=none; b=Gp0uOq8K0VcnAa5Nm9EKuGKbglakxU5axL9g0V5m9VVLpd3atTEPZILbPXjnmptGXARrpxoF6JEW7m199KpE06HNFbVb01qK7c92cqFnGUbKEo0sfmazX4WELVHIuqZnNiEOD8vgpEVUmcAM+dVwWOblhEl/aTSVgtMYCB1rKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024830; c=relaxed/simple;
	bh=014VIVlUweb8WByuc3EfBW7Qukln1yt6o9jx4loicH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zm3XHUUNQBCxNkqCNuIHvk8qMoEdv0uIJEtvpvhfKGtL6S8PF0qxhd7w/cJ2+DWyKR6cIJ0YvyK2wpdeVkXuvlAZwfVNNU3cYsdph7JaPsgZ9eR9WvXwoliVmeICjS2mVe7OmjL50pZdcAAoYGm1qeNPBa8hQ6ZExIW1s+XktNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LEdP5MR3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QtPLyeY6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VljRUW9G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1QCgVIU9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LEdP5MR3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QtPLyeY6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VljRUW9G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1QCgVIU9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8590E3E30;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=LEdP5MR3Mjmj3G/nlwkz47clUvqnwewM+GrLcWYo+3UC09KoCnkYOuwKJEgq84GYnVW8Gx
	guHCOQ14f1cwYP3lZAcYdTlfrm9a59N5vc8C0UkmafqgWRYUhULeIea4efkQc3WoyVwky5
	LRRVnS0bCxawAKxFDR41XedEitkVd54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=QtPLyeY64ByExov6Bny+g0xdzVq6k1RNYnpZJ7I4f1yKbQ6tw6sUdvR/RnZ9FA9shcF5FJ
	W90ntFMlzSCjuMCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VljRUW9G;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1QCgVIU9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=VljRUW9GpAeZ41JRQjc9CArjKgd4vkbMPotnq7tjAYYSWsnfEntdLD5ziXcpBQmbaNsUCN
	zd2cstZtyK9pfO4rbBe9qnfALftzq4fS0zueEBZtRXcTadNS5DwG7kDwPWRtCubI4rpEI+
	f1rupw4eDe2m51cjMp0Yr9UjrHxgfew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVG9gMSB15PR+Z+MPLJCj5kew9dO3fghcT0SRrZekx0=;
	b=1QCgVIU9vboeClahqIAuwQVxsUyoJJbQrhl4AKfKThG1HfV0TIYxR+B9iDUVjRYP45eIaE
	ad1xCSMm1xTKrqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91D0E779ED;
	Thu,  6 Aug 2026 14:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IGeYIWuTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 09/31] ASoC: max98390: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:41 +0200
Message-ID: <20260806140006.1412298-10-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8590E3E30
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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

