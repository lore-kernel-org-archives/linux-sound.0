Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D282866
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885660; cv=none; b=COoZtUwtPaQQ0BevJbBrNpe6UZrdOdyMQeaCtF6+yAEiXBMQXNgFiiLvG2/a3rgNTmY6xZY3msgyUTJMd+SfDpLKphOaishNBjzWtNpedymitL/ECkhw1iDxJ/lz+QuAvpGjymzhSgr67JXf1GMvGrbwuavC1JU2wWo0nqCH3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885660; c=relaxed/simple;
	bh=/Qu3YWt9IdHTTPfgJcFMYTnsu5Vcdqs3k1wsna/ysig=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dky1AXlXMZIfaAle6fu7diAwdEjh4lZr0qESPRuyi+YFnZNDf7KrBhS2nqUWema8FrJv1xVvZzg2F5+5sLxbcPBkwfx+/X9lHGHIKsJMT89l3HDbZ/ZspDP5g+2CtTrQZMtkb0xDoQABukHdvRQrs3ZMMqlaOBD/YulWhOvsHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VuNsOQid; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXyWl0xt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VuNsOQid; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXyWl0xt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VuNsOQid";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXyWl0xt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VuNsOQid";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXyWl0xt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D76321187;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=soJpeVKPX+Kt0yze7dg437LY1lR2DA7Y+lP4xHUHoa0=;
	b=VuNsOQidBBNbXncRXv+hCKlEYFINr9SrmVvHjlxdq+NHb07HQ7tRiZh8UfZBezg7/Znr+w
	+hHdGcMqTMd4W5/5YUx5yLEJVxylpqxqs+w4A+6PrEiwhdwb/WDmliwxKQJCYcZ7yLiqj9
	8wMpv7cv9Mt4m+RAR/9el44QpPS23as=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=soJpeVKPX+Kt0yze7dg437LY1lR2DA7Y+lP4xHUHoa0=;
	b=qXyWl0xttA/vdx2HHxklh8PhMU2/x24mHggWme0jeTWwWW7xQ8luRL0l6IGvD7WNSzCdz9
	RGkK7SCKzivXDHCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=soJpeVKPX+Kt0yze7dg437LY1lR2DA7Y+lP4xHUHoa0=;
	b=VuNsOQidBBNbXncRXv+hCKlEYFINr9SrmVvHjlxdq+NHb07HQ7tRiZh8UfZBezg7/Znr+w
	+hHdGcMqTMd4W5/5YUx5yLEJVxylpqxqs+w4A+6PrEiwhdwb/WDmliwxKQJCYcZ7yLiqj9
	8wMpv7cv9Mt4m+RAR/9el44QpPS23as=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=soJpeVKPX+Kt0yze7dg437LY1lR2DA7Y+lP4xHUHoa0=;
	b=qXyWl0xttA/vdx2HHxklh8PhMU2/x24mHggWme0jeTWwWW7xQ8luRL0l6IGvD7WNSzCdz9
	RGkK7SCKzivXDHCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7FEE13797;
	Thu, 13 Mar 2025 17:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XadJN9cQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/9] ALSA: PM code cleanups
Date: Thu, 13 Mar 2025 18:07:18 +0100
Message-ID: <20250313170731.26943-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

This is a patch set to convert to the newer PM macros.
All systematically converted, and should be no influence on the driver
behavior (except that it can save a few bytes when CONFIG_PM is
disabled).


Takashi

===

Takashi Iwai (9):
  ALSA: ac97: Convert to RUNTIME_PM_OPS() macro
  ALSA: atmel: Convert to DEFINE_SIMPLE_DEV_PM_OPS() macro
  ALSA: pcm: Convert to SYSTEM_SLEEP_PM_OPS()
  ALSA: hda: Use RUNTIME_PM_OPS() and pm_ptr()
  ALSA: hda-intel: Convert to RUNTIME_PM_OPS()
  ALSA: hda/tegra: Convert to RUNTIME_PM_OPS() & co
  ALSA: oxygen: Convert to EXPORT_SIMPLE_DEV_PM_OPS()
  ALSA: vx222: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: intel-hdmi-audio: Convert to SYSTEM_SLEEP_PM_OPS()

 sound/ac97/bus.c              |  9 ++-------
 sound/atmel/ac97c.c           |  9 ++-------
 sound/core/pcm.c              |  4 +---
 sound/pci/hda/hda_bind.c      |  2 +-
 sound/pci/hda/hda_codec.c     |  3 +--
 sound/pci/hda/hda_intel.c     | 12 ++++++------
 sound/pci/hda/hda_tegra.c     | 16 +++++++---------
 sound/pci/oxygen/oxygen.c     |  4 +---
 sound/pci/oxygen/oxygen.h     |  2 --
 sound/pci/oxygen/oxygen_lib.c |  5 +----
 sound/pci/oxygen/se6x.c       |  4 +---
 sound/pci/oxygen/virtuoso.c   |  4 +---
 sound/pci/vx222/vx222.c       |  9 ++-------
 sound/x86/intel_hdmi_audio.c  |  8 ++++----
 14 files changed, 30 insertions(+), 61 deletions(-)

-- 
2.43.0

