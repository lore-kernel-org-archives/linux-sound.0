Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F7248F63
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684493; cv=none; b=tXo6RP/ybwt1afaMAnuRZzvdM1GFZ8jBEwsS136+MakibnEIa4mP13iV7NsCbxsGMNEUU6Rzn2lC9vxdkUNtnsmcO1vKGfmPs/n4+CKCdwy+Y2Ps5QxpWPrt05JUBn0lvO4erndcvmhJJg6T5yZy1Jc778mFrYM/vrSN8qLl52Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684493; c=relaxed/simple;
	bh=iJNeqs7Dl/PJzQcpkJyODwr9KDDMKBeUxd6lpGJhRkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/5bfLOrK+4wc5nmODMtvI3Sekem4Gvm7YK5CqsrZtYyyuYndSTjOP5tUsz6N+9qUEbtsRsZRnQMi9DEWAFXVNyqPGgli7Fs8/RxbbfVwFmf1ALEN3UfiPmyFSi3r0WnkTyJsRRKhMTBLWy6RDXbrGOpDbSpX/jQal36oRuVYgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VGmXNiEC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zPmW5Cx6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VGmXNiEC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zPmW5Cx6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VGmXNiEC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zPmW5Cx6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VGmXNiEC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zPmW5Cx6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDA1C210EF;
	Mon, 23 Jun 2025 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E8rKBW//f9+iMjKMx153fz3XdOKtdWs7UXbETGASZsY=;
	b=VGmXNiECL5WIW24qzBWNLznSjm4r/7oaKd6oHl3mVbYyl0ylHLaHJ2eBfmKxlfhM/v7VI8
	QoTT+ecxERfnBTwvM6nZ+PnQyx8bAWfQsjnnSYuf5ISi0/Hv7QJYmPsg8kaIoC9n6IUlwS
	ZuyAnatUwdpVOowOmqLQFDgmhxGLHDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E8rKBW//f9+iMjKMx153fz3XdOKtdWs7UXbETGASZsY=;
	b=zPmW5Cx62unyGHnBizKX9U7tj+xr1wMS3yCcDQMWvUqHBsf3DzvlCzwQ9AvK8O8oNZJtSV
	aRJZB8Mbxoy6xVBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VGmXNiEC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zPmW5Cx6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E8rKBW//f9+iMjKMx153fz3XdOKtdWs7UXbETGASZsY=;
	b=VGmXNiECL5WIW24qzBWNLznSjm4r/7oaKd6oHl3mVbYyl0ylHLaHJ2eBfmKxlfhM/v7VI8
	QoTT+ecxERfnBTwvM6nZ+PnQyx8bAWfQsjnnSYuf5ISi0/Hv7QJYmPsg8kaIoC9n6IUlwS
	ZuyAnatUwdpVOowOmqLQFDgmhxGLHDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E8rKBW//f9+iMjKMx153fz3XdOKtdWs7UXbETGASZsY=;
	b=zPmW5Cx62unyGHnBizKX9U7tj+xr1wMS3yCcDQMWvUqHBsf3DzvlCzwQ9AvK8O8oNZJtSV
	aRJZB8Mbxoy6xVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AF2013A27;
	Mon, 23 Jun 2025 13:14:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ISWCJElTWWhzTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 13:14:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH 0/3] ALSA: hda: fixes for jack polling
Date: Mon, 23 Jun 2025 15:14:29 +0200
Message-ID: <20250623131437.10670-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CDA1C210EF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

This is a patch set for making HD-audio jack polling code more
robust.  As recently reported, the jack polling code had potential
races, and this covers those by changing the jack poll work call
patterns and fixing the shutdown code.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: Disable jack polling at shutdown
  ALSA: hda: Disable codec runtime PM when jack polling is enabled
  ALSA: hda: Handle the jack polling always via a work

 sound/pci/hda/hda_codec.c | 56 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

-- 
2.50.0

