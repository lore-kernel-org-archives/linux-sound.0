Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292232E62A9
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599400; cv=none; b=VgbUygHHt1tuEI3igRxMikUJtKnTuiAZV2jdt63sQvAf7CV0gqNZAaSWnto4nQZIp8iVoaUGHMn9y6T0XvaNWDEsrv0RpW7rFJvHBYVHaY+bAhOErluOxNO84HMQjl2Yl+4xYFZ+kDc3IbDgIRAee7wM3Z3L85gxt9ZD+FA3mzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599400; c=relaxed/simple;
	bh=U9J8QxpeE8PDQeH5k/d9GG0FsGa7738Dj0RgolaZ6Tw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/y+C/C+SCu5lE+35sVOPYY90sNWMSZ6qGEqKXFbEyNc2gmmYxVxoPeM7C+ssc9pnpeBPqSa+HC/gSfPOvfH2ZpXiDb9aqEbqcxiA7vM0DMJX96jsxA1l1rKyTDO9ssrL8XGs4J4PH54ayXGQHpsAgv1l2gJf+1PawI4Yi9fHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggOioW5R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=02FZzmPF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggOioW5R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=02FZzmPF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggOioW5R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="02FZzmPF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggOioW5R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="02FZzmPF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D1DB22378;
	Mon, 28 Sep 2026 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VPZ0ERH5Jb9obfecp1CFdw4dwySeaHEPlA48z+PTBuw=;
	b=ggOioW5REmh2vMK7ZMoDiTiibWCX74uprI7J/7NWw8YIEpAuwAHhtpQYYtStoP+rfOpyFq
	HVN6E/V+fzYBZbLDtfVOzoqgFNT5DvEFfjOYSf3drnGWvg0xeQ8qNvIEAYFkxeTUIUE/fi
	33iMZqWSpWp+3qQ000kkGjk+pSh8w6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VPZ0ERH5Jb9obfecp1CFdw4dwySeaHEPlA48z+PTBuw=;
	b=02FZzmPFJ8Dar5oRHG1nu//xlpvrZb8gRomiN2gZIsNrAzLmppdWaqwbKxSt8BcrpsyScT
	0EAqDhLvHvYdD4BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VPZ0ERH5Jb9obfecp1CFdw4dwySeaHEPlA48z+PTBuw=;
	b=ggOioW5REmh2vMK7ZMoDiTiibWCX74uprI7J/7NWw8YIEpAuwAHhtpQYYtStoP+rfOpyFq
	HVN6E/V+fzYBZbLDtfVOzoqgFNT5DvEFfjOYSf3drnGWvg0xeQ8qNvIEAYFkxeTUIUE/fi
	33iMZqWSpWp+3qQ000kkGjk+pSh8w6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VPZ0ERH5Jb9obfecp1CFdw4dwySeaHEPlA48z+PTBuw=;
	b=02FZzmPFJ8Dar5oRHG1nu//xlpvrZb8gRomiN2gZIsNrAzLmppdWaqwbKxSt8BcrpsyScT
	0EAqDhLvHvYdD4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 142F7133F1;
	Mon, 28 Sep 2026 12:43:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4340N+RgumqRCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:43:17 +0000
Date: Mon, 28 Sep 2026 14:43:16 +0200
Message-ID: <877bk55yxn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	" (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Add headset mode
In-Reply-To: <3c251e40a2944ae4ae479e4c2e4e63a4@realtek.com>
References: <3c251e40a2944ae4ae479e4c2e4e63a4@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 21 Sep 2026 10:06:42 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Prior patch will lose headset Mic function, and this patch will restore it.
> 
> BR,
> Kailang

Applied now.  Thanks.


Takashi
