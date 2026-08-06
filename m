Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125813B27C9
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024842; cv=none; b=lI6FPnMGgrkEe/d0P6dza0fhtAqkqjPWuni04Cmyuuv8ePGD3LNnqTb0LVkJ3qBovyCuNex5GhrLPhyCvwmFrWdHqCY7D1NooZzH6EtqYbt5RWqDZ5yWu6VIzKsA1GpruhyMoLQ6vVnVrc8dga5VYyyka2AeHyS2Lxma4BDJ1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024842; c=relaxed/simple;
	bh=25USWmJlnb9NCRoXLqoIPspqGqFKLcCMEbGEEwBdhCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/ttNHL40no9w3p1pc6r5nWbymV8fnLJ4HJDqdcIfM+vV8nz/WD5Y8gDae/qnyIPMQXpW1jv7EHl8dNqdXRN3k8ydGr3XpM+gHB+SRLDHtDiOK8QI3o2YYe8vq28SPVFbCbuTA2C0Z5AIgfFkBH6732D3sK6hViIhW5L++zjqfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KHmqw72k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yAdf+5oh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rZhT2vKC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pC/UdNR3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KHmqw72k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yAdf+5oh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rZhT2vKC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pC/UdNR3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 89A613DF8;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=KHmqw72kc5SO1XRoVIZZywoR2yyUDU3VRHBZI+rVRKJAJy30CjxrtRqvmbfAQqgK5iJO7t
	FvbvA01xBijC14uDYeEY4X2hEw9EEGnE+KpMbAHdhIVAq7jXUP0MrpgykOVBrF+GO/8qWc
	XVi3K1BoJZK3j9NydXUC7O1FmLqJcKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=yAdf+5ohykJGeH3jU5/pmAWZRiuCaWKLGgVoiar+w16Pyjq+oie29n+9H4WdAaIUz2VKe1
	/Si3Sfx8wXUs0RDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=rZhT2vKCYS7CRIU1v8okZOx5Ivo0f1Gd2uKcDEfkql9qdjjbejsqmDnU1QzgUDBY8qoF3r
	n8GjcIQbuzz2XsQnzADdk3wmKNq2qkFrEP9dLULxTZe4aBjMcntmMxxruho0yy11v7eZnc
	Wq71tTXyu8UiMa4+n2y7SOEzEVFTpVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=pC/UdNR3YDWE8lbUEdx9RmtHQO014voAluElwFTC7ciBJ5omuRmNCYOjtQL1JRHDW5NOHb
	GA2PbpQyo0O5NmAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8BF577A1D;
	Thu,  6 Aug 2026 14:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OFuHK22TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH v2 18/31] ASoC: sma1307: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:50 +0200
Message-ID: <20260806140006.1412298-19-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Kiseok Jo <kiseok.jo@irondevice.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/sma1307.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index c52fe95b30c6..adb369a29b9d 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1690,7 +1690,7 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 
 static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *file)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int size, offset, num_mode;
 	int ret;
 
@@ -1703,22 +1703,18 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 		return;
 	} else if ((fw->size) < SMA1307_SETTING_HEADER_SIZE) {
 		dev_err(sma1307->dev, "%s: Invalid file\n", __func__);
-		release_firmware(fw);
 		sma1307->set.status = false;
 		return;
 	}
 
 	int *data __free(kfree) = kzalloc(fw->size, GFP_KERNEL);
 	if (!data) {
-		release_firmware(fw);
 		sma1307->set.status = false;
 		return;
 	}
 	size = fw->size >> 2;
 	memcpy(data, fw->data, fw->size);
 
-	release_firmware(fw);
-
 	/* HEADER */
 	sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
 	sma1307->set.checksum = data[sma1307->set.header_size - 2];
-- 
2.55.0

