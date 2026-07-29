Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4513CC7DF
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311146; cv=none; b=fUd/pZvpdd9MWzCninxlzDYt50aXoY6SDf84D/twjtH9yP+BaBnsGSiO3QVhsCRLTxmuk8nV+U+GREwVJPQCz+2TdCNu7QrBXrysBVQdYLai3K/Nc9w9xZdf8ZU0ntpvFIN+dIBcX+5RCc3aKSPgAzbDqJbYujk05Cw5/g6txzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311146; c=relaxed/simple;
	bh=jra1CmDfC+fyDLXqrgPwRYsl87i9wexsv4WGmZ9nwAU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SylMlnCGJpTD3Nkdv6lmr46cP0UKG3Ds3quEFJqmP6/OmFlFCvWq7f7RhCFEciVRkNmDLso0V1a2GeHsugpFbnDBfxAg9lKqx/nBS5ctAaF6bRrnmWBWULEVBEFwN3wdC8h3Q0UgafKx1tSWv7U10AbtNU8B0CpAKn00ewhNmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bX0l9TN0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6k/xgGr5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CAI+Hbu6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ktFh3Zlx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bX0l9TN0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6k/xgGr5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CAI+Hbu6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ktFh3Zlx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF31D3E0F;
	Wed, 29 Jul 2026 07:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qaau68IHdk9WvkwjaDHC6vwau+iUERH6rIZxuObkPv4=;
	b=bX0l9TN0U4OfxSXuEDJLpYlgm0IJ6yvbbCioUtJwneJWEdYs46Wfj7CBEqd4Sk0RyNCHaF
	ZGAsZB15GwQj2ODm7d9+ahV++SLaD2uM80Zz7iNJC6HFzc43ufSTqvYRJuoAA1hgWmo8At
	Dief4Atz/HTmm9Uj+l0HGmJM+yhFOsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qaau68IHdk9WvkwjaDHC6vwau+iUERH6rIZxuObkPv4=;
	b=6k/xgGr52T1TfHvCXc2H0KzYrFQxHrvFEBOQKm0m0MNT1F1lRbh/F2jnuYJgIb1ng6/yH5
	xnWCSwrrOoMGlMCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qaau68IHdk9WvkwjaDHC6vwau+iUERH6rIZxuObkPv4=;
	b=CAI+Hbu6s8kbQcODaFP6JrGHQNDyn6Ak+VlUO3EQuKfkjST9zadcfcpxuA8evc08+SOvfo
	oW9LbvkouS+oSPdlaOpdFXMklq3wN6X+25pAvxyPnufCMWNKUGJBb3dBiwHRNIv6QO32dr
	fG8xwy0xKvx9Sg/hvNZR1tVVCXnOLUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qaau68IHdk9WvkwjaDHC6vwau+iUERH6rIZxuObkPv4=;
	b=ktFh3Zlxn/R3EBSoeEGzMtEqSkOA1/ebErr7GrEcdVjTebSALIdvcd8r4fvaN7XLaIW5Pb
	1HWki9KIRNoYTBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A090F779B7;
	Wed, 29 Jul 2026 07:45:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FXUZJpWvaWolJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:45:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: usb-audio: missing doc and quirk extensions
Date: Wed, 29 Jul 2026 09:45:15 +0200
Message-ID: <20260729074523.92761-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Since the recent fix for USB-audio introduced the quirk bit 31, we
need to extend the bitmap to 64bit for the future use.
Also, the last fix forgot the update of the documentation, and it's
updated in this series, too.


Takashi

===

Takashi Iwai (3):
  ALSA: docs: Add description of usb-audio playback_urb_fixup quirk
  ALSA: usb-audio: Extend quirk_flags to 64bit
  ALSA: usb-audio: Make some quirk-string helpers local

 Documentation/sound/alsa-configuration.rst |  5 +++++
 sound/usb/card.c                           |  2 +-
 sound/usb/quirks.c                         | 18 +++++-------------
 sound/usb/quirks.h                         |  3 ---
 sound/usb/usbaudio.h                       |  4 ++--
 5 files changed, 13 insertions(+), 19 deletions(-)

-- 
2.55.0

