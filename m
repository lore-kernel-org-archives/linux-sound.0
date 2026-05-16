Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3C1427A
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933622; cv=none; b=blP69GPMqMASaB4Xw7piKWvn1o9FSm8D2KEkJYFP5ob5g9KU3QJpqG+3oEjgAcunawIz0DApQHh2QGIprv0OJYDWQJ0gaBio2bkbhtLbVjF/uKbLZ+9P0hS3Z4EOYGl1Mwmqc0G/frZz4mz5yxts6NKSfXXhbRjpZQXg/d9ttN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933622; c=relaxed/simple;
	bh=urp1HvS1sh+aC2IkdPxxJ3810YBZ9j0dGatvRL/SBR4=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=I+5WWic83rcUrEJG+8/Dbehg3jbnlu5jEbX3XPoVQKN6t9hK7ov21GQ69TPKGXV3n2PaXrNXtOgn97onA43sjrMlcMkCnSHI31SUZWGoj6qu2FqAJBAnSdWXDI4//7x841CXVDIfu28htIT/k2POQo7fE5ZXFNfqQS2R2MhkP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q9bguzSY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f7ptLAAJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q9bguzSY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f7ptLAAJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q9bguzSY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f7ptLAAJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q9bguzSY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f7ptLAAJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6C4A5CB64;
	Sat, 16 May 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778933619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bOkaGpiuQ6uyOrJ+OEhgZOeWiDxKgcU4GiclvwhQig=;
	b=q9bguzSYs4TWXqWOE2S0gz8wz0RMeIAtlAO1gurPDg2Rhl0QcmqlDngC2fXX8zAw2O3QeO
	uMOVGNkw1GSpXC3VU97GEJwfqVVSgat/MXFe39tnNe9HF3MlFCJZzxbPxYSM7lPvXyapKA
	hW0Zjmu4YHGqvt/4m86O5cZ+tz1nWM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778933619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bOkaGpiuQ6uyOrJ+OEhgZOeWiDxKgcU4GiclvwhQig=;
	b=f7ptLAAJrf0lmPVufGB86FTXiH91HhewmXqckuZACO+vApz4gPgHuVeqKavolIExHPwYQt
	lSsU2OvdcP0OcMBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778933619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bOkaGpiuQ6uyOrJ+OEhgZOeWiDxKgcU4GiclvwhQig=;
	b=q9bguzSYs4TWXqWOE2S0gz8wz0RMeIAtlAO1gurPDg2Rhl0QcmqlDngC2fXX8zAw2O3QeO
	uMOVGNkw1GSpXC3VU97GEJwfqVVSgat/MXFe39tnNe9HF3MlFCJZzxbPxYSM7lPvXyapKA
	hW0Zjmu4YHGqvt/4m86O5cZ+tz1nWM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778933619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bOkaGpiuQ6uyOrJ+OEhgZOeWiDxKgcU4GiclvwhQig=;
	b=f7ptLAAJrf0lmPVufGB86FTXiH91HhewmXqckuZACO+vApz4gPgHuVeqKavolIExHPwYQt
	lSsU2OvdcP0OcMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8AEB5593A8;
	Sat, 16 May 2026 12:13:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T/D0H3NfCGp7DQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 12:13:39 +0000
Date: Sat, 16 May 2026 14:13:39 +0200
Message-ID: <874ik7zh58.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc4
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

Linus,

please pull sound fixes for v7.1-rc4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc4

The topmost commit is 6fd9f6e870ea285f05102e8e00e6a7f4495a9a02

----------------------------------------------------------------

sound fixes for 7.1-rc4

A collection of small fixes.  All device-specific small changes.

* HD-audio:
  - Fix NULL pointer dereference in snd_hda_ctl_add()
  - ACPI and Kconfig fixes for Cirrus drivers
  - A regression fix CA0132 codec
  - Various device-specific quirks for HP, Lenovo, Samsung, Framework,
    etc
  - Documentation path fix
* USB-audio:
  - Boundary checks for MIDI endpoint descriptors
  - Offload mapping error handling for Qualcomm
  - A new device quirk for TTGK Technology USB-C Audio
  - A fix for Focusrite Scarlett2 mixer

----------------------------------------------------------------

Adrien Burnett (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Laptop 16-ag0xxx

Andy Shevchenko (1):
      ALSA: hda/cs35l56: Drop malformed default N from Kconfig

Cássio Gabriel (3):
      ALSA: usb-audio: Bound MIDI endpoint descriptor scans
      ALSA: usb-audio: Bound MIDI 2.0 endpoint descriptor scans
      ALSA: usb-audio: qcom: Check offload mapping failures

Daniel Schaefer (1):
      ALSA: hda/realtek: fix mic boost on Framework PTL

Edson Juliano Drosdeck (1):
      ALSA: hda/realtek: Limit mic boost on Positivo DN50E

Jackie Dong (1):
      ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for TTGK Technology USB-C Audio

Markus Kramer (1):
      ALSA: hda/realtek: Add quirk for Samsung Galaxy Book5 360 headphone

Matt DeVillier (1):
      ALSA: hda/ca0132: Disable auto-detect on manual output select

Nicholas Bonello (1):
      ALSA: hda/realtek: Fix Legion 7 16ITHG6 speaker amp binding

Quan Sun (1):
      ALSA: hda: Fix NULL pointer dereference in snd_hda_ctl_add()

Richard Fitzgerald (1):
      ALSA: doc: cs35l56: Update path to HDA driver source

Robertus Diawan Chris (1):
      ALSA: scarlett2: Add missing error check when initialise Autogain Status

Rámon van Raaij (1):
      ALSA: hda/realtek: Add codec SSID quirk for Lenovo Yoga Pro 9 16IMH9 (17aa:38d5)

Shuhao Fu (2):
      ALSA: hda: cs35l56: Put ACPI device after setting companion
      ALSA: hda: cs35l41: Put ACPI device on missing physical node

---
 Documentation/sound/codecs/cs35l56.rst     |  2 +-
 sound/hda/codecs/ca0132.c                  | 44 +++++++++++++++++++++---------
 sound/hda/codecs/realtek/alc269.c          | 20 ++++++++++++--
 sound/hda/codecs/side-codecs/Kconfig       |  1 -
 sound/hda/codecs/side-codecs/cs35l41_hda.c |  4 ++-
 sound/hda/codecs/side-codecs/cs35l56_hda.c |  1 +
 sound/hda/common/codec.c                   |  3 ++
 sound/usb/midi.c                           | 12 ++++----
 sound/usb/midi2.c                          | 12 ++++----
 sound/usb/mixer_scarlett2.c                |  2 ++
 sound/usb/qcom/qc_audio_offload.c          | 31 +++++++++++++++++----
 sound/usb/quirks.c                         |  2 ++
 12 files changed, 99 insertions(+), 35 deletions(-)

