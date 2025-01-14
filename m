Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F36628EC77;
	Tue, 14 Jan 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736844010; cv=none; b=GHX0yOxvayAEBhD0IuaWkVQ92mrU+JnZgaJc5xEMz5AbVGuWZDFwQdk47OoDwKeUZMRhUtbiIlxXozZx0ePgyikdRyju6l2tax6EU9O9SzXw3Jvfqsus3ra8ZgHTS7wuX/HQZSYp2vMFGizT3d+8sgPlYQTEpSnyAdkiSO7AMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736844010; c=relaxed/simple;
	bh=CmzkPb2VS4wyldhj8f+VxvN/YRKcl8Y+7dcG6CY7Vs4=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=hUMFoPNN7bTYx/U95g3fqt13tkYiJLq4EgYrMrPekJh4d863Cc70hf+XLmvyQz9qqMKR+L39oNDL8SCyJXh9QUk+h/mBaVQfvpZqOZpbd2qTh/1Z0Xm0w+uJ51oFYIa1+t69ixQrlF4h8J7JFAH/EQNqHx9S+DOkjzn8j9Iro3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ToSnK5o/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wY5ETj4q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ToSnK5o/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wY5ETj4q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ToSnK5o/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wY5ETj4q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ToSnK5o/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wY5ETj4q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BDF31F7A0;
	Tue, 14 Jan 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736844006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=x/heaEmRcOCSwOrGF40b2DV6HIdD29ML8eEw5zgrirA=;
	b=ToSnK5o/bAxeWvA/ibQwlLPqoYtA9/AaAJv73sFBofQzwQEO95MG85SyykxxQ4/FGF5yfN
	8Harbv8wn83biGRRh0AkzUaP2BQYj+z9uuZ/cAswjNZi3Je0ig5pYyljpCjdRjlHxYPEtJ
	F5zRT0gitftKlib+J3ahmknrplXmLYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=x/heaEmRcOCSwOrGF40b2DV6HIdD29ML8eEw5zgrirA=;
	b=wY5ETj4qwgcJyxQNQAqJf55xD1XaFc32frPZn1YGoq+lls+6hKwdJXnhPl9jsOwJJKjxIH
	dOmM0/Ld5w41F3AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736844006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=x/heaEmRcOCSwOrGF40b2DV6HIdD29ML8eEw5zgrirA=;
	b=ToSnK5o/bAxeWvA/ibQwlLPqoYtA9/AaAJv73sFBofQzwQEO95MG85SyykxxQ4/FGF5yfN
	8Harbv8wn83biGRRh0AkzUaP2BQYj+z9uuZ/cAswjNZi3Je0ig5pYyljpCjdRjlHxYPEtJ
	F5zRT0gitftKlib+J3ahmknrplXmLYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=x/heaEmRcOCSwOrGF40b2DV6HIdD29ML8eEw5zgrirA=;
	b=wY5ETj4qwgcJyxQNQAqJf55xD1XaFc32frPZn1YGoq+lls+6hKwdJXnhPl9jsOwJJKjxIH
	dOmM0/Ld5w41F3AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3A881384C;
	Tue, 14 Jan 2025 08:40:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cO9VNuUihmdRaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 08:40:05 +0000
Date: Tue, 14 Jan 2025 09:40:05 +0100
Message-ID: <8734hl23h6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.13-final
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

please pull sound fixes for v6.13-final from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13

The topmost commit is 34c8e74cd6667ef5da90d448a1af702c4b873bd3

----------------------------------------------------------------

sound fixes for 6.13-final

Hopefully the last PR for 6.13.  This became bigger than wished
due to the timing after holiday breaks.

The only large LOC is the additional document for Cirrus codec
which is nice for users (and absolutely safe).  All the rest are
small fixes in ASoC Rcar and codecs as well as HD-audio quirks.
(And no fix for USB guitar pedals seen yet :)

----------------------------------------------------------------

Charles Keepax (3):
      ASoC: wm8994: Add depends on MFD core
      ASoC: samsung: Add missing selects for MFD_WM8994
      ASoC: samsung: Add missing depends on I2C

Kuninori Morimoto (2):
      MAINTAINERS: add missing maintainers for Simple Audio Card
      ASoC: rsnd: check rsnd_adg_clk_enable() return value

Luke D. Jones (2):
      ALSA: hda/realtek: fixup ASUS GA605W
      ALSA: hda/realtek: fixup ASUS H7606W

Maciej Strozek (1):
      ASoC: cs42l43: Add codec force suspend/resume ops

Marian Postevca (1):
      ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK

Richard Fitzgerald (2):
      ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57
      ALSA: doc: Add codecs/index.rst to top-level index

Shenghao Ding (1):
      ASoC: tas2781: Fix occasional calibration failture

Stefan Binding (1):
      ALSA: hda/realtek: Add support for Ayaneo System using CS35L41 HDA

Yage Geng (1):
      ALSA: hda/realtek: Fix volume adjustment issue on Lenovo ThinkBook 16P Gen5

Zhang Yi (1):
      ASoC: codecs: ES8326: Adjust ANA_MICBIAS to reduce pop noise

---
 Documentation/sound/codecs/cs35l56.rst | 292 +++++++++++++++++++++++++++++++++
 Documentation/sound/codecs/index.rst   |   9 +
 Documentation/sound/index.rst          |   1 +
 MAINTAINERS                            |   2 +
 sound/pci/hda/patch_realtek.c          |   7 +-
 sound/soc/codecs/Kconfig               |   1 +
 sound/soc/codecs/cs42l43.c             |   1 +
 sound/soc/codecs/es8316.c              |  10 +-
 sound/soc/codecs/es8326.c              |  23 ++-
 sound/soc/codecs/tas2781-i2c.c         |   2 +-
 sound/soc/renesas/rcar/adg.c           |  28 +++-
 sound/soc/renesas/rcar/core.c          |   4 +-
 sound/soc/renesas/rcar/rsnd.h          |   2 +-
 sound/soc/samsung/Kconfig              |   6 +-
 14 files changed, 369 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/sound/codecs/cs35l56.rst
 create mode 100644 Documentation/sound/codecs/index.rst

