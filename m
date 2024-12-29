Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE229405
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735460511; cv=none; b=E10jIVBxSCqdNCc5KHj1C3TO/EVHU8fHDY6sKnJZChyzheCxe7FmDZl037JgWRiGFNxz+gK9tlKTpkZOi5ep0IjFxW4D/j0VxQlryd7s61cdlsjF5kw9BeB85gadkiqZrcl6rBKT/k8vkmMdVif3LCe/Ke2Ts9zdoID/ICx/SaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735460511; c=relaxed/simple;
	bh=B/cls3TWRmDFNgGp62SpsTsehhEFJx3TivQ8HjjroXY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCyRd2UFAoGRIqrbz9AJmcTgSbg1x4RHM9Yacus8RqNKq4eb51MXIcFMD7tYL2OfC+NIOD7TNP0/rO6uEL5z5Z8eETqZY1W329j6FBH9igMwpFEyxRGX/IWbBkOUPIJY5gx4j/pBP+rMmV/82SjmYx0rNDxofBKOdfUkXmC25yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M6fkWzZt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vkcQAcPj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M6fkWzZt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vkcQAcPj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M6fkWzZt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vkcQAcPj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M6fkWzZt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vkcQAcPj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A3D291F7A6;
	Sun, 29 Dec 2024 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735460507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUIpQhd5KAByp82xf9QWQMcOBsc9C0zOHYJYiR+2HUI=;
	b=M6fkWzZtybyX0ZQ57zvxaGYuVtvL5cc1b+ExTea0p1fjlgmfbJ7sgIPwnkk0jtGIlmOudY
	L9U9jIA328J5PGmBldhqG9dwDWDhRxw7mkFUJi9/Gk8TKnkjNol8sYAuFfmD0DfBSdJVbF
	obLzOr/aLOC97LbCXQx46rMUl493Zc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735460507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUIpQhd5KAByp82xf9QWQMcOBsc9C0zOHYJYiR+2HUI=;
	b=vkcQAcPjxiXrRUOr2oke1+M3ReTcWVrMbhp+Dov7zYy74c5DSo974r8I/YscsnzGpH2g94
	2FxxMITsYGGxm5DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735460507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUIpQhd5KAByp82xf9QWQMcOBsc9C0zOHYJYiR+2HUI=;
	b=M6fkWzZtybyX0ZQ57zvxaGYuVtvL5cc1b+ExTea0p1fjlgmfbJ7sgIPwnkk0jtGIlmOudY
	L9U9jIA328J5PGmBldhqG9dwDWDhRxw7mkFUJi9/Gk8TKnkjNol8sYAuFfmD0DfBSdJVbF
	obLzOr/aLOC97LbCXQx46rMUl493Zc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735460507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUIpQhd5KAByp82xf9QWQMcOBsc9C0zOHYJYiR+2HUI=;
	b=vkcQAcPjxiXrRUOr2oke1+M3ReTcWVrMbhp+Dov7zYy74c5DSo974r8I/YscsnzGpH2g94
	2FxxMITsYGGxm5DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B745139D0;
	Sun, 29 Dec 2024 08:21:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mZEOGJsGcWfTPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 08:21:47 +0000
Date: Sun, 29 Dec 2024 09:21:46 +0100
Message-ID: <87ttamdhlx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Cc: tiwai@suse.de,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add a comment for alc_fixup_inv_dmic()
In-Reply-To: <20241223084726.146805-1-zhangyongzhen@kylinos.cn>
References: <87plm7wzp7.wl-tiwai@suse.de>
	<20241223084726.146805-1-zhangyongzhen@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 23 Dec 2024 09:47:26 +0100,
Yongzhen Zhang wrote:
> 
> alc_fixup_inv_dmic() has an empty comment line above it,
> add a comment here.
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>

Thanks, applied.


Takashi
