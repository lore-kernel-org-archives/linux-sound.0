Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36F1326D65
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130684; cv=none; b=Ad9ZsgK0e8/psjTE5a5q+8XWbxRgWV0PEUA3E1/G+sy5xe8Vc1IPF8XLxIOE7Sx01zwcUg12mR863vtUqNK6qBWwxdA8avQSYIRVWTbGLTsE1sUiSUV0bSxbl4Z27q9TIFHBdRvTht4mmTvb+63wmj2nSffHj9g0+aG9TaufaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130684; c=relaxed/simple;
	bh=Le/1it3BX6uNM5tGuNC+JSTvUD9RYJP4GLU55k20ldI=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=EdWkToCO3/V7ndsxwQ+bnBEdqotlAjsbRkNR/JHyAD3MU1D5levqMicOxIn9FelFLCzjAOBFoq+okV/WjiT6HFRIXDcVLS8PAnnI4ionz+e8tYTfFks/x3s56so7CjIemNsDbuosKgYWhPBNLEONF9IuU729kLLbw6Jxtdf/yOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vZMMUYTp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zjdzzi3K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vZMMUYTp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zjdzzi3K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vZMMUYTp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zjdzzi3K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vZMMUYTp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zjdzzi3K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3EF29211E0;
	Fri, 14 Nov 2025 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763130680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=wZV0lvDZU8QEP0CL+Acv0SShKckfVk2O7tLlAh32kF8=;
	b=vZMMUYTph3secXeuf9QDrK0Ks48w7Co1Ib2F8MaT8hBcJ0IRt8IQsqpFE4RKVcX389cHF1
	3qg59ru3hIqrcR0cW9gDOjUkys9vg8V3nCh0q7Io4ZoGs77TRBWgPI5suMggcXt6pSJBCM
	9jiL++TzBhlZ0jle7I09za7veUueIzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763130680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=wZV0lvDZU8QEP0CL+Acv0SShKckfVk2O7tLlAh32kF8=;
	b=Zjdzzi3KHItp1j4ZPu+BjmKnOZy97pO//QW8AMD2AdtIT9i3xY8Gr/8qJVDkWWhdly+83n
	Mcm38RkB+Bd2cUDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763130680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=wZV0lvDZU8QEP0CL+Acv0SShKckfVk2O7tLlAh32kF8=;
	b=vZMMUYTph3secXeuf9QDrK0Ks48w7Co1Ib2F8MaT8hBcJ0IRt8IQsqpFE4RKVcX389cHF1
	3qg59ru3hIqrcR0cW9gDOjUkys9vg8V3nCh0q7Io4ZoGs77TRBWgPI5suMggcXt6pSJBCM
	9jiL++TzBhlZ0jle7I09za7veUueIzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763130680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=wZV0lvDZU8QEP0CL+Acv0SShKckfVk2O7tLlAh32kF8=;
	b=Zjdzzi3KHItp1j4ZPu+BjmKnOZy97pO//QW8AMD2AdtIT9i3xY8Gr/8qJVDkWWhdly+83n
	Mcm38RkB+Bd2cUDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 172AB3EA61;
	Fri, 14 Nov 2025 14:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gRtjBDg9F2kjfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Nov 2025 14:31:20 +0000
Date: Fri, 14 Nov 2025 15:31:19 +0100
Message-ID: <87fragit3c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.18-rc6
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

Linus,

please pull sound fixes for v6.18-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18-rc6

The topmost commit is 21a9ab5b90b3716a631d559e62818029b4e7f5b7

----------------------------------------------------------------

sound fixes for 6.18-rc6

A collection of small fixes.  All changes are device-specific, and
nothing stands out.

- A regression fix for HD-audio HDMI probe
- USB-audio hardening patches for issues spotted by fuzzers
- ASoC fixes for TAS278x, SoundWire and Cirrus
- Usual HD-audio and USB-audio quirks

----------------------------------------------------------------

Baojun Xu (2):
      ALSA: hda/tas2781: Add new quirk for HP new projects
      ALSA: hda/tas2781: Correct the wrong project ID

Claudiu Beznea (1):
      ASoC: da7213: Use component driver suspend/resume

Haein Lee (1):
      ALSA: usb-audio: Fix NULL pointer dereference in snd_usb_mixer_controls_badd

Haotian Zhang (3):
      ASoC: cs4271: Fix regulator leak on probe failure
      ASoC: codecs: va-macro: fix resource leak in probe error path
      ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()

Lushih Hsieh (1):
      ALSA: usb-audio: Add native DSD quirks for PureAudio DAC series

Miaoqian Lin (1):
      ASoC: sdw_utils: fix device reference leak in is_sdca_endpoint_present()

Niranjan H Y (2):
      ASoC: tas2783A: Fix issues in firmware parsing
      ASoC: SDCA: bug fix while parsing mipi-sdca-control-cn-list

Pauli Virtanen (1):
      ALSA: usb-audio: add min_mute quirk for SteelSeries Arctis

Richard Fitzgerald (1):
      ASoC: doc: cs35l56: Update firmware filename description for B0 silicon

Shenghao Ding (1):
      ASoC: tas2781: fix getting the wrong device number

Takashi Iwai (2):
      ALSA: hda/hdmi: Fix breakage at probing nvhdmi-mcp driver
      ALSA: usb-audio: Fix potential overflow of PCM transfer buffer

---
 Documentation/sound/codecs/cs35l56.rst |  9 ++---
 sound/hda/codecs/hdmi/nvhdmi-mcp.c     |  4 +-
 sound/hda/codecs/realtek/alc269.c      |  9 +++++
 sound/soc/codecs/cs4271.c              | 10 +++--
 sound/soc/codecs/da7213.c              | 69 ++++++++++++++++++++++------------
 sound/soc/codecs/da7213.h              |  1 +
 sound/soc/codecs/lpass-va-macro.c      |  2 +-
 sound/soc/codecs/tas2781-i2c.c         |  9 ++++-
 sound/soc/codecs/tas2783-sdw.c         | 20 +++++++++-
 sound/soc/renesas/rcar/ssiu.c          |  3 +-
 sound/soc/sdca/sdca_functions.c        |  3 +-
 sound/soc/sdw_utils/soc_sdw_utils.c    | 20 +++++++---
 sound/usb/endpoint.c                   |  5 +++
 sound/usb/mixer.c                      |  2 +
 sound/usb/quirks.c                     |  8 ++++
 15 files changed, 125 insertions(+), 49 deletions(-)

