Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD9FD29E
	for <linux-sound@vger.kernel.org>; Sat,  7 Sep 2024 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698448; cv=none; b=XsCTLrWjVes0BztJyVf8QyHCuWaWyvL5sOwHV00fOIMtpZ8D3DM6jJMH2os4FAC+7dZ5Z49f7Ajp4vKHOPfs9wfmPeu+q6Tl/jna9cCJ19Ttep6BrZYRxKRq8kUOnGydf7s+G6vDMPy0lqWwm/Uetyn7Gvnher9R69xtP/S3POs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698448; c=relaxed/simple;
	bh=5qJWy8dOQCC7oMZEC8T6BBhdt4YJwmpEgF/QnzVMUlM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e/I0bkxTmn9SsMMRx8H/Z0LczPNlWjSmrhtsGOzaw3fyt1D9PhTweqZ4IpNOIkN7RiEAeEMwBeMrDFvBDzNTaGL0ei+VNV4Knnnmb3QtYZjeejjBnE6YvmruDiNuvYTP1//7+p0zC2qc1U0xjKaWXqqxVwjoYq5+Bjo1qXM29vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xRZeQJEC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HevD+KRN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xRZeQJEC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HevD+KRN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xRZeQJEC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HevD+KRN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xRZeQJEC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HevD+KRN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A655821B25;
	Sat,  7 Sep 2024 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725698444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KP4raYFwsDUrgpfYtpBo6eZWGui5FxgXdgvYJafCK50=;
	b=xRZeQJEC8UDPxZ3PLe0MgAAYmwARTz2fS0TJ8daxbyBfCrmnxvAVEIm4JMswUJfbHFfHZP
	V4cE0aZvwL7j1NtsdyB3RKbQjvX5bO7QRqM0eS/z9lFxYHqo/kB2NzOjexsvbrIZPSvlAD
	T9J6IBQNoUKXssq9WXWJCHnR3ZWX14U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725698444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KP4raYFwsDUrgpfYtpBo6eZWGui5FxgXdgvYJafCK50=;
	b=HevD+KRN1h7gsXG0LILXoUH7phdSH2alSJxTYVgUP4wgg0psOunWjYIfh8E3JFbZ1vAIlJ
	mysevXCDPm16LRBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725698444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KP4raYFwsDUrgpfYtpBo6eZWGui5FxgXdgvYJafCK50=;
	b=xRZeQJEC8UDPxZ3PLe0MgAAYmwARTz2fS0TJ8daxbyBfCrmnxvAVEIm4JMswUJfbHFfHZP
	V4cE0aZvwL7j1NtsdyB3RKbQjvX5bO7QRqM0eS/z9lFxYHqo/kB2NzOjexsvbrIZPSvlAD
	T9J6IBQNoUKXssq9WXWJCHnR3ZWX14U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725698444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KP4raYFwsDUrgpfYtpBo6eZWGui5FxgXdgvYJafCK50=;
	b=HevD+KRN1h7gsXG0LILXoUH7phdSH2alSJxTYVgUP4wgg0psOunWjYIfh8E3JFbZ1vAIlJ
	mysevXCDPm16LRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88A5413A88;
	Sat,  7 Sep 2024 08:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HSRSH4wR3GafQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Sep 2024 08:40:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Allow the default preallocation for x86 again
Date: Sat,  7 Sep 2024 10:40:47 +0200
Message-ID: <20240907084129.28802-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Since there are a few corner cases where the S/G buffer allocation
isn't performed (e.g. depending on IOMMU implementations), it'd be
better to allow the default buffer preallocation size for x86, too.

The default for x86 is still kept to 0, as it should work in most
cases.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index e2ac247fc1d4..eb488a522572 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -21,7 +21,7 @@ config SND_HDA_EXT_CORE
        select SND_HDA_CORE
 
 config SND_HDA_PREALLOC_SIZE
-	int "Pre-allocated buffer size for HD-audio driver" if !SND_DMA_SGBUF
+	int "Pre-allocated buffer size for HD-audio driver"
 	range 0 32768
 	default 0 if SND_DMA_SGBUF
 	default 64 if !SND_DMA_SGBUF
@@ -30,7 +30,8 @@ config SND_HDA_PREALLOC_SIZE
 	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
 	  for systems using PulseAudio.  The default 64 is chosen just
 	  for compatibility reasons.
-	  On x86 systems, the default is zero as we need no preallocation.
+	  On x86 systems, the default is zero as S/G allocation works
+	  and no preallocation is needed in most cases.
 
 	  Note that the pre-allocation size can be changed dynamically
 	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
-- 
2.43.0

