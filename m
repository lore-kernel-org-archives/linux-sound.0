Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33F53D954F
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931337; cv=none; b=Bg5rZy8BAsT3mdYoBkn3MJbwvyS48AM4tHUhskfshccypv4ACfBNxL6ZWal/M+EKsGuLazS8GmCUxO4mf/+OysE2ItyaJXOVpQlfRH5UhiyQJrZuvp5n0hU2VEEVEj1HQOVmwrIQLNakS0p7WjWzsn42LUy15CR1S0x2hsMMj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931337; c=relaxed/simple;
	bh=eMlxVs1WfKz/++FgCB+rnzTiVBsT/rA1/uVTQGsvf2c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cxFLpjI/9G1zyHd1FgRrHmIbGXd7EolA5neDhDJ/94BBuDm/zz6NPhMc2xNx8ByAuwJanZx0YF8fXEyLxi4R4BTxIou1HtKLpSv+QzxHv2OmPThIEjX3NfwJXgNFg6PzVaqWN7y7j0jOCY1Kr3PLAUa3oPiZWucxgttgjKJGYIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hN3YCvY+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YvDLf7gR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eg+50yA7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xjNg12u1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hN3YCvY+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YvDLf7gR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eg+50yA7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xjNg12u1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88E3421F29;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CtV//8iKt7E9AZldR2+XbXXFnTwB+6APFp9hmbcIE2c=;
	b=hN3YCvY+LeWNY8PBn8XK/qxhEGmuJ2jtnDVYT+OGVd1w834u4eD3vQcgpwo4StxRVwBInP
	1zIrrEk+hXcGGO8pQAOLGYva1D6Y63QFzpOjfAty4+aV7fmrZ/xcJNtTXdigasts5CIYre
	rkq6Rf7nnxTVlT+lEuctlkU9qOIYfIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CtV//8iKt7E9AZldR2+XbXXFnTwB+6APFp9hmbcIE2c=;
	b=YvDLf7gRRUVeJ90/aXnHZWTZ+Dov3uD5Dou5snT3XSpQNya/jI82vn3DyIIxNTzsJHEI81
	I/RE4lcmH5Uwf3CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CtV//8iKt7E9AZldR2+XbXXFnTwB+6APFp9hmbcIE2c=;
	b=eg+50yA7j2rs5xmgetCCgwYLtrKACxO25mhuJ6QXluP5paA7vPf6/7tBMErdqRjolZe94m
	Cp+Y2e8CAQDK79NKhC7nt7sPPCEkcEjAbVs80QJoLb5II3M5FEbeegq93bWGkx0iSo29k+
	cEyrNmHBPk4LMP036n21k+FcxHuNgc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CtV//8iKt7E9AZldR2+XbXXFnTwB+6APFp9hmbcIE2c=;
	b=xjNg12u1sF0FtU2lCYP5lZO/5FrlPn0HVSPMYBDUTDqLa9556x6TrF4R2i0Xg9Wt3lgTz7
	oktRNhxy2EWrezDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4984E13BFC;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/32] ALSA: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:38 +0200
Message-ID: <20261002085517.693510-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Hi,

here is a revised series of trivial changes as a cleanup.

So far, many sound drivers use the manual call of
snd_card_free_on_error() helper in order to deal with the errors at
probe time.  This can be gracefully done via auto-cleanup, and here
are the conversions.

In this version, the new __free(snd_card_free) is used instead of
__free(snd_card_unref).

Only code refactoring, and no functional changes are expected.


Takashi

===

Takashi Iwai (32):
  ALSA: galaxy: Use auto-cleanup for probe card error handling
  ALSA: sc6000: Use auto-cleanup for probe card error handling
  ALSA: ad1889: Use auto-cleanup for probe card error handling
  ALSA: ali5451: Use auto-cleanup for probe card error handling
  ALSA: als4000: Use auto-cleanup for probe card error handling
  ALSA: atiixp: Use auto-cleanup for probe card error handling
  ALSA: au88x0: Use auto-cleanup for probe card error handling
  ALSA: azt3328: Use auto-cleanup for probe card error handling
  ALSA: bt87x: Use auto-cleanup for probe card error handling
  ALSA: ca0106: Use auto-cleanup for probe card error handling
  ALSA: cs4281: Use auto-cleanup for probe card error handling
  ALSA: cs5535audio: Use auto-cleanup for probe card error handling
  ALSA: echoaudio: Use auto-cleanup for probe card error handling
  ALSA: emu10k1x: Use auto-cleanup for probe card error handling
  ALSA: ens137x: Use auto-cleanup for probe card error handling
  ALSA: es1938: Use auto-cleanup for probe card error handling
  ALSA: es1968: Use auto-cleanup for probe card error handling
  ALSA: fm801: Use auto-cleanup for probe card error handling
  ALSA: ice1724: Use auto-cleanup for probe card error handling
  ALSA: intel8x0: Use auto-cleanup for probe card error handling
  ALSA: lola: Use auto-cleanup for probe card error handling
  ALSA: maestro3: Use auto-cleanup for probe card error handling
  ALSA: oxygen: Use auto-cleanup for probe card error handling
  ALSA: riptide: Use auto-cleanup for probe card error handling
  ALSA: rme32: Use auto-cleanup for probe card error handling
  ALSA: rm96: Use auto-cleanup for probe card error handling
  ALSA: sis7019: Use auto-cleanup for probe card error handling
  ALSA: sonicbibes: Use auto-cleanup for probe card error handling
  ALSA: via82xx: Use auto-cleanup for probe card error handling
  ALSA: ymfpci: Use auto-cleanup for probe card error handling
  ALSA: intel-hdmi-audio: Use auto-cleanup for probe card error handling
  ALSA: Drop unused snd_card_free_on_error()

 include/sound/core.h                |  1 -
 sound/core/init.c                   | 36 ++++++-----------------------
 sound/isa/galaxy/galaxy.c           | 10 +++-----
 sound/isa/sc6000.c                  | 10 +++-----
 sound/pci/ad1889.c                  | 13 ++++-------
 sound/pci/ali5451/ali5451.c         | 13 ++++-------
 sound/pci/als4000.c                 | 13 ++++-------
 sound/pci/atiixp.c                  | 13 ++++-------
 sound/pci/atiixp_modem.c            | 13 ++++-------
 sound/pci/au88x0/au88x0.c           | 11 +++------
 sound/pci/azt3328.c                 | 11 +++------
 sound/pci/bt87x.c                   | 13 ++++-------
 sound/pci/ca0106/ca0106_main.c      | 11 +++------
 sound/pci/cs4281.c                  | 13 ++++-------
 sound/pci/cs5535audio/cs5535audio.c | 13 ++++-------
 sound/pci/echoaudio/echoaudio.c     | 14 ++++-------
 sound/pci/emu10k1/emu10k1x.c        | 13 ++++-------
 sound/pci/ens1370.c                 | 13 ++++-------
 sound/pci/es1938.c                  | 13 ++++-------
 sound/pci/es1968.c                  | 13 ++++-------
 sound/pci/fm801.c                   | 13 ++++-------
 sound/pci/ice1712/ice1724.c         | 13 ++++-------
 sound/pci/intel8x0.c                | 14 ++++-------
 sound/pci/intel8x0m.c               | 13 ++++-------
 sound/pci/lola/lola.c               | 13 ++++-------
 sound/pci/maestro3.c                | 11 +++------
 sound/pci/oxygen/oxygen_lib.c       | 15 +++---------
 sound/pci/riptide/riptide.c         | 11 +++------
 sound/pci/rme32.c                   | 11 +++------
 sound/pci/rme96.c                   | 13 ++++-------
 sound/pci/sis7019.c                 | 13 ++++-------
 sound/pci/sonicvibes.c              | 13 ++++-------
 sound/pci/via82xx.c                 | 13 ++++-------
 sound/pci/via82xx_modem.c           | 13 ++++-------
 sound/pci/ymfpci/ymfpci.c           | 13 ++++-------
 sound/x86/intel_hdmi_audio.c        | 10 +++-----
 36 files changed, 134 insertions(+), 328 deletions(-)

-- 
2.55.0

