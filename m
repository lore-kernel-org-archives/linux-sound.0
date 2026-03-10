Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450534B1B4
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131708; cv=none; b=DGJC2DOZ0+qig6uPcdGS+wQ+cJyfm7GbSZKjUgc+ztwDaMZT3hnTF5jr0jRSJvMagdwDtrtmBIkrA0rokQd20OxAv7UrpWPV4q76V8po2m/E3xWeW+Z4dRq23FOc56Jk6JVI08FePHJYxw1JsPBNFnDIUyxLd2vEp9NBKUu0i9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131708; c=relaxed/simple;
	bh=+9X+fgW3664oBx7NsKHAHe1LqWOoR/91iCSvUvHQ+tU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQW5kGecnsRDO/U7QNxdviyKMEKvonXzCmMDG+iaUHFbP4XZVzjdh+F39QAhvkEgnDHi37eeFKvedhlSSyJbnzXw+/rWLx23lMNVMZLgVy2w7lZ3dlLAt5nreuYAG6gWmeh7QDMsIu0M1y4leokEYq4GJUV7Lhtv9KdD+tOAQQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BKbqk+Lq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wOeamNgk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BKbqk+Lq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wOeamNgk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BKbqk+Lq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wOeamNgk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BKbqk+Lq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wOeamNgk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 104A94D238;
	Tue, 10 Mar 2026 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773131705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3gpENzGojWyrZ/fRWIxGrs17u1WRs82JKGKEC6Slrc=;
	b=BKbqk+LqkmKpnJ+JIO8JeSIiZNp5CB1qjNd8SiR8E9C4N/feosyeM182PWsAcXU/dLswut
	V+LOC/IUXtJS1gSxY9Up4XbrcKXeFRunXFY9TTeTn3pSMF4PGUcuIZKHyBwcTnB4BKuqKR
	dABr8OibSFw6mkAL31ZPPg/HHZQiz70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773131705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3gpENzGojWyrZ/fRWIxGrs17u1WRs82JKGKEC6Slrc=;
	b=wOeamNgkgpFKS8O81u0DKJaPnH/VU+XmYAcJXB5KSgdCt7tmBwubht4j+BYXQLzswdVG43
	xiCUwc0nF/NKpwCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BKbqk+Lq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wOeamNgk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773131705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3gpENzGojWyrZ/fRWIxGrs17u1WRs82JKGKEC6Slrc=;
	b=BKbqk+LqkmKpnJ+JIO8JeSIiZNp5CB1qjNd8SiR8E9C4N/feosyeM182PWsAcXU/dLswut
	V+LOC/IUXtJS1gSxY9Up4XbrcKXeFRunXFY9TTeTn3pSMF4PGUcuIZKHyBwcTnB4BKuqKR
	dABr8OibSFw6mkAL31ZPPg/HHZQiz70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773131705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3gpENzGojWyrZ/fRWIxGrs17u1WRs82JKGKEC6Slrc=;
	b=wOeamNgkgpFKS8O81u0DKJaPnH/VU+XmYAcJXB5KSgdCt7tmBwubht4j+BYXQLzswdVG43
	xiCUwc0nF/NKpwCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAC293F372;
	Tue, 10 Mar 2026 08:35:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j6U0MLjXr2lSGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Mar 2026 08:35:04 +0000
Date: Tue, 10 Mar 2026 09:35:04 +0100
Message-ID: <87zf4gqdzb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/senary: Fix beep error handling and optimize EAPD  switching
In-Reply-To: <20260310023649.155858-1-wangdich9700@163.com>
References: <20260310023649.155858-1-wangdich9700@163.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kylinos.cn:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 104A94D238
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 10 Mar 2026 03:36:49 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> This patch addresses a potential state inconsistency bug and optimizes
> runtime performance:
> 
> 1. Fix error handling in set_beep_amp():
>    Previously, beep_nid was assigned before adding kcontrols. If
>    kcontrol creation failed, the function returned error but left
>    beep_nid set, causing inconsistent driver state. Moved the
>    assignment to the end of the function.
> 
> 2. Optimize senary_auto_turn_eapd():
>    Removed the redundant snd_hda_query_pin_caps() check inside the
>    loop. The target pins are sourced from spec->eapds, which is
>    strictly filtered during the initial parse phase. Checking
>    capabilities again during every mute/unmute hook is unnecessary
>    overhead.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
