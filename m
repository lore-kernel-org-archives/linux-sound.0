Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1653FA5E4
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106345; cv=none; b=g7uBd6i29Fh/JdNaf7Oq5WPnpKZLgkmPHI6DdSMlgaF+B31lxUBQHsX9klTyGwsv4R+lDdTXdv5RfzbySMfugYfeOraNDxTThWwNd6Z27ZasD8iE+hFdnsyRPVp0UiKmEx27iAX6JehmOtr/+k1lj4UW2iLhVcC8y+JWUTRlPm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106345; c=relaxed/simple;
	bh=4DSvBJ8hvwsYqXzDOfjJ+AscOl1cElfTy/X59Qu/dk0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LIPqyV78krNo0XnFpkWUJ8rliHHDvdXPIhHo9PkbIhISI+HwmzBxeUdOS3gYClzqAOWsYvtTC4YOMUnpQAC6GI0TiOk82y1uE0B5gsIq2o+lA9fcSIY5pkGFUno6TXXHMxrwUf33aNQpjaRcL28GAPf7SbE4DjxPWB+yTngx+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qs6zP+ks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOngqv1l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qs6zP+ks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOngqv1l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qs6zP+ks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOngqv1l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qs6zP+ks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOngqv1l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0649B6AD80;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G4KSdjtcDU/d/e7PKXZVHnvi1ewhl7UPy3ShZPPDoBM=;
	b=Qs6zP+ksS3kF/6GW1Dp+AZP1LBGr+Qrz0WyKwizJG4VCBpVylEzRcdJis7HogcHl6RbBwL
	qzc/yZHtGP+6gm+x0r+7IQSi2xM87pOhPO3gV/gw3cl1O4eSIUev1ULcJaUwJ5s3CMISAz
	MjYLZLHSB5Y0/1/g2KGHbLyeFbU36ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G4KSdjtcDU/d/e7PKXZVHnvi1ewhl7UPy3ShZPPDoBM=;
	b=bOngqv1lS1BHaIPPYRujfTdRCksQH7nlzZCqlKIZjrvETGDL45NXnVopDQNfPMD65vBLNP
	erzTNybbzjgiKYBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Qs6zP+ks;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bOngqv1l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G4KSdjtcDU/d/e7PKXZVHnvi1ewhl7UPy3ShZPPDoBM=;
	b=Qs6zP+ksS3kF/6GW1Dp+AZP1LBGr+Qrz0WyKwizJG4VCBpVylEzRcdJis7HogcHl6RbBwL
	qzc/yZHtGP+6gm+x0r+7IQSi2xM87pOhPO3gV/gw3cl1O4eSIUev1ULcJaUwJ5s3CMISAz
	MjYLZLHSB5Y0/1/g2KGHbLyeFbU36ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G4KSdjtcDU/d/e7PKXZVHnvi1ewhl7UPy3ShZPPDoBM=;
	b=bOngqv1lS1BHaIPPYRujfTdRCksQH7nlzZCqlKIZjrvETGDL45NXnVopDQNfPMD65vBLNP
	erzTNybbzjgiKYBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1188779A7;
	Wed, 10 Jun 2026 15:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C4VZMaWGKWo5MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 15:45:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	linux-kernel@vber.kernel.org
Subject: [PATCH 0/5] ALSA: introduce simple refcount helper functions
Date: Wed, 10 Jun 2026 17:45:30 +0200
Message-ID: <20260610154538.51076-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0649B6AD80
X-Spam-Score: -3.01

Hi,

I noticed that we have open-code for managing the same refcount+sync
patterns in various places, so here is a cleanup for them to use the
standard helper functions.

No functional changes, but merely code refactoring.


Takashi

===

Takashi Iwai (5):
  ALSA: Add simple refcount helper functions
  ALSA: core: Use the new helper for the power refcount
  ALSA: hda: Use the new helper for PCM instance refcount
  ALSA: aloop: Use the new helper for stop-count refcount
  ALSA: usb-audio: Use the new helper for shutdown refcount

 include/sound/core.h      | 31 +++++++++++++++++++++++++------
 include/sound/hda_codec.h | 10 ++++++----
 sound/core/init.c         |  3 +--
 sound/core/misc.c         | 24 ++++++++++++++++++++++++
 sound/drivers/aloop.c     | 13 +++++--------
 sound/hda/common/bind.c   |  3 +--
 sound/hda/common/codec.c  | 14 +++-----------
 sound/usb/card.c          | 14 +++++---------
 sound/usb/usbaudio.h      |  5 +++--
 9 files changed, 73 insertions(+), 44 deletions(-)

-- 
2.54.0

