Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1F16D9BD
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498348; cv=none; b=o9CieDaoJi1DVWGwll7dgifjZOuJ2tdafW+UE+kWrKUAD2eaGF0H/AHemgR0mTf6wttPGKHwNtsERl+8WsRANM3q97N1TG6IvM7aciHnYruiGrikcffiEVr5qsKbk5xKmkW50QBbi6XsXvFOzOUVi3R27NLoErH432yxj8lIXio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498348; c=relaxed/simple;
	bh=UUf3O+FYdS5+LaLu5441UG32BWQIECsGeIZq3xo3q/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4JX0JGxdju5fvhd8ToI4oLdB8Ne6NWOmZgYVyl91WaokS1z2mJCut7P7F9jEPsipKrOccYbeXCPMtb3Yos5OflXOKssHUK0cmxQvikEn+6En2xgek7PvHGCZdTFMaCkPH+cDzTIBResyINMTmwGLM0Z2hloGxvIGEgjezFrHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SQyywMrK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aRvtYU3K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SQyywMrK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aRvtYU3K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SQyywMrK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aRvtYU3K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SQyywMrK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aRvtYU3K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0F2B1F7D2;
	Thu,  1 Aug 2024 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GEIF+iinMbFVzz96VXCntQ5qbedUX/891UIqCfmng3A=;
	b=SQyywMrKWyUG6JD5gYeDSOkdvilt7NCw7iK+WqRXrwK2q+CaEWnsZRnW518kGMa55Cd2bD
	MEBztoInLrcwpP6LQ4F0EEScAtAORjWFo6XUDY0i53NbQxyTKJhnYIa8XbZRs3zFbDuqhV
	RnxZ6mk/HpO7Kvj9dnvJt5JsR3E2Bjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GEIF+iinMbFVzz96VXCntQ5qbedUX/891UIqCfmng3A=;
	b=aRvtYU3K34WKqmcnNBfrNiUn86pmpwMe9l9yAivx0cchoK/9iLvjDQEENyWgU+y8Iy3wRu
	TDPzOL04jqzXLjDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GEIF+iinMbFVzz96VXCntQ5qbedUX/891UIqCfmng3A=;
	b=SQyywMrKWyUG6JD5gYeDSOkdvilt7NCw7iK+WqRXrwK2q+CaEWnsZRnW518kGMa55Cd2bD
	MEBztoInLrcwpP6LQ4F0EEScAtAORjWFo6XUDY0i53NbQxyTKJhnYIa8XbZRs3zFbDuqhV
	RnxZ6mk/HpO7Kvj9dnvJt5JsR3E2Bjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GEIF+iinMbFVzz96VXCntQ5qbedUX/891UIqCfmng3A=;
	b=aRvtYU3K34WKqmcnNBfrNiUn86pmpwMe9l9yAivx0cchoK/9iLvjDQEENyWgU+y8Iy3wRu
	TDPzOL04jqzXLjDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 901B213946;
	Thu,  1 Aug 2024 07:45:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 14/iISg9q2YLBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 07:45:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ALSA: control: Locking optimization and cleanups
Date: Thu,  1 Aug 2024 09:46:06 +0200
Message-ID: <20240801074617.4997-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.60

Hi,

this is a series of patches to reduce the locking at control elements
look-up and cleanups of APIs.  It was inspired from the discussion
thread about the mutex inversions of Cirrus codec driver, but this
version goes further, dropping the locking in normal use cases.

The snd_ctl_find_*_unlocked() API functions are completely dropped, as
there is no real use any longer.

The patch touches / removes ASoC code to drop and replace *_locked()
API calls.


Takashi

===

Takashi Iwai (3):
  ALSA: control: Rename ctl_files_rwlock to controls_rwlock
  ALSA: control: Optimize locking for look-up
  ASoC: Drop snd_soc_card_get_kcontrol_locked()

 include/sound/control.h     |  25 ------
 include/sound/core.h        |   2 +-
 include/sound/soc-card.h    |   2 -
 sound/core/control.c        | 151 ++++++++++++++----------------------
 sound/core/control_compat.c |   2 +-
 sound/core/control_led.c    |   2 +-
 sound/core/init.c           |   2 +-
 sound/core/oss/mixer_oss.c  |  10 +--
 sound/soc/codecs/cs35l45.c  |   2 +-
 sound/soc/fsl/fsl_xcvr.c    |   2 +-
 sound/soc/soc-card-test.c   |  57 --------------
 sound/soc/soc-card.c        |  10 ---
 12 files changed, 70 insertions(+), 197 deletions(-)

-- 
2.43.0

