Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C727FD45
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767197713; cv=none; b=oCUqm+A6A0AmtKW3rFYZR4T7rG/UBKXg3++DcGeM0oLOMZMo5reRWGePqDlNR7tU/wokjZnUoFRtQlXK1qG4mLVswa8pn7uKazWCuhbYCiVDsoJ3l0JWzenuEod/vEksyfIcoQR7cuFJw+CuBwnDugGP8cAvugaV1jOcwXmO0pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767197713; c=relaxed/simple;
	bh=8pY1uOl975Zbwc/wI4ZGGOII9lr14HgM9g33Bc/Kavc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKxXBGUMGY8Xz0xE3lf/22MnsEuzrpZyVqa+guNXME4ms1wlPA+mfgvFQlEluV6LOiIRxYC53kbQTcu/mLWpL/DtP6DdBNX5vFAn9TK+1RwvlawoqodG1d4/mFu3QPLQICd1Jyk48VWx9J/Gt1A6m8nlCYtIKQ5oPqwBezkoRKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DtlNwxN+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LmKkRgja; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NCybQWSU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eworGuMV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtlNwxN+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LmKkRgja";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NCybQWSU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eworGuMV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D94FC5BDC5;
	Wed, 31 Dec 2025 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767197710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtAYyxesiodPJj1zBIKuNiN57/3GWJH5KWT7lAV7wtU=;
	b=DtlNwxN+JP58xc9HwHTF1QH3ReJCcdWQWJ2gUa3a2jJcK2AWdTK+4nV6Zcb1KcZlX36Ym8
	SvyTlafbTtub1vOHWWHDlI9+dFeEk2gdfws7AqECyQfCi2C9HFU3WXgYCwlfHQUPSOvYdV
	GIyDItvgQZtEk4mDso4+mMSMeEonGUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767197710;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtAYyxesiodPJj1zBIKuNiN57/3GWJH5KWT7lAV7wtU=;
	b=LmKkRgja3BQnfHm561QiqhhZNp//ZgOCj/y8lDRcvxwZQsk4Xxa+EKGbgQSJiqFjo0P0kQ
	dqHs2GHcq8LaFvDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767197709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtAYyxesiodPJj1zBIKuNiN57/3GWJH5KWT7lAV7wtU=;
	b=NCybQWSUmVbz2BLjhF9rMgQ+vkrTVDiH1X7jPauMau5MNk6PgIJ5i9/JuiIQ6JDylmRU5a
	kZdufe7RKpVdFem7TTqUzwTOsqW+0W4OW3bzW+PgEtHfzkPIQ9nWNjSddtTFh9vcNEh86B
	fKxo9FAeBCrltvCNvFCetizy8UaUbo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767197709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtAYyxesiodPJj1zBIKuNiN57/3GWJH5KWT7lAV7wtU=;
	b=eworGuMVMSwZ0hIDY1Omz1FA8CCi8GMmNldmrQW38jfUauMyM7Gq9khZ3ffCPOWVH7cYOi
	uj3sN7Rp+3SDo4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F2763EA63;
	Wed, 31 Dec 2025 16:15:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Dcu0IQ1MVWklbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 16:15:09 +0000
Date: Wed, 31 Dec 2025 17:15:09 +0100
Message-ID: <875x9my6eq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: echoaudio: adjust function name
In-Reply-To: <20251231161116.141071-1-Julia.Lawall@inria.fr>
References: <20251231161116.141071-1-Julia.Lawall@inria.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.810];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,inria.fr:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.26

On Wed, 31 Dec 2025 17:11:16 +0100,
Julia Lawall wrote:
> 
> The function restore_dsp_rettings sets a lot of things, so change the
> name to the more natural restore_dsp_settings.  This name was indeed
> already used in a comment above the code in
> sound/pci/echoaudio/echoaudio.c.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
> v2: change the function name in the code, rather than in the comment
> 
> This was tested by compiling sound/pci/echoaudio/darla20.c, which
> includes both files.

Thanks, applied now to for-next branch.


Takashi
