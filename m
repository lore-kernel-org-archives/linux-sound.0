Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E1D3DA7D1
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024842; cv=none; b=AnEZzBGzini2gnqg8vVTO5X0hVE0ThLUO/tSKi+FrzbIdi87J5WPOfV795XZfPq4cqbY2nk7yXlxfKEpT+EeBNARnbF1uv2kwAuONOnSIvz07pmn346kQ80Q6DPhxJE8cF4CbSIqU/g9q9/AZ+Mr+cUY9vdOTndeJ6i3kUvNzc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024842; c=relaxed/simple;
	bh=0BhHJrMprZu2MNGY1Vx+2RwkZL7gOifa6ZBWVtRZVHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC8t1F2dxyDuQ2sBgTcfS23cLSxrT6rzJpfW6pUtLH12gBQLCHskwHvZJjPqTaFC/T2YM8lRY4z+gbl7f3cyUB4J8poruAf902bOyNHr56OW/LBgY68fn0OZ30V4U/fVFwybKLoiSbglqVRLZnsL0tsvVYq3Hv5JGQTx/Pb+YdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0loYGZPq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K6okU4Wz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BgJcBLb7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1nVbKLLp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0loYGZPq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K6okU4Wz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BgJcBLb7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1nVbKLLp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 38E623E2C;
	Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPEZxquVH3fqrXzFKOJHYJX2obrvS1eb0PPTDyeAOqU=;
	b=0loYGZPqk+RJ7HHkMV3rlAhetggCUUEt84lGDkaaw7hn/NQsJJWe3pDFex7jR8jofC2wl6
	VODHTCBwyQlUl15CCrlTVX91aSOkb8yRDx/reuvZ2xhfplBU/54YgFV46i3AC3h2JrRaca
	T8HOpXH/HbtWDc5gAPSJdGSvUKVsZOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPEZxquVH3fqrXzFKOJHYJX2obrvS1eb0PPTDyeAOqU=;
	b=K6okU4WzQ3PUmokb54mqLhBv2/r1O3KLryMiRasFitZSzain87afnbbpGdesiI4+pVXleo
	LgIySHKxCGbHVeBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BgJcBLb7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1nVbKLLp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPEZxquVH3fqrXzFKOJHYJX2obrvS1eb0PPTDyeAOqU=;
	b=BgJcBLb7/EAFTnzi7sSqsZ1oJYr+LmxGbXhkxRBygZ2+UYMVm93lCHUiNVhT3lC8J8ZCoA
	C5dBZc5Arl3HJo8iQjTYYgvSL3Nmor8cmKZPR2Bzqs8a0ehe1JYhCmfKuzVeJ/9lGLjnOI
	RxTFg4kweah5jhfAhVdeVjPqD0oMKwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPEZxquVH3fqrXzFKOJHYJX2obrvS1eb0PPTDyeAOqU=;
	b=1nVbKLLpXXopsZSgJrGYyloetCF9XGXzIKM7YY4ZHhUj4OxaJYp5dtlOPVTeij2e9HlxO4
	imxEnjoCWJVcCeDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B18EA77A29;
	Thu,  6 Aug 2026 14:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8E2+JnCTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH v2 30/31] ASoC: SDCA: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 16:00:02 +0200
Message-ID: <20260806140006.1412298-31-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,cirrus.com:email,linux.dev:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 38E623E2C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sdca/sdca_fdl.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index dbe572336f8c..150e36ed24bc 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -195,7 +195,6 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 {
 	struct device *dev = interrupt->dev;
 	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
-	const struct firmware *firmware = NULL;
 	struct acpi_sw_file *swf = NULL, *tmp;
 	struct sdca_fdl_file *fdl_file;
 	char *disk_filename;
@@ -230,6 +229,7 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 
 	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
 
+	const struct firmware *firmware __free(firmware) = NULL;
 	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
 	kfree(disk_filename);
 	if (ret) {
@@ -258,8 +258,7 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 
 	if (!swf) {
 		dev_err(dev, "failed to locate SWF\n");
-		ret = -ENOENT;
-		goto error;
+		return -ENOENT;
 	}
 
 	dev_info(dev, "loading SWF: %x-%x-%x\n",
@@ -271,9 +270,6 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
 				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
 				     swf->file_length - offsetof(struct acpi_sw_file, data));
-
-error:
-	release_firmware(firmware);
 	return ret;
 }
 
-- 
2.55.0

