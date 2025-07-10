Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B852D59E2
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142061; cv=none; b=Hpo10nN+5yt8YLHW98Y8nHPVH2pzBLMpW2wvtb70q4wTlqtlhQiHOO/dGwZHhYK96BQicEJz6CVqcUFaB5FkwdeJ55VkcrZXWRQpswA5oemwtvyl1XcyN743YpWXdHjMBociTZMkWUpmmXsn215cmOvnfdP6+NEu8uSnHvSiSxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142061; c=relaxed/simple;
	bh=997zphglEL6gVAQ3Wjw2KD2dtmty7U8ggaMyBdfDAbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7SuiEpc+qr5ELVAxWB7YI4NGgApBCn7d5a98Yr5K8Ci6sUDzFZX9AXXxv4tRkAaIskTMW8MmE/oyUVOC80GoKfKvYBFZY9808EM8ZVtsVnUoOs3vnTSD9+cRkuNyLwxR2gl2YpVtnT9qH+fHlMNXMtFy/L/R8nLAHpvuRXnvDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cL31dMD6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Azry5N1W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cL31dMD6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Azry5N1W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cL31dMD6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Azry5N1W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cL31dMD6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Azry5N1W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5A651F38E;
	Thu, 10 Jul 2025 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtVzxFTbXIYrt9VvZRZzflr4PE5RraeOFC+h2rW3C04=;
	b=cL31dMD6e293CSZnF6HAjsAQut8V0qVQls5+GEDHZ7DoiEnMc7lVZm33MzzHI7dgmBd2w4
	pRE5SyMbkunsQ+H6jTXNBgaE9UpKeBvWY5fEdmg0l3YZz2PAtaMh2ojsv5bz40oiZjAkXB
	H+jtLYdBXHy6HeL6eLMvI8K/lc+nEzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtVzxFTbXIYrt9VvZRZzflr4PE5RraeOFC+h2rW3C04=;
	b=Azry5N1WpIGB9mAKSDNEr57fvmN7xy20eHGVAzXBOKwM0nHX2MVb3B4zv330rT3CjPDnC2
	UATkrbHFMl3yYlCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtVzxFTbXIYrt9VvZRZzflr4PE5RraeOFC+h2rW3C04=;
	b=cL31dMD6e293CSZnF6HAjsAQut8V0qVQls5+GEDHZ7DoiEnMc7lVZm33MzzHI7dgmBd2w4
	pRE5SyMbkunsQ+H6jTXNBgaE9UpKeBvWY5fEdmg0l3YZz2PAtaMh2ojsv5bz40oiZjAkXB
	H+jtLYdBXHy6HeL6eLMvI8K/lc+nEzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtVzxFTbXIYrt9VvZRZzflr4PE5RraeOFC+h2rW3C04=;
	b=Azry5N1WpIGB9mAKSDNEr57fvmN7xy20eHGVAzXBOKwM0nHX2MVb3B4zv330rT3CjPDnC2
	UATkrbHFMl3yYlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B177A13A70;
	Thu, 10 Jul 2025 10:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aI4bKuiQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 001/103] ALSA: control: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:43 +0200
Message-ID: <20250710100727.22653-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 11f660fc6f2b..9c3fd5113a61 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1435,7 +1435,7 @@ static int snd_ctl_elem_user_enum_info(struct snd_kcontrol *kcontrol,
 	names = ue->priv_data;
 	for (; item > 0; --item)
 		names += strlen(names) + 1;
-	strcpy(uinfo->value.enumerated.name, names);
+	strscpy(uinfo->value.enumerated.name, names);
 
 	return 0;
 }
-- 
2.50.0

