Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEA24E4C6
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024837; cv=none; b=BamsYbRFqOrGPsv+TtzzOOSXKkgDXyN4bJ6ZthpDvzy7x13EM7zSqhHTfBi4+B0ca5lfyxkznq+Op4VAFPlchS67sYDvgNQJATg0CDJZ7N2/skJ+uBwZrzKQn0BC9fRkoE02Lp98iolyyZ4wZwAtI/jLg9ZlGtdrwT+NKuZIaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024837; c=relaxed/simple;
	bh=IPVDAGH+L3vyHQEAKGWXYVCmOBFTwkV8ehRo7TVKyF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPG5i5wlFCHkoh/CxE/zqSbEB1ixH9fZpZpFnGVdD/Ujsml0uyExASRgpaqRmOpVnyvGFM1MG1rREKZhAGfSb2NwHklp+5UKCtfDizN7pA1VcAf+wIs25OgU2ucFRlYc5CQ/JOilQwNxEH5Oxwiy3JQooSQ06Qd3rcqXu7B/GR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f8D/WSpS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AqHZqJgh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gB7trYWB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9eQzOkqW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f8D/WSpS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AqHZqJgh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gB7trYWB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9eQzOkqW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2F403E22;
	Thu,  6 Aug 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CLjtLRANBtO6bwfS2LghNkx4/As4E12O4nySzYfyR0=;
	b=f8D/WSpSCOlNHZH5XHjzwSf7POhrKMzpC1mQpwLyMg0ViQLdwJGKJHW+jH45JXs/B2fSgL
	RjEXuzUxNphEUrQz6RQDFRMQGGk/aC5ykrGJ4zFwx9PExH35QI1+EACr5lFszcZKNUL5xV
	McBkzRE+vycLXcLNhydVzG0uBskRQIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CLjtLRANBtO6bwfS2LghNkx4/As4E12O4nySzYfyR0=;
	b=AqHZqJghsPXxOCEhdjuB30RqCV6tPX4JbdGGM3XoEtf9YigvDMxyQkbaEVZDwSU7fSvBWN
	R0z7MYRPEDtLB3AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gB7trYWB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9eQzOkqW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CLjtLRANBtO6bwfS2LghNkx4/As4E12O4nySzYfyR0=;
	b=gB7trYWB8+1fGk6oe0d+T7DvloxrUmPl4/FdFVmY2k4R5koov/QUN9Y9u6klW7+gtfs64O
	gwrgideB7klTd25URYQC1Z5WDMdK14KKp0HcZWT8hsdDjTo/lOa2VkAJfnSO3ehcQIlsw4
	g4vfy2IjNj2AMSGfPk3ly/vL2/aFjng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CLjtLRANBtO6bwfS2LghNkx4/As4E12O4nySzYfyR0=;
	b=9eQzOkqWWxXLMs6LULuqgd2PCj7XPlRH2gVG5eCx4RqQ+IO79GgOdijv1lNwAygVs0sEbo
	+zMYk8fK1H2xNTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79FE2779FD;
	Thu,  6 Aug 2026 14:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wPk4HG2TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH v2 17/31] ASoC: sigmadsp: se auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:49 +0200
Message-ID: <20260806140006.1412298-18-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E2F403E22
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,metafoo.de:email,analog.com:email,suse.de:mid,suse.de:email,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Nuno Sá <nuno.sa@analog.com>
Acked-by: Nuno Sá <nuno.sa@analog.com>
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

