Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DC38758F
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777894136; cv=none; b=JeFsf/3r7eY5hweccQl9kPGDzgCROAfvsQ6CHTWXQDc6PcXXj+x1QC1UJiAKVSuig2cjgS8VgliylmSD2QS/3qX7EdTetHLm886iTPsM3gWwMFabkpziSwVi1S/IaMjm5TzU9F33g9MI1zOatqUci+Lf+nKDaAO+cFIzkZ5mywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777894136; c=relaxed/simple;
	bh=FEp8aY0Tgt5d5vnsNb0PXs+bg9yvsP6/NgJr9I6rKIw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsLNc1e1993+F9T/UoZgx+FL+cuQm9DYtJadG5tA6kXfvEx5XYrMEVp3JclCm+rc38op5ngotzo6otNYtLg6DGVk2BS2xtMwcOxth3aKXC4IakLZmzH4p3nSmtVAjbRTZnS9dKX9LHGPR9DmXPAqZv07TZP16EuJuKF/geHPAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H/Z/SXI1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SDzHP4Ke; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H/Z/SXI1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SDzHP4Ke; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H/Z/SXI1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDzHP4Ke";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H/Z/SXI1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDzHP4Ke"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27C0F5C474;
	Mon,  4 May 2026 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777894133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vbQLzDwH+DqsAaYbsi1zoB13P2WoTpe06sC2vVfwd8A=;
	b=H/Z/SXI1v7JrJY6Beknv0PnKUBddaMJNaXLWbCV6aHlAUBSSIQLcpH1onFK7nB3sfG58fi
	M+IWm3adMe3U2hOq68AmCKHMKOlb7VS+Tv8bwQ0AbDc8WPf/aTm+RpIafdrvWHSEoV1woT
	mCZvOPNAuKxpwTWlbHSnHDrbfPQcNXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777894133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vbQLzDwH+DqsAaYbsi1zoB13P2WoTpe06sC2vVfwd8A=;
	b=SDzHP4Ke8wRoTcLqcKxqlfN0az4JpAmUcRvFppGjhO08w8e8lJmh7NT+5qrghRCinaX02i
	UwWWwivhOPr75lCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="H/Z/SXI1";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SDzHP4Ke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777894133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vbQLzDwH+DqsAaYbsi1zoB13P2WoTpe06sC2vVfwd8A=;
	b=H/Z/SXI1v7JrJY6Beknv0PnKUBddaMJNaXLWbCV6aHlAUBSSIQLcpH1onFK7nB3sfG58fi
	M+IWm3adMe3U2hOq68AmCKHMKOlb7VS+Tv8bwQ0AbDc8WPf/aTm+RpIafdrvWHSEoV1woT
	mCZvOPNAuKxpwTWlbHSnHDrbfPQcNXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777894133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vbQLzDwH+DqsAaYbsi1zoB13P2WoTpe06sC2vVfwd8A=;
	b=SDzHP4Ke8wRoTcLqcKxqlfN0az4JpAmUcRvFppGjhO08w8e8lJmh7NT+5qrghRCinaX02i
	UwWWwivhOPr75lCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC5D9593A3;
	Mon,  4 May 2026 11:28:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HJpwNPSC+Gl3HQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 11:28:52 +0000
Date: Mon, 04 May 2026 13:28:52 +0200
Message-ID: <87v7d3xvkb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: jack: use scnprintf to improve parse_mask_bits
In-Reply-To: <20260503101102.298782-2-thorsten.blum@linux.dev>
References: <20260503101102.298782-2-thorsten.blum@linux.dev>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 27C0F5C474
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sun, 03 May 2026 12:11:02 +0200,
Thorsten Blum wrote:
> 
> Use the return value of scnprintf() to keep track of the current string
> length and also replace strlcat() with scnprintf(). Return the string
> length directly instead of calling strlen(buf).
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied now.


Takashi
