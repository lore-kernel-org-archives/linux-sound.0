Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FFA4734C6
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938005; cv=none; b=oCfXMhxXfDlDGv+krr3J/gEbzkRuWBaazLCthSSl2PZUpCJSG2PRDpTWt3L0QDLNAckH2N2+yh/hIzU5yN95X6NewTpVzCiB87NPVyso6uXIE3AOoBpm5Vxs1l5PoJqGVO+QCUMtHcFnEbrESNpn6bK1os5+bzz5J9Yrofo7424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938005; c=relaxed/simple;
	bh=8QsXvt+45eDu6gLjESlvFfmNQxj8kG5gXtcn1gniM0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEkv5IjAkO9455glmB/rm/fsOGilYqhLcav6mxYKo+VW4hSADVRBehEFQKe4po4qangmFkIiFw4RtvjdNCkYUfkBfH0fp+RDXTZ0T5dOfxQrEtVbVidy9nZ4icPo1SdGwOE9/lvpPxUEtqcDWnsbSiHG7BYNaCLcssMHJ0yfGZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E3X+Mlgg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgOevSWj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XPgSLbzs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YvcQUwu1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E3X+Mlgg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgOevSWj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XPgSLbzs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YvcQUwu1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5BD6A3DFF;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=E3X+Mlgggv4uD9FPlBL9JApCa5KzbbUSCZaGIdDYH8G4OE4iuySDUAssamn4HYMJAaylGU
	IBQnECcu9sNZNIulVp0UX+J95utDjwYmx8skcLZOKMTbzmEOtRIKQ7hp5HLLWRfpuxOPUK
	fqSHTUHeLriJFJiCCMyDq2JweA+0QaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=tgOevSWjjVqVRCwUqKO4ZsFdn8enL8Sxgi5yJFeflGowmunv3Ujyx2ezNH5QuaELLK8c/t
	0gh4eUOOi9OwbWDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=XPgSLbzsNvBScczV+PG+sRjdmNgCt0KSJaZKIY2THb88382jyJPD6OvXogwp/8woUub2DN
	jz4IUFsEn2D5VpERGvw/3dvpPgh4yLI6wENr/1q5AmVLymuXPLjvwY+klpsdOAOcppXDWk
	Dp1D4q3MbbgSeR1c5irLFLob+t4hU+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PwsqDCRnICNmyZHun/1duzR67DILDCLop2t6bTMvKA=;
	b=YvcQUwu1qaJPvESHHVus7/dPL4tglTNW8tf49XqDXhaK8Lyt1DiVXwvCzD3sk5Et2wKP+3
	f3+ivw7eFbD/TADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DBDC77A01;
	Wed,  5 Aug 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QNvgDTtAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 24/31] ASoC: zl38060: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:25 +0200
Message-ID: <20260805135247.670693-25-tiwai@suse.de>
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

