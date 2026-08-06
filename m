Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3753B7753
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024830; cv=none; b=Odo9xvjyCA4Kzt52aZWha2AQ6W1rwFKfRTWxv5NfOIh4cOLazp0Ah4DFLbjJ5FFVV3dPbhT/KE3+/gC4cKaWSmjNgk9wUI18kHLOal2WiNpEu1gbZBMgwF1rwgvpovwRL+5IzBCma9re9T72ndXEy7YrbcQrI8sENTFukUoR+Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024830; c=relaxed/simple;
	bh=JZWFVyPHqrAHy6hIioVBdZjfThfcLiNYWHXWf0bc2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZb+42JHdGUNyITxp5QWnbkxTPMEmcKLKnvmkn7rfBAQBLhRVdmJagNsIu7Lc8VXnN+A6efOzljpMlcABAXdN/OYOLHF54IUo3l+X7KS0Thcsf/pNeTAZsGDPBVRelOWOC1a6biQF8Xqe80ShKyfmJfrJWgGiP4dcFK0m8v71zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tW0gOVId; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4GGLhjk/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2ARxyVmt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ub8FRSeA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tW0gOVId";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4GGLhjk/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2ARxyVmt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ub8FRSeA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9FD43E32;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=tW0gOVIdlGQWh+QmjVVeLxQ55LI7XVbBG2BPS479/w+f3ZETU6wppe9/lWyDgK+0PyfJky
	9DiP/lgvXU516Hvj+KETZagXw9/IYqWKpCNsnK/jEtYys+Ewp+sZr5N8Ynu6i4BFHs9yIk
	lYOElj2ixpSEIhUygugzT7u+Hj6D4OY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=4GGLhjk/nm8JveynohE0ebYIJoN8DzhOW5jvo+NS2/YnOkeMh/qoUTHGigHiLo88K54M36
	y2x+7CpWrctsBxAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=2ARxyVmt32znN1lSq9JtI//+jaCZSOigwlN6q9uy+2kkj0E94D/sgkZOB/o9QKKcoRszj9
	SGLCgmzQeY5SpwPIaAejU7NMlvxhvfDXw7c/s3WUc8e8QjZAFBU5Rwesu2CCZPDhsowARi
	G/i1V87hziNTmNMGy4hpLjHc6fr8szA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=ub8FRSeAsIcBlGVh/OBKguTNzZI4x8iIH9Qesoe0tgyK/qyM4VhFdgdQPpGlJHB5LBmT1q
	zdlHvAFMG7aaoxBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3056779EE;
	Thu,  6 Aug 2026 14:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WIp9MWuTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 10/31] ASoC: ntpfw: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:42 +0200
Message-ID: <20260806140006.1412298-11-tiwai@suse.de>
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
 sound/soc/codecs/ntpfw.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/ntpfw.c b/sound/soc/codecs/ntpfw.c
index 5ced2e966ab7..b6443e24ae8e 100644
--- a/sound/soc/codecs/ntpfw.c
+++ b/sound/soc/codecs/ntpfw.c
@@ -89,7 +89,7 @@ int ntpfw_load(struct i2c_client *i2c, const char *name, u32 magic)
 {
 	struct device *dev = &i2c->dev;
 	const struct ntpfw_chunk *chunk;
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	const u8 *data;
 	size_t leftover;
 	int ret;
@@ -101,10 +101,8 @@ int ntpfw_load(struct i2c_client *i2c, const char *name, u32 magic)
 		return ret;
 	}
 
-	if (!ntpfw_verify(dev, fw->data, fw->size, magic)) {
-		ret = -EINVAL;
-		goto done;
-	}
+	if (!ntpfw_verify(dev, fw->data, fw->size, magic))
+		return -EINVAL;
 
 	data = fw->data + sizeof(struct ntpfw_header);
 	leftover = fw->size - sizeof(struct ntpfw_header);
@@ -112,23 +110,18 @@ int ntpfw_load(struct i2c_client *i2c, const char *name, u32 magic)
 	while (leftover) {
 		chunk = (struct ntpfw_chunk *)data;
 
-		if (!ntpfw_verify_chunk(dev, chunk, leftover)) {
-			ret = -EINVAL;
-			goto done;
-		}
+		if (!ntpfw_verify_chunk(dev, chunk, leftover))
+			return -EINVAL;
 
 		ret = ntpfw_send_chunk(i2c, chunk);
 		if (ret)
-			goto done;
+			return ret;
 
 		data += be16_to_cpu(chunk->length) + sizeof(*chunk);
 		leftover -= be16_to_cpu(chunk->length) + sizeof(*chunk);
 	}
 
-done:
-	release_firmware(fw);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(ntpfw_load);
 
-- 
2.55.0

