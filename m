Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066952D5A0D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142168; cv=none; b=QvNNB+Z6j7ToQIm2bc6G3C/0sYTH/YsmPyjsV/r1uwfG1q9n+tXBVNYxPrk30LGL7O1N/M4jS5gaR6VA8Xk5Y+O2yqBbbq/USWENmzkhWJTxUaNAr4fiRpS9gUzfPqZZ39GJmzpgE/CWx7ZKBuuwa8eom77lyVoj2c4+hiJc00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142168; c=relaxed/simple;
	bh=lVDR33WsSZN/qC1CjUG3MsFdF+szI7VWk1s/G0ZZdHg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aATzJ6I3S1ypAj6y0/zz77aera8bldUR9BUHXzj6IZqC+I0biSWOfXMqcySCyJ2vtlq2azyCB0gYYzS9YAgbdvcO2VmyrAKVQReCw8NWOd4D5OlXEltl8MSTKh3lqSRdujNOX4j9Z7V2WStcH7aYFGru7I7myggwAow/WHDTVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CAn4Eo4u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=INT4T4F5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CAn4Eo4u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=INT4T4F5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CAn4Eo4u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="INT4T4F5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CAn4Eo4u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="INT4T4F5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC2932118E;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUcJTxyzc2n/3iqPwNYgnQA8EeAkIbekinIrgMVC5nE=;
	b=CAn4Eo4uMpbmM0jOEZh+LMI5hjjybudLsJQxsujRcVowDF3VZ356PnYZNZvPKg2OiswuAg
	Rh++lWRz+dYu1N5w8oOgrNphG7ooF5i6wtohvLGzwebo3TTy96OXbeUOeYgMkMsXrUoRjc
	U7FrHWsIPGRAmFVOcOV2YmVdxGfov+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUcJTxyzc2n/3iqPwNYgnQA8EeAkIbekinIrgMVC5nE=;
	b=INT4T4F5fTnvtMoMY/rR2+GVnoKn/UBz9oqnS93nkmZZYh1psehp56cbRikqgx4Ulbnhva
	hoZXGBADlSMLBOAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CAn4Eo4u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=INT4T4F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUcJTxyzc2n/3iqPwNYgnQA8EeAkIbekinIrgMVC5nE=;
	b=CAn4Eo4uMpbmM0jOEZh+LMI5hjjybudLsJQxsujRcVowDF3VZ356PnYZNZvPKg2OiswuAg
	Rh++lWRz+dYu1N5w8oOgrNphG7ooF5i6wtohvLGzwebo3TTy96OXbeUOeYgMkMsXrUoRjc
	U7FrHWsIPGRAmFVOcOV2YmVdxGfov+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUcJTxyzc2n/3iqPwNYgnQA8EeAkIbekinIrgMVC5nE=;
	b=INT4T4F5fTnvtMoMY/rR2+GVnoKn/UBz9oqnS93nkmZZYh1psehp56cbRikqgx4Ulbnhva
	hoZXGBADlSMLBOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0C2213A70;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CGvNLeuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 023/103] ALSA: adlib: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:05 +0200
Message-ID: <20250710100727.22653-24-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: DC2932118E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/adlib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/adlib.c b/sound/isa/adlib.c
index f079ba4ef1a0..03fb2bce9255 100644
--- a/sound/isa/adlib.c
+++ b/sound/isa/adlib.c
@@ -61,8 +61,8 @@ static int snd_adlib_probe(struct device *dev, unsigned int n)
 		return -EBUSY;
 	}
 
-	strcpy(card->driver, DEV_NAME);
-	strcpy(card->shortname, CRD_NAME);
+	strscpy(card->driver, DEV_NAME);
+	strscpy(card->shortname, CRD_NAME);
 	sprintf(card->longname, CRD_NAME " at %#lx", port[n]);
 
 	error = snd_opl3_create(card, port[n], port[n] + 2, OPL3_HW_AUTO, 1, &opl3);
-- 
2.50.0

