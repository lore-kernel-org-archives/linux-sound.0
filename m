Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CA1F0E2A
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265418; cv=none; b=sbrKas1Lp1uxNPyvbZfCRJDSWQ09WZxtL8l9UmB273tS24ChgNTdK3ESCjRYDIuKq/9f/94deI68sfGUyricZfOGnLaqBB/i8DWQVkyXlr4YTpN0nXwmkJ4VZLl/+quUtgUh7dGxK/efH3oYgvwzK1zlZS3fbqbl4aGawjPnw0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265418; c=relaxed/simple;
	bh=KE4lLiM1fq7WaD1Y03KNiTAjCYMtvEJwbcrSHWPokG8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f1KITFfL7hbQXITY2tbWdoWl493J+v15emyp7qsnQy52p13Yz8orkAMAf+joJNvJsTi36R0AEoM8bYd5jJVvhGWIod/3Txj1biuGoPUmMv4LIzwanmD+tZ3mDZtU0LSamrIERquZDGCeJTw10JDkx/YbBlGCdwv1sIKWbRT0j6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y05hm8lS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T19WcOFv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kbPEFxM2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElsmiNGn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y05hm8lS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T19WcOFv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kbPEFxM2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElsmiNGn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD6D81F385;
	Tue,  7 Jan 2025 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s55dUie13cRWyD0dtP+B4H3Y7cr8e0iokLDD+lctXpY=;
	b=Y05hm8lSj5scuFxKjxchMB3AVF4qVI/QRnTIFD9gzKnrhr8QIZiVdqqzQeWLe8CTZx6Khg
	AcJc4EbgCjVYwXoxOJ39gJ4DAIZA2D94kVI+7KSKwj9BypB0Zt5QsAIPT/Eu+PCXqPWcTr
	vCL3D3zz+IQ9OfrK3zZwS8dD/ecDIfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s55dUie13cRWyD0dtP+B4H3Y7cr8e0iokLDD+lctXpY=;
	b=T19WcOFvajsJZ7aPdSs0hMeMkTl6Q2TzHw2K6/MhL3rZgjc4NgIRF8bBKZ06ZVezAmRw3q
	xp3JfDmhDhLdwsAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kbPEFxM2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ElsmiNGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s55dUie13cRWyD0dtP+B4H3Y7cr8e0iokLDD+lctXpY=;
	b=kbPEFxM2FmTW3EwDC7e4f6Mnh65i8bkrZecN+cdiyMiUwV6GfDVFoXmEoyDD5I9Sn7OffY
	8bQbx8nWgYSInpRwIyaNjC1nUdyCaxlHGQKJsh9CaMe/7JdEiTdU2Qt9O+loRrD3FzMC10
	7ZPOplbYCM+VYNbAsnvTN2RjcfSvcXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s55dUie13cRWyD0dtP+B4H3Y7cr8e0iokLDD+lctXpY=;
	b=ElsmiNGnI1eyy2fqcsGhcTGPti6LfWubEvU5tsfjBxXIsRdsjvY/bnOmdYk4w0H6jsvtK8
	/nrbQvSTK3jZasDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D38413A9E;
	Tue,  7 Jan 2025 15:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZJ2SJMZOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/7] ALSA: Simplify with standard helpers
Date: Tue,  7 Jan 2025 16:56:30 +0100
Message-ID: <20250107155641.4435-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD6D81F385
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Hi,

this is a series of trivial patches just for replacing some code with
the standard string helpers like str_on_off() for code simplification.

No functional change.


Takashi

===

Takashi Iwai (7):
  ALSA: trident: Simplify with str_on_off()
  ALSA: sonicvibes: Simplify with str_off_on()
  ALSA: hdspm: Simplify with str_on_off()
  ALSA: emu10k1: Simplify with str_on_off()
  ALSA: firewire: Simplify with str_on_off()
  ALSA: seq: oss: Simplify with str_enabled_disabled()
  ALSA: hda: Simplify with str_enable_disable()

 sound/core/seq/oss/seq_oss_device.h          |  4 ----
 sound/core/seq/oss/seq_oss_init.c            |  6 ------
 sound/core/seq/oss/seq_oss_synth.c           |  4 ++--
 sound/firewire/fireface/ff-protocol-former.c |  4 ++--
 sound/hda/hdac_component.c                   |  7 +++----
 sound/pci/emu10k1/emuproc.c                  |  8 ++++----
 sound/pci/rme9652/hdspm.c                    | 15 ++++++---------
 sound/pci/sonicvibes.c                       |  2 +-
 sound/pci/trident/trident_main.c             |  4 ++--
 9 files changed, 20 insertions(+), 34 deletions(-)

-- 
2.43.0

