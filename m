Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8692BEC27
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416401; cv=none; b=LUOBok/M24/QfteynxRROgtip5vPx7bOzDytMTVExHqNX0gnpOF6SbXEF5KHfbsFt0WSjuobFb5pVsnMdmdB6I0cWPtBCeQQBinqVPZR8KJGxfFftIb3Xddq2OqqvsXhMOZ7rcS5DJ4KB0+G3dKMtZeZzwa2Mc437gVVH5Ix4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416401; c=relaxed/simple;
	bh=cB/tj+GjPXxwkAGTaySiYoz2SvaJn2RZwp1aQcupk8g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QrdJYAIWeNNCQD/xO4dcffoazclKgfRbQ1QiroD8vjJG7u7WjT3Cep9CQ8LU5c8duoGSFP62rBXhklQLWy4Pvtrphs3odB3D+GRJk7bY9RZONkFfn3KZE2uK4fgC+6pQLCZNRBWhGCRq7mqO5/vIUGvLgk9DqYzwEeDelS2SCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stFuFQTM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fhS4HEzi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stFuFQTM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fhS4HEzi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stFuFQTM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fhS4HEzi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stFuFQTM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fhS4HEzi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B1B15BD18;
	Mon, 26 Jan 2026 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QYEypHws+EzVm0NgsgyCHENGuBCWc2jo62uZI31f2O8=;
	b=stFuFQTMqfkNi9nVsEk8D1fY7mjd2xLfDuVpvTUQoS34OkRmKYnLehi8BPF406wtL4m6m8
	t6fswcqe+0aYYIHlpuJUDA54hdO7lNHKNkEGZkUTZNIZlDxVygB7GGvESl1/IrKfb9NQe3
	wID+f4aT8PbdO+L4STWDiIp06Q0qA10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QYEypHws+EzVm0NgsgyCHENGuBCWc2jo62uZI31f2O8=;
	b=fhS4HEzihlFiUOn+/zLWthfFZM+ky7dbPQr75qifp2TkCPJjK2JdEnU7tHntWMzCJvjImy
	WjZLv9VerUwgwMCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=stFuFQTM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fhS4HEzi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QYEypHws+EzVm0NgsgyCHENGuBCWc2jo62uZI31f2O8=;
	b=stFuFQTMqfkNi9nVsEk8D1fY7mjd2xLfDuVpvTUQoS34OkRmKYnLehi8BPF406wtL4m6m8
	t6fswcqe+0aYYIHlpuJUDA54hdO7lNHKNkEGZkUTZNIZlDxVygB7GGvESl1/IrKfb9NQe3
	wID+f4aT8PbdO+L4STWDiIp06Q0qA10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QYEypHws+EzVm0NgsgyCHENGuBCWc2jo62uZI31f2O8=;
	b=fhS4HEzihlFiUOn+/zLWthfFZM+ky7dbPQr75qifp2TkCPJjK2JdEnU7tHntWMzCJvjImy
	WjZLv9VerUwgwMCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00102139F0;
	Mon, 26 Jan 2026 08:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UkJzOs0md2mcIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Jan 2026 08:33:17 +0000
Date: Mon, 26 Jan 2026 09:33:17 +0100
Message-ID: <87qzrcbwoi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: jack: Improve string handling in jack_kctl_name_gen
In-Reply-To: <20260125155159.98720-1-thorsten.blum@linux.dev>
References: <20260125155159.98720-1-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3B1B15BD18
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sun, 25 Jan 2026 16:51:56 +0100,
Thorsten Blum wrote:
> 
> If appending " Jack" is not necessary, replace snprintf("%s", ...) with
> the faster strscpy().
> 
> Additionally, rename 'need_cat' to the clearer 'append_suf', use local
> variables for the suffix and its length, remove the confusing comment,
> compare strncmp() to 0, and use 'size_t' for the 'size' function
> parameter.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied to for-next branch.


Takashi
