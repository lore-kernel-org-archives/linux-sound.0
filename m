Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21435E1BA
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783237374; cv=none; b=tQoKZ+HILjOzkh9oPAbh5TWRHyI5WYN94rDMmqMvp+5JT876EfktnlQJgzhjtxOZT1p1EAK8tcT7X4d+b4sHAVJNrrZxFQmTBA5T5qODo0keATw9/7N08pVwTsC9opOuhwEW3cL+fMEVcDjIchJMug6WmL3TDCkq7mbWjmqyx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783237374; c=relaxed/simple;
	bh=iQ2hytuEckIkrUcLNEt8mmAdC6/GC5UNkigYsR6UP8o=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=YDphAIW/iqy2NW1+rPWmq8iAa2AXb5yYgyS57aPH5HI6H72sXk6wqByoK/ahHXeC0oWdORZMSJmFZs70g70ZfASN+asbmIFmbZmsySTg4Fg0Trbzyz3i8bJvgUnMTjaotnm8nNee2D+JZ/OBffgme6rvfD0lOiehgphXWltrU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NAnAPIVJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3z8GcnNa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NAnAPIVJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3z8GcnNa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NAnAPIVJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3z8GcnNa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NAnAPIVJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3z8GcnNa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3DFE4734B7;
	Sun,  5 Jul 2026 07:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783237366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5H+q7mWhjgujgHcL9n5/MEVw8tcsUHR5IMFKFaKTLSE=;
	b=NAnAPIVJ8L+jML4eonHB6+qpxvi/Rz4xL/VZxvoq+pfN/BtQxfN9Z19IW4Ndb2owi2O1sz
	6y15Yj2c04BknoEW7B0ElVbr/w4g1k6KonNN4kmDij5KNgw4O2kPeneL7fw5pe7bySN8YZ
	w0WS2Q+Dw29CUMYgF9dDGgN6v04baWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783237366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5H+q7mWhjgujgHcL9n5/MEVw8tcsUHR5IMFKFaKTLSE=;
	b=3z8GcnNaVmLDarL+ONLwkggWDid80nh5J0cvJSbPBS45I3aRP08Enc19+9+vJeyfCvsYem
	iM32HHeb3VKc1CDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783237366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5H+q7mWhjgujgHcL9n5/MEVw8tcsUHR5IMFKFaKTLSE=;
	b=NAnAPIVJ8L+jML4eonHB6+qpxvi/Rz4xL/VZxvoq+pfN/BtQxfN9Z19IW4Ndb2owi2O1sz
	6y15Yj2c04BknoEW7B0ElVbr/w4g1k6KonNN4kmDij5KNgw4O2kPeneL7fw5pe7bySN8YZ
	w0WS2Q+Dw29CUMYgF9dDGgN6v04baWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783237366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5H+q7mWhjgujgHcL9n5/MEVw8tcsUHR5IMFKFaKTLSE=;
	b=3z8GcnNaVmLDarL+ONLwkggWDid80nh5J0cvJSbPBS45I3aRP08Enc19+9+vJeyfCvsYem
	iM32HHeb3VKc1CDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C8A9779AA;
	Sun,  5 Jul 2026 07:42:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +vfRAPYKSmoSaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 05 Jul 2026 07:42:46 +0000
Date: Sun, 05 Jul 2026 09:42:45 +0200
Message-ID: <87wlv96fwq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2-rc2
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Level: 
X-Spam-Score: -3.30

Linus,

please pull sound fixes for v7.2-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc2

The topmost commit is 5720deab6da70d0676cee8a580f6146ef85a3ab9

----------------------------------------------------------------

sound fixes for 7.2-rc2

A standard set of driver-specific fixes and quirks accumulated since
the merge window:

ASoC:
- SOF: Sanity check to prevent OOB reads
- rsnd: Fix clock leak and double-disable issues with PM
- tas675x: Misc fixes for register fields, etc
- lpass-va-macro: Correct codec version for Qualcomm SC7280
- amd-yc: DMIC quirk for Alienware m15 R7 AMD

Others:
- us144mkii: Fix a UAF on disconnect and anchor list corruption
- HD-audio: Realtek quirks for HP models

----------------------------------------------------------------

HyeongJun An (1):
      ALSA: usx2y: us144mkii: fix work UAF on disconnect

Jetha Chan (1):
      ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table

John Madieu (2):
      ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
      ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume

Luca Weiss (1):
      ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280

Sen Wang (3):
      ASoC: codecs: tas675x: use READ_ONCE for params to be used concurrently
      ASoC: codecs: tas675x: Fix CHx temperature range register bit fields
      Documentation: sound: tas675x: Fix temperature range and impedance documentation

Shubham Nayak (1):
      ALSA: hda/realtek: Add quirk for HP Victus 16-e0xxx (88EE) to enable mute LED

Vijendar Mukunda (1):
      MAINTAINERS: ASoC: SOF: add AMD reviewer for Sound Open Firmware

WenTao Liang (1):
      ALSA: us144mkii: capture_urb_complete: redundant usb_anchor_urb corrupts anchor list on each resubmission

Yousef Alhouseen (1):
      ASoC: SOF: validate probe info element counts

---
 Documentation/sound/codecs/tas675x.rst | 11 ++++++-----
 MAINTAINERS                            |  1 +
 sound/hda/codecs/realtek/alc269.c      |  1 +
 sound/soc/amd/yc/acp6x-mach.c          |  7 +++++++
 sound/soc/codecs/lpass-va-macro.c      |  7 ++++++-
 sound/soc/codecs/tas675x.c             | 14 +++++++-------
 sound/soc/renesas/rcar/adg.c           | 29 ++++++++++++++++++++++++++++-
 sound/soc/renesas/rcar/src.c           |  2 ++
 sound/soc/sof/sof-client-probes-ipc3.c | 23 +++++++++++++++++++----
 sound/soc/sof/sof-client-probes-ipc4.c | 11 ++++++++++-
 sound/usb/usx2y/us144mkii.c            | 17 +++++++++++------
 sound/usb/usx2y/us144mkii_capture.c    |  2 +-
 12 files changed, 99 insertions(+), 26 deletions(-)

