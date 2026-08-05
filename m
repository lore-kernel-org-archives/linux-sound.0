Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE1B4749F9
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938005; cv=none; b=DoteNeY15fdwTT8dCPj1ZCt/RkdZe7OcWyKQJKd2NhDGp4uSOLtooI23nU4549aroD1Tkoi1Dc6QxR7PLJcwb0/XHg730SZ5/MpD7v9lQSvRTC0VdfLF8Ahyu6zM5MetkwY6rMcvN0/4fJFjyLOj6ufs6xrig6HccREEpgoGmeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938005; c=relaxed/simple;
	bh=1G5vWXk9xxpd52FaeiWOowfcd2KI3ToTjsKF8rwJkr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saX29S+we9L3Q4i/ogiymCZZeTs/bCJvdvlS1zAiqsaQyH5ObV6zesDOBlZK2GZXmzivn1tvkKuJHrWEiEaEBFqfFPXQhIfg93O0BR5i2SACK+IIiB4z/CuM3o+tn1DFI/tQyv4orydnDN++xX910Fbr9QIoBmEI8SQLW8mWCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=owQeKlfG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZdXZk/To; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fQBmDe/y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LO05hma1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="owQeKlfG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZdXZk/To";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fQBmDe/y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LO05hma1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F7DD7F0D2;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wOTfVxom1bzZ4T+vjJjRTq2V3NBqbZP7at544qg4vM=;
	b=owQeKlfGUWXoDtWh5lOUseaiVIePS6UqBEx/sh7xQ3sDyEsLzmGVZfM5n+ESthybjpSMn/
	9LJC6+dxUsfoHBA6swjqUL6mfensdJNTxwxkstmNfsxngH8vuw/effi67rjnwSN5HXm95n
	k4A6BQOtlMQiHfDqW4cNxE5WDcSl8Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wOTfVxom1bzZ4T+vjJjRTq2V3NBqbZP7at544qg4vM=;
	b=ZdXZk/To+b9BBMTPpuf6uo7EDxj1/HpyT6n8ff7pLRcNt+42dOTtYyAVQlSHEHp3C6nzYb
	/pbYbnSh3A3xXQAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="fQBmDe/y";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LO05hma1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wOTfVxom1bzZ4T+vjJjRTq2V3NBqbZP7at544qg4vM=;
	b=fQBmDe/yE/HeD3u3FhrADqrp0MyCFlmaocbvqzuYPHLHz37RbnQlA90M5hFaCmoC4C6oWX
	SLeA1Q4sHSSa2vAA/Xwwp7BDfSgWFQyhQKj0n3KHELI2hyNawhTPcrSx6smWFi0gwJ5Xy1
	HC8JCoiYUvjBoVEk561dHuBMtIfRYTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wOTfVxom1bzZ4T+vjJjRTq2V3NBqbZP7at544qg4vM=;
	b=LO05hma11lkW7YwW6xMB/VQ1YK7dm2j5u7KyK6TwDlzNA3wbY+slVA4lCE0JMqblDm1Az+
	5z7lYzd1CpXdNsAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEAE8779FA;
	Wed,  5 Aug 2026 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yAkTOTlAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 17/31] ASoC: sigmadsp: se auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:18 +0200
Message-ID: <20260805135247.670693-18-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,metafoo.de:email,analog.com:email,suse.de:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 3F7DD7F0D2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/sigmadsp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index b7dbeb237447..4ecbbac93258 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -484,7 +484,7 @@ static void devm_sigmadsp_release(struct device *dev, void *res)
 static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
 {
 	const struct sigma_firmware_header *ssfw_head;
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 	u32 crc;
 
@@ -492,7 +492,7 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
 	ret = request_firmware(&fw, name, sigmadsp->dev);
 	if (ret) {
 		pr_debug("%s: request_firmware() failed with %i\n", __func__, ret);
-		goto done;
+		return ret;
 	}
 
 	/* then verify the header */
@@ -506,13 +506,13 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
 	 */
 	if (fw->size < sizeof(*ssfw_head) || fw->size >= 0x4000000) {
 		dev_err(sigmadsp->dev, "Failed to load firmware: Invalid size\n");
-		goto done;
+		return -EINVAL;
 	}
 
 	ssfw_head = (void *)fw->data;
 	if (memcmp(ssfw_head->magic, SIGMA_MAGIC, ARRAY_SIZE(ssfw_head->magic))) {
 		dev_err(sigmadsp->dev, "Failed to load firmware: Invalid magic\n");
-		goto done;
+		return -EINVAL;
 	}
 
 	crc = crc32(0, fw->data + sizeof(*ssfw_head),
@@ -521,7 +521,7 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
 	if (crc != le32_to_cpu(ssfw_head->crc)) {
 		dev_err(sigmadsp->dev, "Failed to load firmware: Wrong crc checksum: expected %x got %x\n",
 			le32_to_cpu(ssfw_head->crc), crc);
-		goto done;
+		return -EINVAL;
 	}
 
 	switch (ssfw_head->version) {
@@ -542,9 +542,6 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
 	if (ret)
 		sigmadsp_firmware_release(sigmadsp);
 
-done:
-	release_firmware(fw);
-
 	return ret;
 }
 
-- 
2.55.0

