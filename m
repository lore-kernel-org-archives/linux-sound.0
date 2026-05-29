Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE13B5318
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050285; cv=none; b=P7D5z02OKzIUaM/6LYUv4oMF/QForqlMhZL0H4E0vdRgfyk0/eBDg0ejaEZJG9Ct47UuzQJQ3l1u21mqLwzGMdC8DFyFkaZg3fXUf9C5kq2x2xsOzi6rNUBvERfhT/0eW5BQnKMCDqQHywulG6I3oGWuYIUD1SU3Wda5xZgyRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050285; c=relaxed/simple;
	bh=/5u3ENX1t4H7zSkEjfNoyReRExhryRWMA9sCSJuS3jg=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=ONa+0+H0Hsq6/Wykrxc5FYDwLAsWl82iv2XLWsS8kPVKvsFzf43328l5zhz3RRcNaUb/a2gZBFRxSxNQRoXb7ws3b0CvT8T1jOnWiiMeqMY1Hh/OUjaz8KkjQpTHckdnWdXAUiiRn0LTQUgy8YU1yGnRW7Ul99veKAcVujtgI6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8v692Xz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LG/R7fqn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8v692Xz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LG/R7fqn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8v692Xz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LG/R7fqn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8v692Xz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LG/R7fqn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A5226AAA4;
	Fri, 29 May 2026 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780050282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kI7U4JUvsmAXBTBAvfwcsM6BabtVHVvT0c9AxiLL5io=;
	b=V8v692XzZdNxYXA1p60b15DX5SJ1TA3dMckd3IaY121VokrXiMe5gedU4VKYg6YmM5JGsF
	7CD133ne1UaFv/MYFnBGuQCF3IUntrUIAAAxnqbeIKYo2KVRb1hzC/3W8M/39+llPYbpnH
	0K5qCsUQULZTIvWyUnq4hbVB6G5jxtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780050282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kI7U4JUvsmAXBTBAvfwcsM6BabtVHVvT0c9AxiLL5io=;
	b=LG/R7fqn2VLPqU9Lj5/n2HtUgEwg3cvn1ssdMjKCvv3hUNANHj4WiHGfY001UeDwAIZg/O
	ZwwdgWDdb6mI6NBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780050282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kI7U4JUvsmAXBTBAvfwcsM6BabtVHVvT0c9AxiLL5io=;
	b=V8v692XzZdNxYXA1p60b15DX5SJ1TA3dMckd3IaY121VokrXiMe5gedU4VKYg6YmM5JGsF
	7CD133ne1UaFv/MYFnBGuQCF3IUntrUIAAAxnqbeIKYo2KVRb1hzC/3W8M/39+llPYbpnH
	0K5qCsUQULZTIvWyUnq4hbVB6G5jxtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780050282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kI7U4JUvsmAXBTBAvfwcsM6BabtVHVvT0c9AxiLL5io=;
	b=LG/R7fqn2VLPqU9Lj5/n2HtUgEwg3cvn1ssdMjKCvv3hUNANHj4WiHGfY001UeDwAIZg/O
	ZwwdgWDdb6mI6NBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4A04779A7;
	Fri, 29 May 2026 10:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mp+4MmlpGWpRDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 May 2026 10:24:41 +0000
Date: Fri, 29 May 2026 12:24:41 +0200
Message-ID: <87mrxiqzrq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc6
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

Linus,

please pull sound fixes for v7.1-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc6

The topmost commit is 2c142b63c8ee982cdfdba49a616027c266294838

----------------------------------------------------------------

sound fixes for 7.1-rc6

A collection of recent small fixes and quirks.
We still see a bit more changes than wished, but most of them are
device-specific ones that are pretty safe to apply, while a core fix
is a typical UAF fix for PCM core that was recently caught by fuzzer;
so overall nothing looks really worrisome.

* Core:
- Fix a UAF in PCM OSS proc interface

* HD-audio:
- Fix memory leaks in CS35L56 driver
- Various device-specific quirks for Realtek and CS420x codecs

* USB-audio:
- Quirk for TAE1160 USB Audio
- Fix for Scarlett2 Gen4 direct monitor gain

* ASoC:
- Fixes for QCom q6asm-dai, Intel bytcht_es8316, and simple-mux codec

* FireWire:
- Fix for Motu DSP event queue protection

----------------------------------------------------------------

Cássio Gabriel (5):
      ALSA: firewire-motu: Protect register DSP event queue positions
      ALSA: hda: cs35l56: Fix system name string leaks
      ALSA: pcm: oss: Fix setup list UAF on proc write error
      ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors
      ASoC: codecs: simple-mux: Fix enum control bounds check

Edson Juliano Drosdeck (1):
      ALSA: hda/realtek: Limit mic boost on Positivo DN140

Fabian Lippold (1):
      ALSA: hda/realtek: add quirk for HP Dragonfly Folio G3 2-in-1

Geoffrey D. Bennett (1):
      ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on firmware 2417

Jakub Pisarczyk (1):
      ALSA: hda/cs420x: Add CS4208 fixup for iMac16,1

Kris Kater (1):
      ALSA: hda/realtek: Add HDA_CODEC_QUIRK for Lenovo Yoga Slim 7 14AGP11

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for TAE1160 USB Audio

Srinivas Kandagatla (5):
      ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
      ASoC: qcom: q6asm-dai: close stream only when running
      ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
      ASoC: qcom: q6asm-dai: remove unnecessary braces
      ASoC: qcom: q6asm-dai: use pointer type with kzalloc_obj()

Zhang Heng (2):
      ALSA: hda/realtek: Fix incorrect comment for ALC299_FIXUP_PREDATOR_SPK
      ALSA: hda/realtek: Fix speaker output on ASUS ROG Strix G615LP

---
 sound/core/oss/pcm_oss.c                           | 18 ++++----
 .../motu/motu-register-dsp-message-parser.c        | 11 +++--
 sound/hda/codecs/cirrus/cs420x.c                   |  1 +
 sound/hda/codecs/realtek/alc269.c                  |  6 ++-
 sound/hda/codecs/side-codecs/cs35l56_hda.c         | 17 ++++----
 sound/soc/codecs/simple-mux.c                      |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c             | 29 ++++++++++++-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   | 48 +++++++++++-----------
 sound/usb/mixer_scarlett2.c                        | 33 +++++++++++++--
 sound/usb/quirks.c                                 |  2 +
 10 files changed, 117 insertions(+), 50 deletions(-)

