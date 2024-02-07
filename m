Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FD7FBBE
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321117; cv=none; b=WWu1bxFUjvYv8ZQyGYrbeSV4BAJBF6dzCDbXAnCUVabIlzt64P2INj8nUgUAy98T1/+XJWku7RLrsz/HagntG+l+peShtEPYq5nK0Wk0Ldrq9oZ0C27loRdLt+pwPxIiQPR4R7G5e0ee1n2fmY1jq2yFm4wzGv+m+Za1J91vFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321117; c=relaxed/simple;
	bh=NmPf/jBpDoas//7CAyrIy9m5BgQn9hY+qihYWHOvu2M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=pHgMU0W4IsvBK4vbAPRZAkAcNZ1BDAaPSJp5NfPwd2B3QOXOs/VK6qFEgCk3x7LIebTl6R6/jmAFW003GobgBLpRxyH7ui78/1mPap+CPoEG264d/WU+Eex8VzDHT0zuLmuTifLiOUgqgzRV8yUH1pY7Tw7yH95exZHHsVDqYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H4oUkUQe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aaDCOlHU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H4oUkUQe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aaDCOlHU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H4oUkUQe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aaDCOlHU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H4oUkUQe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aaDCOlHU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A83B222CF;
	Wed,  7 Feb 2024 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IrJUqY2AoZ/QkxGyEw0ZvRAV/q6PSLmM2/GsRHQd074=;
	b=H4oUkUQe1r+55D4IUluN+HVLpgg53cWvjSd87Y67x4Aq6/ElFB0N0tzlBNYFoN5CUq9iJz
	E03G64Y8vPDOQLmODp/Sv2w7zIr+oDz+WbMBOu9+YfTSEnWEkRup1uH/npS8SjJjv/bk+I
	1BStPZuFor6uqB/KqGeuOCOu/N6Sbo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IrJUqY2AoZ/QkxGyEw0ZvRAV/q6PSLmM2/GsRHQd074=;
	b=aaDCOlHU/nEU8prnXb8ACCvg6WUHDrdj6NjqQ6kS8eR1Q5AKgRjEPpSXsQpWIfOjcfE1X9
	25ObuBk2duCFqJAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IrJUqY2AoZ/QkxGyEw0ZvRAV/q6PSLmM2/GsRHQd074=;
	b=H4oUkUQe1r+55D4IUluN+HVLpgg53cWvjSd87Y67x4Aq6/ElFB0N0tzlBNYFoN5CUq9iJz
	E03G64Y8vPDOQLmODp/Sv2w7zIr+oDz+WbMBOu9+YfTSEnWEkRup1uH/npS8SjJjv/bk+I
	1BStPZuFor6uqB/KqGeuOCOu/N6Sbo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IrJUqY2AoZ/QkxGyEw0ZvRAV/q6PSLmM2/GsRHQd074=;
	b=aaDCOlHU/nEU8prnXb8ACCvg6WUHDrdj6NjqQ6kS8eR1Q5AKgRjEPpSXsQpWIfOjcfE1X9
	25ObuBk2duCFqJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C1AE139B9;
	Wed,  7 Feb 2024 15:51:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0PJ7ARqnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/29] ALSA: Clean up with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:11 +0100
Message-Id: <20240207155140.18238-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Hi,

this is a patch set to clean up the use of the deprecated
SIMPLE_DEV_PM_OPS() with DEFINE_SIPMLE_DEV_PM_OPS().

Most of changes are strightforward, but some needed tweaks, either
defining the dummy functions for non-PM configs or unconditionally
enabling a few bytes for the storage.

There are still a few leftover SIMPLE_DEV_PM_OPS() even after this
patch; those are with the lots of build dependencies, so the change
would be non-trivial.


Takashi

===

Takashi Iwai (29):
  ALSA: aloop: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: dummy: Replace with DEFINE_SIPMLE_DEV_PM_OPS()
  ALSA: pcsp: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: als300: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: atiixp: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: ens137x: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: intel8x0: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: nm256: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: aoa: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: aaci: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: pxa2xx-ac97: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ASoC: pxa2xx-ac97: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: at73c213: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: ali5451: Embed suspend image into struct snd_ali
  ALSA: ali5451: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: azt3328: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: cmipci: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: cs4281: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: echoaudio: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: es1938: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: es1968: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: fm801: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: maestro3: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: riptide: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: rme96: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: sis7019: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: via82xx: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: doc: Use DEFINE_SIMPLE_DEV_PM_OPS()

 .../kernel-api/writing-an-alsa-driver.rst     |  6 ++--
 include/sound/ak4531_codec.h                  |  3 ++
 include/sound/sb.h                            |  3 ++
 sound/aoa/fabrics/layout.c                    |  7 +---
 sound/arm/aaci.c                              | 10 ++----
 sound/arm/pxa2xx-ac97.c                       |  7 +---
 sound/drivers/aloop.c                         |  9 ++----
 sound/drivers/dummy.c                         |  9 ++----
 sound/drivers/pcsp/pcsp.c                     |  9 ++----
 sound/pci/ali5451/ali5451.c                   | 32 +++----------------
 sound/pci/als300.c                            |  9 ++----
 sound/pci/als4000.c                           |  9 ++----
 sound/pci/atiixp.c                            | 12 ++-----
 sound/pci/atiixp_modem.c                      | 11 ++-----
 sound/pci/azt3328.c                           | 11 ++-----
 sound/pci/cmipci.c                            | 11 ++-----
 sound/pci/cs4281.c                            | 13 ++------
 sound/pci/echoaudio/echoaudio.c               | 21 ++----------
 sound/pci/echoaudio/echoaudio.h               |  2 --
 sound/pci/ens1370.c                           |  9 ++----
 sound/pci/es1938.c                            | 11 ++-----
 sound/pci/es1968.c                            | 17 ++--------
 sound/pci/fm801.c                             | 11 ++-----
 sound/pci/intel8x0.c                          |  9 ++----
 sound/pci/intel8x0m.c                         |  9 ++----
 sound/pci/maestro3.c                          | 29 ++++++-----------
 sound/pci/nm256/nm256.c                       |  9 ++----
 sound/pci/riptide/riptide.c                   | 11 ++-----
 sound/pci/rme96.c                             | 30 ++++++-----------
 sound/pci/sis7019.c                           | 13 ++------
 sound/pci/via82xx.c                           | 15 ++-------
 sound/pci/via82xx_modem.c                     |  9 ++----
 sound/soc/pxa/pxa2xx-ac97.c                   |  6 +---
 sound/spi/at73c213.c                          | 11 ++-----
 34 files changed, 86 insertions(+), 307 deletions(-)

-- 
2.35.3

