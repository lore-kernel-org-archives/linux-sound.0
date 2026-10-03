Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A13B0AD6
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025074; cv=none; b=OdfgDECo6DLCqxJBTFLYwNmkpYdCBwMAjJJloHhc9xkHIql8oXsYW1F/CcISoL8ueMJRVLjBFoTQqhgOvCcLeT9zJdcQC+24Uy411kivVvQxAmfLVB0a1USDBzaGfnsavVhHAdCCDhJeZTdKPgnvo5iucQulSevvgrMqh/zsjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025074; c=relaxed/simple;
	bh=q1yiMZiqQpH7S/Wv2zrg3/4V+vgnAu8iMb0Tyrvc1Qc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=X+IKgQjItQr/0NEplr3umEpefx9nOR8V7DY42sOxKjt3bWCd2RDEOO2n7JkMpNAw3UbNGwZrmeBozovbJdxOI41J7wsZN5bN9+mCrAGNykqmxk9++zaocOWBW7agZNn205zyrokPXdWzG/P+gs03G66irvaunGn1Od/9MO2hpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FGC7cfHw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NQjxlzbM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yoMNs3E8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fXy0JmQw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FGC7cfHw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NQjxlzbM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yoMNs3E8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fXy0JmQw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF7821FECE;
	Sat,  3 Oct 2026 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KgP0liTb+wnlv9bQhjjWGJ06ylQidoEF6R+VWYypJEU=;
	b=FGC7cfHwkeZYymFrShUVDcFNjy8wz1f5crGiw17AqA9NIP24m/mEKBtY1EUDdkvOAG3sWO
	JO6maaDPYRo66ImGd+7e8D7ydkA5rb83sYMMMCRyK6NTMudoNgacsSEMQfYydnP82+ZBc5
	CBXtZjZxPQmLOptE8ah1q3FniLz44f4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KgP0liTb+wnlv9bQhjjWGJ06ylQidoEF6R+VWYypJEU=;
	b=NQjxlzbM6u36B9uhd5asNVyiaRplPXdKplfIFJOFmc3lS1gfPEpCTINZ/TCsLeLCaEZKxP
	KBmOW92wJm3YafAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yoMNs3E8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fXy0JmQw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KgP0liTb+wnlv9bQhjjWGJ06ylQidoEF6R+VWYypJEU=;
	b=yoMNs3E8PQDKmrfrIeI0xCTYRLj74793FNKDp4UrA/VVkiK+9mCUrNFnGAccPZQjd7YZqI
	YsygBW3fUaeniIJVJ2wyUxSI4/8pbtf63DK/GAM/r5HjYMJhcY1ILEYIgsyazAUwFiRpU2
	hlfR5vbDzK9fJfszingCiGdWdgiGzxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KgP0liTb+wnlv9bQhjjWGJ06ylQidoEF6R+VWYypJEU=;
	b=fXy0JmQwhSSVaLMYkG9yt3IGbzZjqi4N1GUGGvt3AcvVWWh809a/8o8y4PsDsKa2uGPA2G
	WdQsGm+LO/MvuVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FBC613707;
	Sat,  3 Oct 2026 10:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/9] ALSA: Use devres card management
Date: Sat,  3 Oct 2026 12:57:07 +0200
Message-ID: <20261003105719.1070427-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DF7821FECE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Hi,

this is another series of trivial changes for sound drivers to use
devres card management.  There are a few drivers (mostly with platform
drivers) that do only snd_card_free() at remove, and they can be
replaced well with devres.

Only code cleanup and no functional changes.


Takashi

===

Takashi Iwai (9):
  ALSA: mips: hal2: Use devres card management
  ALSA: mips: sgio2audio: Use devres card management
  ALSA: mips: n64: Handle card removal properly
  ALSA: parisc: harmony: Use devres card management
  ALSA: ctxfi: Use devres card management
  ALSA: powermac: Use devres card management
  ALSA: sh: Use devres card management
  ALSA: sparc: cs4231: Use devres card management
  ALSA: sparc: dbri: Use devres card management

 sound/mips/hal2.c       | 30 ++++++--------------
 sound/mips/sgio2audio.c | 30 ++++++--------------
 sound/mips/snd-n64.c    | 61 +++++++++++++++++++----------------------
 sound/parisc/harmony.c  | 24 +++++-----------
 sound/pci/ctxfi/xfi.c   | 23 +++++-----------
 sound/ppc/powermac.c    | 35 ++++++++---------------
 sound/sh/sh_dac_audio.c | 22 ++++-----------
 sound/sparc/cs4231.c    | 49 ++++++++++++++-------------------
 sound/sparc/dbri.c      | 37 ++++++++++---------------
 9 files changed, 111 insertions(+), 200 deletions(-)

-- 
2.55.0

