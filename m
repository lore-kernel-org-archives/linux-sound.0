Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FF43AEB5F
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024839; cv=none; b=R2EIs3t3DVQVhmDmtRZS9kXaT69ra47Z80J6b5tu73IdzD0eqtY4e6XDSk0xanbMiqrDXJaHcaOdyx164wwSdkQ6+VN3D+zphNmgC7KzryqI4JU3bsmm4wUKCjmAoXFH4O+hBJQ0yTvYyt9Fu4SMyWTEHK+6U5VJEBntXmh/B+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024839; c=relaxed/simple;
	bh=8QsXvt+45eDu6gLjESlvFfmNQxj8kG5gXtcn1gniM0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOGK5vJvjt2xjs0wFN1cZT7kUjek7gL6jM0L5gts8K9aSX1wBwf/UUr8QPlWRuLOuNreLBVuPKfRMV/jfNNwwWEvm0JjAVk2Q8TnAVBcLqqPFFAlV/Zb5CFODH4kLem+Qd0gWCRM2NzNtWF/Kmpw1fsoU3P2o7SsFVACnC2olv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CxX7nwnR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jrCqxDkS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dwoxtgkp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z+szQVyK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CxX7nwnR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jrCqxDkS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dwoxtgkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z+szQVyK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D06D8800DD;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=CxX7nwnRchC7dsrF/cqU60nevU4LXAHtgLiJ9N6n8RT0cU2VAODL2irGQuska6SNd2R24P
	JMMzOjD00dfDUeTJET6wEoJ39ukLoE2wBjiqFDDGE6o8BtxspMBc4KsD9zM/wdR58kDkYy
	zUJJxjjm7T8j+yme0OLByBy4s7KHBuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=jrCqxDkSqOssNE0nHN/+s5BoUvx4UtFqsqio1J4PoTaYbjCx/hYNkM89wvgBwgGaLIetB7
	PKsAG8EC4kU0tZCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=Dwoxtgkp93dZA5kBgnWhQuhorS8U00jhjKlMKtV3NoJtx2EIRJ0c1ukXTTyNNkbX1Ktv4Z
	3wCwfKB1mnx9oVJBDRKNmBvnqTD08raA/PYWVlgfXhSW6TtC0bSwYbQvXbNPlBvEBGHF+y
	6k64jrWApEGBfzqiggb8qbDZhhWgUwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=Z+szQVyKPtLfIKtziQQz6fWTrpUr6fSBaxEXb9j7OC8G5l4mnbvcifu0b4KdgfwUEcDSDn
	DcuF8Hour0Bv9eBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 446A877A23;
	Thu,  6 Aug 2026 14:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OLwQD2+TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 24/31] ASoC: zl38060: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:56 +0200
Message-ID: <20260806140006.1412298-25-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/zl38060.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 7de4014e626d..894b8eb42e39 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -162,7 +162,7 @@ static int zl38_fw_send_xaddr(struct regmap *regmap, const void *data)
 static int zl38_load_firmware(struct device *dev, struct regmap *regmap)
 {
 	const struct ihex_binrec *rec;
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	u32 addr;
 	u16 len;
 	int err;
@@ -180,7 +180,7 @@ static int zl38_load_firmware(struct device *dev, struct regmap *regmap)
 		return err;
 	err = zl38_fw_enter_boot_mode(regmap);
 	if (err)
-		goto out;
+		return err;
 	rec = (const struct ihex_binrec *)fw->data;
 	while (rec) {
 		addr = be32_to_cpu(rec->addr);
@@ -195,15 +195,12 @@ static int zl38_load_firmware(struct device *dev, struct regmap *regmap)
 			err = -EINVAL;
 		}
 		if (err)
-			goto out;
+			return err;
 		/* next ! */
 		rec = ihex_next_binrec(rec);
 	}
-	err = zl38_fw_go(regmap);
 
-out:
-	release_firmware(fw);
-	return err;
+	return zl38_fw_go(regmap);
 }
 
 
-- 
2.55.0

