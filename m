Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA7F1A76D4;
	Fri, 20 Dec 2024 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685055; cv=none; b=oHirp2n8l1Fm/YRY9bmNhOwGCwsPy7zvcFmnP6Zz44geAn0LCamjvC0q1bB2mo86h6EeT6Exb4vbW9HaeCWa87VqmGVLtpTn4F5uGc7wwmrnYuBOsh8DkBTDZF5xfzfm48erNTHPJD5LXxl1Y7fp83IjER4D3aG/ndL5q/lallU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685055; c=relaxed/simple;
	bh=kdfctPfr+9NnxI2qkiw5WLhuN/gMGgzu6iEAhP6ubrg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7mpiHYY3b7Uu6ug/TbkdKKW9xICCB1WiwdRa5Qcv0fwO696/08C1ykXhctIRIR1IBUOvYTP1PvcR2NYvFyqnwdU44fFb3tctq5yT6htkWShYy13hK3Uep5bxE59akdWKoFGDXXs4a3qkj57Q1lcF6PuAq9lFNDiTbK2UobJ9kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HklfYHie; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5rQZ6GHl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HklfYHie; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5rQZ6GHl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HklfYHie";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5rQZ6GHl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HklfYHie";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5rQZ6GHl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E1D81F365;
	Fri, 20 Dec 2024 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734685052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4KDolRU+wgdZJroxCP01kjwj0YA/8puhtgdduvkqZhU=;
	b=HklfYHieHMYRssgYXDCKAt53Pt8uVaZv6jSMEUpwRvW5KF4CKW9yeEfgQMdaZIwTobTDVA
	nLMaUJMyuRDxwM8rBlUHwbk+q+Ge+Y3lPAxr81Yjo94+Cxr5DLwyMe4FDo1OyIAFDbatzN
	YfLwp8qzEJr2ftKV9yLnoibcq1Fo9X4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734685052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4KDolRU+wgdZJroxCP01kjwj0YA/8puhtgdduvkqZhU=;
	b=5rQZ6GHltddOrtBp4rSoA4idnxE/VPtlcdh0oeaf5A+J1iBeib/dvVM87t7tz9e6vu75We
	0CkhNROHtidEi/Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HklfYHie;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5rQZ6GHl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734685052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4KDolRU+wgdZJroxCP01kjwj0YA/8puhtgdduvkqZhU=;
	b=HklfYHieHMYRssgYXDCKAt53Pt8uVaZv6jSMEUpwRvW5KF4CKW9yeEfgQMdaZIwTobTDVA
	nLMaUJMyuRDxwM8rBlUHwbk+q+Ge+Y3lPAxr81Yjo94+Cxr5DLwyMe4FDo1OyIAFDbatzN
	YfLwp8qzEJr2ftKV9yLnoibcq1Fo9X4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734685052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4KDolRU+wgdZJroxCP01kjwj0YA/8puhtgdduvkqZhU=;
	b=5rQZ6GHltddOrtBp4rSoA4idnxE/VPtlcdh0oeaf5A+J1iBeib/dvVM87t7tz9e6vu75We
	0CkhNROHtidEi/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B008A13A63;
	Fri, 20 Dec 2024 08:57:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XGJvJ3sxZWfUbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 08:57:31 +0000
Date: Fri, 20 Dec 2024 09:57:31 +0100
Message-ID: <875xneratg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hdsp: Use str_on_off() and str_yes_no() helper functions
In-Reply-To: <20241216123412.64691-2-thorsten.blum@linux.dev>
References: <20241216123412.64691-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5E1D81F365
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 16 Dec 2024 13:34:11 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_on_off() and str_yes_no()
> helper functions.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied now to for-next branch.


Takashi
