Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F217FE;
	Fri,  3 Jan 2025 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916172; cv=none; b=DJ7sr3cUbUDR8MdxiH2ynApaFcCvT3wQGhmbZd9/2EhFop4nHXAkQ4xKQ6tcDYovcDu6w7i5HdO7QeKB8pb5CbWypeeoUewpqg0KfDkFma31Wz9zij1eW+IryXxQsn8KSnZhSPRqXvTBLdwHHAfKEOGfS2NIwMCecvRC+HxOzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916172; c=relaxed/simple;
	bh=zO9U1lBM7Z5ybRjIXHFxL5FKqCQnUIGpb9HHzEEnpc4=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=HjCLfyR4tUnkk0YJ7so4sEd6d137aiglb0SmEI6nk2cxsctMPKyPG/yye5WBB5H6XpyBqYfmOvGQPNM1aBirzO0YsfDttBop3JQWMZ3R8nrmeLVcfWKseYlFWfYyZWGXp7EG849TJZSyW0qT3yYhPQskB4+dyWt11M0vccApS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Il2ZXaE2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ahn+51x4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Egwf/q4C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QlrgHN1G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Il2ZXaE2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ahn+51x4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Egwf/q4C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QlrgHN1G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5C6021119;
	Fri,  3 Jan 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735916168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=hp+MvlRi0RdjtGWUlzXAd3ZGMINkN1RwyuU1F3H+5Fo=;
	b=Il2ZXaE2ynx9p6or4NCQ2cB0jESpwhO4jfo1mZiIeKxRPph8N4i/1mGc0XxxLssOi5h3IF
	AxvxEX6yn4k4TIYYmYGle3z4TgUNCSlmpEGKamRY0Rg/U0/La6IM7H5K7I5CJeqEPlWAuZ
	Vc+8HxsJKWVog+dJfZpJGLm52VDXB28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735916168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=hp+MvlRi0RdjtGWUlzXAd3ZGMINkN1RwyuU1F3H+5Fo=;
	b=ahn+51x42aa0ggmqiFj7J7Q0LeN4W8xz+PKIpqBJOQgzUxQl/rqgfjM8luFJnY7xuI0C90
	2IG8UR4eXAWHKSBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Egwf/q4C";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QlrgHN1G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735916166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=hp+MvlRi0RdjtGWUlzXAd3ZGMINkN1RwyuU1F3H+5Fo=;
	b=Egwf/q4CpwTfGyXHnNq0tzNe5vKDZvqs1Dj47+B3TDXGB6YVFMOjVlo2IPDUcw1lljaFRv
	O8BIk0WRMSgOgOetnw4Lbb+PvXpjeSGxFCeRqJUNI6ri8muo/PRE8Jhuc2cRAI67t4AalN
	wqeIqDxroRBYkc+IG8m9ctQ5K2Y57e8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735916166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=hp+MvlRi0RdjtGWUlzXAd3ZGMINkN1RwyuU1F3H+5Fo=;
	b=QlrgHN1GChs1mj9+eSFND1Ca30g9DRYlLklTg4QsFVz24R4VmySxSvvnQMSH7yaeClizB9
	YVsQL8gUMKmPc6Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C60B213418;
	Fri,  3 Jan 2025 14:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vYAaL4b6d2crZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jan 2025 14:56:06 +0000
Date: Fri, 03 Jan 2025 15:56:06 +0100
Message-ID: <87ttagymih.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.13-rc6
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E5C6021119
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

[ resent due to wrong mail format -- sorry! ]

Linus,

please pull sound fixes for v6.13-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13-rc6

The topmost commit is 8765429279e7d3d68d39ace5f84af2815174bb1e

----------------------------------------------------------------

sound fixes for 6.13-rc6

The first new year PR: no surprise, all small fixes, including:

- Follow-up fixes for the new compress-offload API extension
- A couple of fixes for MIDI 2.0 UMP handling
- A trivial race fix for OSS sequencer emulation ioctls
- USB-audio and HD-audio fixes / quirks

----------------------------------------------------------------

Al Viro (1):
      ALSA: compress_offload: fix remaining descriptor races in sound/core/compress_offload.c

Baojun Xu (1):
      ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects

Daniel Schaefer (1):
      ALSA hda/realtek: Add quirk for Framework F111:000C

Takashi Iwai (4):
      ALSA: compress_offload: Drop unneeded no_free_ptr()
      ALSA: seq: oss: Fix races at processing SysEx messages
      Revert "ALSA: ump: Don't enumeration invalid groups for legacy rawmidi"
      ALSA: seq: Check UMP support for midi_version change

Tanya Agarwal (1):
      ALSA: usb-audio: US16x08: Initialize array before use

---
 sound/core/compress_offload.c      | 12 ++++++------
 sound/core/seq/oss/seq_oss_synth.c |  2 ++
 sound/core/seq/seq_clientmgr.c     | 14 ++++++++++----
 sound/core/ump.c                   |  2 +-
 sound/pci/hda/patch_realtek.c      |  1 +
 sound/pci/hda/tas2781_hda_i2c.c    |  4 ++++
 sound/usb/mixer_us16x08.c          |  2 +-
 7 files changed, 25 insertions(+), 12 deletions(-)

