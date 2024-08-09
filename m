Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806415ECE2
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723200121; cv=none; b=GdQXgo1N+pA3yMKZkZQ2Iig8fUSLaqX4FoyPErEdrf1jrdKFslhqJ3WD0MJZ2Syddlee2EZM8fZihXadCYT788blq9dzd6D+9c7uEZ1GepAfSj47ywHBTz4OqnicVvuvPHqxTopyGfUF+Q4uISQN5+NlI00pZx8P+LliKhl3Pro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723200121; c=relaxed/simple;
	bh=bc4N49+/252QKtFOdmFfDJzAgkewrkWmV3N7rOzumXc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=n8Akg9D1BmaLtczYLH9yx44mhynciRivLKqgHG01jrsDQe1I+CUlrhoXwEYgUUTEt2pIOWZ6vij+5PDr2/bDdHtpWQZgrL1PvP622LN2rmmWiPK3lnsRjLl0mSn8KkPZBsa06RymAdAGt3e9Ej6mkUWzV9Pu3hVhjVUmPlT4sNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wV8aSuad; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C17/hT8O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wV8aSuad; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C17/hT8O; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wV8aSuad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C17/hT8O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wV8aSuad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C17/hT8O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 431F221ECE;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EJBBdCDE42lHxVc8lJpMmPqIDetzIIkDmXGbaN8La38=;
	b=wV8aSuadW+zbN5hTc2cLXgA65LJidvH8OGhXqMZeOQkZlmIvmR5BT0tY/obp8PL37sNE2N
	TkMZQy5LSsB3YBQK0AMWdPl9TnjBZ+px7JtXb8+c4fELOCQRl2umm9wQE3zyYulYfVnCqX
	9Rf6GZK14jqQS6CSdhmwb7n2cYGBmcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EJBBdCDE42lHxVc8lJpMmPqIDetzIIkDmXGbaN8La38=;
	b=C17/hT8ODpQqSVvCHn5J6+tDWEvI7TVwAQDZF9UA2JzUb928yYtAg9kgvVeoqnwapKFpcn
	+ja/ImxXRVSMQSBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EJBBdCDE42lHxVc8lJpMmPqIDetzIIkDmXGbaN8La38=;
	b=wV8aSuadW+zbN5hTc2cLXgA65LJidvH8OGhXqMZeOQkZlmIvmR5BT0tY/obp8PL37sNE2N
	TkMZQy5LSsB3YBQK0AMWdPl9TnjBZ+px7JtXb8+c4fELOCQRl2umm9wQE3zyYulYfVnCqX
	9Rf6GZK14jqQS6CSdhmwb7n2cYGBmcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EJBBdCDE42lHxVc8lJpMmPqIDetzIIkDmXGbaN8La38=;
	b=C17/hT8ODpQqSVvCHn5J6+tDWEvI7TVwAQDZF9UA2JzUb928yYtAg9kgvVeoqnwapKFpcn
	+ja/ImxXRVSMQSBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 294401379A;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BpXOCHbytWaqTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 10:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 0/3] ALSA: control: Locking optimization and cleanups
Date: Fri,  9 Aug 2024 12:42:28 +0200
Message-ID: <20240809104234.8488-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Hi,

this is a revised patch set for reduce the locking at control elements
look-up and cleanups of APIs.

Only the 3rd patch was updated for catching up the recent ASoC change
to add snd_soc_component_get_kcontrol_locked() which is dropped here
as well.  No other changes since v1.

v1: https://lore.kernel.org/20240801074617.4997-1-tiwai@suse.de


Takashi

===

Takashi Iwai (3):
  ALSA: control: Rename ctl_files_rwlock to controls_rwlock
  ALSA: control: Optimize locking for look-up
  ASoC: Drop snd_soc_*_get_kcontrol_locked()

 include/sound/control.h       |  25 ------
 include/sound/core.h          |   2 +-
 include/sound/soc-card.h      |   2 -
 include/sound/soc-component.h |   3 -
 sound/core/control.c          | 151 +++++++++++++---------------------
 sound/core/control_compat.c   |   2 +-
 sound/core/control_led.c      |   2 +-
 sound/core/init.c             |   2 +-
 sound/core/oss/mixer_oss.c    |  10 +--
 sound/soc/codecs/cs35l45.c    |   2 +-
 sound/soc/fsl/fsl_xcvr.c      |   2 +-
 sound/soc/soc-card-test.c     |  57 -------------
 sound/soc/soc-card.c          |  10 ---
 sound/soc/soc-component.c     |  12 ---
 14 files changed, 70 insertions(+), 212 deletions(-)

-- 
2.43.0

