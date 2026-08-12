Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF23330D25
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=jSsAJqhTxa8wa+xm1xg9mCH5Y0SYTBBv/HhRjOv58+B0bqgNHB0gVX6qywIqhoAKkxrocM05EIJU7t69aHZcoYt2FpA+a1FHxXtQRYkjGdiI86Ocl/75tij6TGm61qN6f6BF6if/gb4kogIXlRffrm6tlyMFIYhCt8W2EcJjvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=EgsmxQ5ImcGgi6ZKbiNLY0jPmr55uxu7S+kZWE5z05Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVLxE3wxNKOzNeJjQmS3/KXta19fHKj9nzLXi5MUXJODhJWo7xg8YoWBAFGTIFFdr9D28Uy9pUZtjR4QBNz8EltUzP5coDTf/I0EXFqq/eWHZakODtnk+DNaTQ5ATtUiI+apPNJkyoyZCAZbuGXd5p267nXnlmQfOqmP37X7Jgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qr3A9dbM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MUZwWYhY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TWgcZaMC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BlfcmgCt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qr3A9dbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MUZwWYhY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TWgcZaMC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BlfcmgCt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C01E3E42;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSaq5H2XhqswD65mmGtn0FHEELzDnH7MYOYK01/S0TI=;
	b=qr3A9dbMJ/N/Rvww0b+vDsKFHxg/+TZxeXD43fRVWic3dlnWPezyR1AtoDZ2I8gP5ybIgg
	Bg3vkOoeuuUKb9ruKrxEt5M5M+GYEzjBvhGzU7FhVbQ7TswlPzqebNGnMoW+KyNeAAZtff
	u2U2f+mM+f3LX6e6ogzmsO+WXtsBUEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSaq5H2XhqswD65mmGtn0FHEELzDnH7MYOYK01/S0TI=;
	b=MUZwWYhYlLMPlGRZwN6oahez6yyAmScsNyin+AbuA0I51CRpXQUmgkTpWkehlXqX+BCw+j
	NfeNie2VndnhnPAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSaq5H2XhqswD65mmGtn0FHEELzDnH7MYOYK01/S0TI=;
	b=TWgcZaMCqlgw89minmArGeXENXtXEh2wdVnBP3W0xTmTlEBh0Ql0lgT5lZz6maRleOt4kM
	sWqY6P46OZuS4++i1l9r2fLbgYHC2ugprqBMKEppiDghHIpFldKE8sFN8wG/ehB8aIWBCT
	K3WpqsH8aNzetZy2QL/b+tWXYSRd56M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSaq5H2XhqswD65mmGtn0FHEELzDnH7MYOYK01/S0TI=;
	b=BlfcmgCtFFONkb5O1cyXL0FO/5zZKDa1f48KwKFvky1JLQVhimIthy8IYgN0ZZ/4XwZYTu
	9jiXr7rURe7bs+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 446EC779BF;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UL93D1QNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/14] ALSA: kunit: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:38 +0200
Message-ID: <20260812060557.80445-7-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/sound_kunit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index 84e337ecbddd..0376112cc67e 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -17,8 +17,8 @@
 	.name = #fmt,								\
 }
 
-#define WRONG_FORMAT_1 (__force snd_pcm_format_t)((__force int)SNDRV_PCM_FORMAT_LAST + 1)
-#define WRONG_FORMAT_2 (__force snd_pcm_format_t)-1
+#define WRONG_FORMAT_1 (SNDRV_PCM_FORMAT_LAST + 1)
+#define WRONG_FORMAT_2 -1
 
 #define VALID_NAME "ValidName"
 #define NAME_W_SPEC_CHARS "In%v@1id name"
-- 
2.55.0

