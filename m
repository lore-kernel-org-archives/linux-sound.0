Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3B3C2BB0
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401127; cv=none; b=IiTUqUPHJhjcqr1MYtOwWtdZDw9w/I1ttXCITXk3qDDyaKfzXPpp0cT4Lam33mduv7fzAmlaIE5JO2c8NMTWkfIBvtGRSIEVJZvC8KEFzkji9P/QYPG3sSlSuGdoEiPEfD8vITEjJm0iUzZ+mD8ptq8SVRyejnExksibHuy6K5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401127; c=relaxed/simple;
	bh=C3BxZXE4tq+5jQFeBFqQsJeBAW4FffAWI1w5BEKdF4A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZE4eLOM/3j8CMOfeM+RN34EeXhMfCDxao52jl7ZGTE/N2Su53IXSEugqzD3pvYv+fWPmhK9c0Wb53yG5dASXpwhaOXz9NJrN5Ip0xv9A/ev0zOkW0mvaqoOTnIWAom2MZUHC0WlXTEVK4j9JUoQVPLwsaV+x3fMvScQuEJ9y7pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RzfdiHer; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CeTXUrWI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ign/GMks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iCEus2Ef; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RzfdiHer";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CeTXUrWI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ign/GMks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iCEus2Ef"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D6A63EF7;
	Thu, 30 Jul 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785401120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+d2rkzVMgD/JPort4j/E6hRzYdO44VAiQmC2RLeMkXI=;
	b=RzfdiHerPiARlfgmOsUHKEzEPQh6+kZPlImiuKBc2VnBHm5lWRM5c0TcAv0Ejtv8vbp8DY
	f7euqzrn6NotYhrrRqeSy9puLXTyTZLpyfO65zL0DAa1YIDNKBjI2l3C55cEraUkYyyfJt
	4mOESxnlwEnaiT0ijMy3Gko1aQsMRMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785401120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+d2rkzVMgD/JPort4j/E6hRzYdO44VAiQmC2RLeMkXI=;
	b=CeTXUrWII0OQt4Mci55Y3VtMeENtDzPNrLewFKLM39sCSp9etjhL2JrcEFkxPpECwa3F2g
	tZP4IOIoki9UZlBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785401116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+d2rkzVMgD/JPort4j/E6hRzYdO44VAiQmC2RLeMkXI=;
	b=Ign/GMksahwL47G07MjRBZXOU4m/2X5oWhGq7AsrAqijT+9BE83xZUkoHxWvkatm6s1e6j
	gpv0iFH4u/BvFccssSuWRjVqMmf/g6GTiHp/oRK/jIbXJ14bzW04lYECI+QjE3Fqlt8PhP
	a4CO7sYyG1RW9dGQ3Fpf4qyGh5HVbZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785401116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+d2rkzVMgD/JPort4j/E6hRzYdO44VAiQmC2RLeMkXI=;
	b=iCEus2EfH8c6fdIU/2sqB38sEWpRekYwRrfP+gqldQQfhWgBo61fOrpdWeA9/IqyXP5zYE
	t5sGz7gwpHUvFQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19F90779CC;
	Thu, 30 Jul 2026 08:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VoYwBRwPa2qeSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 08:45:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: hda: Clean up jack name helpers
Date: Thu, 30 Jul 2026 10:44:31 +0200
Message-ID: <20260730084513.327992-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.63 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.03)[-0.139];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.63
X-Spam-Level: 

[ resent as the previous submission went wrong; apologies if you already
  received this ]

A couple of cleanup patches for HD-audio jack name helper functions
and callers.  Here simply dropping the useless code.


Takashi

===

Takashi Iwai (2):
  ALSA: hda: Drop unneeded calculation of index at get_jack_mode_name()
  ALSA: hda: Drop index handling from snd_hda_get_pin_label()

 sound/hda/codecs/generic.c         | 19 +--------
 sound/hda/common/auto_parser.c     | 66 +++++-------------------------
 sound/hda/common/hda_auto_parser.h |  2 +-
 sound/hda/common/jack.c            |  2 +-
 4 files changed, 14 insertions(+), 75 deletions(-)

-- 
2.55.0

