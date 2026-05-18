Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEDB3815C6
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080970; cv=none; b=T8olXIn5UFxDoAuKHl8AfcPmVpMGHyEhYgL35JoEkpaIOUw/8aUuN6ThSJLpJg8pVAeUz+fgj2wWhyQlWSl3DyTVssl92UmPSCUdTI8f01BOR8pweuEZglEKvDIgylX1519XdTJsfaYFhpHRwQg4wjdr9JFnK6iRWy658qRBaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080970; c=relaxed/simple;
	bh=Br/20oIpb9EE56nrHFTk46tND2/8PBACVaPw+/MmSqE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GX3oiehiLiJEjhjKkTNusWaN2lR38/PHgcVbq4RgkR2SFzaVwFRwx2oFqsS5YVVFrM2YBK+uLJQd9r6EsTIqdM2Tzm+NBdY+ab/3O3QFNthRlK/yLdX08hQI7qGGm3VGH+Y0my1Rzty0wMaqxdfyQABuIQ3IPQKopT/qSaKWJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a5KJjQCV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JvNKx9OK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a5KJjQCV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JvNKx9OK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a5KJjQCV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JvNKx9OK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a5KJjQCV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JvNKx9OK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27A2D67CB5;
	Mon, 18 May 2026 05:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779080967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/9wpWYTHx8WRZr24PW8eNzvgDzAVlmK+MRDvrcJFUk=;
	b=a5KJjQCVTAsYvaUUCNe5iDgkeW0rLYabrGbZUuK7bY9nt7ucXZ55hFZqxzc7hZL7udrdTJ
	ljGAdKEw8GMEjigx+X5NZkbPmxABgytRN4jBx5htUjzPeQHchIl3ANS/xIERxgCZO6dic3
	CyLt/ICPkp8mFl8l16xRy8Se9mRtTGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779080967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/9wpWYTHx8WRZr24PW8eNzvgDzAVlmK+MRDvrcJFUk=;
	b=JvNKx9OK2ZkpahyGaukBYNnVLH1dud5G+WZ49QCI3k5wCZ4OzRMXm26SwCPkT9Uwob3BDd
	dQbSlVxJkCJrQXAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a5KJjQCV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JvNKx9OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779080967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/9wpWYTHx8WRZr24PW8eNzvgDzAVlmK+MRDvrcJFUk=;
	b=a5KJjQCVTAsYvaUUCNe5iDgkeW0rLYabrGbZUuK7bY9nt7ucXZ55hFZqxzc7hZL7udrdTJ
	ljGAdKEw8GMEjigx+X5NZkbPmxABgytRN4jBx5htUjzPeQHchIl3ANS/xIERxgCZO6dic3
	CyLt/ICPkp8mFl8l16xRy8Se9mRtTGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779080967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/9wpWYTHx8WRZr24PW8eNzvgDzAVlmK+MRDvrcJFUk=;
	b=JvNKx9OK2ZkpahyGaukBYNnVLH1dud5G+WZ49QCI3k5wCZ4OzRMXm26SwCPkT9Uwob3BDd
	dQbSlVxJkCJrQXAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CCE6593A8;
	Mon, 18 May 2026 05:09:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pj2cAgefCmqAYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 May 2026 05:09:27 +0000
Date: Mon, 18 May 2026 07:09:26 +0200
Message-ID: <877bp1e22h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Minxi Hou <houminxi@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Z66 G6 14 laptop
In-Reply-To: <20260518031542.2899188-1-houminxi@gmail.com>
References: <20260518031542.2899188-1-houminxi@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 27A2D67CB5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 18 May 2026 05:15:42 +0200,
Minxi Hou wrote:
> 
> The HP Z66 G6 14 inch laptop uses the ALC236 codec with subsystem ID
> 0x103c:8df7. Without a quirk entry, the PCI SSID falls back to the
> generic 0x103c:0000 fixup, which does not configure the mute/micmute
> LED GPIOs correctly.
> 
> Add the SND_PCI_QUIRK entry for this model using
> ALC236_FIXUP_HP_GPIO_LED, matching the surrounding HP EliteBook G12
> entries (0x8dec-0x8dfe) which share the same ALC236 codec and GPIO LED
> layout.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>

Applied now.  Thanks.


Takashi
