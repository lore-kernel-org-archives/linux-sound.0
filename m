Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130B1F4E4C
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478839; cv=none; b=GU13qHt1ackqDQclw8zmAkJDGTrYRlstf64oh9znibUbcCWHX8O1BAzae+pexKJLQdbJuBImBkDT1YWby0/30g4fgy+xG+mnVcRIeHqQfIWNSx0IUwGxEndmrOMpYVslfk6LO2p5ZZx2fpc9Yrq7nXPKfX6qZDArztDdEr+5pSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478839; c=relaxed/simple;
	bh=8z4G2fp6T+ZjY7acr4HlTnt32vej3Ww8emRdQk/v4xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9NTnZ4dgLGyitxYjiNE48bsX1kqpgX2T8FUSh/dtDFPbpZ69E3+gD55Ictbrto8AwuAUHTdZYTK6O2gHcGmJX2THqOFByWNjvBpPEKOixaY++t0gVDWZ1eKw4k0v4Y29QSpckOE5BZOlveCdufgYueRuq2TjNlaMuj+ROzmxGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t15jHHpN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pKjAXBuI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QUYmS5Ev; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PPHx0yib; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t15jHHpN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pKjAXBuI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QUYmS5Ev";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PPHx0yib"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAF7421170;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AD630wfZ+P5WZK23IYD4R90wClKt+m7Qxargbdevkp8=;
	b=t15jHHpNdIQ+WGI4PFjjTzX5YDv+0CSxadMzn/2Rg1idUHU2NxHky0fjXQkg5WjBCauu82
	lpDdlVSm9u5qBc/j16igFrIdlJFyAx9dHUYRq9mckN7GfLYSTf+TICgvaAoLLO8PFztwaP
	jJsC5+aLrFlTbslsillEziS2XYSon3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AD630wfZ+P5WZK23IYD4R90wClKt+m7Qxargbdevkp8=;
	b=pKjAXBuICnCs0LHQjyI70YkCYybnRhH3hTsUS4yNORUDZHCM39e2SDghpGHQ+v6d80XQOX
	v0LDPFV1ymFIrtBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AD630wfZ+P5WZK23IYD4R90wClKt+m7Qxargbdevkp8=;
	b=QUYmS5EvXkCMX7Z92wKIOGr2n0Y830ex0cR8jzgweiEpRmWwH8ZD/tI/MqN9igqA1Q6Ryw
	hobmiScniImsBlsgLe9fT5PAufFLQ+ZTDBzp98BIfoPuFQoF7mzReN3K9dWvFzdUXq5LBg
	D13vHkKPotmoF1wn+Vg2WLu4jbMd2tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AD630wfZ+P5WZK23IYD4R90wClKt+m7Qxargbdevkp8=;
	b=PPHx0yib/TAI/BMD+FOn+z5bOKrM5Sk7A03fabRM42hMt2l/H1uSr2hxVbV3hhmXG4McRy
	XOkGNQILF1fP9sBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5B8D1387C;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6CzuLrPSj2d3bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Jan 2025 17:00:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH 2/3] ALSA: usb: fcp: Fix incorrect resp->opcode retrieval
Date: Tue, 21 Jan 2025 18:00:30 +0100
Message-ID: <20250121170032.7236-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121170032.7236-1-tiwai@suse.de>
References: <20250121170032.7236-1-tiwai@suse.de>
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Fix a wrong conversion macro used for resp->opcode, which is __le32.

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501212331.SaePSmsA-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/fcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 92e3caab0b82..cfa131b35e43 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -266,7 +266,7 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 	if (req->opcode != resp->opcode) {
 		usb_audio_err(mixer->chip,
 			      "FCP response %08x opcode mismatch %08x\n",
-			      opcode, le16_to_cpu(resp->opcode));
+			      opcode, le32_to_cpu(resp->opcode));
 		return -EINVAL;
 	}
 
-- 
2.43.0

