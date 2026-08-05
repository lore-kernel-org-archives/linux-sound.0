Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3A3E49EB
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915049; cv=none; b=XsOadj05Ty74sUrfrEYlsAQwyHnX3fj82wXuWT/nDsmusv6FM3s9Nw+dQI5HNs0zYC5mgkbtWJrkZGxjYbGnfY0+x3Cbsm46b0aAq/v9qeOAtbfFgKPxxW1QmIW/qdolx3m8Zqoyl1FsaG+lk2so/AEdv9KVO4CgnnQRrNkP8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915049; c=relaxed/simple;
	bh=WnqEqrdW07q2e/QUo0fztWds+1Q1BZI+V9K/DpDRSLc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RC7Heg9KKhlH9x6/6mIa4WIHMmN7XnspxHkeZjhMZL/gcfyjyFwkswpTeq+UXqoVOCNXOReyK24+1MVDxLM0+/ORwufrX3bwyyuokUswWwKdo58Ltj0RFTkwprEyuA/EQ42sk154TkcFE6DKgbew52Bw7haGeFYjeh3b8naEsyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DhRTtnvR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oGOzzNY4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nInUPaal; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i0CKfbTd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DhRTtnvR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGOzzNY4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nInUPaal";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i0CKfbTd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E0137FC25;
	Wed,  5 Aug 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785915042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a3jyPXx6CzYfSrIK6EQLlmYMm6UceLM3t5fE5akEh1A=;
	b=DhRTtnvReaNwE4kEZ4CjrQCQTsgqv/RH97U1YVShbL129Pe2sfPsMSE/ENfa9fspxvAg/s
	eWTx/FY5QdECHFZ4iOkqd2oHc/03Jnq4eYtQ+cEFwdLK0t1j+GRMUFrLKmaW6LuhaxGQ0H
	/Ln9NP8CPGdXQgD3JRyGEnP7HIKGkDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785915042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a3jyPXx6CzYfSrIK6EQLlmYMm6UceLM3t5fE5akEh1A=;
	b=oGOzzNY4W016hwN2Nmee1UgL2AyeSly550PIaFw8jspXMMajrZpgLDtSz/7+nMljEmxlbV
	rqZAWHkJd6vdjBBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nInUPaal;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=i0CKfbTd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785915038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a3jyPXx6CzYfSrIK6EQLlmYMm6UceLM3t5fE5akEh1A=;
	b=nInUPaalEOuDCsek713VLa95IwqFfWqYn/0ESGiDMoaOLFlQS9AaXHG2hKz1I2iVOZD5/6
	ELZvLhdR4imiuQASwKjsTS3IzRDtMPMjzAj5FJtkhLyVMPRqQGVapNjPht8UJo+MLZzp3T
	NoUahUXr5MhnQVisJrPE7nVI8Be6mq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785915038;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a3jyPXx6CzYfSrIK6EQLlmYMm6UceLM3t5fE5akEh1A=;
	b=i0CKfbTd6MwsgwvzXeOS76jIbO+MAQmtHTaz3pkgynJyD+/WeLw0cXcQ1iM8LOTn+lJwyX
	q1bTEllRNLX3gVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A676779C2;
	Wed,  5 Aug 2026 07:30:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Dc+qF57mcmrmPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 07:30:38 +0000
Date: Wed, 05 Aug 2026 09:30:37 +0200
Message-ID: <87pkzxgh2a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v6 1/2] ALSA: control: tidy up whitespaces
In-Reply-To: <20260720103505.1860399-1-mstrozek@opensource.cirrus.com>
References: <20260720103505.1860399-1-mstrozek@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 9E0137FC25
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Mon, 20 Jul 2026 12:35:04 +0200,
Maciej Strozek wrote:
> 
> Clean up trailing whitespace in preparation for the card components
> changes.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> added in v3, no changes since then

Now I applied both to for-next branch.
Please submit the corresponding alsa-lib update (either alsa-devel ML
or github PR).


thanks,

Takashi
