Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA6388E40
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727516; cv=none; b=sm4zeL2BuKoY7KdUXSui93Q7DjaKg/9XZsuxDXypTMz4nHl4QUm36aj+639sIIQ3Lly4KMxWCnvV4V0vjogFLy+rHhhbe1JuKSyAy+nFtHZ3ArzQJzDwqLKlWnSRjRe8ScmAoTngZU5Reg8DkuhWdkDIdihROmSpNeEg6jY57JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727516; c=relaxed/simple;
	bh=/fZ0aDM5G1fqzC8pLX/ecLCo/ELPswz6cgTAdhtVEXk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mhPEDQB88/0vLfLSXZy1uSVBsgt1eycto5J4+32byPImEJheF+hts68kMGXTv+8hbQT9tHjMf6CIQ9cJko5arUv6Zus1MXxhDbdq6wQyBxz48cEOyQ2hgih4eY0mM+3gtW7TyYDV2MyIBaOlfGLiWiY6r940V5EZW3Y60NxCMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SyxKaadm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PHpooOH7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SyxKaadm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PHpooOH7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SyxKaadm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PHpooOH7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SyxKaadm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PHpooOH7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 086F14EE82;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B0cSPbZ/DVrHIrqfzef1ILomMQhSVZKdTfW+CQR46nc=;
	b=SyxKaadmqlSqdgxT9Rf0FrjUx/qvISYlIP30lqWqjO4anDAZUgp6g5+O/1aZKVq3e8faEB
	Emv/i4h0IkTzAn18RoTkURrXJah3HnYIFU0dj4RGKOVYx3lk4aOHf5X0v/7RwF+Hb7P2i8
	ZH0mJ+mCEaT3Ub7b18dOV5MA+IwM6GU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B0cSPbZ/DVrHIrqfzef1ILomMQhSVZKdTfW+CQR46nc=;
	b=PHpooOH7KNP/6hcjol8H6xa/CgRYKv3SG96LmXtA/kIe4s9ghVV+euDUW4EvwV2qiVEwJE
	mRg+HZUvdCU+s0BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B0cSPbZ/DVrHIrqfzef1ILomMQhSVZKdTfW+CQR46nc=;
	b=SyxKaadmqlSqdgxT9Rf0FrjUx/qvISYlIP30lqWqjO4anDAZUgp6g5+O/1aZKVq3e8faEB
	Emv/i4h0IkTzAn18RoTkURrXJah3HnYIFU0dj4RGKOVYx3lk4aOHf5X0v/7RwF+Hb7P2i8
	ZH0mJ+mCEaT3Ub7b18dOV5MA+IwM6GU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B0cSPbZ/DVrHIrqfzef1ILomMQhSVZKdTfW+CQR46nc=;
	b=PHpooOH7KNP/6hcjol8H6xa/CgRYKv3SG96LmXtA/kIe4s9ghVV+euDUW4EvwV2qiVEwJE
	mRg+HZUvdCU+s0BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D88274A0B3;
	Thu,  9 Apr 2026 09:38:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D0GLM5Vz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/10] ALSA: hda: Cleanups aboug GPIO handling code
Date: Thu,  9 Apr 2026 11:38:13 +0200
Message-ID: <20260409093826.1317626-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Hi,

this is a series of cleanup patches for the GPIO verb handlings in
HD-audio codec drivers.  Supposed to be no behavior change but only
the code refactoring / cleanup.


Takashi

===

Takashi Iwai (10):
  ALSA: hda: Add sync version of snd_hda_codec_write()
  ALSA: hda: Add a simple GPIO setup helper function
  ALSA: hda/realtek: Clean up with snd_hda_codec_set_gpio()
  ALSA: hda/alc662: Simplify the quirk for CSL Unity BF24B
  ALSA: hda/analog: Fix GPIO verb orders
  ALSA: hda/sigmatel: Clean up with the new GPIO helper
  ALSA: hda/ca0132: Clean up with the new GPIO helper
  ALSA: hda/cirrus: Clean up with the new GPIO helper
  ALSA: hda/conexant: Clean up with the new GPIO helper
  ALSA: hda/senarytech: Clean up with the new GPIO helper

 include/sound/hda_codec.h          | 15 +++++++++++
 sound/hda/codecs/analog.c          | 18 +++++++-------
 sound/hda/codecs/ca0132.c          | 14 ++---------
 sound/hda/codecs/cirrus/cs420x.c   | 11 +++-----
 sound/hda/codecs/cirrus/cs421x.c   | 11 +++-----
 sound/hda/codecs/cirrus/cs8409.c   | 22 +++++-----------
 sound/hda/codecs/conexant.c        | 14 +++--------
 sound/hda/codecs/generic.c         |  2 +-
 sound/hda/codecs/hdmi/intelhdmi.c  |  2 +-
 sound/hda/codecs/realtek/alc662.c  | 14 +++--------
 sound/hda/codecs/realtek/realtek.c | 16 ++++--------
 sound/hda/codecs/realtek/realtek.h |  1 -
 sound/hda/codecs/senarytech.c      | 10 ++------
 sound/hda/codecs/sigmatel.c        | 10 +-------
 sound/hda/common/codec.c           | 40 +++++++++++++++++++++++++-----
 15 files changed, 88 insertions(+), 112 deletions(-)

-- 
2.53.0

