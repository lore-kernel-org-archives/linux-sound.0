Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA110290D81
	for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482712; cv=none; b=e9JViUmAPurxoC8GY0MRPYLNhy1xqKsWwlxFtFXMaqsxpVY66ctRYymTfETYZI9cKJivEqZ3P9HxXtVHhv5fkg2orZ0WTGbk327ceDfYOzA2l575l0DyApzBISBHH1wvoOf1RoNBW/IirNKfZNEjkPi5BIGm9uDnHHM5MmeBajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482712; c=relaxed/simple;
	bh=Fn1KSa1w103viVMIgSChiB2v+IIDyuhX1kY560OmwiI=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=IqXjiVQPTYllVjWHK/iuyrG9cBuOo7gJGQ1pE2idN8V3+nqoMWa8ke67oFr2HFk/J9ZMCzI23o8+eD5UiaYFhAmt3Lg2EOYIwiMkeqsp2IkgsAzfIgEmeHbUlASCxbMkC1e6AwaepzzPK5+gL3ElAtrfS6kSrX92qVbH1EEyvSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L5T+LbAx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mNJUrhcO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L5T+LbAx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mNJUrhcO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L5T+LbAx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mNJUrhcO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L5T+LbAx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mNJUrhcO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC5FF5BCF3;
	Tue, 23 Dec 2025 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766482708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SFUwb2s/VqfarFZiUDBoKBt6FtSMccAfg1zI7RLwAtk=;
	b=L5T+LbAxZShuXrSUkhVGDz6eCkN2H7qWzb+ZucJrZf8I3ai8c+sYnnynX75Wk3cpsvp6Oa
	hWmUmDnyIq2Y4c4FDNLRXJ7N8r9UwDlq05oaV+WqIQsLYI9e4uBEDvtmw1TW6z6pMpzZWa
	pK/jwAomtt0LV4iEfULD9nMqYn8ARmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766482708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SFUwb2s/VqfarFZiUDBoKBt6FtSMccAfg1zI7RLwAtk=;
	b=mNJUrhcOQJ77qyjxl2Krx12G7MYrCItlUEo0V98GhvICBPJmpMWgOx/rz8gv009+CA6Q0Y
	dPlKoB/NHnUmdhDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766482708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SFUwb2s/VqfarFZiUDBoKBt6FtSMccAfg1zI7RLwAtk=;
	b=L5T+LbAxZShuXrSUkhVGDz6eCkN2H7qWzb+ZucJrZf8I3ai8c+sYnnynX75Wk3cpsvp6Oa
	hWmUmDnyIq2Y4c4FDNLRXJ7N8r9UwDlq05oaV+WqIQsLYI9e4uBEDvtmw1TW6z6pMpzZWa
	pK/jwAomtt0LV4iEfULD9nMqYn8ARmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766482708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SFUwb2s/VqfarFZiUDBoKBt6FtSMccAfg1zI7RLwAtk=;
	b=mNJUrhcOQJ77qyjxl2Krx12G7MYrCItlUEo0V98GhvICBPJmpMWgOx/rz8gv009+CA6Q0Y
	dPlKoB/NHnUmdhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F8A73EA63;
	Tue, 23 Dec 2025 09:38:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PqHAFxRjSmmCOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Dec 2025 09:38:28 +0000
Date: Tue, 23 Dec 2025 10:38:11 +0100
Message-ID: <87v7hxilmk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19-rc3
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

Linus,

please pull sound fixes for v6.19-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc3

The topmost commit is 17753d1755a589659433ff4ead595f2bb7f695a8

----------------------------------------------------------------

sound fixes for 6.13-rc3

Likely the last PR in 2025, again a collection of lots of small fixes.
Most of them are various device-specific small fixes.

* An ASoC core fix for correcting the clamping behavior of *_SX mixer
  elements
* Various fixes for ASoC fsl, SOF, etc
* Usual HD- and USB-audio quirks / fix-ups
* A couple of error-handling fixes for legacy PCMCIA drivers

----------------------------------------------------------------

Alexander Stein (4):
      ASoC: fsl_easrc: fix duplicate debugfs directory error
      ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
      ASoC: fsl_sai: Add missing registers to cache default
      ASoC: fsl_xcvr: provide regmap names

Andrew Elantsev (1):
      ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025

Antheas Kapenekakis (1):
      ALSA: hda/realtek: Add Asus quirk for TAS amplifiers

Bard Liao (2):
      ASoC: sdw_utils: subtract the endpoint that is not present
      ASoC: SOF: ipc4-topology: set playback channel mask

Chancel Liu (2):
      ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
      ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties

Chris Chiu (1):
      ALSA: hda/realtek: fix PCI SSID for one of the HP 200 G2i laptop

Dirk Su (1):
      ALSA: hda/realtek: fix micmute LED reversed on HP Abe and Bantie

Haotian Zhang (2):
      ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
      ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path

Jiapeng Chong (1):
      ALSA: hda: Remove unnecessary print function dev_err()

Jussi Laako (3):
      ALSA: usb-audio: Update for native DSD support quirks
      ALSA: usb-audio: Reorder USB mode selection quirk
      ALSA: usb-audio: Do not expose PCM and DSD on same altsetting unless DoP

Kai Vehmanen (1):
      ALSA: hda/realtek: enable woofer speakers on Medion NM14LNL

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Prefer 32-bit DMIC blobs for 8-bit formats as well
      ASoC: SOF: ipc4-topology: Convert FLOAT to S32 during blob selection
      ASoC: SOF: topology: Add context when sink or source widget is missing
      ASoC: SOF: Intel: pci-mtl: Change the topology path to intel/sof-ipc4-tplg
      ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files op
      ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match table

Robert Oscilowski (1):
      ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format

Shengjiu Wang (1):
      ASoC: ak4458: remove the reset operation in probe and remove

Shipei Qu (1):
      ALSA: usb-mixer: us16x08: validate meter packet indices

Shuming Fan (1):
      ASoC: rt1320: update VC blind write settings

Stefan Binding (5):
      ALSA: hda/realtek: Add support for HP Trekker Laptop
      ALSA: hda/realtek: Add support for HP Clipper Laptop
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
      ASoC: ops: fix snd_soc_get_volsw for sx controls

sheetal (1):
      ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub

---
 include/sound/soc-acpi.h                           |   5 +-
 sound/hda/codecs/realtek/alc269.c                  |  32 +++++--
 sound/hda/controllers/cix-ipbloq.c                 |   4 +-
 sound/pcmcia/pdaudiocf/pdaudiocf.c                 |   8 +-
 sound/pcmcia/vx/vxpocket.c                         |   8 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   7 ++
 sound/soc/codecs/ak4458.c                          |   4 -
 sound/soc/codecs/rt1320-sdw.c                      |  16 ++--
 sound/soc/fsl/fsl-asoc-card.c                      |   8 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   3 +
 sound/soc/fsl/fsl_easrc.c                          |   3 +
 sound/soc/fsl/fsl_sai.c                            |  13 ++-
 sound/soc/fsl/fsl_xcvr.c                           |   3 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 104 +++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  49 ----------
 sound/soc/intel/common/sof-function-topology-lib.c |   5 +-
 sound/soc/intel/common/sof-function-topology-lib.h |   2 +-
 sound/soc/qcom/sdm845.c                            |   2 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   8 +-
 sound/soc/soc-ops.c                                |  32 ++++---
 sound/soc/sof/intel/pci-mtl.c                      |   6 +-
 sound/soc/sof/ipc4-topology.c                      |  49 ++++++----
 sound/soc/sof/topology.c                           |  26 +++++-
 sound/soc/tegra/tegra210_ahub.c                    |   6 +-
 sound/usb/endpoint.c                               |   8 +-
 sound/usb/format.c                                 |   5 +-
 sound/usb/mixer_us16x08.c                          |  20 ++--
 sound/usb/quirks.c                                 |  14 ++-
 28 files changed, 313 insertions(+), 137 deletions(-)

