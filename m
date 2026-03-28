Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CE3921E0
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774705410; cv=none; b=dvN2Z8+qiKz+5Qr1jLV+xQMF4UaOySavIXG0XVm09nmoyoZkduBX8Y/1ShnnhgGJByXQJGsOyX7JyGrBjdJIcpO/TJUdXV+dhKbITcR0x3ZIbiAMYXkq1/pxXuaUZrwSqkte349KGP7IpT3nHkWgMbWHVId+Lt0UgDxNsVUo0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774705410; c=relaxed/simple;
	bh=LkIaLrMfLfMol8B9hSQwoIygTrlJjKFcCATuaZNAybU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFFehzORSoMrvJDa2sx6QcFOY+GIyfNNtqIWkf/07KJggbxJ1Ywueth137xGMfmEE/a61SOZD9VNFSQRcHIGOzse4nhNnRnDTTe5wxNZdWop/43wEcwzR5T/3OG+bx0xxy688qHyrzEHg/9y/mHLThZbua1OGDzT3cfp1L5jkzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JNOkwk00; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9/kO6RNe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=awJoIUoz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M55h8Y9X; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JNOkwk00";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9/kO6RNe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="awJoIUoz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M55h8Y9X"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E88864D2AE;
	Sat, 28 Mar 2026 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774705405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f4o99poOLyJiEXZV9B6/Fd4jl5GB3cuhX6ZAMkvE7jQ=;
	b=JNOkwk00STxNp7NrDmaCUYNnXFFBn9O/jtvBWrGnlxmlv5XeiN0jBVlDQWpdgpTyzEURdL
	uYMWMH5unesL/FsT+HMO9EdJGlgZOk7oTzXAObwKyNV44U/MEtP/spVxbI+EmUa8RryJWV
	8V/RPdM9vZotCf9wGeSGFjlDZBWJrZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774705405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f4o99poOLyJiEXZV9B6/Fd4jl5GB3cuhX6ZAMkvE7jQ=;
	b=9/kO6RNe2ziPUVuxCPnMYC9d6oDZkTgHzb+vaemcS0IiNNTAronJ/iAwrQREHPiJFSc0Vj
	tnkTI7Z725DB+SBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774705404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f4o99poOLyJiEXZV9B6/Fd4jl5GB3cuhX6ZAMkvE7jQ=;
	b=awJoIUozWgDYmCb8sET3qosxxU4kxg8WfinBVJQIkGt4WrCN8HKpJ6N4/eEvSassnkv3ag
	YtEKwufMD1j5GD24hFAqKeG0ftVz0AtFYDnipuF9vEUYyB1ff3NuOJ4YDhaE6E2DhNMqnz
	VACUWTx1+RVZ7+x3o0/uIQGWWUApRFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774705404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f4o99poOLyJiEXZV9B6/Fd4jl5GB3cuhX6ZAMkvE7jQ=;
	b=M55h8Y9XSItVAoGuUfyQREm+qcyI6p70XK6fYvfqCzGnN8R/FBZ6PaU9daKLchG9TBx5m5
	zNfwN0Sx9DjWDtDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C85064A0A3;
	Sat, 28 Mar 2026 13:43:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ot6pL/zax2luJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 13:43:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: =?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH] ALSA: hda: Add missing SET_GPI_* and SET_GPO_* verb definitions
Date: Sat, 28 Mar 2026 14:43:05 +0100
Message-ID: <20260328134319.207482-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.957];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spam-Level: 

We've added the definitions of the missing GPI and GPO verbs for
reading in the previous commit, but the counter-part for setting
values is missing.

Add the definitions of missing verbs for comprehensiveness.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_verbs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sound/hda_verbs.h b/include/sound/hda_verbs.h
index 127e7016e4fe..6066954409aa 100644
--- a/include/sound/hda_verbs.h
+++ b/include/sound/hda_verbs.h
@@ -104,6 +104,11 @@ enum {
 #define AC_VERB_SET_DIGI_CONVERT_2		0x70e
 #define AC_VERB_SET_DIGI_CONVERT_3		0x73e
 #define AC_VERB_SET_VOLUME_KNOB_CONTROL		0x70f
+#define AC_VERB_SET_GPI_DATA			0x710
+#define AC_VERB_SET_GPI_WAKE_MASK		0x711
+#define AC_VERB_SET_SPI_UNSOLICITED_RSP_MASK	0x712
+#define AC_VERB_SET_GPI_STICKY_MASK		0x713
+#define AC_VERB_SET_GPO_DATA			0x714
 #define AC_VERB_SET_GPIO_DATA			0x715
 #define AC_VERB_SET_GPIO_MASK			0x716
 #define AC_VERB_SET_GPIO_DIRECTION		0x717
-- 
2.53.0

