Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FB324B02
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833521; cv=none; b=EQ9DpEH4eFzf+SABBcj2cyrRFEiky2FU5dKr4AvzQzp5EhsMw5hOSYuj/FNi8t2eWemvlYd+jMIjHCsVdxLwPO3AGP2SEsUEMJBMVncLuo+mQa6IvPX8QINWJajlWKhA6EyTLcYxo4TWDcBPXbC9hAwdbZbYjjfjMzfUtMza0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833521; c=relaxed/simple;
	bh=P0Bp2W/VOYtfvlzHJtlaXPBqgMhd1lk4YFHKCxjZlWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2WkbzlyvCB5nZAyVVWVOazL43O7P8UojJ1KATvwnKTOJJTybkQzeSAxgUA/KQNLfZp/229su/vnVk8qbTzC/tBSe/ssfYnkEv17Q520BBncpnrtIl6gves+MJN9InER4znz9gUXnnfmuPKS/vdd3uZiNMY4rLmgM/IrB6iHVsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gPdv0QI/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aP1lXbIk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w1n8pmIk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oMv8hx+e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gPdv0QI/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aP1lXbIk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w1n8pmIk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oMv8hx+e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA196211EF;
	Tue,  2 Sep 2025 17:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756833518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3rAUmMxxNrRMBy9nRafwrS7Zo4/AT938wQfuh63RXU=;
	b=gPdv0QI/EQTmow23KIrG5KBcLGAYndhOW9+qv0oqU/8xOSx+tY3c5Wb36f61/pqjYlvi59
	kkqXquGGj1PjNkc/pRB8FOOXxfkCIQmx9ihdjLhdMALwtOZmjHMI5eFU1cyxIqeUdGNVZb
	wr5H74la8wwKwx2j8s6Az78uqhEb1p8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756833518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3rAUmMxxNrRMBy9nRafwrS7Zo4/AT938wQfuh63RXU=;
	b=aP1lXbIkUa9OujRz+DkbnMIdhptw0n3ApKKGk1z8snqeOTHJrbZf+g2A02inRnE0quaLrs
	e7+V0IxVOYDjQ4Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756833517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3rAUmMxxNrRMBy9nRafwrS7Zo4/AT938wQfuh63RXU=;
	b=w1n8pmIkam2elPK1fgEKHazFUBjtyHDz99ElB2wkkFSMBDANBJW5gXM4OP7cGxL6Mh1BYb
	Bzro0KT0ZjqYpqBzbkh41lQnntZOhZtUBeoDlgN7Z/+eExC4DJZhgmS2DNf8ArLmLb6i0E
	ExOKJ3TXX0hBQrzE8tCge/eQrrZcTyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756833517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3rAUmMxxNrRMBy9nRafwrS7Zo4/AT938wQfuh63RXU=;
	b=oMv8hx+eqNVeB3PIPtpLPJOhBMQ+QJ1w1Sdawil6sI1PdGcH+TgR37Ro/Ch7tuEWR2Ugoh
	J5y1Oq6/eWgEGpCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A93D813888;
	Tue,  2 Sep 2025 17:18:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kNjNJ+0mt2i8UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Sep 2025 17:18:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ASoC: Intel: Fix invalid quirk input mapping
Date: Tue,  2 Sep 2025 19:18:18 +0200
Message-ID: <20250902171826.27329-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

This is a revised patch set for potential OOB accesses when wild
values are passed to quirk option for ASoC Intel drivers.
Unlike the v1 previous patchset, invalid quirk values are checked and
corrected at log_quirks() in each driver, instead.

v1: https://lore.kernel.org/20250415083144.6588-1-tiwai@suse.de


Takashi

===

Takashi Iwai (3):
  ASoC: Intel: bytcht_es8316: Fix invalid quirk input mapping
  ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
  ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping

 sound/soc/intel/boards/bytcht_es8316.c | 20 +++++++++++++++++---
 sound/soc/intel/boards/bytcr_rt5640.c  |  7 +++++--
 sound/soc/intel/boards/bytcr_rt5651.c  | 26 +++++++++++++++++++++-----
 3 files changed, 43 insertions(+), 10 deletions(-)

-- 
2.50.1

