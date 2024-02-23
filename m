Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930E18633
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677779; cv=none; b=RTd7J5s7cF+imgw12mS3vdhxWY2XrQQ0ns9Qan5FVHRgharujSgX6YUEffE9gW+qDL1imgHazSF1bgHkKZYUxkiRQZ+JozYpjSrU1+YGyefOTfx59J81TajE/cjen9jES6NEE7rTWcg0rs8i4KItWR5gb/J6N1GJ7WeiYgxEdNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677779; c=relaxed/simple;
	bh=MPRbX5yAU44uZcHuBzVlvhHsK6sx9phnEB+asFxB+Xc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=kOIoUeLm4JmmQAbeFRNgiE3ss4ZVMCFovRNPaZwUksxHNQ9K6plkBCOTs/HXr1it+v1oEMnGyntgFBD4gLgMRBkrTaKzk/48GRS1gu18kWgNUS5fuIiKLmMGNDOkkAaDC/7Xm+QbDaZZ/oYyJmebnGbwZSyzutmrHz9+5sCrFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xVHE95JO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mHXf0tpC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xVHE95JO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mHXf0tpC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xVHE95JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mHXf0tpC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xVHE95JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mHXf0tpC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78CB51F7B2;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qNB5Hu31Xqcl6sHy18BuQt2CDLtaIKPQmEwAaR+kbuM=;
	b=xVHE95JO7TeKEtcGA9q1/Pi0sBaR2LtsPJUEwNxyPVhgfCA13tVZqveS5xha6niiHSMbIN
	aaAVztGafZE6LVetVLACW8+P1F0q54fcFjuRhYFhKI9Qk2ObcyIS8FXGgjC91xzJtH463b
	/kSra9+YzsvpOHw3mVqP5eUApGQ+4tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qNB5Hu31Xqcl6sHy18BuQt2CDLtaIKPQmEwAaR+kbuM=;
	b=mHXf0tpCZk2gSbEEjYIbWzebXrR+dls5X69UTzdXFlalQbRRZnnXD+/HMhojz3fFWKsMD9
	Vbd9R8LvYri2/iBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qNB5Hu31Xqcl6sHy18BuQt2CDLtaIKPQmEwAaR+kbuM=;
	b=xVHE95JO7TeKEtcGA9q1/Pi0sBaR2LtsPJUEwNxyPVhgfCA13tVZqveS5xha6niiHSMbIN
	aaAVztGafZE6LVetVLACW8+P1F0q54fcFjuRhYFhKI9Qk2ObcyIS8FXGgjC91xzJtH463b
	/kSra9+YzsvpOHw3mVqP5eUApGQ+4tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qNB5Hu31Xqcl6sHy18BuQt2CDLtaIKPQmEwAaR+kbuM=;
	b=mHXf0tpCZk2gSbEEjYIbWzebXrR+dls5X69UTzdXFlalQbRRZnnXD+/HMhojz3fFWKsMD9
	Vbd9R8LvYri2/iBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 503D9133DC;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EUEoEopa2GVDOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:42:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: core: another small set of automatic cleanups
Date: Fri, 23 Feb 2024 09:42:37 +0100
Message-Id: <20240223084241.3361-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xVHE95JO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mHXf0tpC
X-Spamd-Result: default: False [2.14 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.55)[98.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.14
X-Rspamd-Queue-Id: 78CB51F7B2
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++

Hi,

here are the rest of small cleanups of ALSA core using the automatic
kfree and co.

Only minor code refactoring.


Takashi

===

Takashi Iwai (3):
  ALSA: pcm: Use CLASS() for fdget()/fdput()
  ALSA: mixer_oss: ump: Use automatic cleanup of kfree()
  ALSA: pcm_oss: ump: Use automatic cleanup of kfree()

 sound/core/oss/mixer_oss.c | 59 ++++++++++++--------------------------
 sound/core/oss/pcm_oss.c   | 33 +++++++--------------
 sound/core/pcm_native.c    | 22 +++++---------
 3 files changed, 35 insertions(+), 79 deletions(-)

-- 
2.35.3

