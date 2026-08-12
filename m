Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8E31282F
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514783; cv=none; b=oX7J4ARQ8KHa103Zxaxb4kglFTfvybZ9xNXEV5jUcghawBPLc0VZiEgy595Twm7G7piMqHay2/p+p9pJM/P3MsHDS6ZuQ8Oo1Vx9tN6CzxKtRps+ylUVggXgPUGmmW6Z3lpKS06S3wbUMVVqI+6bCHv+yDjAgKoWyD6YoBLf2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514783; c=relaxed/simple;
	bh=IHyTkcePdHuWiYpNu81tfW7kDkvf166jSC1GUgmmN0U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSVBH9wQs+9+3D1Tj96mMV+0ol9/7FgjJ7xpQj/F4dIl+VZlUwNKWRltJ8VjYmPd/RWBFygjnlX1ikPFwytbtulof+9IoN25eVlSTjwyVM6dLa7XNMZR2V0yDohMr+vsvyrtMdYfbX69pJdqB94aEdV/cwXoLCiqUgpS6WUWg40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DMYTQFik; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UP/lC5OE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F9dylfOu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C6VfhYJ6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DMYTQFik";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UP/lC5OE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F9dylfOu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C6VfhYJ6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23E993E3F;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSHD6eM7cxDkPRi0oc/fu47+846uK2TRWRpH3EPn2a0=;
	b=DMYTQFik+aLnKmh5s82qnk1I7ZepE1x9PAk8Jd8bHEa5b9Io/w2dyqa/D+2N8bP6DZCNmM
	rPYNPAVb/N4lxnM+dP+auk86jV0CdasG0fyyJi0fue7cdudi0HlmXFioM4ZHICTDDRq3w+
	lURMv7/PwxsJXrpVs9h0CMzSvFhPydc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSHD6eM7cxDkPRi0oc/fu47+846uK2TRWRpH3EPn2a0=;
	b=UP/lC5OEDGArExXnjNC39lZ0pRMaY/G7BFHZ6GP6/bO4LlzBsyjYneMjw6gy3wE7I7iTuD
	H4a00TkrpewC/BAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSHD6eM7cxDkPRi0oc/fu47+846uK2TRWRpH3EPn2a0=;
	b=F9dylfOuGV/bKoqjx1RWLZbpFLEr4ihiv+Il3Oi7UeNJiy7lkgJ2V5rG4gnvuticRPycFX
	um4QvDgpUplzw7O3MfTwxAcU0R6yHA2GGVWgd42SGSqKHRjjUQU2vc2yLXjBDumjr4iyA6
	ihGzOZShpRgIUs4ZKO8JZfPyvBO2DP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSHD6eM7cxDkPRi0oc/fu47+846uK2TRWRpH3EPn2a0=;
	b=C6VfhYJ6xdE4NALQs2JlH9ALD41nSkUnTEE5nuugQdPNOQWuOlpYELh3r5MC5IebEqTTU2
	Tqka4Gu42zJ1GICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05F1E779B7;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YFJDAFQNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/14] ALSA: control: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:36 +0200
Message-ID: <20260812060557.80445-5-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Now that the bitwise parameter definitions are gone for control
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_compat.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index f14d9f5e94be..87f7ad5ab739 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -226,8 +226,8 @@ static int copy_ctl_value_from_user(struct snd_card *card,
 	if (type < 0)
 		return type;
 
-	if (type == (__force int)SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    type == (__force int)SNDRV_CTL_ELEM_TYPE_INTEGER) {
+	if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
 		for (i = 0; i < count; i++) {
 			s32 __user *intp = valuep;
 			int val;
@@ -236,7 +236,7 @@ static int copy_ctl_value_from_user(struct snd_card *card,
 			data->value.integer.value[i] = val;
 		}
 	} else {
-		size = get_elem_size((__force snd_ctl_elem_type_t)type, count);
+		size = get_elem_size(type, count);
 		if (size < 0) {
 			dev_err(card->dev, "snd_ioctl32_ctl_elem_value: unknown type %d\n", type);
 			return -EINVAL;
@@ -259,8 +259,8 @@ static int copy_ctl_value_to_user(void __user *userdata,
 	struct snd_ctl_elem_value32 __user *data32 = userdata;
 	int i, size;
 
-	if (type == (__force int)SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    type == (__force int)SNDRV_CTL_ELEM_TYPE_INTEGER) {
+	if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
 		for (i = 0; i < count; i++) {
 			s32 __user *intp = valuep;
 			int val;
@@ -269,7 +269,7 @@ static int copy_ctl_value_to_user(void __user *userdata,
 				return -EFAULT;
 		}
 	} else {
-		size = get_elem_size((__force snd_ctl_elem_type_t)type, count);
+		size = get_elem_size(type, count);
 		if (copy_to_user(valuep, data->value.bytes.data, size))
 			return -EFAULT;
 	}
-- 
2.55.0

