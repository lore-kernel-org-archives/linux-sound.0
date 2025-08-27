Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE73128C0
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280627; cv=none; b=FRUqBscUtvFSdXVa7ZA8JqggTB86v6YbxgrdmoIILKk4RrGFMHl7GJASnbHrAlIH/72HYrZ4kwF6rux6BwwHiSQtEvtXH14DHQt46c33mweORvp+vDswUO+I4JUV3emtnxSKSR6v0RMAGQWG0jiLwPxPsEC4UJ7sFsyCe8mAupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280627; c=relaxed/simple;
	bh=wGGKRK8gzPMmKC7h+a7I3ODlDETtGRx5ngA36KVtWok=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JMTp2BblT6GD7SccBbUyZSl8vnih2CdX0pYG+IYG106VQOzPugEvL6JyPa3cFW2EL7uyFS6HDhVC24wHzq7uoM7QCm6onAkcbParlKZ0i/f1GKXoXQGzsbtbSQGwsxSCLNhmwQoQRptq3F4QG2rkm2YuehY47Qfb1TlwIq6Fab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sGQL5GxL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z+HOKGSl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sGQL5GxL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z+HOKGSl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sGQL5GxL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+HOKGSl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sGQL5GxL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+HOKGSl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8956D22377;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hComJmOAXGsOKRdmP88HWuQouwqg4/QIwe7p1OEvk9s=;
	b=sGQL5GxLN9DWp59w4obZrizWuu4QUF685zZNJ4kgENN/fhVpPKaMSJUodmO80HtwaakuTC
	IfKV9mNaj+W13mDZrVsK4H1XcDt4rDLq82hEk6O8eE+vEziuVFMxH+SKbbT76dADelOKSx
	eudTty7XsYvZAa8IAAkBYhCEgnGOj9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hComJmOAXGsOKRdmP88HWuQouwqg4/QIwe7p1OEvk9s=;
	b=z+HOKGSlTISx79WjijSUb2ntBGL73QdH4lfRmuxLGcQeJJek2fw0n5WLuQWEXHyKrrwgbl
	hSYYqUxMRJkhb1Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sGQL5GxL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z+HOKGSl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hComJmOAXGsOKRdmP88HWuQouwqg4/QIwe7p1OEvk9s=;
	b=sGQL5GxLN9DWp59w4obZrizWuu4QUF685zZNJ4kgENN/fhVpPKaMSJUodmO80HtwaakuTC
	IfKV9mNaj+W13mDZrVsK4H1XcDt4rDLq82hEk6O8eE+vEziuVFMxH+SKbbT76dADelOKSx
	eudTty7XsYvZAa8IAAkBYhCEgnGOj9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hComJmOAXGsOKRdmP88HWuQouwqg4/QIwe7p1OEvk9s=;
	b=z+HOKGSlTISx79WjijSUb2ntBGL73QdH4lfRmuxLGcQeJJek2fw0n5WLuQWEXHyKrrwgbl
	hSYYqUxMRJkhb1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E64F13867;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YcmfGc+zrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/25] ALSA: hda: Use auto-cleanup macros
Date: Wed, 27 Aug 2025 09:28:40 +0200
Message-ID: <20250827072916.31933-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8956D22377
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This is a resubmission of a cleanup patch set for HD-audio using the
auto-cleanup macros like guard(), CLASS() and __free().

All patches are only about code refactoring and no behavior changes
intended.

v1->v2: Fix a couple of build errors with Clang W=1


Takashi

===

Takashi Iwai (25):
  ALSA: hda: Introduce auto cleanup macros for PM
  ALSA: hda/ca0132: Use cleanup macros for PM controls
  ALSA: hda/hdmi: Use cleanup macros for PM controls
  ALSA: hda/realtek: Use cleanup macros for PM controls
  ALSA: hda/common: Use cleanup macros for PM controls
  ALSA: hda: Use auto cleanup macros for DSP loader locks
  ALSA: hda/common: Use guard() for mutex locks
  ALSA: hda/core: Use guard() for mutex locks
  ALSA: hda/ca0132: Use guard() for mutex locks
  ALSA: hda/hdmi: Use guard() for mutex locks
  ALSA: hda/realtek: Use guard() for mutex locks and COEF locks
  ALSA: hda/cs35l41: Use guard() for mutex locks
  ALSA: hda/tas2781: Use guard() for mutex locks
  ALSA: hda/cs8409: Use guard() for mutex locks
  ALSA: hda/component: Use guard() for mutex locks
  ALSA: hda/generic: Use guard() for mutex locks
  ALSA: hda/analog: Use guard() for mutex locks
  ALSA: hda/intel: Use guard() for mutex locks
  ALSA: hda/common: Use auto cleanup for temporary buffers
  ALSA: hda/realtek: Use auto cleanup for temporary buffers
  ALSA: hda/generic: Use auto cleanup for temporary buffers
  ALSA: hda/ext: Use guard() for spinlocks
  ALSA: hda/core: Use guard() for spinlocks
  ALSA: hda/common: Use guard() for spinlocks
  ALSA: hda/intel: Use guard() for spinlocks

 include/sound/hda_codec.h                     |  30 ++
 include/sound/hdaudio.h                       |   1 +
 sound/hda/codecs/analog.c                     |   3 +-
 sound/hda/codecs/ca0132.c                     | 295 +++++++-----------
 sound/hda/codecs/cirrus/cs8409.c              |  22 +-
 sound/hda/codecs/generic.c                    |  76 ++---
 sound/hda/codecs/hdmi/hdmi.c                  | 199 +++++-------
 sound/hda/codecs/hdmi/nvhdmi-mcp.c            |   3 +-
 sound/hda/codecs/realtek/alc268.c             |   3 +-
 sound/hda/codecs/realtek/alc269.c             |   3 +-
 sound/hda/codecs/realtek/realtek.c            |  40 +--
 sound/hda/codecs/realtek/realtek.h            |  21 ++
 sound/hda/codecs/side-codecs/cs35l41_hda.c    | 110 +++----
 sound/hda/codecs/side-codecs/hda_component.c  |  15 +-
 sound/hda/codecs/side-codecs/hda_component.h  |   3 +-
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  |  53 +---
 sound/hda/common/codec.c                      | 129 ++++----
 sound/hda/common/controller.c                 | 124 ++++----
 sound/hda/common/proc.c                       |   4 +-
 sound/hda/common/sysfs.c                      | 110 +++----
 sound/hda/controllers/intel.c                 |  14 +-
 sound/hda/core/bus.c                          |   8 +-
 sound/hda/core/component.c                    |   6 +-
 sound/hda/core/controller.c                   |  58 ++--
 sound/hda/core/device.c                       |  23 +-
 sound/hda/core/ext/controller.c               |   6 +-
 sound/hda/core/ext/stream.c                   |  38 +--
 sound/hda/core/regmap.c                       |  35 +--
 sound/hda/core/stream.c                       |  34 +-
 29 files changed, 589 insertions(+), 877 deletions(-)

-- 
2.50.1

