Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE13C01
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508349; cv=none; b=QW4KOabyuDlNGfezSHCaoMShCtECHe7t8MRcQNj9IV8zihmK2LyvTFC8FSlUiqAiW7SRJFbaG5+kFDyNkKP1b3Alic9JN1pSYdgYX38VmpCB6UbNZwk3zsFySq3j/yr2l4fvpr9qxesB+LzW54VBPQq5JhDHGlu1ZLjSX0XGZQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508349; c=relaxed/simple;
	bh=g1F0Bq9kYPgCBoM3m5XNZJXRfTZR1+i+f7r+SHxhLU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7F5u++wIAyALJIdlkWnyKuBYQYMPHa+lXooMUtf1SkxcNnzmt4Cr2y45gLYeM3jx3PBKItf6pvH92N8YZOUePxlqdyeSz0Stp93lJs/sU87jPxQnsdWQYtpxS1gAfZoXbLS2pZ/HLzafQIZfCdm026JD9Mng6CWegPMC//FPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cQ97XOvP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GFEm22YE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cQ97XOvP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GFEm22YE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cQ97XOvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GFEm22YE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cQ97XOvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GFEm22YE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 62B11207E1;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2Ql7ftQq+b84mGxWv1nZd2FVw9dWMSefoYRnVa+OWA=;
	b=cQ97XOvPv5L/AJZEjGzUFCFBVBF45OL3a4l8+6MMTyz6f1cuA56ESVIn9qOc0b2IX+vPu7
	uGR9ZIWKBtNIosJCQ7Txak9Q1a/Y7CKEaeOnwZ754mH6c0uIOGIbLSKJNcNHh6WM18+ycF
	PjGEVEXIjwQGieE4Y9H0o7kOPCSuX08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2Ql7ftQq+b84mGxWv1nZd2FVw9dWMSefoYRnVa+OWA=;
	b=GFEm22YEWCEnM/xR5luLuqVeAY5leVB4lWNXmrhFJ3bGLgAJklxm72VeSIH+Vr38ygDuZY
	KmzZ0ZROP8y3UrAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cQ97XOvP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GFEm22YE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2Ql7ftQq+b84mGxWv1nZd2FVw9dWMSefoYRnVa+OWA=;
	b=cQ97XOvPv5L/AJZEjGzUFCFBVBF45OL3a4l8+6MMTyz6f1cuA56ESVIn9qOc0b2IX+vPu7
	uGR9ZIWKBtNIosJCQ7Txak9Q1a/Y7CKEaeOnwZ754mH6c0uIOGIbLSKJNcNHh6WM18+ycF
	PjGEVEXIjwQGieE4Y9H0o7kOPCSuX08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2Ql7ftQq+b84mGxWv1nZd2FVw9dWMSefoYRnVa+OWA=;
	b=GFEm22YEWCEnM/xR5luLuqVeAY5leVB4lWNXmrhFJ3bGLgAJklxm72VeSIH+Vr38ygDuZY
	KmzZ0ZROP8y3UrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BF1813ABE;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N9F5DTmsk2i0WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 19:25:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 0/3] ALSA: hda: Restrict prompt only for CONFIG_EXPERT
Date: Wed,  6 Aug 2025 21:25:36 +0200
Message-ID: <20250806192541.21949-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 62B11207E1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

As the previous driver split caused confusions to users who tried to
take over the previous kernel configs, this patch marks the prompt of
each driver with CONFIG_EXPERT, so that the all needed drivers are
selected as default forcibly.  For users who care about the size,
set CONFIG_EXPERT=y and toggle each knob as they like.


Takashi

Link: https://lore.kernel.org/10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de

===

Takashi Iwai (3):
  ALSA: hda/realtek: Restrict prompt only for CONFIG_EXPERT
  ALSA: hda/hdmi: Restrict prompt only for CONFIG_EXPERT
  ALSA: hda/cirrus: Restrict prompt only for CONFIG_EXPERT

 sound/hda/codecs/cirrus/Kconfig  | 20 ++++++++++++--------
 sound/hda/codecs/hdmi/Kconfig    | 20 +++++++++++++-------
 sound/hda/codecs/realtek/Kconfig | 28 ++++++++++++++++------------
 3 files changed, 41 insertions(+), 27 deletions(-)

-- 
2.50.1

