Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBE2FC893
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009558; cv=none; b=hDLK/sqhffRwbJq5lFXhnsJ3fmRDeDXm5RtjO5ja0vtUY4AQuIaism0sT9euFEVE2IiQjb1ZCSTX9l4P8EBoKCrkOZYEsHS4GZAvtQfn0/YD6TOw9HqFBTOAhAtINm0Oo4XFTQC5Xe5qI1YhUL/4ALOViIUYE/MjKb2CvPnon6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009558; c=relaxed/simple;
	bh=QJt/VZCrraJBlD6qHb+QmTEm0WXpB0tPqE1kQyeDsGo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTM8PccKqIqqZNSGZ2LV8Vx8OTOOYntqvx0a27Z8O4y13OGKHRICXbo3b9REuZdr5TtcHZCuWxpejUinhT9IR+0LRwnykSJ7kFBOKhVjFmj8q+7CbQEjHni90LnYorWwGPuXgMrleNdS0tP+RginwA6r0BtUBOEr8HyQIo3wOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a9ZTqFKN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MRykXRo2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a9ZTqFKN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MRykXRo2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a9ZTqFKN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MRykXRo2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a9ZTqFKN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MRykXRo2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 57E625BD54;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYzSFY0Vs+j+U0WOhfEw+PE0IXgdF27znukjLHmCQK4=;
	b=a9ZTqFKN+5+zzrerLlrDXOA9WWBGe4J4R/yLlBo6KLQn/a2G4qvHUbP+qcuLeVM4tuvMjl
	lWT2QLyozrUbWmKGJqFEnt6qWZlQkvZBuSAmmNDKs4mkYqNItUTAjTRVeOUTaNd26noDkl
	tMb3hN7OY/dqDgzmrCJ65xBbjea6MC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYzSFY0Vs+j+U0WOhfEw+PE0IXgdF27znukjLHmCQK4=;
	b=MRykXRo2Jjn7Xf4kPzos1h70oMTheat7j/cj1htOIzcNAx0fM1Z3pM//nRc+AIRA98HAnO
	a1zbhHFeOShP37BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYzSFY0Vs+j+U0WOhfEw+PE0IXgdF27znukjLHmCQK4=;
	b=a9ZTqFKN+5+zzrerLlrDXOA9WWBGe4J4R/yLlBo6KLQn/a2G4qvHUbP+qcuLeVM4tuvMjl
	lWT2QLyozrUbWmKGJqFEnt6qWZlQkvZBuSAmmNDKs4mkYqNItUTAjTRVeOUTaNd26noDkl
	tMb3hN7OY/dqDgzmrCJ65xBbjea6MC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYzSFY0Vs+j+U0WOhfEw+PE0IXgdF27znukjLHmCQK4=;
	b=MRykXRo2Jjn7Xf4kPzos1h70oMTheat7j/cj1htOIzcNAx0fM1Z3pM//nRc+AIRA98HAnO
	a1zbhHFeOShP37BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 352AF3EA69;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uKvHC1O4nmlTcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Feb 2026 08:52:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ALSA: usb-audio: Cap the packet size pre-calculations
Date: Wed, 25 Feb 2026 09:52:28 +0100
Message-ID: <20260225085233.316306-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225085233.316306-1-tiwai@suse.de>
References: <20260225085233.316306-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

We calculate the possible packet sizes beforehand for adaptive and
synchronous endpoints, but we didn't take care of the max frame size
for those pre-calculated values.  When a device or a bus limits the
packet size, a high sample rate or a high number of channels may lead
to the packet sizes that are larger than the given limit, which
results in an error from the USB core at submitting URBs.

As a simple workaround, just add the sanity checks of pre-calculated
packet sizes to have the upper boundary of ep->maxframesize.

Fixes: f0bd62b64016 ("ALSA: usb-audio: Improve frames size computation")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221076
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 73bce9712dbd..c887c2f5b25d 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1378,6 +1378,9 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 		return -EINVAL;
 	}
 
+	ep->packsize[0] = min(ep->packsize[0], ep->maxframesize);
+	ep->packsize[1] = min(ep->packsize[1], ep->maxframesize);
+
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
 	ep->freqshift = INT_MIN;
-- 
2.53.0

