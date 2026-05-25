Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB84175A87
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693692; cv=none; b=Iw+xhhJ/AWWf4RqtTTn8yx7WF14N/GONF15b27stSCY4Zfx6PRXkxh95b8qby1mUmKyqqGafk4X9mchD27MVJ6yts/Edd3GCWZGKdv8HrarioyO2HZLyNnwPa5krPPMqdjeiBRZD8pEssbxBtko7mXMTt9K7mcSZhiEWM5nJ1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693692; c=relaxed/simple;
	bh=IoRZ1eKjRZwr1+KfreSepDZ3ldteaonammTV9SOkx3I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txB7rVhPxFYzVrkvHNLw6jqaKDJhabpMsxhRJ3ventJei6STHIFRStj2OKnFRfbxzpa1XN/X+HT7rTdL0DqfSUSZRQkho/MpFIz/poRmGPnj4Hw5k7YsLaEgqMRE/3eWjCVDvdLEWrgjQCWuVtin8vRpxpLunV/KGwQnpGrXCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcfO5Tbl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wozG2yrb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcfO5Tbl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wozG2yrb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcfO5Tbl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wozG2yrb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcfO5Tbl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wozG2yrb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A31E3689FA;
	Mon, 25 May 2026 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oCsf6deOGoJV0P0eYBy1Fmem1SGC0tS+bgAa4pB374=;
	b=RcfO5TblFGI/sjagAE99YCceBTZ+UJ9UXIh7klaQt0SgXWtrWHHRdHtvf5QcDZY0ARiKmM
	9wi4ZlyMIvDMnv2dWnjGSBqYcXZkR1Z2svdomFnXKhWgiBYrV7FVT1KbAtVonCThpHCRnh
	5+5uY1zh+KIUb/2jr79Fn3LK33F2IqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oCsf6deOGoJV0P0eYBy1Fmem1SGC0tS+bgAa4pB374=;
	b=wozG2yrbowldDLSVhB7Adu6gjXoTaAgvy+YZNW29/QmBBjjnVrtDiMHj11dNP+6IquIDYK
	CfkmC1/rVHSlW6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oCsf6deOGoJV0P0eYBy1Fmem1SGC0tS+bgAa4pB374=;
	b=RcfO5TblFGI/sjagAE99YCceBTZ+UJ9UXIh7klaQt0SgXWtrWHHRdHtvf5QcDZY0ARiKmM
	9wi4ZlyMIvDMnv2dWnjGSBqYcXZkR1Z2svdomFnXKhWgiBYrV7FVT1KbAtVonCThpHCRnh
	5+5uY1zh+KIUb/2jr79Fn3LK33F2IqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oCsf6deOGoJV0P0eYBy1Fmem1SGC0tS+bgAa4pB374=;
	b=wozG2yrbowldDLSVhB7Adu6gjXoTaAgvy+YZNW29/QmBBjjnVrtDiMHj11dNP+6IquIDYK
	CfkmC1/rVHSlW6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B0C559B0E;
	Mon, 25 May 2026 07:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +7i0HHn4E2r/EAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:21:29 +0000
Date: Mon, 25 May 2026 09:21:29 +0200
Message-ID: <87h5nwgdja.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix incorrect comment for ALC299_FIXUP_PREDATOR_SPK
In-Reply-To: <20260522060742.1384390-1-zhangheng@kylinos.cn>
References: <20260522060742.1384390-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 22 May 2026 08:07:42 +0200,
Zhang Heng wrote:
> 
> The comment for the pin configuration 0x21 in the fixup
> ALC299_FIXUP_PREDATOR_SPK states "use as headset mic, without its own
> jack detect", but the fixup name and the actual usage indicate that the
> pin is meant to be used as internal speaker. Correct the comment to
> avoid confusion.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
