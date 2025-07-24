Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344252C3757
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753361390; cv=none; b=UuswGuVQcDFcNxLfEVJqYJPljC148Ezn5vyk515G1qpOnOweRbSneTMX3y5YSLAX53aZsHkdi3wEySEmbUyspBEr6B+L9eME2DfXHb41oILUid23F+ZKqt6zKQhN+GW13K/0vLXf5Spn94eW0gyOxjsUk3dZ1xUPUWqHYPeXSTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753361390; c=relaxed/simple;
	bh=MUiHEiFslWfuxu4LcdNZXafhiO6sVymXKZQJoz8zPT8=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=ZmIbD3a/RLAzLfaleWXqA7jPU41wNeDGyt0dRJ4jfnjKkbeXCa59eMivTs1cPc3iF3vd9AJaFIxYetqGJVmTg4zFtANXQkATvGQWOZEw58ZvFtu5HZ0ovRZR83oSGSfaIpzko8A+BthwEjPWAA7mhmfSjw8OG8Qh4Uohb5hOOYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyse4J3r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+pHhYrkt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyse4J3r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+pHhYrkt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyse4J3r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+pHhYrkt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyse4J3r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+pHhYrkt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 899012191F;
	Thu, 24 Jul 2025 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753361387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=olqeYXgaFAkqM0Duf7s0lQpb0HS04XjUFVNc0iTKkgo=;
	b=nyse4J3ruKeULYfkJrMSEtBP2uNdnr/lirFYnD5KayIzCUWixGI6atPQ9yrN3qS6CrLo90
	CPOdF3hLrI09tcGgM8gqBQo2Wi+WY438wDllgVNluMWeZVsLZN8GRbZOMYI60o8OU0SlW8
	KiQsMnqJZAPpFcxb0w+kjTFnYzFs69I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753361387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=olqeYXgaFAkqM0Duf7s0lQpb0HS04XjUFVNc0iTKkgo=;
	b=+pHhYrktBSIB02YWWplyIgz2Eg/Xtj2ncIey2plHAB8p0TI88F0dp2a061E6VvLHfkl8WC
	X/7sAdm+b1RJfPAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753361387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=olqeYXgaFAkqM0Duf7s0lQpb0HS04XjUFVNc0iTKkgo=;
	b=nyse4J3ruKeULYfkJrMSEtBP2uNdnr/lirFYnD5KayIzCUWixGI6atPQ9yrN3qS6CrLo90
	CPOdF3hLrI09tcGgM8gqBQo2Wi+WY438wDllgVNluMWeZVsLZN8GRbZOMYI60o8OU0SlW8
	KiQsMnqJZAPpFcxb0w+kjTFnYzFs69I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753361387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=olqeYXgaFAkqM0Duf7s0lQpb0HS04XjUFVNc0iTKkgo=;
	b=+pHhYrktBSIB02YWWplyIgz2Eg/Xtj2ncIey2plHAB8p0TI88F0dp2a061E6VvLHfkl8WC
	X/7sAdm+b1RJfPAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60964136DC;
	Thu, 24 Jul 2025 12:49:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bCNkFusrgmhDFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 12:49:47 +0000
Date: Thu, 24 Jul 2025 14:49:47 +0200
Message-ID: <87seilkb2s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.16
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

Linus,

please pull sound fixes for v6.16 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16

The topmost commit is 0d57ed922b9a9b0d36c90a992e076d850b779be5

----------------------------------------------------------------

sound fixes for 6.16-final

Some last-minute fixes.  All changes are device-specific small fixes
or quirks, safe to apply.

----------------------------------------------------------------

Dawid Rezler (1):
      ALSA: hda/realtek - Add mute LED support for HP Pavilion 15-eg0xxx

Derek Fang (1):
      ASoC: rt5650: Eliminate the high frequency glitch

Edip Hazuri (1):
      ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa0xxx

Erick Karanja (1):
      ALSA: usb-audio: qcom: Adjust mutex unlock order

Guoqing Jiang (1):
      ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv

Johan Hovold (1):
      ASoC: mediatek: common: fix device and OF node leak

Ranjani Sridharan (1):
      ASoC: SOF: Intel: PTL: Add the sdw_process_wakeen op

SHARAN KUMAR M (1):
      ALSA: hda/realtek: Fix mute LED mask on HP OMEN 16 laptop

Shuming Fan (1):
      ASoC: SDCA: correct the calculation of the maximum init table size

---
 sound/pci/hda/patch_realtek.c                    | 4 +++-
 sound/soc/codecs/rt5645.c                        | 1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 4 ++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c       | 3 +--
 sound/soc/sdca/sdca_functions.c                  | 2 +-
 sound/soc/sof/intel/ptl.c                        | 1 +
 sound/usb/qcom/qc_audio_offload.c                | 6 +++---
 7 files changed, 14 insertions(+), 7 deletions(-)

