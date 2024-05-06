Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF55155385
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012032; cv=none; b=E1IvgcZjDuz22jbyfHijQICHiD3/senEuDY8FcMkX1xhyD/nGQtqQm70IQ/PxDx4fzaA2dTxrozKlmLo56UjZ59YVfxE9InBtPSNv8nwsBUyKlHO4oIywt9E8hjgOS+kz7bR2MOHVJozKQBEG7aKFpBEJ1PzTQCyrf5mUEj+Y7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012032; c=relaxed/simple;
	bh=9mUbWmyYtt65aOyUhukENNaI+oqBxWykpNaYeOrr9sg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TdpoR+xsuK6m7Fs4BZd1I5ED017NE+5n5R2GBPQKsCpvhbKaBlJlwEdbagiNZ18pU1Ujf9mZrRiIw1CoKBRqHBADnEOxuirllVjREE19leQXU5U7XeuoMSZAeJnTrLier2ysP60zFQsqM2FpWTRh+Wr2uCTVBYwmGeIY4mBoblA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CMyXlttv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IGhSt27e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CMyXlttv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IGhSt27e; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CMyXlttv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGhSt27e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CMyXlttv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGhSt27e"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 662CE1F797;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=slcuZz/d6oWDtT6DmmP4IuVbilU53q03thG60jcoRXc=;
	b=CMyXlttv4MBdl8S4OBbfK0BxsiKBJL16L1hmqoOxPnTFbgrwG72BpqkZnvR8O5hJUFilXK
	b1OdfowmwD+L+uhs6zKlkLO9v0DlU4IvUMGYJ87EAVCZ8zDA/bV5mXAUyxid8Cf84LImGp
	ZjhWjd24uXmYXVy4w8eVueqS1KzKrTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=slcuZz/d6oWDtT6DmmP4IuVbilU53q03thG60jcoRXc=;
	b=IGhSt27eaKFjmdLyHXAn8JsdgjynDpG9FIvEduBryUv0QX+W1gv1p2xfEoUsngsCgJlODc
	BV5CDG6Tc5X0tXBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=slcuZz/d6oWDtT6DmmP4IuVbilU53q03thG60jcoRXc=;
	b=CMyXlttv4MBdl8S4OBbfK0BxsiKBJL16L1hmqoOxPnTFbgrwG72BpqkZnvR8O5hJUFilXK
	b1OdfowmwD+L+uhs6zKlkLO9v0DlU4IvUMGYJ87EAVCZ8zDA/bV5mXAUyxid8Cf84LImGp
	ZjhWjd24uXmYXVy4w8eVueqS1KzKrTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=slcuZz/d6oWDtT6DmmP4IuVbilU53q03thG60jcoRXc=;
	b=IGhSt27eaKFjmdLyHXAn8JsdgjynDpG9FIvEduBryUv0QX+W1gv1p2xfEoUsngsCgJlODc
	BV5CDG6Tc5X0tXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45F741386E;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lruKD70BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/12] ALSA: hda: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:43 +0200
Message-ID: <20240506161359.6960-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.56
X-Spam-Level: 
X-Spamd-Result: default: False [-2.56 / 50.00];
	BAYES_HAM(-2.76)[98.97%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.982];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

The legacy HD-audio drivers contain a fair amount of CONFIG_PM
dependent code.  As nowadays CONFIG_PM is de facto mandatory, this
makes code unnecessarily complex.

This patch series tries to reduce CONFIG_PM dependencies in HD-audio
drivers.

Lightly tested with different config sets.


Takashi

===

Takashi Iwai (12):
  ALSA: hda: intel: Reduce CONFIG_PM dependencies
  ALSA: hda: codec: Reduce CONFIG_PM dependencies
  ALSA: hda: generic: Reduce CONFIG_PM dependencies
  ALSA: hda: analog: Reduce CONFIG_PM dependencies
  ALSA: hda: ca0132: Reduce CONFIG_PM dependencies
  ALSA: hda: cirrus: Reduce CONFIG_PM dependencies
  ALSA: hda: conexant: Reduce CONFIG_PM dependencies
  ALSA: hda: cs4809: Reduce CONFIG_PM dependencies
  ALSA: hda: hdmi: Reduce CONFIG_PM dependencies
  ALSA: hda: realtek: Reduce CONFIG_PM dependencies
  ALSA: hda: sigmantel: Reduce CONFIG_PM dependencies
  ALSA: hda: via: Reduce CONFIG_PM dependencies

 include/sound/hda_codec.h       | 11 --------
 sound/pci/hda/hda_codec.c       | 37 +++++++-------------------
 sound/pci/hda/hda_controller.c  |  2 --
 sound/pci/hda/hda_generic.c     |  4 ---
 sound/pci/hda/hda_generic.h     |  2 --
 sound/pci/hda/hda_intel.c       | 46 ++++++++++-----------------------
 sound/pci/hda/hda_intel_trace.h |  2 --
 sound/pci/hda/hda_sysfs.c       |  4 ---
 sound/pci/hda/patch_analog.c    |  4 ---
 sound/pci/hda/patch_ca0132.c    |  4 ---
 sound/pci/hda/patch_cirrus.c    |  4 ---
 sound/pci/hda/patch_conexant.c  |  4 ---
 sound/pci/hda/patch_cs8409.c    |  8 ------
 sound/pci/hda/patch_hdmi.c      |  8 ------
 sound/pci/hda/patch_realtek.c   | 16 +-----------
 sound/pci/hda/patch_sigmatel.c  |  8 ------
 sound/pci/hda/patch_via.c       |  6 -----
 17 files changed, 25 insertions(+), 145 deletions(-)

-- 
2.43.0

