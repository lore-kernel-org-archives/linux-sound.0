Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F16B4C74;
	Thu, 26 Dec 2024 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735229818; cv=none; b=C7y0+JSH3EAAkT5ggliHBiKGIi8KK2OaIB7Cz1rGHM2vxRvoGd88Nxl/fuQgOU8LiGAPWYQORt8iK/PemrkRZriOEdKBvg50Yjj6tmAlSxDYhfOSTzZQfof3FcwZTUZ8U9HuyB2koremcn9Ixiv8/oRqjIqd6KDOG9GMU7BLaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735229818; c=relaxed/simple;
	bh=39KHIPoOjwJMJ6mMfym61Q9nL7Qy415lVjdApdi6vh0=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=dyl9M4s8trTaIF5kj5nxp0pWL+yD2wuJ1//2me6d32k2J4olkZ+jxBbxYe/ht7ML9l/xfU0LHv25dVmyCL8flkLOva2HSLm3JHyPOUzVSbI+dPktP+YPzS3UggLYQGW3XFsWO5aCTrXo71arNm67Pl714tx0xgNhszMcJmt9wHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VCmWyxS/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uiXFaxWZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VCmWyxS/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uiXFaxWZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VCmWyxS/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uiXFaxWZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VCmWyxS/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uiXFaxWZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 34E2A336E7;
	Thu, 26 Dec 2024 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735229815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=D4id4AkwPYMofctqBcaPajuGDopgWnu8R4oQsrv3SoM=;
	b=VCmWyxS/QlaT1fyntesvrU/yB7D9ZIhf5eYuqc49P9EVRMG6rhtEZef5sLIxccrm0eYxT2
	qOE13P4dqG4IhKYQXN/yI3Zjk66N3rLh6XoLo8evlvDwuwGkFR07CqewJs9nfGlXYl5hKN
	QGdzOajRIUmJHssreu2oXcEQtEjyjG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735229815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=D4id4AkwPYMofctqBcaPajuGDopgWnu8R4oQsrv3SoM=;
	b=uiXFaxWZY5dLOAy/vPk6Dvjha3dN/5UtwXiM896k/EqUx2u3i6VxfthOEIoqLXGqncgJqJ
	rpWDlTHVSX3uYoDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735229815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=D4id4AkwPYMofctqBcaPajuGDopgWnu8R4oQsrv3SoM=;
	b=VCmWyxS/QlaT1fyntesvrU/yB7D9ZIhf5eYuqc49P9EVRMG6rhtEZef5sLIxccrm0eYxT2
	qOE13P4dqG4IhKYQXN/yI3Zjk66N3rLh6XoLo8evlvDwuwGkFR07CqewJs9nfGlXYl5hKN
	QGdzOajRIUmJHssreu2oXcEQtEjyjG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735229815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=D4id4AkwPYMofctqBcaPajuGDopgWnu8R4oQsrv3SoM=;
	b=uiXFaxWZY5dLOAy/vPk6Dvjha3dN/5UtwXiM896k/EqUx2u3i6VxfthOEIoqLXGqncgJqJ
	rpWDlTHVSX3uYoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFB9F13999;
	Thu, 26 Dec 2024 16:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rICjK3aBbWeQYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Dec 2024 16:16:54 +0000
Date: Thu, 26 Dec 2024 17:16:45 +0100
Message-ID: <87zfki5sia.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.13-rc5
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

Linus,

please pull sound fixes for v6.13-rc5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13-rc5

The topmost commit is 8cbd01ba9c38eb16f3a572300da486ac544519b7

----------------------------------------------------------------

sound fixes for 6.13-rc5

A collection of small fixes.  Nothing really stands out, fortunately.

- Follow-up fixes for the new compress offload API extension
- A few ASoC SOF, AMD and Mediatek quirks and fixes
- A regression fix in legacy SH driver cleanup
- Fix DMA mapping error handling in the helper code
- Fix kselftest dependency

----------------------------------------------------------------

Arnd Bergmann (2):
      ALSA: compress_offload: import DMA_BUF namespace
      ALSA: compress_offload: avoid 64-bit get_user()

Chen-Yu Tsai (2):
      ASoC: dt-bindings: realtek,rt5645: Fix CPVDD voltage comment
      ASoC: mediatek: disable buffer pre-allocation

Fedor Pchelkin (1):
      ALSA: memalloc: prefer dma_mapping_error() over explicit address checking

Jaroslav Kysela (2):
      ALSA: compress_offload: use safe list iteration in snd_compr_task_seq()
      ALSA: compress_offload: improve file descriptors installation for dma-buf

Li Zhijian (1):
      selftests/alsa: Fix circular dependency involving global-timer

Peter Ujfalusi (1):
      ASoC: SOF: Intel: hda-dai: Do not release the link DMA on STOP

Richard Fitzgerald (2):
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB

Shuming Fan (1):
      ASoC: rt722: add delay time to wait for the calibration procedure

Takashi Iwai (1):
      ALSA: sh: Fix wrong argument order for copy_from_iter()

Venkata Prasad Potturu (1):
      ASoC: amd: ps: Fix for enabling DMIC on acp63 platform via _DSD entry

---
 .../devicetree/bindings/sound/realtek,rt5645.yaml  |  2 +-
 sound/core/compress_offload.c                      | 33 ++++++++++++++--------
 sound/core/memalloc.c                              |  2 +-
 sound/sh/sh_dac_audio.c                            |  2 +-
 sound/soc/amd/ps/pci-ps.c                          | 17 ++++++++++-
 sound/soc/codecs/rt722-sdca.c                      |  7 ++++-
 sound/soc/intel/boards/sof_sdw.c                   | 23 +++++++++++++--
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |  4 +--
 sound/soc/sof/intel/hda-dai.c                      | 25 ++++++++++++----
 sound/soc/sof/intel/hda.h                          |  2 --
 tools/testing/selftests/alsa/Makefile              |  2 +-
 11 files changed, 88 insertions(+), 31 deletions(-)

