Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125C3257D
	for <linux-sound@vger.kernel.org>; Mon, 20 Jan 2025 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359220; cv=none; b=oDVkoOJM1rahwoqbarPN6ZQ/bJ6B3EobM/SE/ZXLATXF8wdre3lkD9ytt6VKIzo55oMCvazPyS6PsM8RTfIYl8HsKfMYPEJOTEwFPgJF/JgIyEHXJJjtalfqlOCf6CrkPIar75HevXBFAJ6sFpFkNFvPnJdIXYBSHA7ryMNTUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359220; c=relaxed/simple;
	bh=sAFyhA3whxrd22p14FtdrrnxcrdCGRQCZCaTrh/zQcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwe9sTCYV8XPaGi4Svxw81witEKiu3yzHuuMynAlyN0zGn4heFqmwkXqyfsH0NN4ZE8IQo394GbOO152bI2jJQwYqmjPebpKENtkN05swJnNOl4xk3zhg7zbdyoijcPne5nmISF7H4IxILQWyMR+wYM/JsIgIlhbVlU71dB0AT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m/4cFEK+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UeEIvoqx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=byhhlw0p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7WQkBdPo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m/4cFEK+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UeEIvoqx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="byhhlw0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7WQkBdPo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFC2F21160;
	Mon, 20 Jan 2025 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737359217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8ltlXY8BbkEFsu2mz78AvUa0mGrqlsjas7R6ZEAuH+0=;
	b=m/4cFEK+JDX9DG0/jTSArhwxAvNl30Mz+EKojI3wWs7tWG0jFYzZSOyKCQjyv9rjr76/ER
	5UcaM9RZv/zvxfoa/0KUzSkVVGEonCVyrc2fDM/ZUqbYqBxUHUWOMerO26o+euS79RFtC0
	Ry5XVQGm9k06+Qjb8jJlBzgzBc6oQA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737359217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8ltlXY8BbkEFsu2mz78AvUa0mGrqlsjas7R6ZEAuH+0=;
	b=UeEIvoqxPxlsjRELeb4GIiVbmro6c2oG9URUuT41+ltQrXcWRS41Ow/ItqkQck50H0Nf//
	Ove8SQ46aLRhTRBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=byhhlw0p;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7WQkBdPo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737359216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8ltlXY8BbkEFsu2mz78AvUa0mGrqlsjas7R6ZEAuH+0=;
	b=byhhlw0p8pPEt5p9ptUPWpqRsRrGAfQt/ijGX5hYgYg6tpTHRxgoyrYpqXfFCIgGqZI5iy
	ThSxYu7GmNTPtexOn033LBCA9+jeJKHIBuBtFdGIpeEIWwIjySuG9at1KaAJ0LXC0NEoeu
	/HkKHwVwyTFIbUqIpQBSyTMsx6lVL/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737359216;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8ltlXY8BbkEFsu2mz78AvUa0mGrqlsjas7R6ZEAuH+0=;
	b=7WQkBdPoegXGCoQTppYjhpP2ljsj0+YHK8z1gWfNP33yFSoiyAVQrrtTGvMgjCT79mKPLp
	g84FJmRU0awuDSBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A72AD1393E;
	Mon, 20 Jan 2025 07:46:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 95RMJnD/jWevOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 07:46:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Eric Biggers <ebiggers@kernel.org>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH] ALSA: hda: tas2781-spi: select CRC32 instead of CRC32_SARWATE
Date: Mon, 20 Jan 2025 08:46:54 +0100
Message-ID: <20250120074655.922-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CFC2F21160
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Just like the I2C driver (as in commit 86c96e7289c5 "ALSA:
hda/tas2781: select CRC32 instead of CRC32_SARWATE"), the new tas2781
SPI driver has to select CONFIG_CRC32 instead of
CONFIG_CRC32_SARWATE for fixing the build failures.

Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Link: https://lore.kernel.org/20250120181744.6433557e@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index ca3f5b69b521..e393578cbe68 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -212,7 +212,7 @@ config SND_HDA_SCODEC_TAS2781_SPI
 	depends on ACPI
 	depends on EFI
 	depends on SND_SOC
-	select CRC32_SARWATE
+	select CRC32
 	help
 	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
 	  in snd-hda-intel driver, such as ALC287.
-- 
2.43.0

