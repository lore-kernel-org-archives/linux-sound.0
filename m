Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDAA30F959
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168993; cv=none; b=G4w1jpjlq2CPMFuCmGPPD8+aIcrVbyBQGo+qOO7K0aocqWZ2EuarG65R/FKifCVCzkZim4cnj/n5/tI/qPjQuh7q8TiEQolNxiHo4AOGN/ECSePFiQmoCHR0NIovoxWWmCd5y0lWWPC+uBzWpNnXfX00i2thI4yqac9A6vlcxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168993; c=relaxed/simple;
	bh=0aqfPZXimnPZVhJAxshjlLBlkd4wyEY4PVre9JK6lzA=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=Avxtzs3lARHFAOyJSlbd2cD3L3E95B25+mConcL9NqsR9mOVXnyT5DT6lvc5Ljzk1dWNx9gKcLF4syZY+ij9XdSwQJe7PJWfzJXqMh+QxdtMF9+CP6PjU1XSbEQ8cHDy6SoHoPkO2j76Vp2U9WYvS/MVZ86hxKaGZwPLg6DW8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D6fq5A2C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SOxmbI7V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D6fq5A2C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SOxmbI7V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D6fq5A2C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SOxmbI7V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D6fq5A2C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SOxmbI7V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D49AD337C5;
	Fri, 23 Jan 2026 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VueNaQXQDF7KioeJA4An5x+j6Ml5OPRTxnAOeK+mbu4=;
	b=D6fq5A2CuvBmwLTufXCKcXB0NDOnfc03WDvflCXdO+q9ugicDSQs0sujtICQnQ0UQWB22K
	kS5nak/qWpKWHW6uQ2eNspWXP9xu/mnEMO2EsgZc2MswrEkZd8Sxsd3poyRvzDL+mgWtuI
	dU34l4U0kPEQeq76fpNZxk6GRTchO3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VueNaQXQDF7KioeJA4An5x+j6Ml5OPRTxnAOeK+mbu4=;
	b=SOxmbI7VJfYOcM/2vjFOTkk8HEavU3xz4qDxGS1oOJRbQCocfKR/Y4cHLC5m8I2DJwLy9S
	UqeH4wjk1EiOi/Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VueNaQXQDF7KioeJA4An5x+j6Ml5OPRTxnAOeK+mbu4=;
	b=D6fq5A2CuvBmwLTufXCKcXB0NDOnfc03WDvflCXdO+q9ugicDSQs0sujtICQnQ0UQWB22K
	kS5nak/qWpKWHW6uQ2eNspWXP9xu/mnEMO2EsgZc2MswrEkZd8Sxsd3poyRvzDL+mgWtuI
	dU34l4U0kPEQeq76fpNZxk6GRTchO3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VueNaQXQDF7KioeJA4An5x+j6Ml5OPRTxnAOeK+mbu4=;
	b=SOxmbI7VJfYOcM/2vjFOTkk8HEavU3xz4qDxGS1oOJRbQCocfKR/Y4cHLC5m8I2DJwLy9S
	UqeH4wjk1EiOi/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAE6E136AA;
	Fri, 23 Jan 2026 11:49:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Spx7KF1gc2l+CAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 11:49:49 +0000
Date: Fri, 23 Jan 2026 12:49:49 +0100
Message-ID: <878qdoft0i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19-rc7
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

Linus,

please pull sound fixes for v6.19-rc7 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc7

The topmost commit is 64e0924ed3b446fdd758dfab582e0e961863a116

----------------------------------------------------------------

sound fixes for 6.19-rc7

A collection of a few more small fixes for HD- and USB-audio,
including a regression fix for the OOB fix that was included in
the previous PR.

----------------------------------------------------------------

Arun Raghavan (1):
      ALSA: usb: Increase volume range that triggers a warning

Berk Cem Goksel (1):
      ALSA: usb-audio: Fix use-after-free in snd_usb_mixer_free()

LeeYongjun (1):
      selftests: ALSA: Remove unused variable in utimer-test

Lianqin Hu (1):
      ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti

Martin Hamilton (1):
      ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Book 9i 13IRU8 audio

Samasth Norway Ananda (1):
      ALSA: scarlett2: Fix buffer overflow in config retrieval

Takashi Iwai (2):
      ALSA: ctxfi: Fix potential OOB access in audio mixer handling
      ALSA: usb-audio: Use the right limit for PCM OOB check

Tim Guttzeit (1):
      ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU

Zhang Heng (1):
      ALSA: hda/realtek: Add quirk for Samsung 730QED to fix headphone

---
 sound/hda/codecs/realtek/alc269.c          | 29 ++++++++++++++++++++++++++++-
 sound/pci/ctxfi/ctamixer.c                 |  2 ++
 sound/usb/mixer.c                          | 22 +++++++++++++++++-----
 sound/usb/mixer_scarlett2.c                |  6 +++---
 sound/usb/pcm.c                            |  3 ++-
 sound/usb/quirks.c                         |  2 ++
 tools/testing/selftests/alsa/utimer-test.c |  1 -
 7 files changed, 54 insertions(+), 11 deletions(-)

