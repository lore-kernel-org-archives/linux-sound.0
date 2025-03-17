Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF6230BDB
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205645; cv=none; b=DRtMpMlhMNF9YPbCuTftE+vkCuhBVi7zvGLlUpikVtv5blnbdBBUlW740HUVzWRScStXHvvcvdOenPtq314lSgK6sLtrxvk166fUGsGdB/sZ4PG8gLea8r7YnzK4CJOxndwo48Idigwxv/kADxRbVNNMJt3VK32kjCWXV5MzbuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205645; c=relaxed/simple;
	bh=k2Oxkft+Zhz1OGawdwdXbuqHQOnodTJ7+0vpQDc9+sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OG1ize74QqddKABg0tsSE0qup3rinR5TTW8QDmH9kxTIVOZGTFUV+EnO1JETxqN75d0l4X/gcfcr2D3jXFeBZodqVyBJ+Ke0YnwRCPSNdli3/4ZWhl1g2GyV5xR0RKOiqLu3XBj6ixg54MMbwhehuUZcviLIU/uzOLKJUUNyrYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goH1zRHE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IKqwW5AX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goH1zRHE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IKqwW5AX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goH1zRHE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IKqwW5AX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goH1zRHE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IKqwW5AX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C060221EC;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEg7MKpZjByd67SNr+PQR26vbsLImbIOxem/Oi8qnsk=;
	b=goH1zRHE3FBUOPrg2vGbdND+8xH4pFS8glJ//ul48rSUyzQuBYGfc0pV5LHfweSimbenfm
	tmVCaH88rw9BCGSbPPYeNWUnAWSflDdr+pPkuxCOZCDIFRwpT3jVOSpLqREdRYijuKo7W+
	GswzK7qNAs/TxRT5/iOFLdNKa7WB5tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEg7MKpZjByd67SNr+PQR26vbsLImbIOxem/Oi8qnsk=;
	b=IKqwW5AX/8S2fVav/jIfFgw2xO+ZaA2y3Rluvc1k14geqaAPvvnlZoXGKTgzbM+lWzX1+0
	usQkKZjypHmzEVBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEg7MKpZjByd67SNr+PQR26vbsLImbIOxem/Oi8qnsk=;
	b=goH1zRHE3FBUOPrg2vGbdND+8xH4pFS8glJ//ul48rSUyzQuBYGfc0pV5LHfweSimbenfm
	tmVCaH88rw9BCGSbPPYeNWUnAWSflDdr+pPkuxCOZCDIFRwpT3jVOSpLqREdRYijuKo7W+
	GswzK7qNAs/TxRT5/iOFLdNKa7WB5tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEg7MKpZjByd67SNr+PQR26vbsLImbIOxem/Oi8qnsk=;
	b=IKqwW5AX/8S2fVav/jIfFgw2xO+ZaA2y3Rluvc1k14geqaAPvvnlZoXGKTgzbM+lWzX1+0
	usQkKZjypHmzEVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7785713A2C;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gEPpG8zx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 86/88] ASoC: xtensa: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:48 +0100
Message-ID: <20250317095603.20073-87-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,suse.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xtensa/xtfpga-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 4eaa9011405f..678ded059b95 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -629,8 +629,8 @@ MODULE_DEVICE_TABLE(of, xtfpga_i2s_of_match);
 #endif
 
 static const struct dev_pm_ops xtfpga_i2s_pm_ops = {
-	SET_RUNTIME_PM_OPS(xtfpga_i2s_runtime_suspend,
-			   xtfpga_i2s_runtime_resume, NULL)
+	RUNTIME_PM_OPS(xtfpga_i2s_runtime_suspend,
+		       xtfpga_i2s_runtime_resume, NULL)
 };
 
 static struct platform_driver xtfpga_i2s_driver = {
@@ -639,7 +639,7 @@ static struct platform_driver xtfpga_i2s_driver = {
 	.driver  = {
 		.name = "xtfpga-i2s",
 		.of_match_table = of_match_ptr(xtfpga_i2s_of_match),
-		.pm = &xtfpga_i2s_pm_ops,
+		.pm = pm_ptr(&xtfpga_i2s_pm_ops),
 	},
 };
 
-- 
2.43.0

