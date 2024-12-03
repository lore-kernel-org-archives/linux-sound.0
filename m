Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FE1F4261
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235517; cv=none; b=Xbv4/y8WIwg80RqpJZnlIdS3yhD7GWpjImwuM14UzkFYd5vuKDlzNw8O4Rj3AEvdtd+pZFRouuMBV3Xf3xaVmYG4FNmhq8Q5KmzB+3SzuUN/dlI5NyEBg4SFXFay5WoiA4wzejLnbA05o5ANf5gFCAJI1WMwWwk8Mt/yuFTgcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235517; c=relaxed/simple;
	bh=wpLFnDk7UHBTmZy2kG/OxObuYjbanYNThlncilkPYiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mw1xYYzhtsXN/5DhWfgxqfHs3PdKY+iaiBId4saPVj0dcteJ8fa1ZgBvVTV25toySGS6nGSPMFNeKnrdm6KpfDhUsHZd9yRHED8uQ2xsgntvs0uy1WUG2O+h9d8MR/V3KCiyn0NDQbOakoTO+vS+Rjtz/SuWGujCev5G5TeOe4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MeVD91Zq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1VZJXmKg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MeVD91Zq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1VZJXmKg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MeVD91Zq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1VZJXmKg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MeVD91Zq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1VZJXmKg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B5891F445;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TGeSzjuSgy2NC+BlF3NVCNHDakbUm1/mBdE76Wk/bd0=;
	b=MeVD91ZqG+VlX0WLCuZHZQUqDITpOuvaTbouEMrnpUByCnFDUR6jPaayC2gd9RfStsuFfB
	Sc0ooXaG255lUIfjYJwSMY628VZ/sCrnBUP8lLn/rWmIfBPuIOmP3VaJvEXNF7IBDZr08n
	nYNlxD5ST00Fq2rI/nkizYL7G2FICfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TGeSzjuSgy2NC+BlF3NVCNHDakbUm1/mBdE76Wk/bd0=;
	b=1VZJXmKgyC12/6YwD9wUVyMSPmAqC90cfxCTIHJGULh1CKTQJi0HBGIpdS+anc6UmeADYD
	i7ZQUKnw0UnRt/BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TGeSzjuSgy2NC+BlF3NVCNHDakbUm1/mBdE76Wk/bd0=;
	b=MeVD91ZqG+VlX0WLCuZHZQUqDITpOuvaTbouEMrnpUByCnFDUR6jPaayC2gd9RfStsuFfB
	Sc0ooXaG255lUIfjYJwSMY628VZ/sCrnBUP8lLn/rWmIfBPuIOmP3VaJvEXNF7IBDZr08n
	nYNlxD5ST00Fq2rI/nkizYL7G2FICfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TGeSzjuSgy2NC+BlF3NVCNHDakbUm1/mBdE76Wk/bd0=;
	b=1VZJXmKgyC12/6YwD9wUVyMSPmAqC90cfxCTIHJGULh1CKTQJi0HBGIpdS+anc6UmeADYD
	i7ZQUKnw0UnRt/BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6007713A15;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s9PUFjgTT2etMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 14:18:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ASoC: Correct *-objs usages
Date: Tue,  3 Dec 2024 15:18:15 +0100
Message-ID: <20241203141823.22393-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

I stumbled upon the use of *-objs in Makefile in a few places in
ASoC.  Here are trivial patches to correct those.


Takashi

===

Takashi Iwai (5):
  ASoC: cs40l50: Use *-y for Makefile
  ASoC: mediatek: mt8365: Use *-y for Makefile
  ASoC: SDCA: Use *-y for Makefile
  ASoC: cs42l84: Use *-y for Makefile
  ASoC: wcd937x: Use *-y for Makefile

 sound/soc/codecs/Makefile          | 8 ++++----
 sound/soc/mediatek/mt8365/Makefile | 2 +-
 sound/soc/sdca/Makefile            | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

