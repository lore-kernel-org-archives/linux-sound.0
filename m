Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1A346AD7
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894005; cv=none; b=IY+faclALDMiNvB9o8pRPVrPllwITT+QN0U+9MpJWZ+r7CbfPng8QdqQIzjei0XUgBsC/2Dgk2g+G47YaobQlLw5FGdcFhM7i3kxPWe2pHXN2hRYqI9zgI9/a+rsDekURCwLIPe+qgJkuxn425DCGcd6Ydd6+qkio2u6V5mZGEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894005; c=relaxed/simple;
	bh=Hx9k3Au0tGj22wVmjOMaK6K69pSmVjZe8PLfWBaagpw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L+LjC53xNuoIXglNR8B0SwAmIqiS2X2b7zFK8jjt2AIfxiVu++39IfN1U9YVIRmKw+0tHsr5q932lagK+DJW+Ka2u73JfJubsloC1L0xpvsPuvA6NPEBqSn6pyEr3HwtAX297A57k7Bp3tRF/uc+yOSIU7CP13pa4Wkkm2RHfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vrfi0+vi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xL5OVQuh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vrfi0+vi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xL5OVQuh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vrfi0+vi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xL5OVQuh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vrfi0+vi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xL5OVQuh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83DDF336A3;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e2eekyOSyXiHuhv/tdR+dBaBdxhRncB+rf+9r5gcWQc=;
	b=Vrfi0+viMafM30duVl2snIeffXcG05EKYaNJrvWxVRfubGj9nQq4UH5bi7LaIxpqfL5auu
	SxdFjrRnGykOb2vOhWTROjwGoHer/Plf6Bv3sRpPiYCF8JiJ2iqeC87dfxyRRE8u6jiSRk
	PwdhBc0m8wKce7W2D3S0HLLEp/o0AMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e2eekyOSyXiHuhv/tdR+dBaBdxhRncB+rf+9r5gcWQc=;
	b=xL5OVQuhBAxrXiqsLGrUeG/oEsUjpnC0vyCKJp5/yqVqYuaAWbCcu10dbAP5QAdWR9CO0M
	g8f8XIXH1p0V2pBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e2eekyOSyXiHuhv/tdR+dBaBdxhRncB+rf+9r5gcWQc=;
	b=Vrfi0+viMafM30duVl2snIeffXcG05EKYaNJrvWxVRfubGj9nQq4UH5bi7LaIxpqfL5auu
	SxdFjrRnGykOb2vOhWTROjwGoHer/Plf6Bv3sRpPiYCF8JiJ2iqeC87dfxyRRE8u6jiSRk
	PwdhBc0m8wKce7W2D3S0HLLEp/o0AMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e2eekyOSyXiHuhv/tdR+dBaBdxhRncB+rf+9r5gcWQc=;
	b=xL5OVQuhBAxrXiqsLGrUeG/oEsUjpnC0vyCKJp5/yqVqYuaAWbCcu10dbAP5QAdWR9CO0M
	g8f8XIXH1p0V2pBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 763303EA63;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aGAvHHJnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/11] ALSA: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:22 +0100
Message-ID: <20251216140634.171890-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.933];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.79

This is a series of corrections where __free() variable declarations
have been used with NULL initialization.  This was the standard way in
the past, but now the rule was relaxed and we should rather move the
__free() variable declarations at the actually used place.

There should be no functional changes.


Takashi

===

Takashi Iwai (11):
  ALSA: compress_offload: Relax __free() variable declarations
  ALSA: control: Relax __free() variable declarations
  ALSA: pcm: Relax __free() variable declarations
  ALSA: oss: Relax __free() variable declarations
  ALSA: seq: oss: Relax __free() variable declarations
  ALSA: seq: Relax __free() variable declarations
  ALSA: timer: Relax __free() variable declarations
  ALSA: vmaster: Relax __free() variable declarations
  ALSA: hda: Relax __free() variable declarations
  ALSA: usx2y: Relax __free() variable declarations
  ALSA: usb-audio: Relax __free() variable declarations

 sound/core/compress_offload.c        |  28 +++--
 sound/core/control.c                 |  12 +-
 sound/core/control_compat.c          |  21 ++--
 sound/core/control_led.c             |  12 +-
 sound/core/oss/mixer_oss.c           |  64 +++++-----
 sound/core/oss/pcm_oss.c             |  19 +--
 sound/core/pcm.c                     |   4 +-
 sound/core/pcm_compat.c              |   9 +-
 sound/core/pcm_native.c              |  50 ++++----
 sound/core/seq/oss/seq_oss_init.c    |   4 +-
 sound/core/seq/oss/seq_oss_midi.c    |  45 ++++---
 sound/core/seq/oss/seq_oss_synth.c   |  23 ++--
 sound/core/seq/seq_clientmgr.c       | 171 ++++++++++++++-------------
 sound/core/seq/seq_compat.c          |   4 +-
 sound/core/seq/seq_midi.c            |  10 +-
 sound/core/seq/seq_ports.c           |  11 +-
 sound/core/seq/seq_queue.c           |  32 ++---
 sound/core/seq/seq_ump_client.c      |  16 +--
 sound/core/seq/seq_virmidi.c         |   4 +-
 sound/core/timer.c                   |  12 +-
 sound/core/vmaster.c                 |  12 +-
 sound/hda/codecs/generic.c           |   4 +-
 sound/hda/codecs/realtek/alc269.c    |   4 +-
 sound/hda/codecs/realtek/realtek.c   |   5 +-
 sound/hda/common/codec.c             |   4 +-
 sound/hda/common/sysfs.c             |   5 +-
 sound/usb/fcp.c                      |  36 +++---
 sound/usb/mixer_scarlett2.c          |  21 ++--
 sound/usb/quirks.c                   |  13 +-
 sound/usb/usx2y/us144mkii.c          |   4 +-
 sound/usb/usx2y/us144mkii_controls.c |   4 +-
 sound/usb/usx2y/us144mkii_pcm.c      |   4 +-
 32 files changed, 343 insertions(+), 324 deletions(-)

-- 
2.52.0

