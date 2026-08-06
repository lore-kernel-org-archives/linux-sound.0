Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C24379C35
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024838; cv=none; b=q25CiC/XPvgLkYvqsYYXV4Pl7sAR9uKbIc2Ds8Y7gFdaIJYhELNqNguG7iCijLC/+HmW8vPSrw0Vte836vYCk3EcbOoQODXbNArxUSE5ThMkPLzZ1ly9tlzzqbDmNbrPYT84aX/vEgdpTzglDgLmtML1jRuv0wN7yfDiKADTDLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024838; c=relaxed/simple;
	bh=9mEVZJj8qmak6NWKNJTkYhrk9QlgoCaphA/65qvRnrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiIjuNu+XDKEXg0hg29JHryL+ke5Pr8unNOT45a+PoGmN7rw/60YiYcI2bqCMwsIlh0kGOHq9oPB1Rw52Rs6N8ZQgbOejVmm6742pLrl280kTxcBAnx//F6txb/ZMpXjzTv6i49hHZ87gyTCaju/WScPv+PhyrL6bgRFNWSjd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UJ2Rvmij; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JBX2wY/u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7CXG8og; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+De3D8N; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UJ2Rvmij";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JBX2wY/u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7CXG8og";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+De3D8N"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 903203E25;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiv+kL2bT58WSmjg6HPRH0XzgREM5dG6nMPzO3pz1XY=;
	b=UJ2RvmijmgXfyv/WM7z8LJ2KtJT+ScevBXMHO+0YNdH+MBLuBwjFDFQnQO7lZOwGdGEMh6
	PIpgFsbUFhE2W298LaAOUuPSYnO9wnNobvhPPfjSuUbrRocH3FuWU8MiwNnAYtO8xCJmuT
	WAsIRlFC2yuKDBZbw7W/nXt6HrUuTrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiv+kL2bT58WSmjg6HPRH0XzgREM5dG6nMPzO3pz1XY=;
	b=JBX2wY/u9gDE60jyWYWehguvMRgHpzvJIpz8DmwuCCDYQSWhnZXqB1I0wNFICWbjiQArFV
	X3w0u7ANY0lhWqBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k7CXG8og;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8+De3D8N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiv+kL2bT58WSmjg6HPRH0XzgREM5dG6nMPzO3pz1XY=;
	b=k7CXG8ogUsFZiiVf7z78srxpbonp7urBxzwTETQEyWJ56Dv9R74P5uyvMRGwSYRB9HjYKM
	CmB+CgJzVPON6HW8bEHg8SfEuUE2oAnrNIY1E8uF/zgExUl1dyyhkGN5Y4mRObJDwq0Xx8
	Lfw2kQbVydnPbIDSggYogVepZVMCJb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiv+kL2bT58WSmjg6HPRH0XzgREM5dG6nMPzO3pz1XY=;
	b=8+De3D8NnPFgEEuUI5T7oP5hiKERmow1emR5sdoVrpJECO64CSz/WE70BSERAwJhdRlozG
	Bar354O7j5xmEMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC5BE77A1E;
	Thu,  6 Aug 2026 14:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qO85OG2TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH v2 19/31] ASoC: tas2781: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:51 +0200
Message-ID: <20260806140006.1412298-20-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 903203E25
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Sen Wang <sen@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tas2781-fmwlib.c | 45 +++++++++++--------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 11d1c2ac865b..df30abfb3b6b 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2243,7 +2243,7 @@ int tas2781_load_calibration(void *context, char *file_name,
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
 	struct tasdevice *tasdev = &(tas_priv->tasdevice[i]);
-	const struct firmware *fw_entry = NULL;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	struct tasdevice_fw *tas_fmw;
 	struct firmware fmw;
 	int offset = 0;
@@ -2253,60 +2253,50 @@ int tas2781_load_calibration(void *context, char *file_name,
 	if (ret) {
 		dev_err(tas_priv->dev, "%s: Request firmware %s failed\n",
 			__func__, file_name);
-		goto out;
+		return ret;
 	}
 
 	if (!fw_entry->size) {
 		dev_err(tas_priv->dev, "%s: file read error: size = %lu\n",
 			__func__, (unsigned long)fw_entry->size);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	fmw.size = fw_entry->size;
 	fmw.data = fw_entry->data;
 
 	tas_fmw = tasdev->cali_data_fmw = kzalloc_obj(struct tasdevice_fw);
-	if (!tasdev->cali_data_fmw) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!tasdev->cali_data_fmw)
+		return -ENOMEM;
+
 	tas_fmw->dev = tas_priv->dev;
 	offset = fw_parse_header(tas_priv, tas_fmw, &fmw, offset);
 	if (offset == -EINVAL) {
 		dev_err(tas_priv->dev, "fw_parse_header EXIT!\n");
-		ret = offset;
-		goto out;
+		return -EINVAL;
 	}
 	offset = fw_parse_variable_hdr_cal(tas_priv, tas_fmw, &fmw, offset);
 	if (offset == -EINVAL) {
 		dev_err(tas_priv->dev,
 			"%s: fw_parse_variable_header_cal EXIT!\n", __func__);
-		ret = offset;
-		goto out;
+		return -EINVAL;
 	}
 	offset = fw_parse_program_data(tas_priv, tas_fmw, &fmw, offset);
 	if (offset < 0) {
 		dev_err(tas_priv->dev, "fw_parse_program_data EXIT!\n");
-		ret = offset;
-		goto out;
+		return offset;
 	}
 	offset = fw_parse_configuration_data(tas_priv, tas_fmw, &fmw, offset);
 	if (offset < 0) {
 		dev_err(tas_priv->dev, "fw_parse_configuration_data EXIT!\n");
-		ret = offset;
-		goto out;
+		return offset;
 	}
 	offset = fw_parse_calibration_data(tas_priv, tas_fmw, &fmw, offset);
 	if (offset < 0) {
 		dev_err(tas_priv->dev, "fw_parse_calibration_data EXIT!\n");
-		ret = offset;
-		goto out;
+		return offset;
 	}
 
-out:
-	release_firmware(fw_entry);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(tas2781_load_calibration, "SND_SOC_TAS2781_FMWLIB");
 
@@ -2399,7 +2389,7 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 int tasdevice_dsp_parser(void *context)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
-	const struct firmware *fw_entry;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw_entry, tas_priv->coef_binaryname,
@@ -2407,15 +2397,10 @@ int tasdevice_dsp_parser(void *context)
 	if (ret) {
 		dev_err(tas_priv->dev, "%s: load %s error\n", __func__,
 			tas_priv->coef_binaryname);
-		goto out;
+		return ret;
 	}
 
-	ret = tasdevice_dspfw_ready(fw_entry, tas_priv);
-	release_firmware(fw_entry);
-	fw_entry = NULL;
-
-out:
-	return ret;
+	return tasdevice_dspfw_ready(fw_entry, tas_priv);
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_dsp_parser, "SND_SOC_TAS2781_FMWLIB");
 
-- 
2.55.0

