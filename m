Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323B1FEFDE
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496254; cv=none; b=IWhXLhKs8tDjyIlFdqcU6cUQgB6AtC6YQnjCHMYQfWE1CXh1/73TawYTynk5+B8TMVXw4b1Y/hRR17kLA+R+wucLOywoJXzn9l3riJiCxjXKpSZpLBRpTUCMgSeRGn4gGElrPKJiCel7W/xG4Ok5ho90iBa8YF2x4bGz3ags5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496254; c=relaxed/simple;
	bh=fCAwFq+H7uapxdhhWamDN5E77ime/VHkdkOG13+NyRE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=k1gJkX5Vt/7wJJXby/uzL9BGAM6DzyJQtAuYjsA+pcuDV9ft5fdK7sfESWPFnae1GInNqTuZ+43FVHged94gCjEpY/9pq19UC8x40UnNySPYfreib22zcNMoRJrfRBVy9Pky9LHRZpFv86qGjKW0ROG3jL6DC+VgjTEa6gxZA7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=08H50y+d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0XNQLDID; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=08H50y+d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0XNQLDID; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="08H50y+d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0XNQLDID";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="08H50y+d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0XNQLDID"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 07C71211CC;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wfAa9Mvy6FCwwfC6/SizlfWy6MIhMp86pZuZt+U/hkY=;
	b=08H50y+dzfOuVET3KalMaQ43tYgV60KHeTs3DEpYUNrL2FhGAxamQYL9PjpRTgPE9ffSS+
	b8SS935p7KJ8SOo3KyUHxcqFkf38Do+1KOWz95LPwcy4HEnEg052fmEjBG/c4x1gPdbpBh
	DTvyxcB0LEQhM0lrGpzaH4upq5XgjAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wfAa9Mvy6FCwwfC6/SizlfWy6MIhMp86pZuZt+U/hkY=;
	b=0XNQLDIDnBa5phHK1ylrWE/XApjz5RlYFh7m/NmKq0YPzFrWQcNm7ClIpX3SDRdXlDz51N
	2DpoDBBeDWr0IOAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wfAa9Mvy6FCwwfC6/SizlfWy6MIhMp86pZuZt+U/hkY=;
	b=08H50y+dzfOuVET3KalMaQ43tYgV60KHeTs3DEpYUNrL2FhGAxamQYL9PjpRTgPE9ffSS+
	b8SS935p7KJ8SOo3KyUHxcqFkf38Do+1KOWz95LPwcy4HEnEg052fmEjBG/c4x1gPdbpBh
	DTvyxcB0LEQhM0lrGpzaH4upq5XgjAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wfAa9Mvy6FCwwfC6/SizlfWy6MIhMp86pZuZt+U/hkY=;
	b=0XNQLDIDnBa5phHK1ylrWE/XApjz5RlYFh7m/NmKq0YPzFrWQcNm7ClIpX3SDRdXlDz51N
	2DpoDBBeDWr0IOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2B2213301;
	Wed, 13 Nov 2024 11:10:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J4MKNjWJNGe3UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:10:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ALSA: Fix USB disconnect behavior for non-standard drivers
Date: Wed, 13 Nov 2024 12:10:34 +0100
Message-ID: <20241113111042.15058-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

This is a series of patches to fix problems of USB non-standard audio
drivers at disconnections.  A few of them call snd_card_free() at the
disconnect callback, and this blocks until all files get closed.  It
may eventually trigger a soft lockup, as spotted by syzkaller.
Those can be fixed by replacing with snd_card_free_when_closed()
version.

While looking through the code, I stumbled on other issues like 6fire
driver's release management, and the fix is included as well.


Takashi

===

Takashi Iwai (5):
  ALSA: usx2y: Use snd_card_free_when_closed() at disconnection
  ALSA: us122l: Use snd_card_free_when_closed() at disconnection
  ALSA: us122l: Drop mmap_count field
  ALSA: caiaq: Use snd_card_free_when_closed() at disconnection
  ALSA: 6fire: Release resources at card release

 sound/usb/6fire/chip.c     | 10 +++++-----
 sound/usb/caiaq/audio.c    | 10 ++++++++--
 sound/usb/caiaq/audio.h    |  1 +
 sound/usb/caiaq/device.c   | 19 +++++++++++++++----
 sound/usb/caiaq/input.c    | 12 +++++++++---
 sound/usb/caiaq/input.h    |  1 +
 sound/usb/usx2y/us122l.c   | 21 +--------------------
 sound/usb/usx2y/us122l.h   |  2 --
 sound/usb/usx2y/usbusx2y.c |  2 +-
 9 files changed, 41 insertions(+), 37 deletions(-)

-- 
2.43.0

