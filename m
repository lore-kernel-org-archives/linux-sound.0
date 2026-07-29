Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4723A75BD
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314294; cv=none; b=Z2Ymp3sKpjwbPcVSPOmILj9PNYCF3d/AKwnUacZwhuqvMQnJV0H+EZUWIGWwoOpMV9sj+68d6W4LfQ2a9TbO1tWbw/gtUSePn4Tq/cf5Pj4QPPyh6PQdkr00TUVBWa6jxDTZ77cIPdznHLBU5l+tPtOAskwuBr0FtcYSdIcHBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314294; c=relaxed/simple;
	bh=R6++fIW23kENBV8U3G4EiDv42sqpIwCSIyfgJoqmhq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1AcNw26vxSS8eE+ueVRyVsDwoodsMKk9fgbHc5IkHCG419D/dB1z4UvJ2jDYdo4y4GnSDlpB5duM1P39XRekLiNSIZVnjitC1YY4wdIZrB6OfZYlQklU8tVYohgoeXNunCtHygR1SQ4XXKNJn9Ub0a1DD1lHlRfuLqzztjMBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bW2qSX+e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VmzFy+F9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s7UqIxIJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kS1/+M1f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bW2qSX+e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VmzFy+F9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s7UqIxIJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kS1/+M1f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B507B3E20;
	Wed, 29 Jul 2026 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbDY4Xw/sLmRWW//LeDHbVq+0hl+NsrQ2K7OxNtdQyU=;
	b=bW2qSX+e1RwyqQfqo+tMgz0LCxr6VXhJlM3FvnSQWypOfXSWexj7X2b0EreX/0j2KcApvf
	DQIvTuEnR/UDKhpsyK4noJRylhLs4kf3HGkZIsR2M7lRb1fZ1hlq2qB9ZdGATZbreeoyKu
	pFSrSVwtVD7e2hSmh7UROS8BQ8NDOgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbDY4Xw/sLmRWW//LeDHbVq+0hl+NsrQ2K7OxNtdQyU=;
	b=VmzFy+F9mqTZplGjkaVI7UhA53GsEBeGeU68OXDNKWBCX2argmC00UdMLnLdfDQFDLZ7DH
	/CQ0SxB5IZf9apAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbDY4Xw/sLmRWW//LeDHbVq+0hl+NsrQ2K7OxNtdQyU=;
	b=s7UqIxIJs1zO1qFooRCLfhbLTdU8CHoZRvnFKVY/v4uTuhA2ndsMw5KLKm36LXPSQW1bEZ
	TpY9VrtctcJAO3MzigMNq/iqmeTJorttARRr0QfZ5h8OOq1+OOLO1zrjg0nbv62xmEehV0
	QQ7ptENSuOKuIfmqhHcMjWjAE2EDcDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbDY4Xw/sLmRWW//LeDHbVq+0hl+NsrQ2K7OxNtdQyU=;
	b=kS1/+M1fzrNDsfZaoxUEAZRVZFaucySyTwRQbBDcU8hn+2k/RAHqMuKFek9TiVDopa7ZWs
	1RsfUpkdsKtjpBBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01927779BC;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eCXNOte7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Subject: [PATCH 05/14] ALSA: hda: cs35l41: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:23 +0200
Message-ID: <20260729083735.120219-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.984];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with auto-cleanup
with __free(firmware).  A NULL clear is added at
cs35l41_request_firmware_file() for avoiding the double-free.

Note that the driver still keeps a few manual firmware releases
because it retries with different firmware files when one of firmware
pairs fails.

Only the code refactoring, no functional changes.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 33 ++++++++--------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 64a5bd895fd1..41a13456775d 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -170,6 +170,7 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 	char *s, c;
 	int ret = 0;
 
+	*firmware = NULL;
 	if (spkid > -1 && ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d-%s.%s", CS35L41_PART,
 				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
@@ -528,8 +529,8 @@ static int cs35l41_read_tuning_params(struct cs35l41_hda *cs35l41, const struct
 
 static int cs35l41_load_tuning_params(struct cs35l41_hda *cs35l41, char *tuning_filename)
 {
-	const struct firmware *tuning_param_file = NULL;
-	char *tuning_param_filename = NULL;
+	const struct firmware *tuning_param_file __free(firmware) = NULL;
+	char *tuning_param_filename __free(kfree) = NULL;
 	int ret;
 
 	ret = cs35l41_request_tuning_param_file(cs35l41, tuning_filename, &tuning_param_file,
@@ -548,19 +549,16 @@ static int cs35l41_load_tuning_params(struct cs35l41_hda *cs35l41, char *tuning_
 		cs35l41_set_default_tuning_params(cs35l41);
 	}
 
-	release_firmware(tuning_param_file);
-	kfree(tuning_param_filename);
-
 	return ret;
 }
 
 static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 {
-	const struct firmware *coeff_firmware = NULL;
-	const struct firmware *wmfw_firmware = NULL;
+	const struct firmware *coeff_firmware __free(firmware) = NULL;
+	const struct firmware *wmfw_firmware __free(firmware) = NULL;
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
-	char *coeff_filename = NULL;
-	char *wmfw_filename = NULL;
+	char *coeff_filename __free(kfree) = NULL;
+	char *wmfw_filename __free(kfree) = NULL;
 	int ret;
 
 	if (!cs35l41->halo_initialized) {
@@ -592,20 +590,13 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 
 	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
 			      cs35l41_hda_fw_ids[cs35l41->firmware_type]);
-	if (ret)
-		goto err;
+	if (ret) {
+		cs35l41_set_default_tuning_params(cs35l41);
+		return ret;
+	}
 
 	cs35l41_hda_apply_calibration(cs35l41);
-
-err:
-	if (ret)
-		cs35l41_set_default_tuning_params(cs35l41);
-	release_firmware(wmfw_firmware);
-	release_firmware(coeff_firmware);
-	kfree(wmfw_filename);
-	kfree(coeff_filename);
-
-	return ret;
+	return 0;
 }
 
 static void cs35l41_shutdown_dsp(struct cs35l41_hda *cs35l41)
-- 
2.55.0

