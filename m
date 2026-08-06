Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18453B8BDB
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024830; cv=none; b=bzUUANeuiG7UHI8iuOP3tthnkGVpXMsCHyBnipiUj42kbKaOQ5WNQGbjaVe8RCk+ZWzg2HHmY9pLTzp2A9W4UPy2j/h3XZoLYjcnn03+mLZaReX4IEt3xOU+balZ2uZdE7l7MjIkfig2KtAl1YRRP6iTXKuB+zDODjB3cxhr6YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024830; c=relaxed/simple;
	bh=/HHPRj/GATptVWv68UaccJBnD9W/fjlefmswCOHbGdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPoAbsiD9txj7ia0X2n2Vf9CWAx2w91vbBHoz7RVeT4ietLhG3xv+CuibXgEOAjTC24rqw2jFgf4Lqd3ek4yH4bbOqzjo5i+KG27iNRZLYpXiGyJQ5eyrhedOZFtUD9owIHCRwhy1yFNNi6saTPG78GEQQnusm3uapFzig4z0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M00+V7V7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z3Pu2+N8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k2Bw7Wnj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M67A8afL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M00+V7V7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z3Pu2+N8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k2Bw7Wnj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M67A8afL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D478880038;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojHQBK1NBb3I0HvY4zZAsdxEaw0NRrT97l9Df54b530=;
	b=M00+V7V75aV0QKwHD1GNFqKosTp//OebTYtluV0970jyk+qZdABEBkvroeaYnnFVvFgLeD
	n9vcwOGCmWup7WPohFBDl+NdSlGbNcGUWS0j5FYUwWxMG35p7uI4vIMbMvZ1oypT+5iKSp
	ueu1bmNwzKb39RBi5pzas897ff1bWVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojHQBK1NBb3I0HvY4zZAsdxEaw0NRrT97l9Df54b530=;
	b=Z3Pu2+N8lvJJbOJkuMPP+XeeppE58TJ+TAkHKFx25ALr17cYaMNx30kor8Qnloa2E7f2/6
	67V/Fu+sa8SgKAAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k2Bw7Wnj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M67A8afL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojHQBK1NBb3I0HvY4zZAsdxEaw0NRrT97l9Df54b530=;
	b=k2Bw7WnjBeXzEc5NExdHhxHCnTbmdZE8kiMLyD42jMQpQfpEYYDgmhCMGjdW+nguqi+3n6
	eZC6vAmSrS8ER7BmvRISZKPrmwL7MSLszQlyjY1/FJSlDvl6pnry5xoUpYW9PF1hMKJNpR
	9zOv84wfz76Ad93DX6oyhGXCi0Bixoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojHQBK1NBb3I0HvY4zZAsdxEaw0NRrT97l9Df54b530=;
	b=M67A8afLt+W/MKurdj0d+g870xkbNfaOzuoIDZ1uxUTAEW9pn8z1RIHD+E5C9R3zLcBe65
	x5H1ZKzwQ9UukZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C83C779F2;
	Thu,  6 Aug 2026 14:00:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gHkKFWyTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 12/31] ASoC: peb2466: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:44 +0200
Message-ID: <20260806140006.1412298-13-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
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
X-Rspamd-Queue-Id: D478880038
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/peb2466.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 5a1ed02abb84..f1ded68c2d75 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1538,17 +1538,14 @@ static int peb2466_fw_parse(struct snd_soc_component *component,
 
 static int peb2466_load_coeffs(struct snd_soc_component *component, const char *fw_name)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw, fw_name, component->dev);
 	if (ret)
 		return ret;
 
-	ret = peb2466_fw_parse(component, fw->data, fw->size);
-	release_firmware(fw);
-
-	return ret;
+	return peb2466_fw_parse(component, fw->data, fw->size);
 }
 
 static int peb2466_component_probe(struct snd_soc_component *component)
-- 
2.55.0

