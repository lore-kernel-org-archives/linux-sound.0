Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999703A4F58
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024830; cv=none; b=rNz0doxg+wqFrQ+AfHAnJ5UraYH1iB6nmWAMrtEKnH57ph5uTjW6dyviorEw4Uf/K/w0Je0DrqVtsIeuPeFk8FZqv9KfQRS1sKV2KAOyAzJ3HyPsETy1dIxgz9YRVyuYNgF8mpp3A9KajRELRC651gz83+5pmJPNO9yoURKiOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024830; c=relaxed/simple;
	bh=4I+wM8w6T6oc8taX2tESosEwgsZTnH3Hu2aliippTM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P25qawp2TJm+f21q7NIcirNIVzKUD5x5nbjovcWv5UtaEEVP9yt5up++ZSRancIAvZJQUjJaW3Bs3Sw3Z3ZTkJrUsgMKS566ejMfQzYduqPfMhjzvIG2GFjtkG1uSdAc9DI+kbYk5jqoiov622NwJxthW+Xqd/+rRS/TbzUy0DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AlsEN7qX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aeLhY2rp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RUNUJTOt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EB7nxuca; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AlsEN7qX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aeLhY2rp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUNUJTOt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EB7nxuca"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B0796800D6;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukMEnR67o0s/dI6Ojqq4PhSpr/PTbnMmcoVJ7VfQ9Ak=;
	b=AlsEN7qXb4vvOZdrMdUADyyJQn4/h0F1RYFh9SgVC+ZHY+6uzhRVHwVJpNIbeX23O1r4Dx
	wOdDbTOAQQy2+CAEtP5znsvoYqliPg9FWpnEm7gNrzMFTqWc0UAAJZtwZtoTGmHLgd9ndL
	ifNnYq0eC/G4RY7ZqjBLVOiwdJ4tCcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukMEnR67o0s/dI6Ojqq4PhSpr/PTbnMmcoVJ7VfQ9Ak=;
	b=aeLhY2rp7u54ylDS3v7sWjWTZukDaRxmQ+E8WfYL0j4T/3VlwOH5vXS3Jk1L21DoTwqVt0
	2TP3Kc39CBUJbcCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RUNUJTOt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EB7nxuca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukMEnR67o0s/dI6Ojqq4PhSpr/PTbnMmcoVJ7VfQ9Ak=;
	b=RUNUJTOtCv2lZfjtAP9Ut00OQpSnxd5VE3QiRPrhG2XSBr4CahwyEqcH8/FY3zLDg0e0Vt
	Sqi623Go1WSR8BLdn5A/Un84/iiYmkZzTwM0fPLM4PolrKweoIkaSp5A423H9o5ikQ/Fru
	AiSy+vyWWDiByLudya/DIRe7P4IMbJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukMEnR67o0s/dI6Ojqq4PhSpr/PTbnMmcoVJ7VfQ9Ak=;
	b=EB7nxucab7+Z6r6nX+PSJ5KYMDFv815I8dwlpC2LY0QkvSmN6OXYHdgpZMrFnqbPTQorRW
	HqrR4KHpzfp6BmDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26884779EF;
	Thu,  6 Aug 2026 14:00:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8NHlB2yTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 11/31] ASoC: pcm6240: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:43 +0200
Message-ID: <20260806140006.1412298-12-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,bootlin.com:email,suse.de:email,suse.de:mid,suse.de:dkim];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: B0796800D6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Since the firmware release is cleaned up automatically, we can convert
the mutex call with guard() gracefully, too.

Only the code refactoring, no functional changes.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/pcm6240.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index a2b66eae6ac4..db85ae2f8aed 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -1577,10 +1577,10 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 {
 	struct pcmdevice_priv *pcm_dev = snd_soc_component_get_drvdata(comp);
 	struct i2c_adapter *adap = pcm_dev->client->adapter;
-	const struct firmware *fw_entry = NULL;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	int ret, i, j;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	pcm_dev->component = comp;
 
@@ -1588,7 +1588,7 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 		for (j = 0; j < 2; j++) {
 			ret = pcmdev_gain_ctrl_add(pcm_dev, i, j);
 			if (ret < 0)
-				goto out;
+				return ret;
 		}
 	}
 
@@ -1621,21 +1621,17 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: request %s err = %d\n", __func__,
 			pcm_dev->bin_name, ret);
-		goto out;
+		return ret;
 	}
 
 	ret = pcmdev_regbin_ready(fw_entry, pcm_dev);
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: %s parse err = %d\n", __func__,
 			pcm_dev->bin_name, ret);
-		goto out;
+		return ret;
 	}
-	ret = pcmdev_profile_ctrl_add(pcm_dev);
-out:
-	release_firmware(fw_entry);
 
-	mutex_unlock(&pcm_dev->codec_lock);
-	return ret;
+	return pcmdev_profile_ctrl_add(pcm_dev);
 }
 
 
-- 
2.55.0

