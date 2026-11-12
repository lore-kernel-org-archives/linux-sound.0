Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487183;
	b=Q9AD+b2Bb8AirlecpvPPFL1RfqNz9ZEqRPzU01MTqX7IfS6e3GCHwIoEq3X/xwrxTgSD
	 i/AwaVFCTTif6BzJ0r2WjSDGSAZLhJ0NWxBDf1nPLiRpnFIwwaT/vVTdwDN/L6F/7NS+R
	 44hwQHgFxe+dW7dd5HqjnY9Hgh/3ZQmdZ+U7QfR5jc9VqDiLpiEgFsrJRiUH6CKiZFd6b
	 3/KFcZg50v8QwJwrUlzQ/O6Ncx15eJ+A2FD8YN+daK2aeqI6KUqNngVw1RfqbZzpXEm5q
	 Oy+khttOAVw5fevsIsn9iMc22AVdymtTrTWo3sxQ9LFvVEhjg5+ay3EwWG0KXL8XZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487183;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=8kiwSirOigF/qJvwquSbpNG7fgBeF8dwYpmmK5AWpf0=;
	b=bleb3fSi2rwPh8dSqXTRk+h5D8kHoIW7MH3M12yHiKllk1iXdZKTNQqw93IkpjZUSmcW
	 LVIECMmbRsNkvZmiOZqaZ+JQrGA/+rmyaJlVoBVpMYTmcWXIAHL1FvsWRLzgd/MKn1gFz
	 u5BN+Dhs/2hYp0bOQavHMFJ/gk1XO49RHakKH7wEWleiUzrLsnkrRTVFZrBykeZZk/bAc
	 5D21PYQ48LKnCd5nSuR/Ppama2OCFZ6Q5EfH4Vj+qbndsPaeNzjx2akzn4QJI7Cfnl06h
	 gt9LX6allLY26ZM8lYSEFFSBZXqOwktjtCt1WsSVx8kVyAed0yrUoHVBamu5FA2N68w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=z0cH6vr3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IzWHx5my;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EHyjbC6m;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qpXHmoM8;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02DB606A895
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02DB606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=z0cH6vr3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IzWHx5my;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EHyjbC6m;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qpXHmoM8
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5C451F388;
	Thu, 12 Nov 2026 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794487181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8kiwSirOigF/qJvwquSbpNG7fgBeF8dwYpmmK5AWpf0=;
	b=z0cH6vr3S1IkK37jprtC0FQQgCKTnSNWRndG9RSkWambM5BBi0a5sHBhgftRAli793oY0R
	fOTYID3XTKGtZ7T0ljy4XHcxfw/JTKIJ6xqsvnVXs2GWx8k5RcQzF80M0pUj/ylgH2tf4h
	yduA2wvRp/6aftrE5fhCG/NzYR6oMVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794487181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8kiwSirOigF/qJvwquSbpNG7fgBeF8dwYpmmK5AWpf0=;
	b=IzWHx5myU8g4iOqmQYQho6FMRa+qAJX8MDzODdWwEgIL3bGNfBHfTRfAD2jP1GtTxAViB9
	ztuY8tjQnuqsUFAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EHyjbC6m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qpXHmoM8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794487180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8kiwSirOigF/qJvwquSbpNG7fgBeF8dwYpmmK5AWpf0=;
	b=EHyjbC6mJfVsJBLRQ45FpJeZD37cuKi3OfZyQ0xQK889uqHQpiGygzmiJeXQhQ7xziLcuC
	Fxj+pLSB56huJINZsmGeXsxZFySQxdxiMlY2Z5R6HQaZqognE50XNlczikpFUgdmf2UyjA
	mRDU2bd/JvmuGjv8p4E9ye27w2pvaoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794487180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8kiwSirOigF/qJvwquSbpNG7fgBeF8dwYpmmK5AWpf0=;
	b=qpXHmoM8AQ9klj3QPsG64zGQsmNHCN5FebGSv/AY2UeOKKqbwSQYzVAr7ZSa5J6SeyRuoS
	vBh3rbKPw5v5b9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9755D13432;
	Thu, 12 Nov 2026 12:39:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zZ/BG4yz9WodTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 12:39:40 +0000
Date: Thu, 12 Nov 2026 13:39:40 +0100
Message-ID: <87jymirzoz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Remove Headphone MIC support
In-Reply-To: <3c8129fbfa6d4ee2b464735f2f31dffa@realtek.com>
References: <3c8129fbfa6d4ee2b464735f2f31dffa@realtek.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D5C451F388

On Thu, 12 Nov 2026 08:59:14 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Dell QC DT unit don't support Headphone MIC.
> This patch was changed model to NO Headphone MIC model.
> This modify also fixed headphone popping noise issue.

Applied now.  Thanks.


Takashi
