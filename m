Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07335839C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611219; cv=none; b=L0naZfmOW4mP1fiDGIW+qYm2WRnhZcORsQXVn5f5vkN68K+1xMtuhNi/trA+hwJ/XIPGTJ0hBaHDEVUcdUqhHSsh0lky6qIhuvugEX9L0wqo4QrAg5I+uuwXEnAjqVxjmsSpQBe+E6jrSiBb6RUl0FRN7c7ME4zR/iJEU+6wbXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611219; c=relaxed/simple;
	bh=HH9JPjaFRAr3KBhGa0H6r+GX+b3MzuOzpIOrxXm3hTE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UL7/TJihN1KwaObeXu+oHbV0dzjNAvZMwhUAQsBLkykVa8HFDPSlS4pCz5QmVk/DAJ5+MKkBt9wuR0hoLXjFlIw+O5D5XqezuCHBSo0DLtYcaNOjmo6SJW7aDPYChUNfilyWPUqfj0a8hBqTsR3xzL18wPshah+b/Z6CEx5Uaxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XILN/B+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DdLdYwod; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XILN/B+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DdLdYwod; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XILN/B+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DdLdYwod";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XILN/B+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DdLdYwod"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A4394D338;
	Fri, 27 Mar 2026 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6D7ZG7jInPytPdN0QgNfh3x3Q742sOKQk5nGKbKHXas=;
	b=XILN/B+y3RY1XpGl2TInj6tWF65rFrf6H1T/4hT7OPZT40T9HpgByMZR4nMgfRiHcpR87k
	6US1Kxp3Mmds4FOfSuRGvuavm89IWy9yTC0pLjOs76FDgNVQxoCf0cbRBg4+WjZcboUiII
	9PY7z1P033t+XoFZGWRHwyEM0fGY1jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6D7ZG7jInPytPdN0QgNfh3x3Q742sOKQk5nGKbKHXas=;
	b=DdLdYwod5d1Q75ctXo+Mld8jXBVarrECFZwOZQ74kgWq4v+gEWlFTFwgLA3rzW2LEpsvzV
	k4u59ecEgOSnzbBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="XILN/B+y";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DdLdYwod
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6D7ZG7jInPytPdN0QgNfh3x3Q742sOKQk5nGKbKHXas=;
	b=XILN/B+y3RY1XpGl2TInj6tWF65rFrf6H1T/4hT7OPZT40T9HpgByMZR4nMgfRiHcpR87k
	6US1Kxp3Mmds4FOfSuRGvuavm89IWy9yTC0pLjOs76FDgNVQxoCf0cbRBg4+WjZcboUiII
	9PY7z1P033t+XoFZGWRHwyEM0fGY1jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6D7ZG7jInPytPdN0QgNfh3x3Q742sOKQk5nGKbKHXas=;
	b=DdLdYwod5d1Q75ctXo+Mld8jXBVarrECFZwOZQ74kgWq4v+gEWlFTFwgLA3rzW2LEpsvzV
	k4u59ecEgOSnzbBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04CB94A0A2;
	Fri, 27 Mar 2026 11:33:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5Bc2Ow5rxmmEHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 11:33:34 +0000
Date: Fri, 27 Mar 2026 12:33:34 +0100
Message-ID: <87tsu1qzg1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James <james@jaytek.org>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable rear line-out pins on MSI EC79 (ALCS1200A)
In-Reply-To: <d7c39804-c019-4622-b387-c1b771c38204@app.fastmail.com>
References: <20260315101950.130380-1-james@jaytek.org>
	<87ikav7lcy.wl-tiwai@suse.de>
	<92a9a89d-e445-4816-bfa5-8127f2e535db@app.fastmail.com>
	<877brag74k.wl-tiwai@suse.de>
	<87se9yen18.wl-tiwai@suse.de>
	<d7c39804-c019-4622-b387-c1b771c38204@app.fastmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 3A4394D338
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 18 Mar 2026 23:12:28 +0100,
James wrote:
> 
> 
> Hello,
> Attached is a clean state dump with my modifications removed. I think the
> previous alsa-info dump was misleading as some kernel modifications were still
> left over from my testing and causing the wrong module to load, but I now have
> a clean install of the kernel and have disabled my userspace patch.

Thanks, this looks better.

And, could you elaborate what exactly doesn't work with the unpatched
kernel?  It looks like that the driver probes fine and recognizes NIDs
0x14, 0x15 and 0x16 properly.  Isn't it just a matter of your mixer
setup?


Takashi
