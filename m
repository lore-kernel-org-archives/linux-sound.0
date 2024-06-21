Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE089259C
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955535; cv=none; b=hDrDQ7XFwe4rlecXOGSx505nIBIcsu+3JQEFjBKpFS/HRkS6+uHIhKovBOVAbktUN61molXEB0Az0yBAmLyLhaF/WRmy4JyoAi7JqZslWD3jukp/A6yivlpRgTekNUmtziAOmqA1qYHcCdRYwQ67xjPWsIEu0CfWNsPOAv3x5sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955535; c=relaxed/simple;
	bh=eawmFnpITWSBnXwP/D0WYDwHPKfGhTdvUa9ocISpgPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZGLusLx0iZvZDFSxV1/WTYLyudUIL4ZthiX+PC3v4j8P/MyUPNMA+pUNbTDpY4/PN484kgLD3uA8GYDtwOCLoapH0gvozFRHeq6piZgYnQVR3gOHPufMJbrQ5HVDMp9lMm+5TErpT3V53CEaGl0qvtWKJRT80ErV7RLI6HhxzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BTadA6fR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dKKKmYz6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BTadA6fR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dKKKmYz6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BTadA6fR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dKKKmYz6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BTadA6fR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dKKKmYz6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7F3F21A49;
	Fri, 21 Jun 2024 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718955531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BoO6MTYhn6dlLifRgiKAidAE5p0zDLwrw9Dx1B8Nzns=;
	b=BTadA6fRcNorJN61T7RPPWsO5pmnL8GDY+AnsRTxFI+3yWRNOTnUOGZWx1M+OqLWjva2iH
	s46V5VM1EaiQ/MUIkOvV9NE68uQxaO1WYKvXnXSOyf0qJ31V7w4GYoV7QEQM4hJvEIyNJ2
	BfpO+z4kAXgvfwUuycKP0jgFeR1MIR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718955531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BoO6MTYhn6dlLifRgiKAidAE5p0zDLwrw9Dx1B8Nzns=;
	b=dKKKmYz6kaO3jRlRdCUjkR95XzLAyfu7gIQ1Isoq7zvRM4xIWsfjoyhH6PcT8POH5Yw8Eo
	zKBhNetJNvQHXCDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BTadA6fR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dKKKmYz6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718955531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BoO6MTYhn6dlLifRgiKAidAE5p0zDLwrw9Dx1B8Nzns=;
	b=BTadA6fRcNorJN61T7RPPWsO5pmnL8GDY+AnsRTxFI+3yWRNOTnUOGZWx1M+OqLWjva2iH
	s46V5VM1EaiQ/MUIkOvV9NE68uQxaO1WYKvXnXSOyf0qJ31V7w4GYoV7QEQM4hJvEIyNJ2
	BfpO+z4kAXgvfwUuycKP0jgFeR1MIR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718955531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BoO6MTYhn6dlLifRgiKAidAE5p0zDLwrw9Dx1B8Nzns=;
	b=dKKKmYz6kaO3jRlRdCUjkR95XzLAyfu7gIQ1Isoq7zvRM4xIWsfjoyhH6PcT8POH5Yw8Eo
	zKBhNetJNvQHXCDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96AED13AAA;
	Fri, 21 Jun 2024 07:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iVaLIwsudWYnGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Jun 2024 07:38:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: Use imply for suggesting CONFIG_SERIAL_MULTI_INSTANTIATE
Date: Fri, 21 Jun 2024 09:39:09 +0200
Message-ID: <20240621073915.19576-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7F3F21A49
X-Spam-Score: -2.55
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.55 / 50.00];
	BAYES_HAM(-2.54)[97.92%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

The recent fix introduced a reverse selection of
CONFIG_SERIAL_MULTI_INSTANTIATE, but its condition isn't always met.
Use a weak reverse selection to suggest the config for avoiding such
inconsistencies, instead.

Fixes: 9b1effff19cd ("ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406210732.ozgk8IMK-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202406211244.oLhoF3My-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index e59df40a0007..a3cf0725fc43 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -162,7 +162,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
 	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
 	select FW_CS_DSP
-	select SERIAL_MULTI_INSTANTIATE
+	imply SERIAL_MULTI_INSTANTIATE
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L56_SHARED
 	select SND_HDA_SCODEC_CS35L56
@@ -179,7 +179,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
 	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
 	select FW_CS_DSP
-	select SERIAL_MULTI_INSTANTIATE
+	imply SERIAL_MULTI_INSTANTIATE
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L56_SHARED
 	select SND_HDA_SCODEC_CS35L56
-- 
2.43.0

