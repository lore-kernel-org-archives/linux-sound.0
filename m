Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB4330D4C
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=o3uyOd9vuRau+a2sowL4pwKLFYhwmB0hVgo7mZnzlZsXv3x1ospgkkQrjSo1XyJDC4vKPSm7T1LLKo/V6kOfZUNvTx7ENmx5NPnZd4zUeeXoXkBBJw7yaZ9EJw+vwLGpkyN1UFIw2JQX6xixXWeWUvWnxfHB9pCtIKyEblsnOYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=tyLwDqRhNxPEqNk8u1d0v1q+FvvmNqz8Ni97nlx2/rM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJc35J83AYOzCdimHA6UnwqBAXNA8EjH4/oCB+LlJE8hO1nJerBc76AhiTFmCVRkmi3iy5WvGTosJsg2gX43nRR0Fbe4uDIYzsLTOtVjJ8sqSaeh/WehSsSCBe6L3I6pCg0hsA3yiGkYiWGU+iXGviq8KeFm2d08LXFDV0xWu3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RE3HPUv3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CyecAvBn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fC7BuuoY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+oniP6o8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RE3HPUv3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CyecAvBn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fC7BuuoY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+oniP6o8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3A9A23E44;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFC4xEmR7s9I/XdwHOjqJIFKCvA/1G6ceKaiRsSMRDI=;
	b=RE3HPUv3Ucg8WePvWbVA2+4pOg7+Gi9lFVeVJVTUWI+xyVPReeD73whyVz2H8k2HcbtPKy
	f1b1vwyHipk+UXERanJjviA3F0sdUq4+XcpHq48RvOEFFkjTMgjBwz9OzxG09EFC0etvi9
	dp6if0PoZUJqBaMYCMe2D5qjBx/HPF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFC4xEmR7s9I/XdwHOjqJIFKCvA/1G6ceKaiRsSMRDI=;
	b=CyecAvBnH+UsTB07rAq/AFUDihqXdB0W96Uu8YpjIO8puFdXSyP9f257AwWDa7GTbgyaX/
	djCBfiibhgvlJXDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fC7BuuoY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+oniP6o8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFC4xEmR7s9I/XdwHOjqJIFKCvA/1G6ceKaiRsSMRDI=;
	b=fC7BuuoYm0bG3FKwwPWdwdodQ6oBaN5f3easaWLqhjU+gM3Zqp5xbap/Di8xT4Zl1Jv8UE
	jXVOyfIELLIxHnRil2g8vaxFtA1xjSGNb5Z4W5zZD0V9ScvLj911NGy3hEFaTzUMNStn85
	ar5gsJvxSVF9MOIB++Sb4OKTCUiVAHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFC4xEmR7s9I/XdwHOjqJIFKCvA/1G6ceKaiRsSMRDI=;
	b=+oniP6o8sZP1/6jSkJ/Yhzaem4MrGJG1R0jwgucYDZpAYSbIcZ1iarjXd4t2VR4rxUIaKp
	zfIXBAoN6wC1y7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB5C7779C5;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sDSBMFQNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/14] ALSA: asihpi: Drop __force cast
Date: Wed, 12 Aug 2026 08:04:41 +0200
Message-ID: <20260812060557.80445-10-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3A9A23E44
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop a superfluous cast.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 4dbc79899c09..b78e96caef9d 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -280,7 +280,7 @@ static void print_hwparams(struct snd_pcm_substream *substream,
 		snd_pcm_format_width(params_format(p)) / 8);
 }
 
-#define INVALID_FORMAT	(__force snd_pcm_format_t)(-1)
+#define INVALID_FORMAT	-1
 
 static const snd_pcm_format_t hpi_to_alsa_formats[] = {
 	INVALID_FORMAT,		/* INVALID */
-- 
2.55.0

