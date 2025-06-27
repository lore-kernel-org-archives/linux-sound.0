Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA2219F461
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025876; cv=none; b=HZuBKSFl2wXyiVRYv0WiGLlm57xJ/rFPJzt3mMfFd02nWiXOoGBV2W0gzPEVqvqlxvrB3c6ILQceLlbAAt6SzJuQKinf7hvMwJz+RYYU0QIImqfaeojnTCr+3fZOQ4xlCePS9ab0JEC7q6fftNd9NQU8gNZR50AT2DXe58Zu7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025876; c=relaxed/simple;
	bh=3FXBrWHeDlitkvmoT7d8g3HT3hcVggZHw9bUh0wmssg=;
	h=Date:Message-ID:From:To:Subject:MIME-Version:Content-Type; b=Ew9iXArPzI2ldBsXKm5Lyg9WcrH+kNS8XOS039KVL/M1NlaMPaJztjdtAWCp+niYSe8I84IBMhjJt9WonRT7a5mgMT6x674VAqCObVq03+XMkmxQoxvciiEjJO4+8Na7DzF72xXaTRxkK0p7lS7JwdwCFOmnMc60DI3rwKYmazU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eqou/aaG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sSJx8Rn6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iTVFbp6q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mBBHqurv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eqou/aaG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sSJx8Rn6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iTVFbp6q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mBBHqurv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B98E21175
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751025872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Y/WaK4DcyMkdozujtOGdctEUwp8jxR6YRTIGVLY3t5M=;
	b=Eqou/aaGXkTlw9tIhaaaZNkq+8hgiX4ANo/Iyo/gXWb3SZWVEg5t2JZK8UDhu8+p+7+vGw
	w3s6vJhisQwP9J2UIXA8jTRjAOR3ml2sdoiE3pIMPENO8wQYAZJEc7oGiP62JwaZ526Sn5
	bQoHU8MvdLYBmfc3GElBpFQAJk86Ks0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751025872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Y/WaK4DcyMkdozujtOGdctEUwp8jxR6YRTIGVLY3t5M=;
	b=sSJx8Rn6t+D5MTLaBI7GcKd55awCINcutuvHkfmMYYUSNNz4/e92l8NksDUPV9ftHfseR6
	piG77I9bqUBI82BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751025870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Y/WaK4DcyMkdozujtOGdctEUwp8jxR6YRTIGVLY3t5M=;
	b=iTVFbp6qokYhqK/CZmCtZ479odkceniGJ/7xFzi3BBGOzfFi+1xHjGVyqWahIovRiSTwtY
	mM6YzgSXj3NirBsyU7ruFJz0pweHGFbUFF2ZfZmKUQl/5LQAI7uanD1f/XQ42/NxBDTrWm
	78+Aq5SvG+t53JYqbl6DCZ5tHhsk8yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751025870;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Y/WaK4DcyMkdozujtOGdctEUwp8jxR6YRTIGVLY3t5M=;
	b=mBBHqurvyhjpTlkQp+4SDJoOOkJV6KyBbnjx0lvt9U/oaL7vyf4UucoLhFCfusUgrmIlgK
	2HjXwJPJkjeozqDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5571413786
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 12:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r0KeE86IXmh2IgAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 12:04:30 +0000
Date: Fri, 27 Jun 2025 14:04:29 +0200
Message-ID: <87ldpdgzle.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [RFC] Reorganizing HD-audio driver code?
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

Hi,

HD-audio driver is known to be quite messy in both file structures and
its design, but until now I haven't touched its files paths so much
because I set a higher priority for the easiness of backport to stable
kernels.  But, you can't leave garbages forever, it's been already
high time for a large clean up.

So I tried a quick code reorganization, and put the result in
test/hda-reorg branch of sound.git tree.
  https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg

The basic idea is to move the code from sound/pci/hda/* into different
subdirectories in sound/hda/ per functionality, as most of the stuff
are independent from PCI, but rather HD-audio bus specific.

After the changes, the HD-audio root directory looks like:

  % ls sound/hda 
  codecs/  common/  controllers/  core/  Kconfig  Makefile

The current HD-audio core code is moved to sound/hda/core/*.
The common snd-hda-codec driver code is moved into
sound/hda/common/*.
The controller code (snd-hda-intel, snd-hda-tegra, snd-hda-acpi) are
moved into sound/hda/controllers/*.
And the codecs are moved to sound/hda/codecs/*.

The core code is almost same as now but I dropped the ugly hdac_
prefix from the filenames:

  % ls sound/hda/core
  array.c       device.c        i915.c              Kconfig   stream.c
  bus.c         ext/            intel-dsp-config.c  local.h   sysfs.c
  component.c   hda_bus_type.c  intel-nhlt.c        Makefile  trace.c
  controller.c  hdmi_chmap.c    intel-sdw-acpi.c    regmap.c  trace.h

  % ls sound/hda/core/ext
  bus.c  controller.c  Makefile  stream.c

The code of snd-hda-codec library module is found in common directory:

  % ls sound/hda/common
  auto_parser.c  controller.c        hda_controller.h  jack.c    sysfs.c
  beep.c         controller_trace.h  hda_jack.h        Kconfig
  bind.c         hda_auto_parser.h   hda_local.h       Makefile
  codec.c        hda_beep.h          hwdep.c           proc.c

Again, the hda_ prefix is dropped from most of files.  The headers
still contain hda_ prefix because otherwise it can be confusing at
including from others.

The controller driver code looks like:

  % ls sound/hda/controllers
  acpi.c  intel_trace.h  intel.c  intel.h  Kconfig  Makefile  tegra.c

And the codec driver code looks like:

  % ls sound/hda/codecs
  analog.c       cmedia.c         eld.c      Kconfig       side-codecs/
  ca0110.c       conexant.c       generic.c  Makefile      sigmatel.c
  ca0132.c       cs8409.c         generic.h  realtek/      via.c
  ca0132_regs.h  cs8409.h         hdmi.c     senarytech.c
  cirrus.c       cs8409-tables.c  helpers/   si3054.c

The Realtek codec is split further to smaller pieces (which was really
huge).

  % ls sound/hda/codecs/realtek
  alc260.c  alc268.c  alc662.c  alc861.c    alc880.c  Kconfig   realtek.c
  alc262.c  alc269.c  alc680.c  alc861vd.c  alc882.c  Makefile  realtek.h

Other drivers like Sigmatel/IDT driver might be worth to split, too.

The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
subdirectory:

  % ls sound/hda/codecs/side-codecs
  cirrus_scodec.c         cs35l41_hda_property.h  hda_component.h
  cirrus_scodec.h         cs35l41_hda_spi.c       Kconfig
  cirrus_scodec_test.c    cs35l56_hda.c           Makefile
  cs35l41_hda.c           cs35l56_hda.h           tas2781_hda.c
  cs35l41_hda.h           cs35l56_hda_i2c.c       tas2781_hda.h
  cs35l41_hda_i2c.c       cs35l56_hda_spi.c       tas2781_hda_i2c.c
  cs35l41_hda_property.c  hda_component.c         tas2781_hda_spi.c

They can be put to each own directory and drop the file name prefix,
if we want, too.  Let me know if Cirrus and TI people would like to
split to more subdirectories.

Finally, the helper code that is included from the codec driver is put
under codecs/helpers subdirectory (with drop of superfluous suffix):

  % ls sound/hda/codecs/helpers
  hp_x360.c  ideapad_hotkey_led.c  ideapad_s740.c  thinkpad.c

So far, so good; all looks better organized.
I planned for further driver code modernization, and this code
reorganization makes it easier, too.

*HOWEVER* the biggest question is: whether it's worth?

Essentially, this makes almost impossible to make a patch for stable
trees from the original commit as is; one has to translate the file
paths and adjust manually in each patch.

Also, of course, if anyone is working on HD-audio stuff right now, the
work had to be adjusted to the new file path.  It'd be one-off action,
though.

Any thoughts / opinions?


thanks,

Takashi
