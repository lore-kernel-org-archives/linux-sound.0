Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460741;
	b=SNWeZR9WO61B77GzD3TVqEdbaBNBiHVMRmk/E+vRXn+shWcrxiqsr2l7eW9mOCVvOZhO
	 WcBjubY+ZlDR9q3d1YTQc8mUK+5vcgI6zj90VtwmxJPCHkXnyM2aQPDokixBLt80HO/Ku
	 ccDlylEUZOQfi6WNA7c+8eoXwTBzYKU58OrCOIs3wn+vyrcBBsXw9Exnfmme0sw/FZaoL
	 poghh/47Ktef6YipLUinOy5XxDAuoejFbyP9RzC99KfHkCJ5Vu9lJF76BOMisHDFDMGlW
	 stkFPUmrCV9Wz0hHMGc4vBraxJSNIXddtMSFRuq4UoPUgQkq2Ua0ZW4Ra/f0pWkbf8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460741;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=tl/Wi3nZo7NoOYfAQin9XmTORwDvi2mJoZ+KnfGsglk=;
	b=Onftgn1BQC3DCJUXBqLJ0iykEUGS2avZyplDaveaW4gWWdtxXt9g+FrcbGjFAbEYH8Jt
	 y+UV74yjw689ERJ85I74MnRLvLdv2e1pm86heK2RrFl23WX2wc3u9oBRuDZ9PmnjZ92Ko
	 yCloCNLXkppbqDoxR7L1jwqfBBVowxHOGkfDSeZ3Wzc0A73fpEqnzz5C9Y5/MO4dC/ENP
	 4DLY6ZvC17mITlkwzkujAxm68RPK1p7rPoYYY4SSKiyY56mFggCdyAjz3txOgNPZQuiIl
	 aty/S7Cxgr/KTN0yXeypfrGDHFS+HnLPxES9I6XegVsQdcFrMZnVFSaiAvVhRBILbsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="tNEBloT/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gnrFI0ew;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="tNEBloT/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gnrFI0ew;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F6606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tNEBloT/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gnrFI0ew;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tNEBloT/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gnrFI0ew
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3DEF1F38A;
	Sat, 31 Oct 2026 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793460733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tl/Wi3nZo7NoOYfAQin9XmTORwDvi2mJoZ+KnfGsglk=;
	b=tNEBloT/q7lTvBm8/XBQGUSieWB4XcKHK2kJ64vuQaIaWkKXh93rWDGW7vVAZmjOmgLE8w
	thTOntgDgN0WqYyJY+fNe+cnZsjdLmrzKgfiYbSSjlSX+bGlSN9GlElLVYP1Liwm/pgSF3
	dPd1OCRuul+lnmULzVsvM3O4mqyEwG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793460733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tl/Wi3nZo7NoOYfAQin9XmTORwDvi2mJoZ+KnfGsglk=;
	b=gnrFI0ew6VPw3j2uFbsZelnKQxSI7Ciw9dZA0WIyW8XAN4tnbxk+9ca43FCElE3lwKVvLW
	0noS7vd9LN3TTyBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793460733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tl/Wi3nZo7NoOYfAQin9XmTORwDvi2mJoZ+KnfGsglk=;
	b=tNEBloT/q7lTvBm8/XBQGUSieWB4XcKHK2kJ64vuQaIaWkKXh93rWDGW7vVAZmjOmgLE8w
	thTOntgDgN0WqYyJY+fNe+cnZsjdLmrzKgfiYbSSjlSX+bGlSN9GlElLVYP1Liwm/pgSF3
	dPd1OCRuul+lnmULzVsvM3O4mqyEwG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793460733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tl/Wi3nZo7NoOYfAQin9XmTORwDvi2mJoZ+KnfGsglk=;
	b=gnrFI0ew6VPw3j2uFbsZelnKQxSI7Ciw9dZA0WIyW8XAN4tnbxk+9ca43FCElE3lwKVvLW
	0noS7vd9LN3TTyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DC0313432;
	Sat, 31 Oct 2026 15:32:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dWxiF/wJ5mpTEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:32:12 +0000
Date: Sat, 31 Oct 2026 16:32:12 +0100
Message-ID: <87h5i1sx6r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.4-merge-window
In-Reply-To: <f3c0e30fe8b901ae314a5400bc8dda92@kernel.org>
References: <f3c0e30fe8b901ae314a5400bc8dda92@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 29 Oct 2026 19:18:34 +0100,
Mark Brown wrote:
> 
> The following changes since commit 73be2ee656f2722d498504259b9f1fdef8419431:
> 
>   ASoC: codecs: Fix more control definitions that write another control's bits (2026-10-18 13:22:10 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-merge-window
> 
> for you to fetch changes up to 11ae63bd9030349a0136fb2edd1622a4a029edc8:
> 
>   ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers (2026-10-29 11:41:21 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.4
> 
> A moderately large collection of fixes and quirks that have come in
> during the merge window, everything here is driver specific and none of
> it unusually severe.

Pulled now.  Thanks.


Takashi
