Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D5331DD83
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478632; cv=none; b=ahfiRfFTUzh+QucGwYH1uqhUCo+2JqnHdPoCyORwQMBJCX9GqfeqgzyJjaIcozBCl05GQ6A1rNvUbo7DM84fnqPmfIdrNsDhlIQhdbRb+DjtsF/oxbLHAsYBtdp6Wtb/893ZGX/ftlmm0uwmlHGQ2QZ6oVzkdEF9ml0SXH4Au+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478632; c=relaxed/simple;
	bh=42qPBevvQK7bCWNP6IvcANcKdMqtITitN9PR32b4SkY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iqcNOawj9E89LCbkG3LvJBAtIMR1QWl/pynkk/xKWKADQP9dyr8Z0ayg/9JzR1YRyKoYsTiNuzKJKuL2GqjyS4y43PgCUpv1X1/4uTLaFj1ewdZa3TdrIQJGqqM7evc092oiyEewb2uO3djPRRBvI9U652lcX226NuW9EdJeFvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iyEznQ3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P4qf97Ct; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iyEznQ3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P4qf97Ct; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iyEznQ3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4qf97Ct";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iyEznQ3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4qf97Ct"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B53B33EC5;
	Fri, 29 Aug 2025 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+sunVAHqyJNfttQMN+JlbAya8njLu1WRgNz5AYlTA8=;
	b=iyEznQ3OkTzKYhltJvIS8/jGSZ5837bWXGhTUq+OzJzt+eewP2TPjw8CNwSaWnLkaqZA9G
	G/r6cvi0f73FppV8V8wUrfVeCcsD3at7pTX1o9ox/IU6pqtF2jrYjBWdOl7U43g5UDTmat
	rutRhlpe+FyEPwLIUEirGm/eRxWOfJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+sunVAHqyJNfttQMN+JlbAya8njLu1WRgNz5AYlTA8=;
	b=P4qf97CtwN6qHXbJc26sy8lj3l38w7o1fr2tQMWRi43cTD/iGbtNlwIvANF5yZ9Z2MPqV/
	T2IiO6d0/xNkoSBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iyEznQ3O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P4qf97Ct
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+sunVAHqyJNfttQMN+JlbAya8njLu1WRgNz5AYlTA8=;
	b=iyEznQ3OkTzKYhltJvIS8/jGSZ5837bWXGhTUq+OzJzt+eewP2TPjw8CNwSaWnLkaqZA9G
	G/r6cvi0f73FppV8V8wUrfVeCcsD3at7pTX1o9ox/IU6pqtF2jrYjBWdOl7U43g5UDTmat
	rutRhlpe+FyEPwLIUEirGm/eRxWOfJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+sunVAHqyJNfttQMN+JlbAya8njLu1WRgNz5AYlTA8=;
	b=P4qf97CtwN6qHXbJc26sy8lj3l38w7o1fr2tQMWRi43cTD/iGbtNlwIvANF5yZ9Z2MPqV/
	T2IiO6d0/xNkoSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11ADB13A3E;
	Fri, 29 Aug 2025 14:43:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eLAHA6S8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/61] ALSA: Use auto-cleanup for PCI drivers
Date: Fri, 29 Aug 2025 16:42:35 +0200
Message-ID: <20250829144342.4290-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2B53B33EC5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

This is another patch set for applying the auto-cleanup macros to
sound/pci/* code.  Merely code cleanups and no functional changes are
expected by all those changes.


Takashi

===

Takashi Iwai (61):
  ALSA: ac97: Use guard() for mutex locks
  ALSA: ac97: Use guard() for spin locks
  ALSA: ali5451: Use guard() for spin locks
  ALSA: azt3328: Use guard() for spin locks
  ALSA: ens137x: Use guard() for mutex locks
  ALSA: ens137x: Use guard() for spin locks
  ALSA: als300: Use guard() for spin locks
  ALSA: als4000: Use guard() for spin locks
  ALSA: ad1889: Use guard() for spin locks
  ALSA: atiixp: Use guard() for mutex locks
  ALSA: atiixp: Use guard() for spin locks
  ALSA: aw2: Use guard() for mutex locks
  ALSA: aw2: Use guard() for spin locks
  ALSA: bt87x: Use guard() for spin locks
  ALSA: ca0106: Use guard() for spin locks
  ALSA: cmipci: Use guard() for mutex locks
  ALSA: cmipci: Use guard() for spin locks
  ALSA: cs4281: Use guard() for spin locks
  ALSA: cs46xx: Use guard() for mutex locks
  ALSA: cs46xx: Use guard() for spin locks
  ALSA: cs5535audio: Use guard() for spin locks
  ALSA: ctxfi: Use guard() for mutex locks
  ALSA: ctxfi: Use guard() for spin locks
  ALSA: echoaudio: Use guard() for mutex locks
  ALSA: echoaudio: Use guard() for spin locks
  ALSA: emu10k1: Use guard() for mutex locks
  ALSA: emu10k1: Use guard() for emu1010 FPGA locking
  ALSA: emu10k1: Use guard() for spin locks
  ALSA: emu10k1x: Use guard() for spin locks
  ALSA: es1938: Use guard() for spin locks
  ALSA: es1968: Use guard() for mutex locks
  ALSA: es1968: Use guard() for spin locks
  ALSA: fm801: Use guard() for spin locks
  ALSA: ice1712: Use guard() for mutex locks
  ALSA: ice1712: Use guard() for spin locks
  ALSA: intel8x0: Use guard() for spin locks
  ALSA: korg1212: Use guard() for mutex locks
  ALSA: korg1212: Use guard() for spin locks
  ALSA: lola: Use guard() for mutex locks
  ALSA: lola: Use guard() for spin locks
  ALSA: lx6464es: Use guard() for mutex locks
  ALSA: maestro3: Use guard() for spin locks
  ALSA: mixart: Use guard() for mutex locks
  ALSA: nm256: Use guard() for mutex locks
  ALSA: nm256: Use guard() for spin locks
  ALSA: oxygen: Use guard() for mutex locks
  ALSA: oxygen: Use guard() for spin locks
  ALSA: pcxhr: Use guard() for mutex locks
  ALSA: rme32: Use guard() for spin locks
  ALSA: rme96: Use guard() for spin locks
  ALSA: hdsp: Use guard() for spin locks
  ALSA: hdspm: Use guard() for spin locks
  ALSA: rme9652: Use guard() for spin locks
  ALSA: sis7019: Use guard() for mutex locks
  ALSA: sis7019: Use guard() for spin locks
  ALSA: sonicvibes: Use guard() for spin locks
  ALSA: trident: Use guard() for mutex locks
  ALSA: trident: Use guard() for spin locks
  ALSA: via82xx: Use guard() for spin locks
  ALSA: vx222: Use guard() for mutex locks
  ALSA: ymfpci: Use guard() for spin locks

 include/sound/emu10k1.h                 |   3 +-
 sound/pci/ac97/ac97_codec.c             |  32 +--
 sound/pci/ac97/ac97_patch.c             |   9 +-
 sound/pci/ac97/ac97_pcm.c               |  50 ++--
 sound/pci/ac97/ac97_proc.c              |  10 +-
 sound/pci/ad1889.c                      |  12 +-
 sound/pci/ak4531_codec.c                |  18 +-
 sound/pci/ali5451/ali5451.c             |  92 +++----
 sound/pci/als300.c                      |  21 +-
 sound/pci/als4000.c                     |  68 +++--
 sound/pci/atiixp.c                      |  69 ++---
 sound/pci/atiixp_modem.c                |  49 ++--
 sound/pci/aw2/aw2-alsa.c                |  26 +-
 sound/pci/azt3328.c                     | 143 +++++------
 sound/pci/bt87x.c                       |  26 +-
 sound/pci/ca0106/ca0106_main.c          |  33 +--
 sound/pci/ca0106/ca0106_proc.c          |  28 +-
 sound/pci/ca0106/ca_midi.c              | 169 ++++++------
 sound/pci/cmipci.c                      | 185 ++++++--------
 sound/pci/cs4281.c                      |  53 ++--
 sound/pci/cs46xx/cs46xx_lib.c           | 200 ++++++---------
 sound/pci/cs46xx/dsp_spos.c             |  70 ++---
 sound/pci/cs46xx/dsp_spos_scb_lib.c     |  63 ++---
 sound/pci/cs5535audio/cs5535audio.c     |  14 +-
 sound/pci/cs5535audio/cs5535audio_pcm.c |  12 +-
 sound/pci/ctxfi/ctamixer.c              |  67 +++--
 sound/pci/ctxfi/ctatc.c                 |  28 +-
 sound/pci/ctxfi/ctdaio.c                |  42 ++-
 sound/pci/ctxfi/cthw20k1.c              |  39 +--
 sound/pci/ctxfi/ctsrc.c                 | 101 +++-----
 sound/pci/ctxfi/cttimer.c               |  63 ++---
 sound/pci/ctxfi/ctvmem.c                |  16 +-
 sound/pci/echoaudio/echoaudio.c         | 128 ++++------
 sound/pci/echoaudio/echoaudio_3g.c      |   6 +-
 sound/pci/echoaudio/gina24_dsp.c        |   3 +-
 sound/pci/echoaudio/layla24_dsp.c       |   6 +-
 sound/pci/echoaudio/midi.c              |  41 +--
 sound/pci/echoaudio/mona_dsp.c          |   3 +-
 sound/pci/emu10k1/emu10k1_main.c        |  27 +-
 sound/pci/emu10k1/emu10k1_synth.c       |  11 +-
 sound/pci/emu10k1/emu10k1x.c            | 221 +++++++---------
 sound/pci/emu10k1/emufx.c               |  81 +++---
 sound/pci/emu10k1/emumixer.c            |  71 ++----
 sound/pci/emu10k1/emumpu401.c           | 173 ++++++-------
 sound/pci/emu10k1/emupcm.c              |  58 ++---
 sound/pci/emu10k1/emuproc.c             |  19 +-
 sound/pci/emu10k1/io.c                  | 123 +++------
 sound/pci/emu10k1/memory.c              |  34 +--
 sound/pci/emu10k1/p16v.c                |   8 +-
 sound/pci/emu10k1/voice.c               |   8 +-
 sound/pci/ens1370.c                     | 316 +++++++++++------------
 sound/pci/es1938.c                      |  28 +-
 sound/pci/es1968.c                      | 160 +++++-------
 sound/pci/fm801.c                       |  71 +++---
 sound/pci/ice1712/aureon.c              |  27 +-
 sound/pci/ice1712/delta.c               |  83 +++---
 sound/pci/ice1712/ews.c                 |  53 ++--
 sound/pci/ice1712/hoontech.c            |  24 +-
 sound/pci/ice1712/ice1712.c             | 186 ++++++--------
 sound/pci/ice1712/ice1724.c             | 314 +++++++++++------------
 sound/pci/ice1712/maya44.c              |  18 +-
 sound/pci/ice1712/phase.c               |   6 +-
 sound/pci/ice1712/pontis.c              |  70 ++---
 sound/pci/ice1712/prodigy192.c          |  11 +-
 sound/pci/ice1712/prodigy_hifi.c        |  56 ++--
 sound/pci/ice1712/quartet.c             |   3 +-
 sound/pci/ice1712/wtm.c                 |   6 +-
 sound/pci/intel8x0.c                    | 178 +++++++------
 sound/pci/intel8x0m.c                   |   8 +-
 sound/pci/korg1212/korg1212.c           | 182 +++++--------
 sound/pci/lola/lola.c                   |   4 +-
 sound/pci/lola/lola_pcm.c               |  36 +--
 sound/pci/lx6464es/lx6464es.c           |  49 ++--
 sound/pci/lx6464es/lx_core.c            | 107 +++-----
 sound/pci/maestro3.c                    |  23 +-
 sound/pci/mixart/mixart.c               |  48 ++--
 sound/pci/mixart/mixart_core.c          |  71 +++---
 sound/pci/mixart/mixart_mixer.c         |  46 ++--
 sound/pci/nm256/nm256.c                 |  37 +--
 sound/pci/oxygen/oxygen.c               |  12 +-
 sound/pci/oxygen/oxygen_lib.c           | 132 +++++-----
 sound/pci/oxygen/oxygen_mixer.c         |  66 ++---
 sound/pci/oxygen/oxygen_pcm.c           | 165 ++++++------
 sound/pci/oxygen/xonar_cs43xx.c         |   6 +-
 sound/pci/oxygen/xonar_dg_mixer.c       |  33 +--
 sound/pci/oxygen/xonar_lib.c            |   3 +-
 sound/pci/oxygen/xonar_pcm179x.c        |  21 +-
 sound/pci/oxygen/xonar_wm87x6.c         |  31 +--
 sound/pci/pcxhr/pcxhr.c                 |  35 +--
 sound/pci/pcxhr/pcxhr_core.c            |  15 +-
 sound/pci/pcxhr/pcxhr_mix22.c           |  23 +-
 sound/pci/pcxhr/pcxhr_mixer.c           |  58 ++---
 sound/pci/rme32.c                       | 152 ++++-------
 sound/pci/rme96.c                       | 211 +++++++--------
 sound/pci/rme9652/hdsp.c                | 309 +++++++++-------------
 sound/pci/rme9652/hdspm.c               | 303 ++++++++++------------
 sound/pci/rme9652/rme9652.c             | 203 ++++++---------
 sound/pci/sis7019.c                     |  43 ++--
 sound/pci/sonicvibes.c                  | 113 ++++-----
 sound/pci/trident/trident_main.c        | 324 ++++++++++--------------
 sound/pci/trident/trident_memory.c      |  19 +-
 sound/pci/via82xx.c                     |  80 +++---
 sound/pci/via82xx_modem.c               |   6 +-
 sound/pci/vx222/vx222_ops.c             |  12 +-
 sound/pci/ymfpci/ymfpci_main.c          | 248 ++++++++----------
 105 files changed, 3094 insertions(+), 4582 deletions(-)

-- 
2.50.1

