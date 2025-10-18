Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2927462
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 16:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760805430; cv=none; b=ZZnPHQ+xOhQS1IDWIuz1jBSURN4MrotEyr/yyzl0aAxozwR5c+sKFc2HvAe0zPyeZDMmzDoGaM8OH4R17DwC1Lf5eSHHKfP1Wc+K6JNdhRrYY94BSPapHSQCep32dLjLojwRrwtWyIhArXP/ZeZrI68iUoS3pirhSy4rANy4XDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760805430; c=relaxed/simple;
	bh=33s02uYd0ogEuFRKMaAgtamqKImEn6KHK/v2KPF7dWw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fO2fH4KBRNiuyw47p8PIPCLa5Pxvz3+UDJojt2TZRG4fOSYbB7qkHB48dI5tdEX7LShKAZsbn/VStbxFrHdNs8VslKV9ba7eEOTqVot4HssqQEWdN+dGzpOnzXAgP3coFOc3viOBTctqSo+3Pt7cH3GNuahM/2J/hVgKrUa8YGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FaSVvtf3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L5RKqH9q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FaSVvtf3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L5RKqH9q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FaSVvtf3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L5RKqH9q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FaSVvtf3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L5RKqH9q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ACED5200B4;
	Sat, 18 Oct 2025 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760805420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDmt84Eoz1CRvvKaZLMPFedydi9fYxkIpcXd1l9RJ2U=;
	b=FaSVvtf3ozp9rILR6FbV61JpD4j2j3NJ8lJJlAZcvc/bjoTPR6zWt9yRelU+EjyqnJa6se
	PIsKIiZXxyIidwJdlCBOvluALkVUrvf9JpfpVySfmLvwLCmNxBUQ6KD+oOWlMOCGyKQc89
	/iQEYlB2oDDwS7pzEW7sMIESppRvhAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760805420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDmt84Eoz1CRvvKaZLMPFedydi9fYxkIpcXd1l9RJ2U=;
	b=L5RKqH9qVnCsimTXVH3oR5onRBeLSLrAGH2ZPn2QkR0OYY21j2OIN3HPXHEI+ooppz6xWl
	Ywdqc4dA69x6Z9BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FaSVvtf3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L5RKqH9q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760805420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDmt84Eoz1CRvvKaZLMPFedydi9fYxkIpcXd1l9RJ2U=;
	b=FaSVvtf3ozp9rILR6FbV61JpD4j2j3NJ8lJJlAZcvc/bjoTPR6zWt9yRelU+EjyqnJa6se
	PIsKIiZXxyIidwJdlCBOvluALkVUrvf9JpfpVySfmLvwLCmNxBUQ6KD+oOWlMOCGyKQc89
	/iQEYlB2oDDwS7pzEW7sMIESppRvhAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760805420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDmt84Eoz1CRvvKaZLMPFedydi9fYxkIpcXd1l9RJ2U=;
	b=L5RKqH9qVnCsimTXVH3oR5onRBeLSLrAGH2ZPn2QkR0OYY21j2OIN3HPXHEI+ooppz6xWl
	Ywdqc4dA69x6Z9BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AE2B1386E;
	Sat, 18 Oct 2025 16:37:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ukqxHCzC82i3BwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Oct 2025 16:37:00 +0000
Date: Sat, 18 Oct 2025 18:37:00 +0200
Message-ID: <87o6q4415f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: J-Donald Tournier <jdtournier@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	J-Donald Tournier <jdournier@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
In-Reply-To: <20251018145322.39119-1-jdournier@gmail.com>
References: <87qzv0478v.wl-tiwai@suse.de>
	<20251018145322.39119-1-jdournier@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: ACED5200B4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Sat, 18 Oct 2025 16:52:26 +0200,
J-Donald Tournier wrote:
> 
> This laptop requires the same quirk as Lenovo Yoga9 14IAP7 for
> fixing the bass speaker problems.
> 
> Use HDA_CODEC_QUIRK to match on the codec SSID to avoid conflict with
> the Lenovo Legion Slim 7 16IRH8, which has the same PCI SSID.
> 
> Signed-off-by: J-Donald Tournier <jdournier@gmail.com>

Thanks, applied.


Takashi
