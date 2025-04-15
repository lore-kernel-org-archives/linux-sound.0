Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7DA27A118
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705936; cv=none; b=dXbDMpOF0Z5ulItcMU6VHCybPfg44s/zkiYpNNNL57tEtZDtQeYlewlPhgkcjgdCvk1DquTXzbSGRw6MZlHzs6xIxcyWi9Z1OIFPfzB6ESnVc3SEUJ+FhdC0TB8nH/cA2Eq2wfX6TwelqVrDg/e+DXmGemX8RijpWbqtYXs7+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705936; c=relaxed/simple;
	bh=LiZbG4/QgQyg0wmSlK33TN8u3kZH4LQPAJR9ZPh68BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hfk8wxX1EGaa5mKIHCnRqmDr+/zc5bZQhRt+mHuo/aaxi+UQqJb7JMw8dCJAi/ejceovR8mvRmNhMKnQGs4B2+h5VN7XS36R39B8aMNOD6ijIMRsFkl0u/yazYzysfmH4Ix+BWgYBVhSPcOELl1SzRyeEnu0SFDCoDhmSt65bYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eecWMikN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IIo6GNVI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eecWMikN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IIo6GNVI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eecWMikN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IIo6GNVI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eecWMikN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IIo6GNVI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FBC51F395;
	Tue, 15 Apr 2025 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wsHlG1ol38QMCbCePQnxLvS8KR1Rq/IdkFH9nRPnpc=;
	b=eecWMikNL96zuLbSxiibHFdNvRVp7moBrCGPjIyaG01efAh2D4/jBMLBjG4cQI2ZxtdeMR
	DoB0hC1U6nRrx3BWNAC+RxXofhd7s+zl+mxcHopDkZrPetxjRsmIKPv5gx7rtzbVdpAX9d
	+QhGxpR9lVVCvJ3NBctFXoabS+sq2ZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wsHlG1ol38QMCbCePQnxLvS8KR1Rq/IdkFH9nRPnpc=;
	b=IIo6GNVI628+LfJ2lS3wRfx+hWcNO45KlEbN99bEDOOn400fe0cJ0vnIamHK3NcRtp4dX5
	xaPjRLMnzqi6nuDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wsHlG1ol38QMCbCePQnxLvS8KR1Rq/IdkFH9nRPnpc=;
	b=eecWMikNL96zuLbSxiibHFdNvRVp7moBrCGPjIyaG01efAh2D4/jBMLBjG4cQI2ZxtdeMR
	DoB0hC1U6nRrx3BWNAC+RxXofhd7s+zl+mxcHopDkZrPetxjRsmIKPv5gx7rtzbVdpAX9d
	+QhGxpR9lVVCvJ3NBctFXoabS+sq2ZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wsHlG1ol38QMCbCePQnxLvS8KR1Rq/IdkFH9nRPnpc=;
	b=IIo6GNVI628+LfJ2lS3wRfx+hWcNO45KlEbN99bEDOOn400fe0cJ0vnIamHK3NcRtp4dX5
	xaPjRLMnzqi6nuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BBC4137A5;
	Tue, 15 Apr 2025 08:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2KRJEXMZ/mfjRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 08:31:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ASoC: Intel: bytcr_wm5102: Avoid OOB array read from the map name
Date: Tue, 15 Apr 2025 10:31:40 +0200
Message-ID: <20250415083144.6588-5-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415083144.6588-1-tiwai@suse.de>
References: <20250415083144.6588-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Since the quirk bits can be passed arbitrarily via a module option, it
may lead to the OOB access over the map name string array.
Fix it by conditionally reading the array, instead.

Fixes: c556d202bef1 ("ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_OUT_MAP quirk")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index a6dfbcfdf74e..15a7302a1753 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -514,11 +514,26 @@ static struct snd_soc_card byt_wm5102_card = {
 
 static char byt_wm5102_components[64]; /* = "cfg-spk:* cfg-int-mic:* cfg-hs-mic:* ..." */
 
+static const char *out_map_name(int n)
+{
+	static const char * const map_names[] = { "spk", "hpout2" };
+	return n < ARRAY_SIZE(map_names) ? map_names[n] : "none";
+}
+
+static const char *intmic_map_name(int n)
+{
+	static const char * const map_names[] = { "in3l", "in1l" };
+	return n < ARRAY_SIZE(map_names) ? map_names[n] : "none";
+}
+
+static const char *hsmic_map_name(int n)
+{
+	static const char * const map_names[] = { "in1l", "in2l" };
+	return n < ARRAY_SIZE(map_names) ? map_names[n] : "none";
+}
+
 static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 {
-	static const char * const out_map_name[] = { "spk", "hpout2" };
-	static const char * const intmic_map_name[] = { "in3l", "in1l" };
-	static const char * const hsmic_map_name[] = { "in1l", "in2l" };
 	char codec_name[SND_ACPI_I2C_ID_LEN];
 	struct device *dev = &pdev->dev;
 	struct byt_wm5102_private *priv;
@@ -594,9 +609,9 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 
 	snprintf(byt_wm5102_components, sizeof(byt_wm5102_components),
 		 "cfg-spk:%s cfg-intmic:%s cfg-hsmic:%s",
-		 out_map_name[FIELD_GET(BYT_WM5102_OUT_MAP, quirk)],
-		 intmic_map_name[FIELD_GET(BYT_WM5102_IN_MAP, quirk)],
-		 hsmic_map_name[FIELD_GET(BYT_WM5102_IN_MAP, quirk)]);
+		 out_map_name(FIELD_GET(BYT_WM5102_OUT_MAP, quirk)),
+		 intmic_map_name(FIELD_GET(BYT_WM5102_IN_MAP, quirk)),
+		 hsmic_map_name(FIELD_GET(BYT_WM5102_IN_MAP, quirk)));
 	byt_wm5102_card.components = byt_wm5102_components;
 
 	/* find index of codec dai */
-- 
2.49.0

