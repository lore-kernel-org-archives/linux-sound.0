Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D121F4CAA
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858012; cv=none; b=WLzYr4gxlkYSr56pK+EwbA40jkVfdgYolIf9mc9oeTxOGuHWgcpQsIOwudv/X/dGiXXusLPhQKAvQLJpefDrdpJc1r+HvNCoI80T3Kq4UgaGmePn/3awoGorz8LzAnZJZPIDV1RzXrBrFNFG3LUSL2niszp4ypJTVrYdkzgHT90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858012; c=relaxed/simple;
	bh=18JItluxug0lQLpVlK5e+bgszPLhv3WP+PP72DHtUuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPAXMxHceCtMSPvpGAXBSycjWwFOlrku8yD80EmuEi9s6bBvtUd4hmIjMkp/2qHkbAegIP39ImaxLM0ge+Ke2Fr7ZbcSkhvLaol0HCw4yHDlsTpZy9m6g44Q1QT+z8VLxy8o8F1m+rFBNxufu9uGISmjfSxEY6tjJmS7KTm9NPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fvm+E+cC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GVAQ4hRy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fvm+E+cC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GVAQ4hRy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fvm+E+cC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GVAQ4hRy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fvm+E+cC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GVAQ4hRy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9EE31F807;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvfkLlEThnzQRwX3MtXgUGTF41h5/Wch/QY6dWf83jE=;
	b=fvm+E+cCF2b2BsOtFQ5/xj3S0BQa+LVmS4+YfMpInhqdWAPAiHAUjoeFWqpo3YUsIprHrK
	bP/MYrNY/YZpMJcn7PSa7as8eEFOIIctqBIVd0rhWWUdWU9Y1p2CM7bE2JdCdatXnQklXz
	sCX8ECfYXTxo6uJ3EHhq13N/QpEDoug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvfkLlEThnzQRwX3MtXgUGTF41h5/Wch/QY6dWf83jE=;
	b=GVAQ4hRylD3wVwSYrrL9cJ96aFqKfA2t7siMOMebuc+4DmHI0bZj5UgO/K3lWqMV0S6Phz
	HF/6bdGRZqsXaUAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvfkLlEThnzQRwX3MtXgUGTF41h5/Wch/QY6dWf83jE=;
	b=fvm+E+cCF2b2BsOtFQ5/xj3S0BQa+LVmS4+YfMpInhqdWAPAiHAUjoeFWqpo3YUsIprHrK
	bP/MYrNY/YZpMJcn7PSa7as8eEFOIIctqBIVd0rhWWUdWU9Y1p2CM7bE2JdCdatXnQklXz
	sCX8ECfYXTxo6uJ3EHhq13N/QpEDoug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvfkLlEThnzQRwX3MtXgUGTF41h5/Wch/QY6dWf83jE=;
	b=GVAQ4hRylD3wVwSYrrL9cJ96aFqKfA2t7siMOMebuc+4DmHI0bZj5UgO/K3lWqMV0S6Phz
	HF/6bdGRZqsXaUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A97301388B;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kEwjKNK/iWigOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Jul 2025 06:46:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/3] ALSA: hda/cirrus: Enable drivers as default
Date: Wed, 30 Jul 2025 08:46:34 +0200
Message-ID: <20250730064639.25617-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730064639.25617-1-tiwai@suse.de>
References: <20250730064639.25617-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Like HD-audio Realtek drivers, Cirrus Logic HD-audio codec driver was
split to multiple drivers, too, and now users are forced to choose the
right kconfig items.

For smoother upgrade path, keep the previous
CONFIG_SND_HDA_CODEC_CIRRUS as the menuconfig.

The new kconfig CONFIG_SND_HDA_CODEC_CS42* are enabled as default, as
long as CONFIG_SND_HDA_CODEC_CIRRUS is set, so that the system with
Cirrus codec can keep working.

This is only about the default config, and each driver can be still
disabled if user wants to reduce the size, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/cirrus/Kconfig b/sound/hda/codecs/cirrus/Kconfig
index b3a5968e9a02..33cfe52713bc 100644
--- a/sound/hda/codecs/cirrus/Kconfig
+++ b/sound/hda/codecs/cirrus/Kconfig
@@ -1,8 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+menuconfig SND_HDA_CODEC_CIRRUS
+	tristate "Cirrus Logic HD-audio codec support"
+
+if SND_HDA_CODEC_CIRRUS
+
 config SND_HDA_CODEC_CS420X
 	tristate "Build Cirrus Logic CS420x codec support"
 	select SND_HDA_GENERIC
+	default y
 	help
 	  Say Y or M here to include Cirrus Logic CS420x codec support in
 	  snd-hda-intel driver
@@ -13,6 +19,7 @@ comment "Set to Y if you want auto-loading the codec driver"
 config SND_HDA_CODEC_CS421X
 	tristate "Build Cirrus Logic CS421x codec support"
 	select SND_HDA_GENERIC
+	default y
 	help
 	  Say Y or M here to include Cirrus Logic CS421x codec support in
 	  snd-hda-intel driver
@@ -29,3 +36,5 @@ config SND_HDA_CODEC_CS8409
 
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_CS8409=m
+
+endif
-- 
2.50.1

