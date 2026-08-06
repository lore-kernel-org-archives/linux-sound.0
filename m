Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF735F8D2
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030360; cv=none; b=YHSEZCGIBCBq52W5XiflB4F35woIyoZdwlooCfmXN7ZvNeORQt/jhHBvjdW73EJlGTyGuRovak73huh6Oq07iVZjtAGdnFYlQL84+ksl9U+183IRqcL1nE4noOLl1WeXDPPMhLcFbTbDRFJxbdCsbXkiO1jUxdCDCvvHSKry0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030360; c=relaxed/simple;
	bh=5Niec1U/ud+4PTYMWfQbLH8wiHzbSDm64deA2YOI7vc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mWpqu32a6JmjeEAJXCl/GqgNLfPBhpP3Rqgjb5jOhpPhPsDnh6/g6TXTYHoK/FiW5g+Q6zAM5YLMbHrI1BjcjIYIuTrnr9wNi4ypkvGrpNxI5ui8/+VjAf39NvEqVOodaAbzzw1OhfFJYW6gwDVfnj54QWyNsiFY0EC0KD/DwWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eU8JQkfS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fedSOOq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lliRwipG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NnRc6rOu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eU8JQkfS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fedSOOq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lliRwipG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NnRc6rOu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC5033E00;
	Thu,  6 Aug 2026 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ELtfnd8Nfqn0VDZfW2X3tlAZWdMC7aiAw67adWxsn2Q=;
	b=eU8JQkfSdDmnEaNfwhguEeYqtnhlR2//hGQEiDqu9oPksU2Mu0w5tOA250sp4dB7aGzPqt
	RtQ5AblFuu24AuGs+DiGTjsBUBnzu4qwfVJwwnmm3QzTHdAIeAImkIRGh/KgEbY3Y8J43P
	OPMwFit31uZncKrS12JlxAFf5ewVUt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ELtfnd8Nfqn0VDZfW2X3tlAZWdMC7aiAw67adWxsn2Q=;
	b=7fedSOOqUJvZC1QtkMUZ497oyk5v5nGZIVrT9iIBXDDQbFx3D2ocR/rmOowapAXQyYFLwt
	daDxzfd5WmIcQ0DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ELtfnd8Nfqn0VDZfW2X3tlAZWdMC7aiAw67adWxsn2Q=;
	b=lliRwipGj7I2H9vul1sS1F3ZQnz1uxVquYK1xhxQbddi6Li8YV+yVlWs+E2wkYDT/7mUz3
	daJBQPoQ3dxppg4BU96ICVEvq4/mpqVkmi5T7Kns+5u2Ya4X0CGxQu+ChhZD7b+NvLVeA8
	HY2VgtkIOttHybNAyjj5UcmxLtnS9Dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ELtfnd8Nfqn0VDZfW2X3tlAZWdMC7aiAw67adWxsn2Q=;
	b=NnRc6rOucxP2TGpiOuROP4q7oMVhtL39Tv/PY0RktOjKRRXwHU7GLg8idCvyZZrHxdi4zz
	IZw+9mj8XNTY2/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E2A2779B6;
	Thu,  6 Aug 2026 15:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1KttIQypdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/6] ALSA: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:17 +0200
Message-ID: <20260806153227.1460166-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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

There are a few other platform-based drivers that don't check the
validity of the dev->id value as the card index, which may lead to OOB
accesses.  Let's paper over them all.


Takashi

===

Takashi Iwai (6):
  ALSA: aloop: Check card index validity at probe
  ALSA: mpu401: Check card index validity at probe
  ALSA: serial-u16550: Check card index validity at probe
  ALSA: virmidi: Check card index validity at probe
  ALSA: mts64: Check card index validity at probe
  ALSA: portman2x4: Check card index validity at probe

 sound/drivers/aloop.c         | 6 ++++++
 sound/drivers/mpu401/mpu401.c | 6 ++++++
 sound/drivers/mts64.c         | 6 ++++++
 sound/drivers/portman2x4.c    | 6 ++++++
 sound/drivers/serial-u16550.c | 6 ++++++
 sound/drivers/virmidi.c       | 6 ++++++
 6 files changed, 36 insertions(+)

-- 
2.55.0

