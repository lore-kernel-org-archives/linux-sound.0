Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B86358368
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399358; cv=none; b=K6RL37oXW/b1wLQX96o7bOK9ku5qjLVPzBFnZMaaX7Qz4eNuwI0U/2MnE4AVbyd+KxkaQQaZgJB17rLJWJua1ftW34Bci+NELcU1fWLbVuZYfRyi1VdfoQMyDYhUsA8YHxbzRicifxqxcesD5j24er/JiBrrZY+FOKh4vrwmW18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399358; c=relaxed/simple;
	bh=NCaMVi+u/ij6I8n+r2mlZNCkXs9L5hMwZgBY+f5AGaA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MBarGz6+7v4aETiovqvvRH3u0dTGMxuHhDAI6Mptkz+NiqyV/Ys5/3HzxiKDozUcpscjNXzoT2IO6RGDKyIExdTRYyXGg13b8+uSVhU2EXN6GKYmISq/nVMxnrSQNuzbOvunbeYciQI+nP+ErkoLq9+m/b1Pw/x7n5+nEnWiYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zmCKzMfJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zsb+mdvk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vtikB2EO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TswRBxuG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zmCKzMfJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zsb+mdvk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vtikB2EO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TswRBxuG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A0303ED8;
	Thu, 30 Jul 2026 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785399343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PDfGiQmjKlXdhE/8uUHFAieVCcD3gdrWJCCUOkTPAwY=;
	b=zmCKzMfJRidZA5scDm8vZKBFzPh6YJthTTVJGwoZ8PlHTl1ggSasMRFNNneLB2FBVQKftZ
	vPDREmoWtJKJaSyA+LnRU0G0PbndAfZAApxXzCQxquSaUWl+vAAWbAiXbB/RVdMBeHmKhZ
	Z4RFUsFcDEgB0FOVKs+5Zdjqm3UQdE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785399343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PDfGiQmjKlXdhE/8uUHFAieVCcD3gdrWJCCUOkTPAwY=;
	b=zsb+mdvkS9q79E+HDRfPEzFczcGWt82zG4LCbEEyXvHDm2f2c2N1HIUHWujHhQZ071gtd1
	0lbQv8sb2D105TDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vtikB2EO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TswRBxuG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785399339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PDfGiQmjKlXdhE/8uUHFAieVCcD3gdrWJCCUOkTPAwY=;
	b=vtikB2EONJsm6adutoVzSpBXPujsvzxoFLfyo9D51h2YQUbWWDP7yYoGjJnNBJWPTOkOR2
	NDi3OhfflsoM3s/hyNGs7hg5XvO+5/1kWk/XfezIf8EsVyUUP9AvtrC+rFtRxTbfBe6eqQ
	dN+Z36HatxFIO0zMkKQD7RAOx8FU0+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785399339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PDfGiQmjKlXdhE/8uUHFAieVCcD3gdrWJCCUOkTPAwY=;
	b=TswRBxuGUaN0FOEOh5p0fy1A8atO8s/eTNkJ5MihM7eopFip9vXV8he4VR7gn3vRyBXQ9E
	a/ckqQunvvHSLyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5016779CD;
	Thu, 30 Jul 2026 08:15:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rNN9NioIa2pWLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 08:15:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: hda: Clean up jack name helpers
Date: Thu, 30 Jul 2026 10:15:32 +0200
Message-ID: <20260730081537.320686-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 1A0303ED8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

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

