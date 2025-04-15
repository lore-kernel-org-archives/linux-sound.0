Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA2EEC3
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705910; cv=none; b=V6Adcr2LNfBu+M+YADc0a7DCHPxPBkYc3svq1wnI3QnlIPXINcIXZW1eP4LCfytm8l0lYdI+9MwghJWF+R6xJz9xfwLEdz5aGFOkIID+rilBxuJtUkKR2UsH5zl49e00HSMiGkv0IDY2VpwULuJZVcTFSN7RFqt1NPlawryFLS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705910; c=relaxed/simple;
	bh=wp3UI+KjPHgzZG9/QPgAssSpFiJrnJwvM0Yi6KyMUyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAG9hsKw+yEqbkDEn5p/pXcpYGijZVkWW8mesWVLX5wkYAFI/8LCEps+St2uDIBFfP5/2op+tPZDrrIjANgNODJoR9Rk+348osCCFA7rohdVtc90TFn9cdeOgxo+JkSrZmBQUNSh/+h8/BVL3sdwQUOPPyRE3PgJpFL3GT9jels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Il+u0lL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CPSsaWyy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Il+u0lL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CPSsaWyy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Il+u0lL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CPSsaWyy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Il+u0lL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CPSsaWyy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B801C1F387;
	Tue, 15 Apr 2025 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1LcmnPtN0Ns0JBWg4wp+jgmfVcVwY7dAjWbZ/7fXm2k=;
	b=Il+u0lL39lHgc+nX7NzHJYzoa3ARqS25wAWWNjXmm4rprjOluSmC9Fq1MY2VG7wS/YwB9Q
	adt5xTWfoNEsRSjeZIjn2iM7hRjQbJWu4TAv36QqVhdx9aDR9NMzxbu7nxNag6dli9hYsM
	c+1c4ynMUGyI6V2q3Hm6iB0DCUlYvb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1LcmnPtN0Ns0JBWg4wp+jgmfVcVwY7dAjWbZ/7fXm2k=;
	b=CPSsaWyyoqyZm4NRTapGQWaSeuXGHJrrW/NveO5hBj+L/ZxHSprPTyuqNghAHkiO55secE
	n/ntIoOqs1MFmMDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1LcmnPtN0Ns0JBWg4wp+jgmfVcVwY7dAjWbZ/7fXm2k=;
	b=Il+u0lL39lHgc+nX7NzHJYzoa3ARqS25wAWWNjXmm4rprjOluSmC9Fq1MY2VG7wS/YwB9Q
	adt5xTWfoNEsRSjeZIjn2iM7hRjQbJWu4TAv36QqVhdx9aDR9NMzxbu7nxNag6dli9hYsM
	c+1c4ynMUGyI6V2q3Hm6iB0DCUlYvb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1LcmnPtN0Ns0JBWg4wp+jgmfVcVwY7dAjWbZ/7fXm2k=;
	b=CPSsaWyyoqyZm4NRTapGQWaSeuXGHJrrW/NveO5hBj+L/ZxHSprPTyuqNghAHkiO55secE
	n/ntIoOqs1MFmMDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 897A6137A5;
	Tue, 15 Apr 2025 08:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9h1jIHIZ/mfjRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 08:31:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/4] ASoC: Intel: byt*: Avoid OOB array read from the map name
Date: Tue, 15 Apr 2025 10:31:36 +0200
Message-ID: <20250415083144.6588-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

While reading bug reports, I casually stubmled on a UBSAN warning
about the array OOB access, and this looks like a real bug in ASoC
Intel driver code.  So here is a series of quick fixes for them.


Takashi

====

Takashi Iwai (4):
  ASoC: Intel: bytcht_es8316: Avoid OOB array read from the map name
  ASoC: Intel: bytcr_rt5640: Avoid OOB array read from the map name
  ASoC: Intel: bytcr_rt5651: Avoid OOB array read from the map name
  ASoC: Intel: bytcr_wm5102: Avoid OOB array read from the map name

 sound/soc/intel/boards/bytcht_es8316.c | 11 ++++++++---
 sound/soc/intel/boards/bytcr_rt5640.c  | 11 ++++++++---
 sound/soc/intel/boards/bytcr_rt5651.c  | 11 ++++++++---
 sound/soc/intel/boards/bytcr_wm5102.c  | 27 ++++++++++++++++++++------
 4 files changed, 45 insertions(+), 15 deletions(-)

-- 
2.49.0

