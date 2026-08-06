Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5EF1EE7B7
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013084; cv=none; b=fLLiaezoqLLjV0NJ1/pihEbGde6ymg8uLnrjZN7LrpvsZGqEmiNOesgmFsNp8lJIpk02cDCMG/S+jYDdYAPBn0grk9GLeMSJRx135fyRTwtI1/mn6P+WKHZQs7DGyTB8dBlhhXVrHkR35bDCCGQlik8RRApOwpjSK8TtzYct890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013084; c=relaxed/simple;
	bh=o76vzrYVjyG6uQ/vMlm1bZv9Q6/Xz5uEFRy9/XdWC3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kk5vXd4pdd+57Rmghi60KwKsk0no1l/DAoTkEZrNNKeifphgFZM6Hfz7FfpD8Myg4eCirheVrTqQW2c/HJPPxAkgYGyxQbQ73hF+Q6ti2ysujCKfhE3gyOXiIpuTIJzJ2vsiJFZ6QVyQoSMaEjx5LEkQNfoNDLqyaUJRDRILVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zPwaxQwA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Js9Q6yta; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kF4AlozK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WsFbkT3I; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zPwaxQwA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Js9Q6yta";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kF4AlozK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WsFbkT3I"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B5BA3DF9;
	Thu,  6 Aug 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786013077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fTKMYxmZJiKulTFfRrvGo2Cc4HU/sTp+QwuU/n7BhmM=;
	b=zPwaxQwA7nVc6z59GejXdqmI2TaWPbpSixKRq0FFRGCZczswzsNG6u8OLVEwsJ3A31wuyC
	Hokb8UfyukNHbetadIu3eHotIome+JUDdFoQh1x8v/hkMBjEeAYK/wMqNzHZqkaXUWRfSz
	KRJV1+Dz5m+cSXkpvBrPthC3Y8ZRZeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786013077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fTKMYxmZJiKulTFfRrvGo2Cc4HU/sTp+QwuU/n7BhmM=;
	b=Js9Q6ytalryY5oWiSdbGEbz6RLZ+4rQho9ST0Y32BPy1vlFUaq1ugpQu+FOTbF85RowbDk
	FbdcDo6Pw2HxboAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kF4AlozK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WsFbkT3I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786013073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fTKMYxmZJiKulTFfRrvGo2Cc4HU/sTp+QwuU/n7BhmM=;
	b=kF4AlozKSZgayqpbyRCoHpvCnhJLOeTOCpVEXFzKWUtRMajc+EvN8Wiqrj+1krIyT16z4e
	jExD/FpaO7zBTwW31krAhYvOKI9qX+fMcoatM3t9ftnBr3IovhWzytjs1CrtFAik1Ct292
	ohbemBmDt5Q76Lwn5IV62atReV26bMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786013073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fTKMYxmZJiKulTFfRrvGo2Cc4HU/sTp+QwuU/n7BhmM=;
	b=WsFbkT3IZgUxySzLSGGGixfc7DBrRS0kwfem47/coV7ohxlmPbwJZwaC1G1fpOKAT6ZAvK
	wuKF1ES2VpxcHxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA6B4779BF;
	Thu,  6 Aug 2026 10:44:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tbMpNJBldGoydgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 10:44:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH] ALSA: hda: cix-ipbloq: Avoid build with 32bit archs
Date: Thu,  6 Aug 2026 12:44:14 +0200
Message-ID: <20260806104431.1300304-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:email,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 0B5BA3DF9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

The cix-ipbloq driver has an assumption of 64bit DMA address, and
building it for 32bit dma_addr_t leads to a sparse / compile warning.
Simply disable the builds for 32bit archs for avoiding such reports.

Fixes: d91e9bd10125 ("ALSA: hda: add CIX IPBLOQ HDA controller support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608061559.Kxqvi5LZ-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/controllers/Kconfig b/sound/hda/controllers/Kconfig
index 5d6a77e68588..26ca69b09a9c 100644
--- a/sound/hda/controllers/Kconfig
+++ b/sound/hda/controllers/Kconfig
@@ -33,6 +33,7 @@ config SND_HDA_TEGRA
 config SND_HDA_CIX_IPBLOQ
 	tristate "CIX IPBLOQ HD Audio"
 	depends on ARCH_CIX || COMPILE_TEST
+	depends on ARCH_DMA_ADDR_T_64BIT
 	select SND_HDA
 	select SND_HDA_ALIGNED_MMIO
 	help
-- 
2.55.0

