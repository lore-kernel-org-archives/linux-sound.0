Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB4232785
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162575; cv=none; b=RdavLNOr/huv2Q4EehRDYtida7SeXKKy2soccRlncw85FNfoB6ZqcYdZCTFIz7s4fQ9SPac+4jbNVpubsM04LcgI0703QElleC5q8q0YD+XCbawZ+4q8Qb+bvIbeEyPyDrr57a9GZO9ewkC8PQR4v4nHiQZX62B+Wy+3uF84lag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162575; c=relaxed/simple;
	bh=QjdJIesNTM/CkgZogM8ai0fBtqgjkSCEMLYrP/T7F08=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=Z95wZBRGDu4RlARmSLHclwK6EpXw7A17B75yevswYVmoxdREECXeC+Xp4e3bd15CyQUk5W4tQTP4gdkjrmZ7rGtZ+F8cCmS4pdSHhOIoOi7+j+bJcE8RP+VJ9gRjSxl7JbnRqeJgtWlvgXJVI9sAQI+f1xw8zs7ewpcmndRtCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CmOCzFBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n8YqOKqA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CmOCzFBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n8YqOKqA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CmOCzFBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n8YqOKqA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CmOCzFBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n8YqOKqA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 859465BCD6;
	Wed, 26 Nov 2025 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764162571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Osh8cwMJZaHze+3YJMBEWafX5UA4hekt/IK1OYlEU7g=;
	b=CmOCzFBEC5ETE+4AVvfSwk83q4/5585Pkd0llqzompfexCmaPUPA98POvQC3m4DSWfmA8P
	oKfE0ZOS9r3+8Rod03ea/SIuk/09uvLhC4c7Dozadq64sU2duPKJwTtm0woAzN5k9MgssL
	t9zkY+FCPbfKB2GtEPie05VWFIIKhmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764162571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Osh8cwMJZaHze+3YJMBEWafX5UA4hekt/IK1OYlEU7g=;
	b=n8YqOKqAO0FXxunKxtNGJFv3CHFH9V3WcAYwbuqBJR9+JnSPgbEgmdC/2nt0HyoBa8g/c8
	YzZ7JS01E48R1iBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CmOCzFBE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n8YqOKqA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764162571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Osh8cwMJZaHze+3YJMBEWafX5UA4hekt/IK1OYlEU7g=;
	b=CmOCzFBEC5ETE+4AVvfSwk83q4/5585Pkd0llqzompfexCmaPUPA98POvQC3m4DSWfmA8P
	oKfE0ZOS9r3+8Rod03ea/SIuk/09uvLhC4c7Dozadq64sU2duPKJwTtm0woAzN5k9MgssL
	t9zkY+FCPbfKB2GtEPie05VWFIIKhmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764162571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Osh8cwMJZaHze+3YJMBEWafX5UA4hekt/IK1OYlEU7g=;
	b=n8YqOKqAO0FXxunKxtNGJFv3CHFH9V3WcAYwbuqBJR9+JnSPgbEgmdC/2nt0HyoBa8g/c8
	YzZ7JS01E48R1iBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 655CC3EA63;
	Wed, 26 Nov 2025 13:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xZNbFwv8JmmVbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Nov 2025 13:09:31 +0000
Date: Wed, 26 Nov 2025 14:09:31 +0100
Message-ID: <87zf899bzo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Sound Mailing List <linux-sound@vger.kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.18
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 859465BCD6

Linus,

please pull sound fixes for v6.18 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18

The topmost commit is d041e5e748f926398ad96436a86667dea8b591e0

----------------------------------------------------------------

sound fixes for 6.18

A collection of small fixes.  All changes are device-specific and
trivial, mostly HD-audio and USB-audio quirks and fixups.

----------------------------------------------------------------

Haotian Zhang (1):
      ALSA: au88x0: Fix incorrect error handling for PCI config reads

Ilyas Gasanov (1):
      ALSA: hda/realtek: Add quirk for HP ProBook 450 G8

Ivan Zhaldak (1):
      ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230

Jacob Zhong (1):
      ALSA: hda/realtek: add quirk for HP pavilion aero laptop 13z-be200

René Rebe (2):
      ALSA: hda/cirrus fix cs420x MacPro 6,1 inverted jack detection
      ALSA: usb-audio: fix uac2 clock source at terminal parser

---
 sound/hda/codecs/cirrus/cs420x.c  | 1 +
 sound/hda/codecs/realtek/alc269.c | 2 ++
 sound/pci/au88x0/au88x0.c         | 8 ++++----
 sound/usb/mixer.c                 | 2 +-
 sound/usb/quirks.c                | 3 +++
 5 files changed, 11 insertions(+), 5 deletions(-)

