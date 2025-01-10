Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68027211A1F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522676; cv=none; b=SoOYpubaBEGY/8gwNOksPsviTRKH2O68GVY354znEveUbC972RQcMubHTM20qebUeOymhM9vMzV7m5+8ARzwa8zXPHiYjpPdY743iPYY6Y69i4o5qVZ3uVbW3qxaCD4fW4H9VAq5ut4L1L5Rlu2mSjRwYrRBgNntaUzNSIRjKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522676; c=relaxed/simple;
	bh=EUvwfYZMYTlazCj5sAL5GiwWppYaO4WGwkEO2dgEBLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sbV6aGxEheB0yXd9EEAu7a53t0ANCOZc0q5w2buhNAq9NWSZci3sRnSbfdPqxESIgE3aFVYF8aLdFHTNmdE3kQQhk1VSGzdgz2CjGTMJ3SdRtQEL4wEffhZiq17QYbQC/02K2HoR+d3gm/JgsVrrJ/nUs8TkJiL2tAOkuyQljuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VhRxbwoN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lDbk4Tw6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VhRxbwoN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lDbk4Tw6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VhRxbwoN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lDbk4Tw6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VhRxbwoN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lDbk4Tw6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 699F92117E;
	Fri, 10 Jan 2025 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736522672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HZDIV+nNyreRrtrI/4nWn7okUOeDkSp0Fumjx6Z01yE=;
	b=VhRxbwoNZQTFrmTbYdG6OSRmEmHnh46VStU0R5pgG67KQ1i+JfJfeYKQcNgqfsPYP5WeuQ
	d0Z0fLwv1Y7QZeN2RizKJiKgT32GYUWlhytB5JkYCdAs6JD3MHide5ES2RDdStuvq/FXHX
	e38L0zgYMJN4FeHfbruLLDTuLoFq5J4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736522672;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HZDIV+nNyreRrtrI/4nWn7okUOeDkSp0Fumjx6Z01yE=;
	b=lDbk4Tw6YkTHeGXbt+XkeLt3ZeG/YVYxlqoPLh13yJCJHzfGbsVUzJ/tsRvbkOY5kVeZen
	lFS/QBislsqUo2Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VhRxbwoN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lDbk4Tw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736522672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HZDIV+nNyreRrtrI/4nWn7okUOeDkSp0Fumjx6Z01yE=;
	b=VhRxbwoNZQTFrmTbYdG6OSRmEmHnh46VStU0R5pgG67KQ1i+JfJfeYKQcNgqfsPYP5WeuQ
	d0Z0fLwv1Y7QZeN2RizKJiKgT32GYUWlhytB5JkYCdAs6JD3MHide5ES2RDdStuvq/FXHX
	e38L0zgYMJN4FeHfbruLLDTuLoFq5J4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736522672;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HZDIV+nNyreRrtrI/4nWn7okUOeDkSp0Fumjx6Z01yE=;
	b=lDbk4Tw6YkTHeGXbt+XkeLt3ZeG/YVYxlqoPLh13yJCJHzfGbsVUzJ/tsRvbkOY5kVeZen
	lFS/QBislsqUo2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49F6813763;
	Fri, 10 Jan 2025 15:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nBvVELA7gWczBwAAD6G6ig
	(envelope-from <aherrmann@suse.de>); Fri, 10 Jan 2025 15:24:32 +0000
From: Andreas Herrmann <aherrmann@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Andreas Herrmann <aherrmann@suse.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: [PATCH] ASoC: amd: Fix build dependency for SND_SOC_AMD_YC_MACH
Date: Fri, 10 Jan 2025 16:22:39 +0100
Message-ID: <20250110152324.20529-2-aherrmann@suse.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 699F92117E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,amd.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

Commit 4095cf872084 ("ASoC: amd: yc: Fix for enabling DMIC on acp6x
via _DSD entry") introduced usage of acpi_evaluate_integer in
acp6x-mach.c.

A kernel config which has

  # CONFIG_ACPI is not set
  CONFIG_SND_SOC_AMD_YC_MACH=y

causes following compile error

  sound/soc/amd/yc/acp6x-mach.c: In function ‘acp6x_probe’:
  sound/soc/amd/yc/acp6x-mach.c:580:15: error: implicit declaration of function ‘acpi_evaluate_integer’; did you mean ‘acpi_evaluate_object’? [-Wimplicit-function-declaration]
    580 |         ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
        |               ^~~~~~~~~~~~~~~~~~~~~
        |               acpi_evaluate_object

Thus ACPI is a new build dependency for SND_SOC_AMD_YC_MACH.

Fixes: 4095cf872084 ("ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry")
Signed-off-by: Andreas Herrmann <aherrmann@suse.de>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c7590d4989bb..803521178279 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -105,7 +105,7 @@ config SND_SOC_AMD_ACP6x
 config SND_SOC_AMD_YC_MACH
 	tristate "AMD YC support for DMIC"
 	select SND_SOC_DMIC
-	depends on SND_SOC_AMD_ACP6x
+	depends on SND_SOC_AMD_ACP6x && ACPI
 	help
 	  This option enables machine driver for Yellow Carp platform
 	  using dmic. ACP IP has PDM Decoder block with DMA controller.
-- 
2.47.1

