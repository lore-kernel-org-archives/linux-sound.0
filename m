Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E41E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480430; cv=none; b=Gsq1LPh0toGYl/jYYtSwMzVrOJMMyqFeucYCj/oWZhoT4pfSOUzc53EwmNyNyC7eD9wAcboHAymeTLhevVwMTkBdjIQnFSWkE8rSpIb6zKU00UEaf7V1PWXxBXyxwRq8ZsV+i1fh2bCxWB/vvmBxL5uv285MVpwENo3Kx+DeE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480430; c=relaxed/simple;
	bh=Fb8I91GitNASQNJtFcJLz//mpMdfSy9gi5MekPR97HQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=G7QPBqu6xjj4fLRY2Yq5AukWPsK/+4rA8afJQUFJlNJCFbO1PetvbXhVmZH6fB1vIlgGLkZAzdkKGzUYEmk634xIQsHnhbkx21MQmxHeoZ11XU4TJbRfl3HVy4lfVCXdbyGDRnO6RDuQtkP6x8tZNtLnPAd4rkavn63vKS7VvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c6wiV/EG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QL9WA8Oj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c6wiV/EG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QL9WA8Oj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c6wiV/EG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QL9WA8Oj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c6wiV/EG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QL9WA8Oj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E2F75C266;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DgoOs6m8jLds0L95WCkZJQFOLqP2nb+X03j1dD+57oY=;
	b=c6wiV/EGlMxyjLSGba5AiPs3wP+yVdL54tZ9E+aPjndSlepRRTLNOp4bobY3rJW8rieWBK
	NqFFwEG0eWNgRZAUqF+SkWMje4RzYoxIJdE9PmnqXuBykuDICIdWplbS0Yd7fXkPnT2jvk
	3MldEDO3QwvSAX854VO5NrGmHCbCEKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DgoOs6m8jLds0L95WCkZJQFOLqP2nb+X03j1dD+57oY=;
	b=QL9WA8OjQ5FmGnC8zoBMVufDh3uXszxFNOzvJemr28AlSB6R0iIucRCqeIVu7N2lQaeQOI
	sL0kCsMR3YsE3cCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="c6wiV/EG";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QL9WA8Oj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DgoOs6m8jLds0L95WCkZJQFOLqP2nb+X03j1dD+57oY=;
	b=c6wiV/EGlMxyjLSGba5AiPs3wP+yVdL54tZ9E+aPjndSlepRRTLNOp4bobY3rJW8rieWBK
	NqFFwEG0eWNgRZAUqF+SkWMje4RzYoxIJdE9PmnqXuBykuDICIdWplbS0Yd7fXkPnT2jvk
	3MldEDO3QwvSAX854VO5NrGmHCbCEKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DgoOs6m8jLds0L95WCkZJQFOLqP2nb+X03j1dD+57oY=;
	b=QL9WA8OjQ5FmGnC8zoBMVufDh3uXszxFNOzvJemr28AlSB6R0iIucRCqeIVu7N2lQaeQOI
	sL0kCsMR3YsE3cCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1323213326;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1K5oA6XDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/19] ALSA: Use auto-cleanup for misc drivers
Date: Fri, 29 Aug 2025 17:13:14 +0200
Message-ID: <20250829151335.7342-1-tiwai@suse.de>
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
	TO_DN_NONE(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2E2F75C266
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Finally, this is the last piece in my large patch series -- applying
the auto-cleanup macros to the remaining legacy stuff such as
sound/i2c, sound/synth, etc.  Again, merely code cleanup / refactoring
and no functional changes are expected.


Takashi

===

Takashi Iwai (19):
  ALSA: i2c: Use guard() for mutex locks
  ALSA: i2c: Use guard() for spin locks
  ALSA: synth: Use guard() for mutex locks
  ALSA: synth: Use guard() for spin locks
  ALSA: synth: Use guard() for preset locks
  ALSA: x86: Use guard() for mutex locks
  ALSA: x86: Use guard() for spin locks
  ALSA: xen: Use guard() for mutex locks
  ALSA: at73c213: Use guard() for mutex locks
  ALSA: pdaudiocf: Use guard() for mutex locks
  ALSA: vxpocket: Use guard() for mutex locks
  ALSA: sparc: Use guard() for mutex locks
  ALSA: aoa: Use guard() for mutex locks
  ALSA: aaci: Use guard() for mutex locks
  ALSA: pxa2xx: Use guard() for mutex locks
  ALSA: atmel: Use guard() for mutex locks
  ALSA: ac97bus: Use guard() for mutex locks
  ALSA: virtio: Use guard() for spin locks
  ALSA: misc: Use guard() for spin locks

 include/sound/soundfont.h               |  18 ++++
 sound/ac97/bus.c                        |  22 ++---
 sound/aoa/codecs/onyx.c                 | 104 +++++++--------------
 sound/aoa/codecs/tas.c                  | 113 ++++++++---------------
 sound/aoa/core/gpio-feature.c           |  20 ++---
 sound/aoa/core/gpio-pmf.c               |  26 ++----
 sound/aoa/soundbus/i2sbus/pcm.c         |  76 ++++++----------
 sound/arm/aaci.c                        |  20 ++---
 sound/arm/pxa2xx-ac97-lib.c             |  12 +--
 sound/atmel/ac97c.c                     |  18 ++--
 sound/core/misc.c                       |  25 +++---
 sound/i2c/other/ak4113.c                |  54 ++++++-----
 sound/i2c/other/ak4114.c                |  39 ++++----
 sound/i2c/other/ak4117.c                |  40 ++++-----
 sound/pcmcia/pdaudiocf/pdaudiocf_core.c |   3 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c  |  25 +++---
 sound/pcmcia/vx/vxp_mixer.c             |   9 +-
 sound/pcmcia/vx/vxp_ops.c               |   6 +-
 sound/sparc/cs4231.c                    |  21 ++---
 sound/spi/at73c213.c                    |  39 +++-----
 sound/synth/emux/emux_effect.c          |  29 +++---
 sound/synth/emux/emux_proc.c            |   6 +-
 sound/synth/emux/emux_seq.c             |  17 ++--
 sound/synth/emux/emux_synth.c           |  54 +++--------
 sound/synth/emux/soundfont.c            | 115 +++++++-----------------
 sound/synth/util_mem.c                  |  17 ++--
 sound/virtio/virtio_card.c              |   8 +-
 sound/virtio/virtio_ctl_msg.c           |  23 ++---
 sound/virtio/virtio_pcm.c               |   8 +-
 sound/virtio/virtio_pcm_msg.c           |  17 +---
 sound/virtio/virtio_pcm_ops.c           |  56 ++++--------
 sound/x86/intel_hdmi_audio.c            | 109 +++++++++-------------
 sound/xen/xen_snd_front.c               |  80 ++++++++---------
 sound/xen/xen_snd_front_evtchnl.c       |  33 ++++---
 34 files changed, 468 insertions(+), 794 deletions(-)

-- 
2.50.1

