Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3030FC26
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314275; cv=none; b=RQil7526vkGT/VEr9q1xouusxlXSBeVjgAV4uF9pQBf4KrOWaWjyMduclqZWaaxsT0T01J3pu561BKDIWJ9lsNOlPXRVlZAEfhm2WELq9Mu5/MQANExUq7+jFDOcN71kwt5eZQZDJmzdQQAVflUW9Ae05MhUPlvysS8Yl5Nt+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314275; c=relaxed/simple;
	bh=dKq7CUw6owkP8lYAdvhzETn86rF/QcYgDSwHWS5V9Gw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L9mgse1M7XN4ho9dsPjRjJ7fh8EC2nCjQLttE9+sGnMfXFULzgUqBOIBWGQcCZUkKpIKBeoLXYiPVUSVY6CM1D8a64FMvydGprmIsy/R3RsFACTdqxhruf1Bp9I7kGAjDjALfublE2tT0xrXgxfSgAkA3iu/RVteintuOWB6p6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vLgPAvXU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=47kdfvAA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zwZ49zWp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r5vZ979E; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vLgPAvXU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="47kdfvAA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zwZ49zWp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r5vZ979E"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6DA053DF5;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J8Zc1tCswMWH0e3Yf6as3OI77unagYolURKFfci7ppE=;
	b=vLgPAvXU4z+BXI6haXk2WbqOW8fzdcGBVOqt8fh+6d2cje6AJ8GLzAkiae6Q4jaj9IW9VX
	tBCJUF8vm1wmM930pnvgaHlRFhDpIWO3ltr7KMxnA69P1b7yDJxaE7lgJJkXhHqNZgHhW7
	gCP4hGclFQVwEBkiCqrCFO6XuAWjgWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J8Zc1tCswMWH0e3Yf6as3OI77unagYolURKFfci7ppE=;
	b=47kdfvAAlmqS89FEoluhkrI5y0NkKNlEuS7ig0YIORe+YEGU64uFMlttXYv+IZR2T8B50S
	BJt/nzu5sSwRhUDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zwZ49zWp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=r5vZ979E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J8Zc1tCswMWH0e3Yf6as3OI77unagYolURKFfci7ppE=;
	b=zwZ49zWppgjH/tvjhZr5V2OmJpOMJknHFZpCUg9/yFq3N7IfzE2p3BHmHjerrMXOQsaFfE
	onveFlaLqjHnlTnghZddLYc3D0dfSlZPX6KrsAUKR8or5zJtyyk14H9mbe5zUC6o4nEUC/
	7DqTeEqTsp0zdZvIEd96nm10c2nBXRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J8Zc1tCswMWH0e3Yf6as3OI77unagYolURKFfci7ppE=;
	b=r5vZ979EqoyIMkFBrKnQCxcdQfTlTMVnadBCjzbzKyv3YMht+E/QwMjqHF4hgHdb0cO3Zc
	vmJMK0HVOifiSQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 526B2779A1;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FJzhEte7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/14] ALSA: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:18 +0200
Message-ID: <20260729083735.120219-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6DA053DF5
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

This is a series of trivial patches that replace the manual
release_firmware() calls with the auto-cleanup via __free(firmware).

It doesn't cover all drivers but just a few as a start.


Takashi

===

Takashi Iwai (14):
  ALSA: 6fire: Use auto-cleanup for firmware loading
  ALSA: hda: ca0132: Use auto-cleanup for firmware loading
  ALSA: hda: intel: Use auto-cleanup for firmware loading
  ALSA: msnd: Use auto-cleanup for firmware loading
  ALSA: hda: cs35l41: Use auto-cleanup for firmware loading
  ALSA: hda: cs35l56: Use auto-cleanup for firmware loading
  ALSA: sscape: Use auto-cleanup for firmware loading
  ALSA: wavefront: Use auto-cleanup for firmware loading
  ALSA: asihpi: Use auto-cleanup for firmware loading
  ALSA: cs46xx: Use auto-cleanup for firmware loading
  ALSA: korg1212: Use auto-cleanup for firmware loading
  ALSA: mixart: Use auto-cleanup for firmware loading
  ALSA: pcxhr: Use auto-cleanup for firmware loading
  ALSA: sh: Use auto-cleanup for firmware loading

 sound/hda/codecs/ca0132.c                  | 12 ++------
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 33 ++++++++------------
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 35 ++++++----------------
 sound/hda/controllers/intel.c              |  3 +-
 sound/isa/msnd/msnd_pinnacle.c             | 18 ++++-------
 sound/isa/sscape.c                         |  8 ++---
 sound/isa/wavefront/wavefront_fx.c         | 23 +++++---------
 sound/isa/wavefront/wavefront_synth.c      |  4 +--
 sound/pci/asihpi/hpidspcd.c                | 18 +++++------
 sound/pci/cs46xx/cs46xx_lib.c              | 30 +++++++------------
 sound/pci/korg1212/korg1212.c              |  8 ++---
 sound/pci/mixart/mixart_hwdep.c            |  4 +--
 sound/pci/pcxhr/pcxhr_hwdep.c              |  3 +-
 sound/sh/aica.c                            |  4 +--
 sound/usb/6fire/firmware.c                 | 24 +++------------
 15 files changed, 69 insertions(+), 158 deletions(-)

-- 
2.55.0

