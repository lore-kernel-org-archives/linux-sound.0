Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A704734FC
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937987; cv=none; b=kVTddFHhxwI/zAOn6lPkDSh6MT/Zwnj1GVnEfFBSRPcVb6phzIlMISs/xu6YUY4sZKKXuaIobk/W5fZetKNQ9UAg0ROJ6oumLkyXg3HNdDcBfZZUSOCUUU+sfJMSCc5Ukhs9UWTEvSX6R+J/tuTYA/ERfe7dX+siLAk+l1ebqyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937987; c=relaxed/simple;
	bh=lgovIbg3YOcS5XeUs+uw7IBK0orKex3FuSVuOtodxtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqFj6ufCrjnQbceELnsns/aLsq/9VIJZbH1LWXqKX45R7j7fM35myOPjlwOxzomVMAYYengYQbo2gKPZbHjSyJkM+Nl0LM78yR/49cyQjM4kOPdFyJVcLyv472CCS2pA8kGGcOQDnY0VoPi2kotY9bb/nGmotLoXXYD+dup5r14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lm/WHMqd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RzyLnb2J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wdcZmL1s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=feKTVY1/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lm/WHMqd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RzyLnb2J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wdcZmL1s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="feKTVY1/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B58893DF3;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=Lm/WHMqdX9VdwklgDfHweVr+n2BBmdINo3c5yilSOPkgw+FdEdheKlMT1rWYqTSNQGyt0L
	pSj908uQ8/55CbNlFojZGpGofLcbbO0k84AErytwDBFAuMjhw7JTDgiHpBcqGNyMZtQwg9
	hU6P3PsMHJ2P6KjpkBc2T3xOT6PGhVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=RzyLnb2JszbSQHICHI7LkGBGCARv7kraIpbCNzMOUxsFyKoz7TUH3Y9Hmf3c+IAb1e6v2H
	RyP1l4YB8YSYY1Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=wdcZmL1sw0RqSSbzEoO8k7tBB+R9oJbilEabioclVR6qMBdn2tRiLO1J75uNV0uqKkTSH8
	8U1GITaOn1MS1dn7rzdZfXwaPZDHv8Tscf5O78MhDlTNRpLkhGijEG6m+ntckSQhAoit4g
	bXr537xVlHPIS2LkENaNxV6nqS5LCos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=feKTVY1/vP274fiOGSIjfgbpzv6sHidm7H4sH7TvSCHbZrvWmDfdm/DUu4JcqrscCo5/Bd
	FueuwcXjdbj4BgAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95F58779EB;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4BlqIzdAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 02/31] ASoC: aw88081: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:03 +0200
Message-ID: <20260805135247.670693-3-tiwai@suse.de>
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
 sound/soc/codecs/aw88081.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index a3cc027de606..3247ba5c71b8 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -1133,7 +1133,7 @@ static int aw88081_dev_init(struct aw88081 *aw88081, struct aw_container *aw_cfg
 
 static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct aw_container *aw_cfg;
 	int ret;
 
@@ -1147,17 +1147,14 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 			AW88081_ACF_FILE, cont ? cont->size : 0);
 
 	aw_cfg = devm_kzalloc(aw88081->aw_pa->dev, struct_size(aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw_cfg) {
-		release_firmware(cont);
+	if (!aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw_cfg->len = (int)cont->size;
 	memcpy(aw_cfg->data, cont->data, cont->size);
 
 	aw88081->aw_cfg = aw_cfg;
 
-	release_firmware(cont);
-
 	ret = aw88395_dev_load_acf_check(aw88081->aw_pa, aw88081->aw_cfg);
 	if (ret)
 		return ret;
-- 
2.55.0

