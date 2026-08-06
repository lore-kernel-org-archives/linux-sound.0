Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CF3D9DCD
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024842; cv=none; b=ObWMeHIjkzf+BcABBXtPAH3hggJt4O++ty5JNl869RfUK5LFL5beJhVoUVbVCAifngZnPgBIRA8mP5WgCc9SOIcHk/k4z+Hl0nQW/DFjJfonhCIZLBXCwTxmHuTH5vEsrsXPPQDjgVX80X40Hkiid3aJSeY97U8GmtAxZbKdOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024842; c=relaxed/simple;
	bh=fBqmpqueiSEZMk0botqeE5radKee7MUlb/8lqw3nC6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i259OVhC7NGGCTmA0iMlBPuHSxj2ujYHCBIY7mDZF5i69NuS7BCirabOCYIQ9C71KpVgXvCSskg6uR+b74HG0dsgrwO2q5xMZb+uIVrQK+TNtE/kJKd6wHFV/4TOcZj+hyx4Mw6vMhDl3MeYfX11TE0LP0cDtI3xnKtKfS1LlsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IwMhpvQ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9tdM8wCm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1u7LpRE4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GLEEeHFd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IwMhpvQ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9tdM8wCm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1u7LpRE4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GLEEeHFd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D9A53E2B;
	Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn9t7Lwg7cUQHynN9inrccnyfeK6T0aRxoKtJqwjnwU=;
	b=IwMhpvQ7rTL95WFbv54ynlxWltvm2VgMfk3Q6laWVc0gd1ed/YQWWq8QKbUTsps7m1temy
	/U6kO/9Z3wY6oczVWa3msgxZ4T2NE9qbMRWGLPxbw8eAUH4iNIL0mRgyxIETmrj3pXVtQc
	bZ3d29diH2SRqewpt00oDW/9piCGJzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn9t7Lwg7cUQHynN9inrccnyfeK6T0aRxoKtJqwjnwU=;
	b=9tdM8wCmmrcLFMb8Mr3tgH2dXOTetplTH36UciUAyGK05wtoNfenXe7oy+3sb6MZLMEAwV
	aRJyARnSvuF01RCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1u7LpRE4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GLEEeHFd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn9t7Lwg7cUQHynN9inrccnyfeK6T0aRxoKtJqwjnwU=;
	b=1u7LpRE4cergyshjVNtk4a3vce3GLNoKIRRnt7yFyV8KOgYjrp1cBei1+zq0xDjtNcoE0m
	tc05JZ201w0xdy4AuvyEG0gpdjJkJvRqn1FeoB6HTgDZtLuQZbY17/TkGMxM4BbyuJAeKP
	VrYaqXJTOvrOo+6cW7xseBGdYXwAq84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn9t7Lwg7cUQHynN9inrccnyfeK6T0aRxoKtJqwjnwU=;
	b=GLEEeHFdupSTNjek8x34JU/5HIKRQvrVoFhI7vyUrtX+Zdnyld9sXtcDIonIBfjh20NVIG
	cdaVcFe/B7zK7KDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FD0577A27;
	Thu,  6 Aug 2026 14:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eMQFDnCTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v2 28/31] ASoC: qcom: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 16:00:00 +0200
Message-ID: <20260806140006.1412298-29-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Rspamd-Queue-Id: 0D9A53E2B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/qdsp6/topology.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 54661bcb006c..faafbc5c0ad0 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1416,7 +1416,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 	struct device *dev = component->dev;
-	const struct firmware *fw;
 	int ret;
 
 	/* Inline with Qualcomm UCM configs and linux-firmware path */
@@ -1426,6 +1425,7 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	if (!tplg_fw_name)
 		return -ENOMEM;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
 		dev_err(dev, "tplg firmware loading %s failed %d\n", tplg_fw_name, ret);
@@ -1438,8 +1438,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 			dev_err(dev, "tplg component load failed: %d\n", ret);
 	}
 
-	release_firmware(fw);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(audioreach_tplg_init);
-- 
2.55.0

