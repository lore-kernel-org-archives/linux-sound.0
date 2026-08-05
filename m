Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B8471412
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938007; cv=none; b=DnXN6DspXNO8+ZjqrHpXELb4FRbtaHaD0d3ocx3F6TDYVoo+A4rH/615IuS7n2CZ26eKPxK6Mn+9UO+pHrPhIVGV9qM46stbQ5UYyikfIuQr2jM0un2f/dJduypDzcTU76kzSmQMu2+6xLOb05MhJYbckL6vnwpRJFSQRWtG/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938007; c=relaxed/simple;
	bh=h5Gm7xMICmHMltLrXzzLL8n5q9eqLL2jFJEw5ChpalY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NItRFVlnv+qaiKz1Bsu36RrJY/HpayMgfPUzzVnO7wbIiXLQ3sPiDPR/I7swo6eIBn718N4jd/vfL/MYmShGLQsL3PS7yHKmU4Kgq9TYi+Ac4A3ZjNdP7Kd4KSHt8e8AO/5t5uotz71gZxOAdbdCSBnLIV8F9tfNzx/BoIxP6ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0QZrXSxd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3uEsgyhK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z7lJGnLn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hOHLudJF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0QZrXSxd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3uEsgyhK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z7lJGnLn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hOHLudJF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 964967F107;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdTAjZFYof1k0h+XldDCIovAMTmDH1MTwshPzuHeGvM=;
	b=0QZrXSxdwxeewDv30c5MdJEqe9mT5gowUZfthF1qmJss651C+cgBRcEaq4BrtKGrA3cfLV
	y9oggPofpM9b8Hd6pgSXMX3DON99snd4fbjOm8ZHFgSgGJ4fbxEUVqAxZj6/r4sUXSdLkZ
	e6tk87iydCNRIKJVrUZwmK3/e3W/MtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdTAjZFYof1k0h+XldDCIovAMTmDH1MTwshPzuHeGvM=;
	b=3uEsgyhKjx2Ajl6t2m48eYdlp1eOf4kcnDrAzEgCaqOwlRgV77PiSpuNyecvpFaQR2EcwJ
	gvPfbgFEAN1b82BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z7lJGnLn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hOHLudJF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdTAjZFYof1k0h+XldDCIovAMTmDH1MTwshPzuHeGvM=;
	b=z7lJGnLnfjcFHqyjjv0bAjKbGXsoDRRxHPh2lkBjjG1VoPeHY5f5TlzyVH6UBAP6n3R7k/
	J2SWrCr0oxDKoyGk/4AFps0xRtEmbFnU7iY4NmMcvSir7mV5J997a2VWmzmksueGtjspfC
	tAlBO4catj7WJNdY8yZEtRZFbXLb2p0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdTAjZFYof1k0h+XldDCIovAMTmDH1MTwshPzuHeGvM=;
	b=hOHLudJFetonVejrAwAoAK83ps2Dsr56wKvdfiSJnNSdd9iu3KcFzpNEMNYkRs4hUyslM4
	fITGml+UcqML/JBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03D4B77A05;
	Wed,  5 Aug 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YARlOztAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 28/31] ASoC: qcom: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:29 +0200
Message-ID: <20260805135247.670693-29-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 964967F107
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/qdsp6/topology.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 1f69fba6de26..42f7bb8e88fe 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1313,7 +1313,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 	struct device *dev = component->dev;
-	const struct firmware *fw;
 	int ret;
 
 	/* Inline with Qualcomm UCM configs and linux-firmware path */
@@ -1323,6 +1322,7 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	if (!tplg_fw_name)
 		return -ENOMEM;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
 		dev_err(dev, "tplg firmware loading %s failed %d\n", tplg_fw_name, ret);
@@ -1335,8 +1335,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 			dev_err(dev, "tplg component load failed: %d\n", ret);
 	}
 
-	release_firmware(fw);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(audioreach_tplg_init);
-- 
2.55.0

