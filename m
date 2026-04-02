Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB31326ED37
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134985; cv=none; b=qTX6oXuFfqoDFiz3nH7VD6MhwzpPl+HqSD9w4AqAcrzxJqmS7cMgk5aoWbk580256UMALn6EPu4/+NEC6qWzMXslUaHTJTVqZJjdsjXFICD6HwkXkMA/6nwOQVKXVqBX/+zW/Ul3QxNkhZPAwRGoCccakz/QZaOmxDSnWjFshTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134985; c=relaxed/simple;
	bh=xabCtXLN693VnaL+pXUj5T1vZibrkFnugnh2bXK2ePU=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=EkdoRwRx5GsrNfgou4wCHGuuhk3EMdzLUsSASN3jc8D6TVgowdj64KYAPHVVOYHfz2qHw6aQRRa6hNh2JmZRoMZ+o4N7WBudsed9Jhfmls+h71gaCRAy1auUxZL8Oj2DlFiplLUj3h1SKdGTZk/yHtsrLhM4FJSYgyXI60aLI5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kUwA9BdN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sxytw5ah; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aXCeHekS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fxgM8rz6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kUwA9BdN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sxytw5ah";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aXCeHekS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fxgM8rz6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 309244D344;
	Thu,  2 Apr 2026 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775134976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=voYJRkjcHxNmto1n5k2yK0hDAcY3ArWEm4vfPXp7ISw=;
	b=kUwA9BdNQioyK7NBFItiB7pBnhpeCP7idrVEcWJXl8gvXxw6XzJQ/ofKGPpKElcjW8/dc4
	Lrfhv4vrm5nqC1ivegX/CwsMAyS1Mxoj/R7JBuYG9lEhtEXHYFTtXz2Bz68fimvfeEkZky
	suCxKfu1IBsXiZERlXq76jp5O/7sguY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775134976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=voYJRkjcHxNmto1n5k2yK0hDAcY3ArWEm4vfPXp7ISw=;
	b=Sxytw5ahtHAzF6wL2yK1YSZXb3pF4z9L80R1ikn+9zAsowbXWTbKpenk+ILavefUoATNsL
	ngdghB81sHjim1DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775134975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=voYJRkjcHxNmto1n5k2yK0hDAcY3ArWEm4vfPXp7ISw=;
	b=aXCeHekSOdNesbJQ6102ciCG0LuwRlhr4TVyAT3sxKPMGpVx2KXlZXhUWgo+Cm4svrHC5U
	Me3HUmi3Fr9Q/KkRxszjaviP28Koepv88vZ+cUhC6OkKOVQgItIKKvxK5DwZDmETwQLW4+
	ib9HXOdXMyGEDrntW0masNHY8rXdOLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775134975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=voYJRkjcHxNmto1n5k2yK0hDAcY3ArWEm4vfPXp7ISw=;
	b=fxgM8rz6yuv/twC0wYXaf0T5dswXUIIli/zW3XUWCqB0nrvmm4E6RAE8pwyJ1Ekn/aCPPc
	aPVTGmm9g4CX1hDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1B214A0B0;
	Thu,  2 Apr 2026 13:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rnehOf5ozmk1QQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 13:02:54 +0000
Date: Thu, 02 Apr 2026 15:02:54 +0200
Message-ID: <87ldf5ikg1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0-rc7
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.0-rc7 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc7

The topmost commit is b477ab8893c3e6b4be3074358db830687de7bfff

----------------------------------------------------------------

sound fixes for 7.0-rc7

people have been so busy for hunting and we're still getting a
more amount of changes than wished, but it doesn't look too scaring;
almost all changes are device-specific small fixes.
I guess it's rather a casual bump, and no more Easter eggs are left
for 7.0 (hopefully)...

- Fixes for the recent regression on ctxfi driver
- Fix missing INIT_LIST_HEAD() for ASoC card_aux_list
- Usual HD- and USB-audio, and ASoC AMD quirk updates
- ASoC fixes for AMD and Intel

----------------------------------------------------------------

Alexander Savenko (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IMH9

Berk Cem Goksel (1):
      ALSA: caiaq: fix stack out-of-bounds read in init_card

Dag Smedberg (1):
      ALSA: usb-audio: Exclude Scarlett Solo 1st Gen from SKIP_IFACE_SETUP

Dustin L. Howett (1):
      ALSA: hda/realtek: add quirk for Framework F111:000F

Geoffrey D. Bennett (1):
      ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen (8016) from SKIP_IFACE_SETUP

Gilson Marquato Júnior (1):
      ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx

Jihed Chaibi (1):
      ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure

Julian Braha (1):
      ASoC: Intel: boards: fix unmet dependency on PINCTRL

Kuninori Morimoto (1):
      ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list

Phil Willoughby (1):
      ALSA: usb-audio: Fix quirk flags for NeuralDSP Quad Cortex

Sachin Mokashi (1):
      ASoC: Intel: ehl_rt5660: Use the correct rtd->dev device in hw_params

Simon Trimmer (1):
      ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log

Sourav Nayak (1):
      ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx

Stuart Hayhurst (1):
      ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by DMI ID

Takashi Iwai (4):
      ALSA: ctxfi: Fix missing SPDIFI1 index handling
      ALSA: ctxfi: Check the error for index mapping
      ALSA: hda/realtek: Add quirk for Samsung Book2 Pro 360 (NP950QED)
      ALSA: ctxfi: Don't enumerate SPDIF1 at DAIO initialization

Zhang Heng (5):
      ALSA: hda/realtek: change quirk for HP OmniBook 7 Laptop 16-bh0xxx
      ALSA: hda/realtek: Add quirk for ASUS ROG Strix SCAR 15
      ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 16X OLED M7601RM
      ALSA: hda/realtek: add quirk for HP Laptop 15-fc0xxx
      ALSA: hda/realtek: add quirk for Acer Swift SFG14-73

songxiebing (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 14AKP10

---
 sound/hda/codecs/realtek/alc269.c   | 28 ++++++++++++-
 sound/hda/controllers/intel.c       | 13 ++++++
 sound/pci/ctxfi/ctatc.c             | 10 +++--
 sound/pci/ctxfi/ctdaio.c            | 82 +++++++++++++++++++++++--------------
 sound/soc/amd/ps/pci-ps.c           |  2 +-
 sound/soc/amd/yc/acp6x-mach.c       | 14 +++++++
 sound/soc/cirrus/ep93xx-i2s.c       | 34 ++++++++++-----
 sound/soc/intel/boards/Kconfig      |  2 -
 sound/soc/intel/boards/ehl_rt5660.c |  2 +-
 sound/soc/soc-core.c                |  1 +
 sound/usb/caiaq/device.c            |  2 +-
 sound/usb/quirks.c                  |  4 ++
 12 files changed, 144 insertions(+), 50 deletions(-)

