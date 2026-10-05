Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4C23793B8
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205840; cv=none; b=HKliDM5WuorVNhTy18w9cwcrsVwQBxuXbud+F0HRXaZsW/VvhB5xyr94Pn49gMZFQtrTw7z9Rf1cBg9sz6rafp8F/4vZEU5/d3+2tKwZwkmwyq9NlcNKDZyrcNudu1d0N/lfZ8iSq95IuW7VIduE9jb6njzPHARhylkjq1vd78A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205840; c=relaxed/simple;
	bh=ZGUtV/7NGeTLTlvUytWzM+10Bw9uJXTIfw3C+Hij3BU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mINSou8boGHdC2vE1bY95HB7Zx09HTFuntltYLXUMqegnaHkJ4DuSJVzunVszrEipSbdJ/TN7mhDOsVsx5/NQcBxr/tLclZGvbcW4ve+aSNDyQXtd6iU9ZPwBhIN2qYj+vEBUoyEqPO8wDNcUZXv810Z2tZdImVpVw/9t+ChAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kKN5+vNm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VPg9QzXP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jkBPEfrT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SJ5gWeI8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kKN5+vNm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VPg9QzXP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jkBPEfrT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SJ5gWeI8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9547521CA4;
	Mon,  5 Oct 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791205832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfSANZO4lsxuXsy1H41dcHSNVkvfh8sS+k6FMv10x1w=;
	b=kKN5+vNmY+FQDFCgsZL63CZKJiV3A7DFvhZZuilLMc97CHlpapMM0qv704on6yPkZSVZkC
	roCPha8cybjjyJBw0GOBrjbhHNzwMROvCa3GH0rHXBYU71+9caldROq7pr51JNLpm+vowL
	HMW4zGeQ163D3G7YadV1ZrqIrA1p1lk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791205832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfSANZO4lsxuXsy1H41dcHSNVkvfh8sS+k6FMv10x1w=;
	b=VPg9QzXPaA0GpKtSLgVObmsiQIIA/Kg56IAq2NBYrV51N4dyTNpqJzQ2JtTZDyQnsjILq5
	3Su5EIJMjRdfOJDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791205828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfSANZO4lsxuXsy1H41dcHSNVkvfh8sS+k6FMv10x1w=;
	b=jkBPEfrTin+jdaWSw0lAKK1GrkhL+bKxR7pX+3smlgouKUxancGJ0YvPOmSi4bsOUL6ysH
	EA49gmCDwDPv3dui8H2gPSydCC0cKMOba0hUOu5ePyJbH8aS1+uGGVXOdszqhNoRcG0ex3
	dZH9W8CNkrANoQ4SPyGKTRepnGJjukM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791205828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfSANZO4lsxuXsy1H41dcHSNVkvfh8sS+k6FMv10x1w=;
	b=SJ5gWeI8Ww2cLRNiPFOevAdqazIkrR9KPR3yUM+4Xk/96omA0rEoNXd7KYn6U/utY57ehL
	Iw/dhH99ZkbT+YCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 573E713688;
	Mon,  5 Oct 2026 13:10:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A+8ZDMShw2oEWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Oct 2026 13:10:28 +0000
Date: Mon, 05 Oct 2026 15:10:12 +0200
Message-ID: <87ik3gs37v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Arun Raghavan <arun@accosted.net>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
In-Reply-To: <8733uoys02.wl-tiwai@suse.de>
References: <871pbsnce8.wl-tiwai@suse.de>
	<5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
	<87se48lv6z.wl-tiwai@suse.de>
	<8733uoys02.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.12 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.02)[-0.114];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.12
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 02 Oct 2026 18:41:33 +0200,
Takashi Iwai wrote:
> 
> On Thu, 20 Aug 2026 16:31:48 +0200,
> Takashi Iwai wrote:
> > 
> > On Thu, 20 Aug 2026 16:02:45 +0200,
> > Jaroslav Kysela wrote:
> > > 
> > > On 8/20/26 15:34, Takashi Iwai wrote:
> > > > Hi,
> > > > 
> > > > a few people including Mark and me have talked about holding a small
> > > > meeting for the Linux audio stuff (finally again!) during the next
> > > > Linux Plumbers Conference (on Oct 5-7 at Prague).
> > > > 
> > > > Has anyone already planned to attend there and is interested to join?
> > > > If we have enough people, we can try an official BoF session.
> > > > Otherwise, we can just have an unofficial session at lunch time or
> > > > such, too.  Just let us know.
> > > 
> > > Hi,
> > > 
> > > I will be attending Linux Plumbers and would be pleased to participate in
> > > a BoF session or another type of meeting.
> > 
> > Awesome, looking forward to seeing you again!
> 
> So, the conference will be opening on the next Monday, and we still
> haven't planed yet -- business as usual :)
> 
> I put people who showed interests in Cc.  If more people are
> interested to join, heartedly welcome!
> 
> If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
> AM/PM), let us know.  Or, since there aren't so many people, we can
> just have a lunch or dinner meeting, too.  If you have any preference,
> speak up, please.

It seems that a lunch meeting would be fitting at b.

How about Wednesday's lunch?  Does anyone have a conflict?


Takashi
