Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877AE15ECEB
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090116; cv=none; b=nlQGm8Dg6dr9gGXSU0Ke3qgTBY0ANFvFv2G6hINxnDVobwW/gIN1y9mUP1XKWwS2MA0FZ9GcUeB89XzwA64aLFkMop++83a1vfPSGRtWDjuEQFYWOsQ98CSkPRoW9P9Kidaoi3L0Kku4kxXKqBTveiGg7tJF1OX+artG8ZkKgno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090116; c=relaxed/simple;
	bh=tvzxFeXV6BVMFTPGIVTsAEgUxlmSNsL1jJRegGTGnBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qm25kL/q7LiY8fiSvW+FnBeI12cgQmIMEav/G8m23kcKoXDyYvoKWsPesh0F+irvyJ10Fj59BbFlQhuaxuluThMp5M+/m+ZoBEZ5NZw+Ymc4MWpSovDqIFTOTLe6kCD8xklCBFkwjTan8UlCqYUaRHdVAVpW+Bda6nN3JyJDeuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D2559s1x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h2p8Ejs9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D2559s1x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h2p8Ejs9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D2559s1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2p8Ejs9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D2559s1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2p8Ejs9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 74A9A20AE1;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOYk4mKzeLwTJPIg7Vr1HvZZFZ10rfFhr5cS+Whs9MA=;
	b=D2559s1xmkLyPs29JjnmX+h7DhoPkPBz+pJfjaEk0N2MUWDfKFwD7i5ovgkbB8/+vqN3pL
	fJ+p35sYuG3vDGnvsQF2DSwAV6/7LRUf4NFZc8YEIT442FzWxfLUb8473F9qa//PTDv8n0
	4eQkJBeiRFDX4yugD148DW6Kys7MKtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOYk4mKzeLwTJPIg7Vr1HvZZFZ10rfFhr5cS+Whs9MA=;
	b=h2p8Ejs9gcf797LQIVjETd6Mnexd+HFLSpWzrj/lXsbSumyCT6vNTB4D0yKLl/CRkv3ne6
	UL96znrgeGdpGdBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOYk4mKzeLwTJPIg7Vr1HvZZFZ10rfFhr5cS+Whs9MA=;
	b=D2559s1xmkLyPs29JjnmX+h7DhoPkPBz+pJfjaEk0N2MUWDfKFwD7i5ovgkbB8/+vqN3pL
	fJ+p35sYuG3vDGnvsQF2DSwAV6/7LRUf4NFZc8YEIT442FzWxfLUb8473F9qa//PTDv8n0
	4eQkJBeiRFDX4yugD148DW6Kys7MKtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOYk4mKzeLwTJPIg7Vr1HvZZFZ10rfFhr5cS+Whs9MA=;
	b=h2p8Ejs9gcf797LQIVjETd6Mnexd+HFLSpWzrj/lXsbSumyCT6vNTB4D0yKLl/CRkv3ne6
	UL96znrgeGdpGdBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64C6413A2D;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMIUGLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:00 +0200
Message-ID: <20240507135513.14919-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

Hi,

this is a series of trivial cleanup patches for Makefile in sound/*
(modulo ASoC -- which will be submitted later in a separate series).

As Andy suggested in a patch review, *-objs suffix in Makefile is
basically a mis-use nowadays for kernel driver modules.  They should
be replaced with *-y suffix instead.  This is a result of systematic
conversions, separated per directory.


Takashi

===

Takashi Iwai (9):
  ALSA: core: Use *-y instead of *-objs in Makefile
  ALSA: pci: Use *-y instead of *-objs in Makefile
  ALSA: hda: Use *-y instead of *-objs in Makefile
  ALSA: isa: Use *-y instead of *-objs in Makefile
  ALSA: usb: Use *-y instead of *-objs in Makefile
  ALSA: drivers: Use *-y instead of *-objs in Makefile
  ALSA: firewire: Use *-y instead of *-objs in Makefile
  ALSA: aoa: Use *-y instead of *-objs in Makefile
  ALSA: misc: Use *-y instead of *-objs in Makefile

 sound/Makefile                     |  2 +-
 sound/aoa/codecs/Makefile          |  6 ++--
 sound/aoa/core/Makefile            |  2 +-
 sound/aoa/fabrics/Makefile         |  2 +-
 sound/aoa/soundbus/Makefile        |  2 +-
 sound/aoa/soundbus/i2sbus/Makefile |  2 +-
 sound/arm/Makefile                 |  4 +--
 sound/atmel/Makefile               |  2 +-
 sound/core/Makefile                | 18 +++++------
 sound/core/oss/Makefile            |  2 +-
 sound/core/seq/Makefile            | 14 ++++----
 sound/core/seq/oss/Makefile        |  2 +-
 sound/drivers/Makefile             | 18 +++++------
 sound/drivers/mpu401/Makefile      |  4 +--
 sound/drivers/opl3/Makefile        |  2 +-
 sound/drivers/opl4/Makefile        |  4 +--
 sound/drivers/pcsp/Makefile        |  2 +-
 sound/drivers/vx/Makefile          |  2 +-
 sound/firewire/Makefile            |  4 +--
 sound/firewire/bebob/Makefile      |  2 +-
 sound/firewire/dice/Makefile       |  2 +-
 sound/firewire/digi00x/Makefile    |  2 +-
 sound/firewire/fireface/Makefile   |  2 +-
 sound/firewire/fireworks/Makefile  |  2 +-
 sound/firewire/motu/Makefile       |  2 +-
 sound/firewire/oxfw/Makefile       |  2 +-
 sound/firewire/tascam/Makefile     |  2 +-
 sound/hda/Makefile                 |  8 ++---
 sound/hda/ext/Makefile             |  2 +-
 sound/i2c/Makefile                 |  6 ++--
 sound/i2c/other/Makefile           | 10 +++---
 sound/isa/Makefile                 | 18 +++++------
 sound/isa/ad1816a/Makefile         |  2 +-
 sound/isa/ad1848/Makefile          |  2 +-
 sound/isa/cs423x/Makefile          |  4 +--
 sound/isa/es1688/Makefile          |  4 +--
 sound/isa/galaxy/Makefile          |  4 +--
 sound/isa/gus/Makefile             | 12 +++----
 sound/isa/msnd/Makefile            |  6 ++--
 sound/isa/opti9xx/Makefile         |  8 ++---
 sound/isa/sb/Makefile              | 18 +++++------
 sound/isa/wavefront/Makefile       |  2 +-
 sound/isa/wss/Makefile             |  2 +-
 sound/mips/Makefile                |  4 +--
 sound/parisc/Makefile              |  2 +-
 sound/pci/Makefile                 | 48 +++++++++++++--------------
 sound/pci/ali5451/Makefile         |  2 +-
 sound/pci/asihpi/Makefile          |  2 +-
 sound/pci/au88x0/Makefile          |  6 ++--
 sound/pci/aw2/Makefile             |  2 +-
 sound/pci/ca0106/Makefile          |  2 +-
 sound/pci/ctxfi/Makefile           |  2 +-
 sound/pci/echoaudio/Makefile       | 28 ++++++++--------
 sound/pci/emu10k1/Makefile         |  6 ++--
 sound/pci/hda/Makefile             | 52 +++++++++++++++---------------
 sound/pci/ice1712/Makefile         |  6 ++--
 sound/pci/korg1212/Makefile        |  2 +-
 sound/pci/lx6464es/Makefile        |  2 +-
 sound/pci/mixart/Makefile          |  2 +-
 sound/pci/nm256/Makefile           |  2 +-
 sound/pci/oxygen/Makefile          |  8 ++---
 sound/pci/pcxhr/Makefile           |  2 +-
 sound/pci/riptide/Makefile         |  2 +-
 sound/pci/rme9652/Makefile         |  6 ++--
 sound/pci/trident/Makefile         |  2 +-
 sound/pci/vx222/Makefile           |  2 +-
 sound/pci/ymfpci/Makefile          |  2 +-
 sound/pcmcia/pdaudiocf/Makefile    |  2 +-
 sound/pcmcia/vx/Makefile           |  2 +-
 sound/ppc/Makefile                 |  2 +-
 sound/sh/Makefile                  |  4 +--
 sound/sparc/Makefile               |  6 ++--
 sound/spi/Makefile                 |  2 +-
 sound/synth/Makefile               |  2 +-
 sound/synth/emux/Makefile          |  2 +-
 sound/usb/6fire/Makefile           |  2 +-
 sound/usb/Makefile                 |  4 +--
 sound/usb/hiface/Makefile          |  2 +-
 sound/usb/misc/Makefile            |  2 +-
 sound/usb/usx2y/Makefile           |  4 +--
 sound/virtio/Makefile              |  2 +-
 sound/x86/Makefile                 |  2 +-
 sound/xen/Makefile                 |  2 +-
 83 files changed, 227 insertions(+), 227 deletions(-)

-- 
2.43.0

