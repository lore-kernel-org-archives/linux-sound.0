Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D92D59E8
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142068; cv=none; b=KFYSQn1Hz/NufQU+7UveJD6ZRMm5fPU8E+E1SUI8r/WFShLdGryn1eyxrt3uRtAMEQnuvwX5vI6+YkG3KrzrFUf0ay43AGUFjkg24gb00GmUlz87aEpypAZEzALWpPHhC4dy0eyzwxFgdko/mpj2UU5sPUJgNue56CIM17ynCx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142068; c=relaxed/simple;
	bh=pw2uFVzTo++ydoaCKagjtwQwaGyJBgwRZAQdczHHC7g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSWn0Fstob6g1WDZ/zRDc5YN+dmJY2liPoDa5d5vv0iyArXpFTJQI9mNrztQ0QCdKuJavBpfcRXgHcL7dl7tdmkZFCkesvGjVeGYmiI1w1g63Cdw2gURwntsP6qntX9i/862I8uY2qC7b1UIeCD6Xvb/yVZfc3N5IbLw22Lt4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZgEpX+Zh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMb5Ngg7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZgEpX+Zh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMb5Ngg7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZgEpX+Zh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMb5Ngg7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZgEpX+Zh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMb5Ngg7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0266E21174;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1+TBZDEJwi2k6mxhSk97jN0noyiNdM9Q6b8rhlZnpE=;
	b=ZgEpX+ZhWIVZcQpOijCquFNXDnrb/iAlNj2p5z88XBd1eICFCpryfMzWZvrndzGjXdmsIp
	b/sJ/vdL07g7ktz1L28mlivCFF5AtYouW9L9kuKg24k73aOgUgYct+quD86P5fAMb0RQNl
	Pf3v9Ex5GCKzsuEpML+rwme+gXDYTko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1+TBZDEJwi2k6mxhSk97jN0noyiNdM9Q6b8rhlZnpE=;
	b=PMb5Ngg75TQzXWQHM2zYOjE52+KNlF+83FLrjrvEltPKCxg+bnDLvPRS/c2VRlPLNxi5BJ
	7/qzuH3RTinphnAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1+TBZDEJwi2k6mxhSk97jN0noyiNdM9Q6b8rhlZnpE=;
	b=ZgEpX+ZhWIVZcQpOijCquFNXDnrb/iAlNj2p5z88XBd1eICFCpryfMzWZvrndzGjXdmsIp
	b/sJ/vdL07g7ktz1L28mlivCFF5AtYouW9L9kuKg24k73aOgUgYct+quD86P5fAMb0RQNl
	Pf3v9Ex5GCKzsuEpML+rwme+gXDYTko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1+TBZDEJwi2k6mxhSk97jN0noyiNdM9Q6b8rhlZnpE=;
	b=PMb5Ngg75TQzXWQHM2zYOjE52+KNlF+83FLrjrvEltPKCxg+bnDLvPRS/c2VRlPLNxi5BJ
	7/qzuH3RTinphnAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCC05136DC;
	Thu, 10 Jul 2025 10:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0OqrNOiQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 002/103] ALSA: rawmidi: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:44 +0200
Message-ID: <20250710100727.22653-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 70a958ac1112..20d36a346cca 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -631,9 +631,9 @@ static int snd_rawmidi_info(struct snd_rawmidi_substream *substream,
 	info->flags = rmidi->info_flags;
 	if (substream->inactive)
 		info->flags |= SNDRV_RAWMIDI_INFO_STREAM_INACTIVE;
-	strcpy(info->id, rmidi->id);
-	strcpy(info->name, rmidi->name);
-	strcpy(info->subname, substream->name);
+	strscpy(info->id, rmidi->id);
+	strscpy(info->name, rmidi->name);
+	strscpy(info->subname, substream->name);
 	info->subdevices_count = substream->pstr->substream_count;
 	info->subdevices_avail = (substream->pstr->substream_count -
 				  substream->pstr->substream_opened);
-- 
2.50.0

