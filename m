Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A5D38D419;
	Tue, 25 Aug 2026 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644797; cv=none; b=Vp+yNXkQ/eGNYmnC3GNxoVHXIl+faOt2vPF8hZuU4J5UwTdls2tO4CsF/PsEpYoo/1n5Zs7wlpiWug4c8vvVofgF6kEDD3ZOCcasVZcg6CDqPFTtQqUo3b8H4mKtm7lAG1ViewtwmJ8NOL3Z3Wrdb2y8eSSRuXRDNiX6uNy5JIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644797; c=relaxed/simple;
	bh=1z0hzRImHi7+RNAdvVExWlw3k1E0YB+bknsCXB7afUI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eB+dPbIprOGdvEtdcL4aMTmoax0ldQALXOjFgYNCRt9L9+RyzOC6IuawNZ7BPIsfgYClZXMdp2jm7edumL8SjQgL34nf2CCVRNN3knSyS526vqUXv7D9V0QmtXbtORb1vVJBvvdwqqntED9vI+H2NeYtlxXb/cdReNTSkpqZwNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQLbh3Oa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xfKEkZtw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kNjwnwQb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A8NEzD9i; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQLbh3Oa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xfKEkZtw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kNjwnwQb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A8NEzD9i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5507D1F7A4;
	Tue, 25 Aug 2026 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJA06+Fu2uY4gdD/CzR+SyRght/UG9o9j6C4E2fShEQ=;
	b=MQLbh3OagJRqIQlsNrzJfe+3irMUKzlgiHliBRXFL7yWQ7Rk5iEZsJxLXHNB84qxee5Php
	TZ67KrrJHlpq8KT8Ualgdu2lg8A/OGiEjh/dUcWL5ZD+kRG3CuSLjBd3QC8abo4qX073fQ
	a6K1UnA658ThcTnoYtemsrTb1aI3omY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJA06+Fu2uY4gdD/CzR+SyRght/UG9o9j6C4E2fShEQ=;
	b=xfKEkZtwVg3OUCKNbSXJNoJ6naV3Lnd2S41N4UmLhEox2z1hUMjgmImnLjCT4Ggs3KwVni
	lG0PkXowZVeTIsBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJA06+Fu2uY4gdD/CzR+SyRght/UG9o9j6C4E2fShEQ=;
	b=kNjwnwQb4gNTdlR6LaP7/JFVRDr+I15EMaK0ayCLk2fl00wKb7iKX/oI8axgLPpDLIt+HN
	uo90YmMkvZNN+8eYmK4cNxyNhlFGv/ZZ/SQOUZ6lqXDljdV+c8C2SkKDRP7LNlT9JL/QnW
	HjxzrepDdM38vXeIHfv3418ve928tok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJA06+Fu2uY4gdD/CzR+SyRght/UG9o9j6C4E2fShEQ=;
	b=A8NEzD9iebewi+u83nS1HfA0tW57awkRE2hD4NeS5QYOBOxXxFQWtjF/49+DkuXPQIDQHk
	RsoEs39MOuuo6bDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7043A13332;
	Tue, 25 Aug 2026 07:59:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xuw+GXFLjWqkcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 07:59:45 +0000
Date: Tue, 25 Aug 2026 09:59:44 +0200
Message-ID: <87h5kitytr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo IdeaPad Slim 3 15ABR8
In-Reply-To: <20260824123752.525173-1-zhangheng@kylinos.cn>
References: <20260824123752.525173-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 24 Aug 2026 14:37:52 +0200,
Zhang Heng wrote:
> 
> The internal microphone on Lenovo IdeaPad Slim 3 15ABR8 (subsystem
> 17aa:3862) exhibits severe distortion at default gain levels. The
> Capture Volume is fixed at 63 (max) and cannot be lowered without
> explicit userspace intervention. The existing fixup
> ALC269_FIXUP_LIMIT_INT_MIC_BOOST limits the gain range and resolves
> the issue.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221891
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
