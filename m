Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D724DCF8
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684494; cv=none; b=A7AY/RVaQGFzhv3kKA2oAn4qc8CXlGCMq9gQB3xS7lkyX+Hm12kV8XNDUJVWKHs2eE57Cc2Z0R3MoBdennNtJpL4srnsJsyT82ivbxiXJ2WQ/BOZqIhPOTBhi+PYVjMrRdxIdtA1UyKI8yu7DABcJBgftKEXT9bCREKYErckvxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684494; c=relaxed/simple;
	bh=drVQv1oTlSkF6KF5aFYxF0mrzTUHG/AjeZonFRxswRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ebu5gQJlSJMe9tXGtwhNS6ejIbBE/Q+c7tHm2SRRgmVbKQLlWFJUXOe4ZiHxEV5nBszXbp6H48/dIs7/ikLWBx/SzjEcrVd+k+qFINLOnGWPwTWSr41se3ASph9K9viGacJsI/NUMpZD3dG7vrNYJmgW7pQOqte+u5L87d14ho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1kYYNjuP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=usmxox0z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1kYYNjuP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=usmxox0z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1kYYNjuP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="usmxox0z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1kYYNjuP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="usmxox0z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 019741F385;
	Mon, 23 Jun 2025 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ndz7V16INPCy/aZXx6lnI2oCoHBqW2XkyzOMlgHUXU=;
	b=1kYYNjuPWYmil+6p9bCY5qVQJRbfu8BbgZK7/H6NdXoxBXLJcw10+P0Tu7iX/NZZ1BJERT
	KYDxDfuZ4rUdBOtRA1IHFBqL2rwa1C+r9M7PXmklcoBwkFStB11vqJtL8ZWfyn+V4RQTB3
	BOcjT4Zip7SWGM+D6Bk2h50588MlFVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ndz7V16INPCy/aZXx6lnI2oCoHBqW2XkyzOMlgHUXU=;
	b=usmxox0zEBZIBLCUhMEitIic536ZpcSJTPMeSFaFZzAN1U3OgyvzSO0KJ684yZPt2224La
	2e775X8qs1JAONCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1kYYNjuP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=usmxox0z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ndz7V16INPCy/aZXx6lnI2oCoHBqW2XkyzOMlgHUXU=;
	b=1kYYNjuPWYmil+6p9bCY5qVQJRbfu8BbgZK7/H6NdXoxBXLJcw10+P0Tu7iX/NZZ1BJERT
	KYDxDfuZ4rUdBOtRA1IHFBqL2rwa1C+r9M7PXmklcoBwkFStB11vqJtL8ZWfyn+V4RQTB3
	BOcjT4Zip7SWGM+D6Bk2h50588MlFVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ndz7V16INPCy/aZXx6lnI2oCoHBqW2XkyzOMlgHUXU=;
	b=usmxox0zEBZIBLCUhMEitIic536ZpcSJTPMeSFaFZzAN1U3OgyvzSO0KJ684yZPt2224La
	2e775X8qs1JAONCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D511E13AC4;
	Mon, 23 Jun 2025 13:14:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4GWqMklTWWhzTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 13:14:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH 1/3] ALSA: hda: Disable jack polling at shutdown
Date: Mon, 23 Jun 2025 15:14:30 +0200
Message-ID: <20250623131437.10670-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623131437.10670-1-tiwai@suse.de>
References: <20250623131437.10670-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,cixtech.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 019741F385
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Although the jack polling is canceled at shutdown in
snd_hda_codec_shutdown(), it might be still re-triggered when the work
is being processed at cancel_delayed_work_sync() call.  This may
result in the unexpected hardware access that should have been already
disabled.

For assuring to stop the jack polling, clear codec->jackpoll_interval
at shutdown.

Reported-by: Joakim Zhang <joakim.zhang@cixtech.com>
Closes: https://lore.kernel.org/20250619020844.2974160-4-joakim.zhang@cixtech.com
Tested-by: Joakim Zhang <joakim.zhang@cixtech.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index c018beeecd3d..4eba3970cd1a 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3020,6 +3020,7 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
 	if (!codec->core.registered)
 		return;
 
+	codec->jackpoll_interval = 0; /* don't poll any longer */
 	cancel_delayed_work_sync(&codec->jackpoll_work);
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
 		snd_pcm_suspend_all(cpcm->pcm);
-- 
2.50.0

