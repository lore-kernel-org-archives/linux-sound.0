Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2013F16DEB5
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097335; cv=none; b=P6hCKk3JOVJAwJAO0qOnPdBZfyyfAyeIBqvU+syh0msZ9pOIlCptlXrtygOVn+tvvVwCvBp9kUw4H84kG+MVTrU4SmqBqZAw+bwSqi0kGdqDTukrYKltf7pkxKjVasTjuL5VyF835a+JlQV5bfLf7qO0gikp6ChMJIBzM2618/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097335; c=relaxed/simple;
	bh=NHgPTVgXY7rL2W3WvzysFZUv8DlPDHd5XvaB2WTcDoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujIP4o7SWtwu12vjatSi/ZUGVh72dNVqup8ZygiqNi51e7TKgVN5I4/8RuxuAupaLfxYbYOKO1lvMspPcGCtVG6pRPE2iuikXohnSSxqtQ23x0zHT0MaOfMig4xkLxRjDgsQ4UrergRIfDWZY/CJopgvIeV6YF9uRK+nkrTKveQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2WhubKAO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zhAHz28r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2WhubKAO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zhAHz28r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2WhubKAO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhAHz28r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2WhubKAO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhAHz28r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 625D221CB2;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1KPsJhuWZG19ju3QDk9TovcIynqyR4u6bykfKu7NCXg=;
	b=2WhubKAOBxzKgn6hnZDDWOfClEMwnLfYdFs1mECfTR0MXUDWpbWjVmC7U6zD8TPY0PuCnk
	5vtQvFpEe8k+EopVIPKiPEATkMKnl9P/TVgrTNGf9JsOSKzOOq/VT7Kt4nvSQxgr5EtfUh
	NWQDIClHA7WqfNHjNJrUpoYpQ8CbNZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1KPsJhuWZG19ju3QDk9TovcIynqyR4u6bykfKu7NCXg=;
	b=zhAHz28rd+//uCgpK61nx6UoMKQ5Wsnejq33iiQRwc0yhUlisYUOYVD2cR7kkKJ3fqD4x+
	Mqblddd1oM5msXDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1KPsJhuWZG19ju3QDk9TovcIynqyR4u6bykfKu7NCXg=;
	b=2WhubKAOBxzKgn6hnZDDWOfClEMwnLfYdFs1mECfTR0MXUDWpbWjVmC7U6zD8TPY0PuCnk
	5vtQvFpEe8k+EopVIPKiPEATkMKnl9P/TVgrTNGf9JsOSKzOOq/VT7Kt4nvSQxgr5EtfUh
	NWQDIClHA7WqfNHjNJrUpoYpQ8CbNZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1KPsJhuWZG19ju3QDk9TovcIynqyR4u6bykfKu7NCXg=;
	b=zhAHz28rd+//uCgpK61nx6UoMKQ5Wsnejq33iiQRwc0yhUlisYUOYVD2cR7kkKJ3fqD4x+
	Mqblddd1oM5msXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4353E13A2D;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3ttvDvJOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 00/34] ASoC: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:04 +0200
Message-ID: <20240507155540.24815-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]

Hi,

this is a series of trivial cleanup patches for ASoC to correct
the *-objs suffix in Makefile.  The other ALSA code has been covered
by a previous patch set
  https://lore.kernel.org/r/20240507135513.14919-1-tiwai@suse.de

As was suggested in a patch review, *-objs suffix in Makefile is
basically a wrong use nowadays for kernel driver modules.
They should be replaced with *-y suffix instead.
This is a result of systematic conversions, separated per directory.

Only lightly compile-tested.


Takashi

===

Takashi Iwai (34):
  ASoC: core: Use *-y instead of *-objs in Makefile
  ASoC: codecs: Use *-y instead of *-objs in Makefile
  ASoC: adi: Use *-y instead of *-objs in Makefile
  ASoC: amd: Use *-y instead of *-objs in Makefile
  ASoC: apple: Use *-y instead of *-objs in Makefile
  ASoC: atmel: Use *-y instead of *-objs in Makefile
  ASoC: au1x: Use *-y instead of *-objs Makefile
  ASoC: bcm: Use *-y instead of *-objs in Makefile
  ASoC: cirrus: Use *-y instead of *-objs in Makefile
  ASoC: fsl: Use *-y instead of *-objs in Makefile
  ASoC: generic: Use *-y instead of *-objs in Makefile
  ASoC: intel: Use *-y instead of *-objs in Makefile
  ASoC: jz4740: Use *-y instead of *-objs in Makefile
  ASoC: kirkwood: Use *-y instead of *-objs in Makefile
  ASoC: loongson: Use *-y instead of *-objs in Makefile
  ASoC: mediatek: Use *-y instead of *-objs in Makefile
  ASoC: meson: Use *-y instead of *-objs in Makefile
  ASoC: mxs: Use *-y instead of *-objs in Makefile
  ASoC: pxa: Use *-y instead of *-objs in Makefile
  ASoC: qcom: Use *-y instead of *-objs in Makefile
  ASoC: rockchip: Use *-y instead of *-objs in Makefile
  ASoC: samsung: Use *-y instead of *-objs in Makefile
  ASoC: sh: Use *-y instead of *-objs in Makefile
  ASoC: SOF: Use *-y instead of *-objs in Makefile
  ASoC: spear: Use *-y instead of *-objs in Makefile
  ASoC: sprd: Use *-y instead of *-objs in Makefile
  ASoC: sti: Use *-y instead of *-objs in Makefile
  ASoC: stm: Use *-y instead of *-objs in Makefile
  ASoC: tegra: Use *-y instead of *-objs in Makefile
  ASoC: ti: Use *-y instead of *-objs in Makefile
  ASoC: uniphier: Use *-y instead of *-objs in Makefile
  ASoC: ux500: Use *-y instead of *-objs in Makefile
  ASoC: xilinx: Use *-y instead of *-objs in Makefile
  ASoC: xtensa: Use *-y instead of *-objs in Makefile

 sound/soc/Makefile                     |  16 +-
 sound/soc/adi/Makefile                 |   4 +-
 sound/soc/amd/Makefile                 |  12 +-
 sound/soc/amd/acp/Makefile             |  26 +-
 sound/soc/amd/ps/Makefile              |   8 +-
 sound/soc/amd/raven/Makefile           |   6 +-
 sound/soc/amd/renoir/Makefile          |   6 +-
 sound/soc/amd/rpl/Makefile             |   2 +-
 sound/soc/amd/vangogh/Makefile         |   8 +-
 sound/soc/amd/yc/Makefile              |   6 +-
 sound/soc/apple/Makefile               |   2 +-
 sound/soc/atmel/Makefile               |  30 +-
 sound/soc/au1x/Makefile                |  16 +-
 sound/soc/bcm/Makefile                 |   6 +-
 sound/soc/cirrus/Makefile              |   6 +-
 sound/soc/codecs/Makefile              | 784 ++++++++++++-------------
 sound/soc/fsl/Makefile                 |  52 +-
 sound/soc/generic/Makefile             |  12 +-
 sound/soc/intel/atom/Makefile          |   2 +-
 sound/soc/intel/atom/sst/Makefile      |   6 +-
 sound/soc/intel/avs/Makefile           |  10 +-
 sound/soc/intel/avs/boards/Makefile    |  34 +-
 sound/soc/intel/boards/Makefile        |  84 +--
 sound/soc/intel/catpt/Makefile         |   2 +-
 sound/soc/intel/common/Makefile        |   8 +-
 sound/soc/intel/keembay/Makefile       |   2 +-
 sound/soc/intel/skylake/Makefile       |   6 +-
 sound/soc/jz4740/Makefile              |   2 +-
 sound/soc/kirkwood/Makefile            |   4 +-
 sound/soc/loongson/Makefile            |   4 +-
 sound/soc/mediatek/common/Makefile     |   4 +-
 sound/soc/mediatek/mt2701/Makefile     |   2 +-
 sound/soc/mediatek/mt6797/Makefile     |   2 +-
 sound/soc/mediatek/mt7986/Makefile     |   2 +-
 sound/soc/mediatek/mt8183/Makefile     |   2 +-
 sound/soc/mediatek/mt8186/Makefile     |   2 +-
 sound/soc/mediatek/mt8188/Makefile     |   2 +-
 sound/soc/mediatek/mt8192/Makefile     |   2 +-
 sound/soc/mediatek/mt8195/Makefile     |   2 +-
 sound/soc/meson/Makefile               |  50 +-
 sound/soc/mxs/Makefile                 |   6 +-
 sound/soc/pxa/Makefile                 |  12 +-
 sound/soc/qcom/Makefile                |  38 +-
 sound/soc/qcom/qdsp6/Makefile          |   4 +-
 sound/soc/rockchip/Makefile            |  16 +-
 sound/soc/samsung/Makefile             |  38 +-
 sound/soc/sh/Makefile                  |  16 +-
 sound/soc/sh/rcar/Makefile             |   2 +-
 sound/soc/sof/Makefile                 |  30 +-
 sound/soc/sof/amd/Makefile             |  10 +-
 sound/soc/sof/imx/Makefile             |   8 +-
 sound/soc/sof/intel/Makefile           |  30 +-
 sound/soc/sof/mediatek/mt8186/Makefile |   2 +-
 sound/soc/sof/mediatek/mt8195/Makefile |   2 +-
 sound/soc/sof/xtensa/Makefile          |   2 +-
 sound/soc/spear/Makefile               |   6 +-
 sound/soc/sprd/Makefile                |   2 +-
 sound/soc/sti/Makefile                 |   2 +-
 sound/soc/stm/Makefile                 |   8 +-
 sound/soc/tegra/Makefile               |  46 +-
 sound/soc/ti/Makefile                  |  36 +-
 sound/soc/uniphier/Makefile            |   8 +-
 sound/soc/ux500/Makefile               |   6 +-
 sound/soc/xilinx/Makefile              |   6 +-
 sound/soc/xtensa/Makefile              |   2 +-
 65 files changed, 787 insertions(+), 787 deletions(-)

-- 
2.43.0

