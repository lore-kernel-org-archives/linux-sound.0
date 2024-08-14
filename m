Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCAE179BD
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643291; cv=none; b=bOcBs/yRbRMqCqMlyOBPlh1nR1SyX1i2Qp8B+2XNl8k6y4tE9SGLx1fEyf2u1GNxK43IBNB71IY0s5PYyrxPJEbnuaIu8fiCpkM1Ou3OffvCrrMEVzpwZ1FaYwmveDrfCVQOYvFqMAmNfKw35PJ38KFs16Naz/a7MKpbRW3BmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643291; c=relaxed/simple;
	bh=QkR+Sz3TYi9kVHlFIfV16raGc6+VAwqLyPM0KH6cUaw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=T4iH89u8FWFLYZkyYCQIc39DwUjHCTWwIkQiY5JcFXgP0YHUctu54Knm+ofbhZTGVXVHGdTzcdYHlgXH5FFoO4+m3j02V5jDyx/l7FmRkELhgiymnJt3XZLWfU0DH/R4ya84qCgO8Xl4wy6ONX/Iuxkv4VocEQmAHOQKL605Xgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=We/8JPT1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hLuV3iwx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=We/8JPT1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hLuV3iwx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="We/8JPT1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hLuV3iwx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="We/8JPT1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hLuV3iwx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9423A1FEE0;
	Wed, 14 Aug 2024 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723643287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=feDAnDbX34+s1/pZui12eg/3uYKr3ct8uRTq5jSwgAE=;
	b=We/8JPT1SBPE4sedlRpQwAsOIs1no1KDXESUfCi6XzjuAIRCz2YbzbZyErOZ8/5ZuvDSj8
	0/mophPlNtKyKloV3yI5PbM5FMRCI5m33qd3ISRWI+82S+QO9ae5JpB28B6hlX/+bASdfR
	anKm5JRk4CL6LcDd5xX9bRm24Vz6ojc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723643287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=feDAnDbX34+s1/pZui12eg/3uYKr3ct8uRTq5jSwgAE=;
	b=hLuV3iwxGKUmRerystndSe25PHvgHPHhtJnrvZ8fs986AeeJI/mT7SFYCO60CjZwV4sLOb
	x/myDJKR11+2MzAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723643287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=feDAnDbX34+s1/pZui12eg/3uYKr3ct8uRTq5jSwgAE=;
	b=We/8JPT1SBPE4sedlRpQwAsOIs1no1KDXESUfCi6XzjuAIRCz2YbzbZyErOZ8/5ZuvDSj8
	0/mophPlNtKyKloV3yI5PbM5FMRCI5m33qd3ISRWI+82S+QO9ae5JpB28B6hlX/+bASdfR
	anKm5JRk4CL6LcDd5xX9bRm24Vz6ojc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723643287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=feDAnDbX34+s1/pZui12eg/3uYKr3ct8uRTq5jSwgAE=;
	b=hLuV3iwxGKUmRerystndSe25PHvgHPHhtJnrvZ8fs986AeeJI/mT7SFYCO60CjZwV4sLOb
	x/myDJKR11+2MzAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 704101348F;
	Wed, 14 Aug 2024 13:48:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3dMKGpe1vGZ1RwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Aug 2024 13:48:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: usb-audio: Clean up quirk tables
Date: Wed, 14 Aug 2024 15:48:40 +0200
Message-ID: <20240814134844.2726-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Hi,

this is patches to clean up USB-audio quirk table definitions with
some helper macros.  There should be no data change by this, just
clean up of the source code.


Takashi

===

Takashi Iwai (2):
  ALSA: usb-audio: Define macros for quirk table entries
  ALSA: usb-audio: Replace complex quirk lines with macros

 sound/usb/quirks-table.h | 2283 +++++++++++---------------------------
 1 file changed, 668 insertions(+), 1615 deletions(-)

-- 
2.43.0

