Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99D472777
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937996; cv=none; b=JE3zWWmzBZA0JP6tuAkjnRETMcQ+pidZ20o0th0ryj8c1S5yNptnTYK0p0XFk/JFt7UHkzvdrXVrfBAGCb0gtGqrlUzDbNwKEH6uU9Y2Jss5PprC+3KZRXYJLvUz4f8rVNOHDv2hY7NWYQvZs8wj7LQH2YHg2T70Ep206PBxPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937996; c=relaxed/simple;
	bh=JZWFVyPHqrAHy6hIioVBdZjfThfcLiNYWHXWf0bc2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9M55bY44txABONguTLxTgDFSmeQLka8YPDVAan5D84/Mmx0pwsFwiB4bF2jFYsm73lys9yBsIJYRkQNUwCaxj/O7dejjLBa+HTKM3a1Mri//nsUdBnF63Nvoegn+kxd4P2SemHKCxiQmEsM9K4hv9I5jpv7B7URFq1ikDVOT/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kBiGpcA4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2kHkzcxc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GjYihpda; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cbSe8Vz7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kBiGpcA4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2kHkzcxc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GjYihpda";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cbSe8Vz7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F1F77F0AF;
	Wed,  5 Aug 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=kBiGpcA4Kh2u+q0pOfROXp7606Ja60xIvzffEYj8MwOtMXmYpJ0QbeubvNChRYmzNEP+5P
	RWayLKPE1Jubd36/I/8rWz+icbF1ty6zF7XYKa1D22cmmUYnklLYdgaALwS+0mAxd6Uy1+
	nUOmFZhhAaOeXho1Ef6V57XIGrcwVdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=2kHkzcxc/MFlHpgn1uEdXbIaN3BZcRhVTrboYKJPTxotImqzz9lDfYgNGIDgPhaEt7KrQ8
	9LCXk6EGZ87a6sCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=GjYihpdaATPLC08BSgbvK7BaQ2qXz9F2q0xGL+qFD1lN00SMh5GOPTQnpE795vhTn94l6k
	06zafDn133kFYnmtoI2zkfYVkZRJfgs74t35wNQG4ZvhHU/zdOy/zqJSxVI5w/zhA6Rv2s
	yCQPoDNxZ5fuMK0Rz1npmMl6RTnD/Rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sdZDhO86pS2Ebuj0qUz2yXFZXVdAlvPY6sSR9WD38=;
	b=cbSe8Vz77lptCcRYCIDVXjp5LErIV6EtERJbVqtXf9EuAi3NVlUg63Cr2EwGlcBdgYADTM
	4/S9dGGRmLg6ceAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8A45779F3;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +MXVLzhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 10/31] ASoC: ntpfw: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:11 +0200
Message-ID: <20260805135247.670693-11-tiwai@suse.de>
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

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

