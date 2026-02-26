Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12C410D23
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120660; cv=none; b=R6OHugbmfw8dguPtrRe7izvLHant9F0Yf5f0fJDH5IW1bLtFlpi+iufgaD2x80UF6hWfHIKiJmquUk84oclIfHhlhGSoaiMDKtxTbTlJNtKynlcL2cJ8W5QwCVQBiZ02n6IFFqbA/qfKDP2d3ir9r40LXoG2JWuoHMcWPgzkbxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120660; c=relaxed/simple;
	bh=V6HGHuTtfsnq0Lvnl789oetu+shdHtMbeIMHh8nuLlk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDROUXGriyp62b0/jJE9u8Uwg0p5gbWHI0tLJUy2I+l19rCTDNBv2F5fk8xh9NpQ7SzzMJcqIEKpVdCp2kPW4ztgceGOW+1cgKpile365wKS5NR2uUwe/7S8fs72sY7zA1UX2H5Z0BLdqIO1WIpAVNbB/tRoMjiCuWFrBwDFekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=12OUJqxL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XlVKXdvb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=12OUJqxL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XlVKXdvb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="12OUJqxL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XlVKXdvb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="12OUJqxL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XlVKXdvb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BC7A4D3A3;
	Thu, 26 Feb 2026 15:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXPEgA9bwDKZxxIBUVOkncJf8bCpqVEBs3GzHcEsfRQ=;
	b=12OUJqxLlXzZ8ov4Gn4Lx7BUZgz9ww6S822iFQ71a8Sm9Qo2ux41ORsw/ddX4Q71RkYUNV
	RHfO/f3vqLl/UUQ7/mPFFVmE2hQZol4cYyqwIItkPCO+SePdKCldrLsgEYsISAUzmcLVaC
	sDRbfGr3ZsYSe4LMPRZMxhKikuhh968=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXPEgA9bwDKZxxIBUVOkncJf8bCpqVEBs3GzHcEsfRQ=;
	b=XlVKXdvbQTT+IW0o7JjkqAanM/Xi27D1exbKjkn9j4w7U6JAY6Xd9ZmRwbp5dBcy7tQJ+P
	VoitXW916FKP8bBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXPEgA9bwDKZxxIBUVOkncJf8bCpqVEBs3GzHcEsfRQ=;
	b=12OUJqxLlXzZ8ov4Gn4Lx7BUZgz9ww6S822iFQ71a8Sm9Qo2ux41ORsw/ddX4Q71RkYUNV
	RHfO/f3vqLl/UUQ7/mPFFVmE2hQZol4cYyqwIItkPCO+SePdKCldrLsgEYsISAUzmcLVaC
	sDRbfGr3ZsYSe4LMPRZMxhKikuhh968=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXPEgA9bwDKZxxIBUVOkncJf8bCpqVEBs3GzHcEsfRQ=;
	b=XlVKXdvbQTT+IW0o7JjkqAanM/Xi27D1exbKjkn9j4w7U6JAY6Xd9ZmRwbp5dBcy7tQJ+P
	VoitXW916FKP8bBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E24413EA6A;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uHINNlFqoGnMawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:44:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: usb: qcom: Correct parameter comment for uaudio_transfer_buffer_setup()
Date: Thu, 26 Feb 2026 16:43:49 +0100
Message-ID: <20260226154414.1081568-4-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226154414.1081568-1-tiwai@suse.de>
References: <20260226154414.1081568-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

At fixing the memory leak of xfer buffer, we forgot to update the
corresponding comment, too.  This resulted in a kernel-doc warning
with W=1.  Let's correct it.

Fixes: 5c7ef5001292 ("ALSA: qc_audio_offload: avoid leaking xfer_buf allocation")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 01e6063c2207..510b68cced33 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1007,7 +1007,7 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 /**
  * uaudio_transfer_buffer_setup() - fetch and populate xfer buffer params
  * @subs: usb substream
- * @xfer_buf: xfer buf to be allocated
+ * @xfer_buf_cpu: xfer buf to be allocated
  * @xfer_buf_len: size of allocation
  * @mem_info: QMI response info
  *
-- 
2.53.0

