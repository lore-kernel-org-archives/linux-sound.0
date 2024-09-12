Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5D44C8F
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726156309; cv=none; b=Hoq7/dnA96vs1Ao/CaHsXDxEN8f+5uJFWuDmFZ2RHTW6P0aCryEW7veZOcDgpb3T8CksB+bSA+WfqmQno35VMTMYfkM4klYC9sv1jQ42fWh59L+gqKZDDxnfnaEIlh6hzzWf/0ZFhyjyI7otNJOtbKB8aHuvm6nO5swJaPrDjkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726156309; c=relaxed/simple;
	bh=zgL0t9vnl+EJaYmEWei7SocUPBs8XwItpcjf+Q2YwRA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Spsj0YPt6gqon8OHYOuqye0Yb3dlokVXPZ/cDH10Yp69DzUJTacjYCmpf1vF1Y4GGIOXY43gONFnTVE+PVQVMjuTQQAeRGioeT8GGKiSOyMXsWAzDsFeg9jSyUuVfjxljlKj6wSC/XK0JlgXgTKGO2/FStf5JRDqcxE1dJyOQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=onE9xyM3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l7PgnMwx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=onE9xyM3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l7PgnMwx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="onE9xyM3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l7PgnMwx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="onE9xyM3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l7PgnMwx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2EA2219CA;
	Thu, 12 Sep 2024 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726156305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qca1NbNbluVsr1eoGqgQzIB7V9hkO1Ugr+7vnv+84/s=;
	b=onE9xyM37Ewiudjf3bf4ORDs2+QsttZBPmlRu5WKCZUjCo7A+FyQJqb62+EjoHp8qWz6rE
	KUPlCizPL4CnfR7vN7arkcZF49fyS9FuBjPD5lWJOH8aTcnjSJzffa37rjkQvULuRzRI7A
	7iD1Hh+O7CmZ/oxGfSWIEyPvhOT6388=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qca1NbNbluVsr1eoGqgQzIB7V9hkO1Ugr+7vnv+84/s=;
	b=l7PgnMwxr9ZiPu9MDmLFrY9a29xJoi3cI2A04bFrBCF1Tv5TsBJ3GN6gZ8E3SAjFCias1n
	2DnnAMg2nxl/4HBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726156305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qca1NbNbluVsr1eoGqgQzIB7V9hkO1Ugr+7vnv+84/s=;
	b=onE9xyM37Ewiudjf3bf4ORDs2+QsttZBPmlRu5WKCZUjCo7A+FyQJqb62+EjoHp8qWz6rE
	KUPlCizPL4CnfR7vN7arkcZF49fyS9FuBjPD5lWJOH8aTcnjSJzffa37rjkQvULuRzRI7A
	7iD1Hh+O7CmZ/oxGfSWIEyPvhOT6388=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qca1NbNbluVsr1eoGqgQzIB7V9hkO1Ugr+7vnv+84/s=;
	b=l7PgnMwxr9ZiPu9MDmLFrY9a29xJoi3cI2A04bFrBCF1Tv5TsBJ3GN6gZ8E3SAjFCias1n
	2DnnAMg2nxl/4HBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBCD113A73;
	Thu, 12 Sep 2024 15:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q2M6LBEO42ZTHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Sep 2024 15:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: memalloc: Use proper DMA mapping API
Date: Thu, 12 Sep 2024 17:52:23 +0200
Message-ID: <20240912155227.4078-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

This is a further cleanup of memalloc core stuff to do behave
more correctly regarding DMA API.  Formerly some x86-specific code
relied on the address from the page allocators, but rather we should
map correctly the pages with DMA mapping API.  With those fixes, the
fallback allocation should work more properly, so we can drop the
hackish check, too.


Takashi

===

Takashi Iwai (2):
  ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer
    allocations
  ALSA: memalloc: Use proper DMA mapping API for x86 S/G buffer
    allocations

 sound/core/memalloc.c | 127 ++++++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 60 deletions(-)

-- 
2.43.0

