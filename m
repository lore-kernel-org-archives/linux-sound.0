Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315D4756AC
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938004; cv=none; b=HKv45mZPszvTicXtbywCa3WotYNT1nVEnbmLErNDpQuF5ACCBx3P0iLq/60eG7M0iAWGHnzNVWsYlkZS3x7bN1c/hMy7zSWxqLty17mecm8OXtI03V+sWN8v1Grs+tsBVwZiP8Jha/oU5HzUPRzeL2nhs8GfnGdoIEGqfhJ8dBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938004; c=relaxed/simple;
	bh=0bRHNYOXAO5FBLPxpxk7x54lVb+WpDN9ziZSzIEQxB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0cfDuukZYqnO2e80en36+TwOLfh1exTwgan+F1S1lTAHtmR0EBogGusjOPt6T88GLtFuOWLt/JA2oB3lSHxAo/mX90tk5SZUoa4afyMEAaiFOs8R3jHjYCMWQZV580GrH+volLHW33W1rsENwONP5IRDzTcIj8aGNWiYhuF7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eu+w3NMl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2EC6Emys; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/f4wlli; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DF6OwXcA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eu+w3NMl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2EC6Emys";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/f4wlli";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DF6OwXcA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 487FE3DF3;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=Eu+w3NMl3qHn2JNR0oGMxn14fTD/cld8gu65YlIIhg2w4Y1k05ifP+pvTeDu65E1eCZIwn
	v+cDZGzH/uFwrA0IA7cjBVlvnVwdtG40BjRLbQ/H0kDCuOkJf702gLew7BzbaNkhRUKZQc
	Nrn8dJhtpxVbTNrgdHy6ItZJq2NlDj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=2EC6Emys5h1awwde7iXi7asSQ1M++fsBdRZEaD2y6FQj1EnfRJsFG5kWjnwzKDFD7DNGhw
	s3X9iOrgnlpy0RAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=d/f4wlliBs48oxlUt7J0FtCyC9No5vfY9XsGzD5O3BqzC0DX+SBkoSm0a6xuzqt+AETuov
	gm9YB8kcNXMfZ9V5284+Uo14UHmNhyrLOq7CkEriIPecNIYcchZK7sP0kQ/7LPHCnAxgnm
	K64i+sOud6i2vbbnvZUqhsgt4IgheOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z2bfLO+o7E06VQNZ9LcnbfkHDMB7UaLD9RM00yrmM8=;
	b=DF6OwXcAi8G3L5foSYR3qC0jULHhLl6l0daPqK+5NhLfCepIwhHVs3Qb5+mAOlwHOhC7dn
	h3TyuDtMG6VOVpCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFAE7779FE;
	Wed,  5 Aug 2026 13:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gJrFKTpAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH 21/31] ASoC: tlv320aic31xx: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:22 +0200
Message-ID: <20260805135247.670693-22-tiwai@suse.de>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,ti.com:email,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Sen Wang <sen@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tlv320aic31xx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 1d2e0ea6d4fe..43bcbc5449e1 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1720,18 +1720,14 @@ static int tlv320dac3100_fw_load(struct aic31xx_priv *aic31xx,
 static int tlv320dac3100_load_coeffs(struct aic31xx_priv *aic31xx,
 				     const char *fw_name)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw, fw_name, aic31xx->dev);
 	if (ret)
 		return ret;
 
-	ret = tlv320dac3100_fw_load(aic31xx, fw->data, fw->size);
-
-	release_firmware(fw);
-
-	return ret;
+	return tlv320dac3100_fw_load(aic31xx, fw->data, fw->size);
 }
 
 static int aic31xx_i2c_probe(struct i2c_client *i2c)
-- 
2.55.0

