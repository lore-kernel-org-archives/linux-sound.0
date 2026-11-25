Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589441;
	b=BDpBVKT+30IsXkf1ST5kDAvRsMfEfcvH+cjT6Ojw9XKkQEFjxFIhVo2Fqiy/8L27oALy
	 SFI41f1CfNYGnKPiwanGGmA5gSPjCfS/vc+79XE5OT9Is+VBHIBfSsrpONFSYUtASFCxD
	 SI0S7Cz5lTSzAn5FtGqeUvdeb5s6vxbAvv3shpcEB8l/kVZdCX+j2ClAnDAJcuW+E6wvJ
	 xfGw0YFu6YdY9CvjKHvgrggp05no2TJPo7dbvX1Iiiq0nSDRJetjVbLc8ABrrCveqZHhC
	 eFM4MmQ3vkk+KD/+zVy/uDv+2MnnEUHzoUrXg/7DCahxbEc3MhY3V7D+tJ4TF3wZ2/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589441;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=K3pJ45YvqmWCPW0D2ukbrpWd1zw6YPH24uAhcjZU/fs=;
	b=UVRy1tfaWeXSUI0+ma4mYZ6TQdTrsGaXbFJApJhInEP0GDUsjW3bY5W2iw6w/iTqZos7
	 8kohmDpLGKn8MAcHd4tGlgaiSihD8wtLhOxUCSiPlbFCwnyr7C2DZ1ZzVH9UESnA7D4ra
	 bROhivSv/6SXAAC4+lufhUvuS1bOy32vstiMXFnnXRsYNVAiaZONSvIG91H0wOgHlI03n
	 rLeJyVDtOqRCaSeNRSBvD3TTggIYXXU/RiHTvPTASY3WSHwfsF8t72kDgsloAQ9ZzE6wF
	 ImZMVq2ciZ75hs0EhEV9HOgx+Bh2SJDpbFRQBeyNpBtaIRR4GEU6jvS5vdztZyr0G2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1wf+2pkD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AWew0NNW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A4dk89Ft;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qIEdKEpO;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ADB606A33F
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 06:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38ADB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1wf+2pkD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AWew0NNW;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A4dk89Ft;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qIEdKEpO
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 693F922306;
	Wed, 25 Nov 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3pJ45YvqmWCPW0D2ukbrpWd1zw6YPH24uAhcjZU/fs=;
	b=1wf+2pkDT+Yk1uW5usudDkk8+17XakFnx6B+q3WvSLzML/sU15vJskmw0iZtqUHSmmbsy4
	P10ONYsaUcktzp2NiLP9JHzh8AS73P6Bp7jAnL2pWuFeNm4Q+o+kxyuqF8rbvqtXv2vRDe
	YKk2zVSGSBTlgyl2isIMzyN6pqp+cTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3pJ45YvqmWCPW0D2ukbrpWd1zw6YPH24uAhcjZU/fs=;
	b=AWew0NNWoj1F8uGlq8cx6Pavev8DdFk+bb88cOAyHtWJCu101kYCbJyRxrPa6+SqP5p0JF
	HqG8Qrn8NCNuDACw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A4dk89Ft;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qIEdKEpO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3pJ45YvqmWCPW0D2ukbrpWd1zw6YPH24uAhcjZU/fs=;
	b=A4dk89FtoTFP6l8f5scNcNYq5xX7J8f67od9bwF+vcjLUA5l1URmmaq2trreECbSA6yyLF
	AhM03t2iOxeAS07RUcWAj38mdfC9Tav4Oy11siCL/rvypd3SYJVyFKp0f8hg2P2wicM3kN
	9Dl4ARa2kvLyvHhbxguY3sZ17N8WtWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3pJ45YvqmWCPW0D2ukbrpWd1zw6YPH24uAhcjZU/fs=;
	b=qIEdKEpOy6Fq3EqgyY+TgFjOkiX4Kv8IhyIXi0c5BwsvuBjgDJbBMYKDtjrGyWFZb1iE0G
	CgqZWBJAPaFb9vCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E12F013505;
	Wed, 25 Nov 2026 06:50:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c5yuGjyFBmvpBQAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 06:50:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: pcm: Prevent PCM hw_params & co during mmap on OSS, too
Date: Wed, 25 Nov 2026 07:50:32 +0100
Message-ID: <20261125065034.1470697-3-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125065034.1470697-1-tiwai@suse.de>
References: <20261125065034.1470697-1-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 693F922306
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

In the OSS emulation mode, we allowed the PCM hw_params, hw_refine and
hw_free even when the buffer is mmapped as an exception.  This is
supposed to be a workaround for some old applications, but this
exception is rather harmful as the mmapped pages can be invalidated by
the concurrent hw_free and hw_params.

As the need of OSS emulation with mmap must be very very low (almost
negligible) now, let's remove the exception and prohibits the PCM
parameter changes during the mmap just like the normal ALSA
applications, too.

Link: https://lore.kernel.org/20261118131945.27592-1-Dmitry.Chumachenko@cyberprotect.ru
Cc: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 9e4a82d4ee82..01abf09ec017 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -784,7 +784,7 @@ static int hw_params_state_check(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
-		if (check_mmap && !is_oss_stream(substream) &&
+		if (check_mmap &&
 		    atomic_read(&substream->mmap_count))
 			return -EBADFD;
 		return 0;
-- 
2.53.0

