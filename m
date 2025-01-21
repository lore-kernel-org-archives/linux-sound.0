Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB111F4E47
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478839; cv=none; b=ehonWsB/B/Oe943OtMcm3GMZt2g61dp9VkxvFY7F0LJ2I5Bel4eGzQdVZXz7X6I83VdLpCpRa+iaAhTOJQjrZyBkn2lkBAdriXvyXDoVkh3s8mMmQTDn9QgV8scX06kTnQUnIIpO46zz42M6KH4R0E8fJTe92XHSE0Svt5UA8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478839; c=relaxed/simple;
	bh=zUyyJGPWwi6veKHw3OJVbUUMAjUs+vUDVGAcSLE1ZFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p1Fnew17Cc33TFf+8lz03hQxxtLb76HXezSSHgxNaxori/cA0lJBGhlSLDujf53VbIoW7h870SSrt9QIhdKQ2QPM3aUjWTrrfN9gCfFPua/8DtBBsf0UHFhtHAeu5QdAAZ+6oOpBEnoWuUKXuBmmFHAweg/LB0u78+7Od0I3WJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ptGxyWl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bt/5EyOT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ptGxyWl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bt/5EyOT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ptGxyWl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bt/5EyOT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ptGxyWl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bt/5EyOT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8171F1F399;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+27jZmUsWFe03X1eXiDQmKAWa2mHkHdPCx/hNatU7/U=;
	b=0ptGxyWlRDv86CHjevYfOiQpzTEPejmdO4l5QKwFvMP+0AHYKVogZYsCmjJhfqakhsbsRF
	8JLI2SpvGOB1ZY8VNt3AuIfl2H4eOAohiu8l7XLEyWAMdYqz0eunOclXJkHbl17/v92zeA
	QDnBgqhpYcoSQaOdNn5QredhZ4DOLY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+27jZmUsWFe03X1eXiDQmKAWa2mHkHdPCx/hNatU7/U=;
	b=bt/5EyOTQ40IOSVL9zX2UlvUxRRBO9aht5AC7mTCQPwap+AlMRIkIovrw/XhReYVj50zzt
	MehA9RFZSZo23xDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0ptGxyWl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="bt/5EyOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+27jZmUsWFe03X1eXiDQmKAWa2mHkHdPCx/hNatU7/U=;
	b=0ptGxyWlRDv86CHjevYfOiQpzTEPejmdO4l5QKwFvMP+0AHYKVogZYsCmjJhfqakhsbsRF
	8JLI2SpvGOB1ZY8VNt3AuIfl2H4eOAohiu8l7XLEyWAMdYqz0eunOclXJkHbl17/v92zeA
	QDnBgqhpYcoSQaOdNn5QredhZ4DOLY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+27jZmUsWFe03X1eXiDQmKAWa2mHkHdPCx/hNatU7/U=;
	b=bt/5EyOTQ40IOSVL9zX2UlvUxRRBO9aht5AC7mTCQPwap+AlMRIkIovrw/XhReYVj50zzt
	MehA9RFZSZo23xDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FBF71387C;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id giI7ErPSj2d3bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Jan 2025 17:00:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH 0/3] ALSA: usb: fcp: Fix sparse warnings
Date: Tue, 21 Jan 2025 18:00:28 +0100
Message-ID: <20250121170032.7236-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8171F1F399
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

We got a few sparse warnings, and this patchset addresses those.

sound/usb/fcp.c:267:17: warning: cast to restricted __le16
sound/usb/fcp.c:267:17: warning: cast from restricted __le32
sound/usb/fcp.c:415:43: warning: cast to restricted __le32
sound/usb/fcp.c:890:22: warning: incorrect type in assignment (different base types)
sound/usb/fcp.c:890:22:    expected restricted __poll_t ( *poll )( ... )
sound/usb/fcp.c:890:22:    got unsigned int ( * )( ... )


Takashi

===

Takashi Iwai (3):
  ALSA: usb: fcp: Fix meter_levels type to __le32
  ALSA: usb: fcp: Fix incorrect resp->opcode retrieval
  ALSA: usb: fcp: Fix return code from poll ops

 sound/usb/fcp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.43.0

