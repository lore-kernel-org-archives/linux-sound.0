Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AAC4734DF
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938008; cv=none; b=umFtOT8L56jWkzTl+YQhlEIydF3ftbVaadxMsrmdWu2Ih55ReXw32wTeGmy6sNhGw/4dJWfCHZYaS6TGcLW8Z7AhAMS98PMKDd8AhoPXTQpEmcwW3JR8v8ePAf2nuvQvK+zufAEGNg0X39WbM1b8+TLNuFVEGhZqC2Z2IJ5wpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938008; c=relaxed/simple;
	bh=bnTUhT33frgDJhUiZJLHLkw98Xlzu6s3rj+fr9RbX5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCb8Dev3v8c4Or2kWkOQcMlrHw4XZU70TzwWteTjXHdFJ1jjww5X7kL3i1KJtJcKQTX2UMXTdy970OUynpPLrJyAzHefwOueAmeCoXI/NtNUf3/K6eYLKUBRlWw5TTBD/zcDGZYYLTlPZe/+C6CH3FU4cYNl/acyNwtprQH6Z+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z6JZcUF6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H0XIjdgg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kCM6eDTQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I3yYLRWn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z6JZcUF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H0XIjdgg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kCM6eDTQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I3yYLRWn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97A8D7F109;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=z6JZcUF6AWNvDnepkY2pwUi/IBt2q3mdTY7JkJY7v9tZaG4MZ0Z+1JQXKFR/2pZwKbxAWU
	ycSR54eENi0n6VnNneFZ7vKO3/7CRmdvz5Xqk39Gm+cS29kws3zY7KxexmCnmpXwlenPO9
	KgEvKDF5nyhsEukzh9wCrDHWRIfpPtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=H0XIjdggvLuedw5EKV3CTKbqZJF5Ze6Elu6rmxx+vhbkIBMlizjuuWTCIT0Fl11eWi1ViX
	+ZqA47v0kJ+OkXAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kCM6eDTQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I3yYLRWn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=kCM6eDTQcm4RaLYqB867HU4U9Y3FITH5Jt4mOXxQTRlN8ekUKodGNhIf541IJYB06/pKan
	JWrElg/2Dk6Hn43kxoXcI+P0MYjSSkqsBOHxSK8RIra5O2pvU+YrF51IhKiGBjHfF76rmX
	by0VBdUK6DhKOS5mUiCvVDhvPqZTZcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=I3yYLRWnv6CQv1yzVhieSzMZufA02fPtQifV3ciNymEjzNGkL3gFrBhh/8cUMY8fPW6RvS
	LoytlZ+jksndVXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40F0977A06;
	Wed,  5 Aug 2026 13:53:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4J69DjxAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:53:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 29/31] ASoC: renesas: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:30 +0200
Message-ID: <20260805135247.670693-30-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 97A8D7F109
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/renesas/siu_dai.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/renesas/siu_dai.c b/sound/soc/renesas/siu_dai.c
index 039b1264d90d..85dee9025710 100644
--- a/sound/soc/renesas/siu_dai.c
+++ b/sound/soc/renesas/siu_dai.c
@@ -715,7 +715,6 @@ static struct snd_soc_dai_driver siu_i2s_dai = {
 
 static int siu_probe(struct platform_device *pdev)
 {
-	const struct firmware *fw_entry;
 	struct resource *res, *region;
 	struct siu_info *info;
 	int ret;
@@ -726,6 +725,7 @@ static int siu_probe(struct platform_device *pdev)
 	siu_i2s_data = info;
 	info->dev = &pdev->dev;
 
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	ret = request_firmware(&fw_entry, "siu_spb.bin", &pdev->dev);
 	if (ret)
 		return ret;
@@ -736,8 +736,6 @@ static int siu_probe(struct platform_device *pdev)
 	 */
 	memcpy(&info->fw, fw_entry->data, fw_entry->size);
 
-	release_firmware(fw_entry);
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
-- 
2.55.0

