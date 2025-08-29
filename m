Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8A2135CE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480057; cv=none; b=oFnKoJythHLrb99wo0FxEyzNM+owiOZD9ZgY+ZFPe6RqIPp6vkeycWhcQOL+YWea2hJPQHFbZOcp0NuRg9kwWFkaUGMECtNw6mLySpxe/YRnTndbxxPTzeRISUfMx+hJTgsJnLDkzT3Ww5dKzSvJB+3mnmeoLf1HrDyZSudIpRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480057; c=relaxed/simple;
	bh=/xC3ffHn0pRyQSxBX+YDlgRvnB1v/ujk08tCOiztDek=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qf2j+iI2AYoXXatNEHXdjJltsS8+6NBZbb4RDh0qaAIrcSdhvz+2+U7gXuC//HC6ip+BNYdAObQlgJw0/Zt2qDaqB0mRqyMGYM+Fc2EJAY6+Xk5EvFMObKXZNZZCb2hxmVClJPLOWd5HInKmWUrp8GeU+oi7dB8DZz1rFEAXNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1O/kqF0V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J79AquPB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1O/kqF0V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J79AquPB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1O/kqF0V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J79AquPB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1O/kqF0V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J79AquPB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4706433EF3;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UOkYPLVSSuGiLxOyhHu9QiHHK3gUQY3HnB0BDcV/isc=;
	b=1O/kqF0Vr75oI2+MhppwaZClAU5nj/DqrCaj2XWUUGs2WcYOsgIrDJRlXVQMr/Nm8LbyvB
	FGLG4vZVut+dID00aiTOSDTGbE1seISYpllDz2iYWL9QpcZS95P6r64UgRENZRJBC9ItSi
	l2WQ6UaWUT6Cr8zGiMSeTbc7ivmYqWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UOkYPLVSSuGiLxOyhHu9QiHHK3gUQY3HnB0BDcV/isc=;
	b=J79AquPB+9P6Bz+POJQupTwy6V1gnKwZo4m0Wt7C5IE0hRVSG1CZMwb4xQEoAdvfFuwitL
	XZt546wBEwneAMAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UOkYPLVSSuGiLxOyhHu9QiHHK3gUQY3HnB0BDcV/isc=;
	b=1O/kqF0Vr75oI2+MhppwaZClAU5nj/DqrCaj2XWUUGs2WcYOsgIrDJRlXVQMr/Nm8LbyvB
	FGLG4vZVut+dID00aiTOSDTGbE1seISYpllDz2iYWL9QpcZS95P6r64UgRENZRJBC9ItSi
	l2WQ6UaWUT6Cr8zGiMSeTbc7ivmYqWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UOkYPLVSSuGiLxOyhHu9QiHHK3gUQY3HnB0BDcV/isc=;
	b=J79AquPB+9P6Bz+POJQupTwy6V1gnKwZo4m0Wt7C5IE0hRVSG1CZMwb4xQEoAdvfFuwitL
	XZt546wBEwneAMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A30B13326;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EcSmCDbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/9] ALSA: Use auto-cleanup macros for USB drivers
Date: Fri, 29 Aug 2025 17:07:08 +0200
Message-ID: <20250829150724.6886-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

This is yet another patch set for applying the auto-cleanup macros to
the remaining drivers in sound/usb/*.  Merely code refactoring, and no
functional changes are expected.


Takashi

===

Takashi Iwai (9):
  ALSA: ua101: Use guard() for mutex locks
  ALSA: ua101: Use guard() for spin locks
  ALSA: usx2y: Use guard() for mutex locks
  ALSA: hiface: Use guard() for mutex locks
  ALSA: hiface: Use guard() for spin locks
  ALSA: line6: Use guard() for mutex locks
  ALSA: usb: qcom: Use guard() for mutex locks
  ALSA: bcd2000: Use guard() for mutex locks
  ALSA: caiaq: Use guard() for spin locks

 sound/usb/bcd2000/bcd2000.c       |  16 +-
 sound/usb/caiaq/audio.c           |  39 ++---
 sound/usb/hiface/chip.c           |  11 +-
 sound/usb/hiface/pcm.c            |  60 +++----
 sound/usb/line6/driver.c          |   8 +-
 sound/usb/line6/pcm.c             |  58 +++----
 sound/usb/misc/ua101.c            | 250 +++++++++++++-----------------
 sound/usb/qcom/qc_audio_offload.c |  69 +++------
 sound/usb/usx2y/us122l.c          |  44 ++----
 sound/usb/usx2y/usbusx2yaudio.c   |  23 +--
 sound/usb/usx2y/usx2yhwdeppcm.c   |  33 ++--
 11 files changed, 240 insertions(+), 371 deletions(-)

-- 
2.50.1

