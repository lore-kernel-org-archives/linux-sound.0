Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C818E1F
	for <linux-sound@vger.kernel.org>; Mon, 22 Jul 2024 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721635536; cv=none; b=adTTwIGJ495hjinsZmVsTJAF+fW7LziowBhW10t09bsM6JDQTj4ej53bl1+dmFNfD0ohvm9Ct4FSvPeyZWP18pfx0fCw3fom5K9RT3ITbDzFV+3h++XxqQwaBEAeitCJ8eWzZ2Ww+H31MSDJAN5rwFcd3A2+zSg16jfUKghmX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721635536; c=relaxed/simple;
	bh=D+JxusPDTUA8oLrns+/s5WKUNnQsXBFT/+tFzdQ/D6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqWEnT+yE1ND+oK66Tr2tGTGC6+rDEdFq5r0l4dzOV1rg+0KAwOtvNVJwqHo0QPdN1nbfXvk7usOjHwqymGMaEtwXRSMiWJpMVXI5XoI9ECcU2JL+2WZra4v7hETp90kcMBG1hQhIWURnCoarp9w1kG/V7+3qMsrycNSvMqvirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rns60D06; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WHdLnZRg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rns60D06; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WHdLnZRg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rns60D06";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WHdLnZRg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rns60D06";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WHdLnZRg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF7B11FD3C;
	Mon, 22 Jul 2024 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721635532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fxRLRtHWxqrDwdvC2Viyp3tYJwYFL2WVAakA9BS4bqc=;
	b=rns60D06pEgr0IaFIuALMvc72fuhQB48/yLhBNLl3xKh+8BNsAnyXyCaw0IJB2E0j1pLkQ
	8x2mli1kCPW/HiAG0HBh02rV+QTZ7FvZEJQRdmbv4JPYUTSa98uaE5kpuMM0unN3H+3Jrg
	ccT8A22Vp3yQEGQ68Y3j2f5b3f8msmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721635532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fxRLRtHWxqrDwdvC2Viyp3tYJwYFL2WVAakA9BS4bqc=;
	b=WHdLnZRgyT3GL7P8/A0B0/QX5TRTygre5wWhnAevZ5GX1YFgKrQ1lYLE2BGV5u5Vo9qNM5
	ADx7sXiWtOX4zaBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721635532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fxRLRtHWxqrDwdvC2Viyp3tYJwYFL2WVAakA9BS4bqc=;
	b=rns60D06pEgr0IaFIuALMvc72fuhQB48/yLhBNLl3xKh+8BNsAnyXyCaw0IJB2E0j1pLkQ
	8x2mli1kCPW/HiAG0HBh02rV+QTZ7FvZEJQRdmbv4JPYUTSa98uaE5kpuMM0unN3H+3Jrg
	ccT8A22Vp3yQEGQ68Y3j2f5b3f8msmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721635532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fxRLRtHWxqrDwdvC2Viyp3tYJwYFL2WVAakA9BS4bqc=;
	b=WHdLnZRgyT3GL7P8/A0B0/QX5TRTygre5wWhnAevZ5GX1YFgKrQ1lYLE2BGV5u5Vo9qNM5
	ADx7sXiWtOX4zaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F889138A7;
	Mon, 22 Jul 2024 08:05:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X/zbIcwSnmZxVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 08:05:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Move HD Webcam quirk to the right place
Date: Mon, 22 Jul 2024 10:06:04 +0200
Message-ID: <20240722080605.23481-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.60
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

The quirk_flags_table[] is sorted in the USB ID order, while the last
fix was put at a wrong position.  Adjust the entry at the right
position.

Fixes: 74dba2408818 ("ALSA: usb-audio: Fix microphone sound on HD webcam.")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 19c1fc9504c3..f070ecf75ce8 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2167,6 +2167,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x19f7, 0x0035, /* RODE NT-USB+ */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
@@ -2225,8 +2227,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
-	DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.43.0

