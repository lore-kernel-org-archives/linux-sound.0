Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D28324FC18
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207445; cv=none; b=gz4bLhazYQRbU37SRcvI5yBcKF1OdsCC2YKrpISuEQJBRnKmg10ChpnOez5Ltw2YqzSAroCmNLZWFFwlsjFudwgMuGf4Mo5kxpRtkyrdmWSL3UkbQ4qqpMRId/YpkTqVQH6K82QIzSd3ZLbVOGJDEwHrdrzSV1pI8UwnfcJEs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207445; c=relaxed/simple;
	bh=jY+2S3lxfbt5cEWvqEcjPk02eWLA74IfEyGVk/eLRpk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/6y8btpSsCpG1ZivLTy1Y2Yfmn4F8l3f/kdV7RB+jgVQMIl3uDnuFlYBv/F8/9p9wta8ks7BQ61W8XTZkuH924Lm0qRfOA6n+TGwJWOlf5U4CmaeUEixL/7znP/Ob5ngUPaD4J1IDcZ/6OxY6c0+QKn1d2wXgOkk5YpmUQeqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggQe94Qq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f5AQW1rQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggQe94Qq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f5AQW1rQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggQe94Qq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f5AQW1rQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggQe94Qq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f5AQW1rQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B22BB1F390;
	Mon, 10 Feb 2025 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739207441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PohLyhykLcDhi7VMiRdJQveCUp5dZQukWR2In285bbg=;
	b=ggQe94QqPhfSFZWL3yrcY6zvEC19TV9129+fDy7Kty/uE7THxlW/jjAa9/jqyvHQUw/e7C
	Yq7lIK2xcBbliLQV9k+B5+UZ9tAgqKjsX601WCeR95ij0GYClxJvukJiKW1zcNEr4+pvWo
	unQ+TLqOsqlPngo36JDYPXPzTUEorDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739207441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PohLyhykLcDhi7VMiRdJQveCUp5dZQukWR2In285bbg=;
	b=f5AQW1rQfQ18EtrXE1dWmpCeY4RPLwftgR4vh2lnePuUf25YtZnQ2IDeLvDwUrpIcAJphT
	H/uCBYYKM42mQNAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739207441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PohLyhykLcDhi7VMiRdJQveCUp5dZQukWR2In285bbg=;
	b=ggQe94QqPhfSFZWL3yrcY6zvEC19TV9129+fDy7Kty/uE7THxlW/jjAa9/jqyvHQUw/e7C
	Yq7lIK2xcBbliLQV9k+B5+UZ9tAgqKjsX601WCeR95ij0GYClxJvukJiKW1zcNEr4+pvWo
	unQ+TLqOsqlPngo36JDYPXPzTUEorDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739207441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PohLyhykLcDhi7VMiRdJQveCUp5dZQukWR2In285bbg=;
	b=f5AQW1rQfQ18EtrXE1dWmpCeY4RPLwftgR4vh2lnePuUf25YtZnQ2IDeLvDwUrpIcAJphT
	H/uCBYYKM42mQNAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D4A813707;
	Mon, 10 Feb 2025 17:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XIzyIBEzqmcLWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Feb 2025 17:10:41 +0000
Date: Mon, 10 Feb 2025 18:10:41 +0100
Message-ID: <874j11afou.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: jack Livingood <jacklivingood@comcast.net>
Cc: clemens@ladisch.de,
	o-takashi@sakamocchi.jp,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] sounds: firewire: isight: changed strcpy to strscpy
In-Reply-To: <20250205192258.358362-1-jacklivingood@comcast.net>
References: <20250205192258.358362-1-jacklivingood@comcast.net>
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
	FREEMAIL_TO(0.00)[comcast.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[comcast.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 05 Feb 2025 20:22:58 +0100,
jack Livingood wrote:
> 
> From: Jack Livingood <jacklivingood@comcast.net>
> 
> changed strcpy to strscpy in order to prevent a possible linear
> overflow.
> 
> Signed-off-by: Jack Livingood <jacklivingood@comcast.net>

Applied now.  Thanks.


Takashi
