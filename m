Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D3017C220
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860592; cv=none; b=daYVSiMOXgHrfJkChK51MSfeJ7yE2saaL5XCc4inmK7747BxCSth6+tDo3fkeQc6T6AuOR/95+/bRRMzZlG0mMR9ZKuYLcvy0Vxv/4MZ8tZEMFxuL0XjVPaqCxY6Tnui6af5jSKrL1avxyxGtlE0Ad7ZaRW14Dx3jbfgv+BLhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860592; c=relaxed/simple;
	bh=8SS1Kg4HK2HevIcZaqZN3jqxojjTXs8rty1063NfZr0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pG0t1ninoDgFP/r9T0kEIak9HYbxGfSIjXkYwCXV1OllXD+27LPnnMXFAiNgUPp+leJz8DccPl1QTSyVVltoXlRDJcteDSEIWNOFylvxGHe68v45zx9fX9pnAhnTwhdg0sN2R6AygY3clco4vNYtssnHCiiSPK7PD3qEi/LzeoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gkztiXQV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qV6DWCis; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gkztiXQV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qV6DWCis; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gkztiXQV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qV6DWCis";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gkztiXQV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qV6DWCis"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B8E55C679;
	Fri, 15 May 2026 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778860589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUFKn2VoT1ja+cbnyoL9DDuCZbGDuNFrzrCQsUj6gMg=;
	b=gkztiXQVN1xdvQAA4onS1EnlgUUiJ+MBPAAR6dWrIfnsX1kfdvbPJ0F12rE4sRqV1XaYfo
	PbAb6rT7PsUbTT4yBzUbHuRYvy95i2Ped1gypLjN8bH/hTehtI0SUpbouidiMNKiwBH/5O
	0BbhyToYu1CTrAvyG75rMTA+3gMTodE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778860589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUFKn2VoT1ja+cbnyoL9DDuCZbGDuNFrzrCQsUj6gMg=;
	b=qV6DWCisd9LCAjEYrwEgr8sKiSuQXJQQiVssYKnVpV+JAPgOFc+mh/FW+NSO6gGeu/N7O4
	2mgJ0KGZcxUQ9jCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gkztiXQV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qV6DWCis
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778860589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUFKn2VoT1ja+cbnyoL9DDuCZbGDuNFrzrCQsUj6gMg=;
	b=gkztiXQVN1xdvQAA4onS1EnlgUUiJ+MBPAAR6dWrIfnsX1kfdvbPJ0F12rE4sRqV1XaYfo
	PbAb6rT7PsUbTT4yBzUbHuRYvy95i2Ped1gypLjN8bH/hTehtI0SUpbouidiMNKiwBH/5O
	0BbhyToYu1CTrAvyG75rMTA+3gMTodE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778860589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUFKn2VoT1ja+cbnyoL9DDuCZbGDuNFrzrCQsUj6gMg=;
	b=qV6DWCisd9LCAjEYrwEgr8sKiSuQXJQQiVssYKnVpV+JAPgOFc+mh/FW+NSO6gGeu/N7O4
	2mgJ0KGZcxUQ9jCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D482593A9;
	Fri, 15 May 2026 15:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0NftBS1CB2q5fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 15:56:29 +0000
Date: Fri, 15 May 2026 17:56:28 +0200
Message-ID: <878q9ksm37.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>,
	=?ISO-8859-1?Q?=27C=E1ssio?= Gabriel' <cassiogabrielcontato@gmail.com>,
	'David Rhodes' <david.rhodes@cirrus.com>,	'Richard Fitzgerald'
 <rf@opensource.cirrus.com>,	'Takashi Iwai' <tiwai@suse.com>,	'Vitaly
 Rodionov' <vitalyr@opensource.cirrus.com>,	'Jaroslav Kysela'
 <perex@perex.cz>,	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND] ALSA: hda/cs35l41: Fix firmware load work teardown
In-Reply-To: <agdAlJek88n6K53H@opensource.cirrus.com>
References: <20260511-alsa-hda-cs35l41-fw-work-teardown-v1-1-1184e9bc4f25@gmail.com>
	<agbxffucE1h67TRI@opensource.cirrus.com>
	<002f01dce47c$a7859760$f690c620$@opensource.cirrus.com>
	<agdAlJek88n6K53H@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,gmail.com,cirrus.com,suse.com,perex.cz,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6B8E55C679
X-Spam-Level: 

On Fri, 15 May 2026 17:49:40 +0200,
Charles Keepax wrote:
> 
> On Fri, May 15, 2026 at 04:08:14PM +0100, Stefan Binding (Opensource) wrote:
> > > -----Original Message-----
> > > 
> > > @Stefan, could you also please have a look.
> > 
> > I think this is fine to do, and I did some tests to make sure it doesnt
> > break anything.
> > Reviewed-by: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> If Stefan is happy so I am :-)

OK, let's take it and see whether everything works.

As this doesn't look like a particularly urgent fix, I apply to
for-next branch for 7.2.


thanks,

Takashi
