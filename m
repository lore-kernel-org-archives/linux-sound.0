Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCBD482EB
	for <linux-sound@vger.kernel.org>; Sat,  4 Oct 2025 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759585659; cv=none; b=sdzQ2gJ9Zjp0O8GIUCs86DWEnDQO8rZHAbD5wBLTrTIpYZetMKxSN6w1q6jjQiwFwVPFVXbvyi4+qDb466kPI2QZTL3/fQPlMSu5q5ef7JL3IdvZjV1MNLmD9Mi9wmGTuG6/uTsmlHj7hqyP79xqvF1d/fLAZKYzOdSoDTUL1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759585659; c=relaxed/simple;
	bh=9hx4P4Pao2pXh52rVupuyi7OgKs9ry/3YuLnw6BjhKk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6Y8LxreBawQtWFNC1OA7hfl4NgkKWnl5fzqGk3k425eMxrzF5k2QYp40/ry/9uF59tBLj8QyaNgu7duKof1gwIL9vL/wDnXdJc0aeYcnDa3dMu+Uz3Dwy8kiKDAzrOyjVygNTMGeFGbMBgGXZ3uqTlWKRxgZ/i95kcLt/8zzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V4ArpJLI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q4GWDwzZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V4ArpJLI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q4GWDwzZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V4ArpJLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q4GWDwzZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V4ArpJLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q4GWDwzZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F3D621E46;
	Sat,  4 Oct 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759585654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4i63MCJoHsqYaJqFGk3Y93BDtH7IFCo9P4+1HjIhtc4=;
	b=V4ArpJLIRs0LJuZfuVYB8Zw7d7utMwCwlFSTXktP4kjklaP80LYUBI2DJa97sowTntyTXX
	x+NPjcJ36U7o+G3dlYZ8gdEoG82jlnbOolHtX2YohDVxqwSTsHZKRbouuAxwnmqUG3z+5i
	BgGmZQkH+KvBGa4/R/J7IBseFuylcro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759585654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4i63MCJoHsqYaJqFGk3Y93BDtH7IFCo9P4+1HjIhtc4=;
	b=Q4GWDwzZnOPAX3GeXfTVSdXaQjXFJcvP2OxwV4Un0YIjaw4g459JGo/+MD1pSgwDt7H8Ge
	URGkASs9+fEecjDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759585654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4i63MCJoHsqYaJqFGk3Y93BDtH7IFCo9P4+1HjIhtc4=;
	b=V4ArpJLIRs0LJuZfuVYB8Zw7d7utMwCwlFSTXktP4kjklaP80LYUBI2DJa97sowTntyTXX
	x+NPjcJ36U7o+G3dlYZ8gdEoG82jlnbOolHtX2YohDVxqwSTsHZKRbouuAxwnmqUG3z+5i
	BgGmZQkH+KvBGa4/R/J7IBseFuylcro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759585654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4i63MCJoHsqYaJqFGk3Y93BDtH7IFCo9P4+1HjIhtc4=;
	b=Q4GWDwzZnOPAX3GeXfTVSdXaQjXFJcvP2OxwV4Un0YIjaw4g459JGo/+MD1pSgwDt7H8Ge
	URGkASs9+fEecjDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FFC11366F;
	Sat,  4 Oct 2025 13:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YbiACnYl4WhpNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 04 Oct 2025 13:47:34 +0000
Date: Sat, 04 Oct 2025 15:47:33 +0200
Message-ID: <87347yhj7u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: Re: [PATCH] ALSA: emu10k1: Fix typo in docs
In-Reply-To: <20251001090757.45991-1-bhanuseshukumar@gmail.com>
References: <20251001090757.45991-1-bhanuseshukumar@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,vger.kernel.org,lists.linuxfoundation.org,linuxfoundation.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Wed, 01 Oct 2025 11:07:57 +0200,
Bhanu Seshu Kumar Valluri wrote:
> 
> interally => internally
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>

Applied now.  Thanks.


Takashi
