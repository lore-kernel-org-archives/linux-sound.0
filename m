Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206A410D07
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120660; cv=none; b=B37+Y6JCDXiL+lDxF2hTFISP46gjaQ0CTngUPUwNDiITUvfbuQKJDwAIWZFCDaanviL/OXDkSxt+WNXO4Zm/nlCWAMPEYyXelv0TOxvCmPmZSxykuTF4o9NkcBDeoETehO9FiYGqw+G/Adq1SjFwJRIkOU6CIA9w4DezlKlxz+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120660; c=relaxed/simple;
	bh=HGno8UXelZj0ipl7+4PdVRC41Yh0WhCNjR8Kx9VUWGY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NvyUkknpB7po20foRL8obBYkoV/BQadROplVuFz232olDMOA7BwP3nrBhDjsKsLo71mD0AQmB64kHDkoE79PWtfOOywGCnLC7a9lzV8rctOxNtqYhJ4QpcER8zK2W/UueJjwssWg9uEbrrnjIsjXNSUVemhTnSEa2IRvo845sgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KT6J0CS3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CgKpl8oM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KT6J0CS3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CgKpl8oM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KT6J0CS3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CgKpl8oM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KT6J0CS3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CgKpl8oM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A17621FA54;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uz4hfaHTkP4z7ZWjOv4pV+AxSkMeRucUM2kkKm3aNQw=;
	b=KT6J0CS3iYMjYND+i5y1EhV7551JpQgIbrj+vhM9Watxsy9GETMkynnxdrWqcaUHa1Awz7
	40kipnRa1vvgfeZWbWcS97s7paugubjAmO2avgNkPmvPJ5v42DdlFHzdc86qpnFQlfFGSI
	sE/1Jqwy2nJWVFYTVPfSpDlQtP2LsgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uz4hfaHTkP4z7ZWjOv4pV+AxSkMeRucUM2kkKm3aNQw=;
	b=CgKpl8oM+r7qR5YfcD2uNYzCtvWCIF6CpA3EMIK3rxaYqvWZOqnFDX/ttmnh8aALV+BhD2
	p8Tsg+F1eBmBotCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KT6J0CS3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CgKpl8oM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uz4hfaHTkP4z7ZWjOv4pV+AxSkMeRucUM2kkKm3aNQw=;
	b=KT6J0CS3iYMjYND+i5y1EhV7551JpQgIbrj+vhM9Watxsy9GETMkynnxdrWqcaUHa1Awz7
	40kipnRa1vvgfeZWbWcS97s7paugubjAmO2avgNkPmvPJ5v42DdlFHzdc86qpnFQlfFGSI
	sE/1Jqwy2nJWVFYTVPfSpDlQtP2LsgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uz4hfaHTkP4z7ZWjOv4pV+AxSkMeRucUM2kkKm3aNQw=;
	b=CgKpl8oM+r7qR5YfcD2uNYzCtvWCIF6CpA3EMIK3rxaYqvWZOqnFDX/ttmnh8aALV+BhD2
	p8Tsg+F1eBmBotCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C6CA3EA62;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pAkpHVFqoGnMawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:44:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: usb: Fix kernel-doc W=1 warnings
Date: Thu, 26 Feb 2026 16:43:46 +0100
Message-ID: <20260226154414.1081568-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A17621FA54

here is a series of minor fixes for W=1 build warnings.


Takashi

===

Takashi Iwai (3):
  ALSA: us144mkii: Drop kernel-doc markers
  ALSA: usb-audio: Drop superfluous kernel-doc markers
  ALSA: usb: qcom: Correct parameter comment for
    uaudio_transfer_buffer_setup()

 sound/usb/mixer_s1810c.c             | 12 ++++++------
 sound/usb/qcom/qc_audio_offload.c    |  2 +-
 sound/usb/usx2y/us144mkii.c          | 14 +++++++-------
 sound/usb/usx2y/us144mkii_midi.c     | 22 +++++++++++-----------
 sound/usb/usx2y/us144mkii_playback.c | 10 +++++-----
 5 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.53.0

