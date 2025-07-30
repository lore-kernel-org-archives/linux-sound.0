Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694314F70
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 06:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858006; cv=none; b=TeA22hNkQCZiFDJlQuU7EkmaNbeJiAtt+N3njTyItQG0aDvSRc/0+BJ1uZeGhp9IWAtymY3o1uZAVK2vCJ+wCLkz1qARPsJQBfk2sho1qiSpb0Y7uPO3S6hNUyuwHWTSyWevJH5JVRfNmu3ifa7uOlQsJ9hoNxcL076fEtsMdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858006; c=relaxed/simple;
	bh=p7VO51OpP3Klb4z/Nq7YOxhIUAdHcdArpFEB3tu6taE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RIMyyMZtkEtYhMetvYwSD+A13ZnHMxb2KbOGWPIzY4M8GFmhKWOWA5cdi1KI67q0+CTmMQ8KszPSht2reNgPfUcnwl7zxxjmKB3YDuAoYpynQ5BNy570X8jbhQDf/ZT3UWT2Sphz/8+uDweBwX+mUQsmWotrLcJtUG20JhK0kLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1SQZZ//j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KScwWouQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1SQZZ//j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KScwWouQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1SQZZ//j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KScwWouQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1SQZZ//j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KScwWouQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 824671F801;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x7eyLaGSKdEGqLcvvARJbbFhu5ytBUC1GujpcXOUkeA=;
	b=1SQZZ//jaoeMHglxW7o2ZVZheuG8L7EGUvxJrMDQIc6qyrX9yloLINL3oZYjWBuns/Wj08
	xhYbLWkXa+dxmQyW16AaIGY6wlmrckviHvfSZ7iZIKBOZoeFkC93doedqOCl9VLJ9lOQas
	keoWfxhw/6rd9roYKYoPjDOtCYk373Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x7eyLaGSKdEGqLcvvARJbbFhu5ytBUC1GujpcXOUkeA=;
	b=KScwWouQrzpq0vCFEK9b1LFe6rHaYelEjaEWTd1fWlUcHq3ky9fzg4JqsJrqb/RnxWFasq
	chHTMLM4bzSedsDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x7eyLaGSKdEGqLcvvARJbbFhu5ytBUC1GujpcXOUkeA=;
	b=1SQZZ//jaoeMHglxW7o2ZVZheuG8L7EGUvxJrMDQIc6qyrX9yloLINL3oZYjWBuns/Wj08
	xhYbLWkXa+dxmQyW16AaIGY6wlmrckviHvfSZ7iZIKBOZoeFkC93doedqOCl9VLJ9lOQas
	keoWfxhw/6rd9roYKYoPjDOtCYk373Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x7eyLaGSKdEGqLcvvARJbbFhu5ytBUC1GujpcXOUkeA=;
	b=KScwWouQrzpq0vCFEK9b1LFe6rHaYelEjaEWTd1fWlUcHq3ky9fzg4JqsJrqb/RnxWFasq
	chHTMLM4bzSedsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62A551388B;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hOvnFtK/iWigOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Jul 2025 06:46:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 0/3] ALSA: hda: Enable drivers as default
Date: Wed, 30 Jul 2025 08:46:32 +0200
Message-ID: <20250730064639.25617-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The recent HD-audio reorganization made Realtek, Cirrus and HDMI codec
drivers split to multiple drivers, as a result, which forced users to
choose the new kconfigs and may miss the needed drivers.

This is a series of fixes to Kconfigs for improving the migration from
the previous kconfig a bit.

Link: https://lore.kernel.org/CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com


Takashi

===

Takashi Iwai (3):
  ALSA: hda/realtek: Enable drivers as default
  ALSA: hda/cirrus: Enable drivers as default
  ALSA: hda/hdmi: Enable drivers as default

 sound/hda/codecs/cirrus/Kconfig  |  9 +++++++++
 sound/hda/codecs/hdmi/Kconfig    | 24 +++++++++++++++++++-----
 sound/hda/codecs/hdmi/Makefile   |  2 +-
 sound/hda/codecs/realtek/Kconfig | 12 +++++++++++-
 4 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.50.1

