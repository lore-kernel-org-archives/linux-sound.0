Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1A8632B
	for <linux-sound@vger.kernel.org>; Sun, 20 Apr 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745139448; cv=none; b=lUO3Y0mZMtVYkWdrs256CE8yFvCtG+nxcbRK9YcehECe1ea66SeJaW4/aoF6GBJort+L8KHRQHAr8sbzbymbCIUqxV2BFX4MwVV+CF/tOzgkuhj4NBPkhALCFH4PzVloOa9PVP/N5hsPUHWXWpUkZCezARL7pkEQKG6njsQ7aRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745139448; c=relaxed/simple;
	bh=NUZjzfVunHfRQxiY4bAk3nk9zeRxLxsmS8SJVr2z2W4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FCZsgXh+ABGX5bDMLgZHmt0ZpKqxpJB1AncbIdq9nN6A5o+pTQcCUadRAYx3kjioz9rgjh7rjsdMRevxfbCikW07Fdf2IsjFpjqSFnn/7V2q9OpMIJl6J88lAWhqpYNLm1hz/wyM/Lo1ikgLEN3CpyZOvs5zLePnyCVqMoXtr0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iRv82fQc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HWvS5Rmk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iRv82fQc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HWvS5Rmk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iRv82fQc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWvS5Rmk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iRv82fQc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWvS5Rmk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69FBC1F388;
	Sun, 20 Apr 2025 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745139444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiGTjO9aINr7hCXLpIKFg8nlU655dFw4JdSOYXsIqHI=;
	b=iRv82fQcezGI4I0+gVpy8SOyacqkfF0yfh8M3/39R2bpSCVGdNHPtrGNK90YI+xgDvwbBN
	PZBDSMO3lCq9vAaPEy3lrplbQtHQvkSnEdxsPYmcCxgOqxvdqKjMNyObofUQcuHFj63+aX
	eXat7jUEfCuwv2C8vtz+VoR0uciKc9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745139444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiGTjO9aINr7hCXLpIKFg8nlU655dFw4JdSOYXsIqHI=;
	b=HWvS5Rmk+dNuBC/8yybSfdnk2j3jF4Ja/0sgt1rGx5tAh7skrMDbWSszLSXjRaxXQvRMXL
	kNM2ZyEL/2BCmXDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745139444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiGTjO9aINr7hCXLpIKFg8nlU655dFw4JdSOYXsIqHI=;
	b=iRv82fQcezGI4I0+gVpy8SOyacqkfF0yfh8M3/39R2bpSCVGdNHPtrGNK90YI+xgDvwbBN
	PZBDSMO3lCq9vAaPEy3lrplbQtHQvkSnEdxsPYmcCxgOqxvdqKjMNyObofUQcuHFj63+aX
	eXat7jUEfCuwv2C8vtz+VoR0uciKc9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745139444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiGTjO9aINr7hCXLpIKFg8nlU655dFw4JdSOYXsIqHI=;
	b=HWvS5Rmk+dNuBC/8yybSfdnk2j3jF4Ja/0sgt1rGx5tAh7skrMDbWSszLSXjRaxXQvRMXL
	kNM2ZyEL/2BCmXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47B30137CF;
	Sun, 20 Apr 2025 08:57:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WUXqD/S2BGisJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 20 Apr 2025 08:57:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
Date: Sun, 20 Apr 2025 10:56:59 +0200
Message-ID: <20250420085716.12095-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Acer Aspire SW3-013 requires the very same quirk as other Acer Aspire
model for making it working.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220011
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 6446cda0f857..0f3b8f44e701 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -576,6 +576,19 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{       /* Acer Aspire SW3-013 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire SW3-013"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-- 
2.49.0

