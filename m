Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D536E490
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203651; cv=none; b=uLUl3qMDAzgSSMQPQtlgNMdjWzu6Se1kFbRw1B0evxqqDgFrK1IPwiig5BjQlGtOgrc9rVKjAmCkllUPNcXDZNACLZ3D3fBcWHHb/Vf+nWW/OGGEYyZyaVrNgIe2J6IU1AKT6CSWv7B/WQrXGtD58amLxi25lynVdq1e7LdUeT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203651; c=relaxed/simple;
	bh=xfCKdhRaaIZOdlujjCMyKze/wSF1H+ahKFnx+HZlr5Y=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=DU6lYwLpnDTxRJ/01KUG37I6ei+S0fsqddF0cWOd772xC2DfKfMxAlv4bXZISd+0c2sZQjckfdCmQSu7Q6OJiZ6kg357wLOkxzpkdTskOTmvicXBORzJkYpzfsHfP8Q5UswKzEpUhe5fNxqA98PFhCC0FeNn1GgruXxkJD+EvQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V9g/f1EG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v+pYxNDV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V9g/f1EG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v+pYxNDV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V9g/f1EG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v+pYxNDV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V9g/f1EG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v+pYxNDV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B6CC568009;
	Fri, 27 Feb 2026 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772203648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=XCo4/Jkx1EkL6Agbp7527gKCLYHx8DgJwFzCmnpKmq8=;
	b=V9g/f1EGH0FB0KtYxEe6JTlGGdFkuxbWOFY4zxCjZ9vPRqBRoU4gvf8qLnTT/RqAccFzRp
	7ZuZCeGtFnUQ8F6pINvMzK8L0aY2frk4lx9Hm1dqUoKDGyqovArtFX28zUT+gDHagGo1I2
	Sk32VYaHdbQp9TH+bxEIqfU074p4ed4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772203648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=XCo4/Jkx1EkL6Agbp7527gKCLYHx8DgJwFzCmnpKmq8=;
	b=v+pYxNDVSLXAn94+Ql3PiRhFLizcFKs+xfxijCDp8HQnkZCO8UIyYbyJA4QtEN3KmfEX5w
	bQKwmK2+uBEianBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772203648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=XCo4/Jkx1EkL6Agbp7527gKCLYHx8DgJwFzCmnpKmq8=;
	b=V9g/f1EGH0FB0KtYxEe6JTlGGdFkuxbWOFY4zxCjZ9vPRqBRoU4gvf8qLnTT/RqAccFzRp
	7ZuZCeGtFnUQ8F6pINvMzK8L0aY2frk4lx9Hm1dqUoKDGyqovArtFX28zUT+gDHagGo1I2
	Sk32VYaHdbQp9TH+bxEIqfU074p4ed4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772203648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=XCo4/Jkx1EkL6Agbp7527gKCLYHx8DgJwFzCmnpKmq8=;
	b=v+pYxNDVSLXAn94+Ql3PiRhFLizcFKs+xfxijCDp8HQnkZCO8UIyYbyJA4QtEN3KmfEX5w
	bQKwmK2+uBEianBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BCB03EA69;
	Fri, 27 Feb 2026 14:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fuLUIICuoWn5fAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Feb 2026 14:47:28 +0000
Date: Fri, 27 Feb 2026 15:47:28 +0100
Message-ID: <87a4wu8cqn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0-rc2
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

Linus,

please pull sound fixes for v7.0-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc2

The topmost commit is 71c1978ab6d2c6d48c31311855f1a85377c152ae

----------------------------------------------------------------

sound fixes for 7.0-rc2

A bunch of small device-specific fixes.  Mostly quirks and fix-ups
for USB- and HD-audio at this time, in addition to a couple of ASoC
AMD and Cirrus fixes.

----------------------------------------------------------------

Azamat Almazbek uulu (1):
      ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table

Charles Keepax (1):
      ASoC: cs42l43: Report insert for exotic peripherals

Geoffrey D. Bennett (5):
      ALSA: scarlett2: Fix DSP filter control array handling
      ALSA: usb-audio: Improve Focusrite sample rate filtering
      ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
      ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP
      ALSA: usb-audio: Skip clock selector for Focusrite devices

Juhyung Park (2):
      ALSA: hda/realtek: fix model name typo for Samsung Galaxy Book Flex (NT950QCG-X716)
      ALSA: hda/realtek: add quirk for Samsung Galaxy Book Flex (NT950QCT-A38A)

Jun Seo (1):
      ALSA: usb-audio: Use correct version for UAC3 header validation

Panagiotis Foliadis (2):
      ALSA: hda/realtek: Add quirk for Acer Aspire V3-572G
      ALSA: hda/intel: increase default bdl_pos_adj for Nvidia controllers

Richard Fitzgerald (2):
      ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
      ALSA: hda: cs35l56: Remove unnecessary struct cs_dsp_client_ops

Sean Rhodes (1):
      ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter

Takashi Iwai (8):
      ALSA: usb-audio: Cap the packet size pre-calculations
      ALSA: usb-audio: Check max frame size for implicit feedback mode, too
      ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
      ALSA: usb-audio: Use inclusive terms
      ALSA: usb-audio: Drop superfluous kernel-doc markers
      ALSA: usb: qcom: Correct parameter comment for uaudio_transfer_buffer_setup()
      ALSA: us144mkii: Drop kernel-doc markers
      ASoC: SDCA: Fix comments for sdca_irq_request()

Zhang Heng (1):
      ALSA: hda/realtek: add quirk for Acer Nitro ANV15-51

---
 sound/hda/codecs/realtek/alc269.c          | 37 +++++++++++++++-
 sound/hda/codecs/side-codecs/cs35l56_hda.c |  7 +--
 sound/hda/controllers/intel.c              |  2 +
 sound/soc/amd/yc/acp6x-mach.c              |  7 +++
 sound/soc/codecs/cs42l43-jack.c            |  1 +
 sound/soc/sdca/sdca_interrupts.c           |  4 +-
 sound/usb/endpoint.c                       | 10 +++--
 sound/usb/format.c                         | 70 +++++++++++++++++++++++++++---
 sound/usb/mixer_s1810c.c                   | 12 ++---
 sound/usb/mixer_scarlett2.c                | 10 ++---
 sound/usb/qcom/qc_audio_offload.c          |  2 +-
 sound/usb/quirks.c                         |  6 ++-
 sound/usb/stream.c                         |  3 ++
 sound/usb/usbaudio.h                       |  6 +++
 sound/usb/usx2y/us144mkii.c                | 14 +++---
 sound/usb/usx2y/us144mkii_capture.c        | 12 ++---
 sound/usb/usx2y/us144mkii_controls.c       | 42 +++++++++---------
 sound/usb/usx2y/us144mkii_midi.c           | 22 +++++-----
 sound/usb/usx2y/us144mkii_playback.c       | 10 ++---
 sound/usb/validate.c                       |  2 +-
 20 files changed, 196 insertions(+), 83 deletions(-)

