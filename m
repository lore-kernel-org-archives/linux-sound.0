Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E3F3264DA
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024823; cv=none; b=C9nU0ZQTym2XF/qqOQXCojZvsEjtRO/5NCPWhPLd2Rw76M0aKjmz8w6LR8QbjpMhTXEp0VhdzjPYAx/J/xvyK73pAXn917qYsieTleyofijP9lX8CFcSiFEUeX0KEkUEiNLwucq6dL+v8GKLFJh2YI/yyY2yhfnyo9nBlQK8Hyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024823; c=relaxed/simple;
	bh=lgovIbg3YOcS5XeUs+uw7IBK0orKex3FuSVuOtodxtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4+NcQjSvrfiVpsb/VGyXSNErUDJ7j76jTIbmQLh0LLU7NbzerR3akS69NLbQSBGjQQDv5rlxBwM1YoYphhhDytXjb4GIGCoOeMiYPGLBH/jaXWm5ppyxZt7xuaWCOdTWMFITw0bv55aYpFnL7acy1VRGKMgME2BU0mGvXj4fOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eL1mXfrI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YcwG1dQm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PokmkXoi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8DwkmEDM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eL1mXfrI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YcwG1dQm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PokmkXoi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8DwkmEDM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58D7D3E0B;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=eL1mXfrIBUWSviJ00H7iM3j8zG0aq4RtILWBUfVax8hlSPghWDQsvToUVsX1gtX3sLGQ/I
	vXjlcSDOcUad0xY99Tyu81gVX/h0Gdyk8cpWCkzD996zGcPtNw4nTQB9YyocXbt1i3mxvW
	scEyVP9/bZgc8FfNZQkyxXimnxVlDFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=YcwG1dQmMYE+4uvyf0w6RC/D/sxqDRrK3PE1whVm9yegYO0NZ9It3iqk5fvlYMYWANbWQ6
	R2KGTVP4uEXKdFCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=PokmkXoicdMpzd3Cw3U6pp/q1goGjRM95J9PHMJ67CQSKqJfr62nfT4kDDZlS0A9y7ZETD
	gyKWpldw3jBkLT9ZNO4D0Rdu9iinnGZhJxjicclUL8BXTtB+4RcHhtps1IG39SxrLpeA9x
	84PzPOZJbe0yXIbQU2yeb7Mm10O8tQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGejBPP0hc0oyKCvnFtKDBw7vPm3ci5IicUSAQDn1E=;
	b=8DwkmEDMSc+gDJcOdhAEDzz3o49RYdxgzD+kHMEir92PiLWPC8yUWnhPHzQXfoDPb55k/6
	KjuMt5BRBxxGiUDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30229779C3;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OKYICmqTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 02/31] ASoC: aw88081: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:34 +0200
Message-ID: <20260806140006.1412298-3-tiwai@suse.de>
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

