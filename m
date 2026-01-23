Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491F313E34
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168320; cv=none; b=ekcN1Q9tKarixtCRqQCnpDPtuVXl5FdNyEi4Vmk+ypYY7hHi/Ix7OgtLyifDF/+5116O8R07H8vul1Koa3Nk9Cu39tEWupUgx0tp8j04jTe7ef8EE0qBLgnMQ+SkOEyYMCp0RlkOkyxTV5kwsrI5owhQLd230a6IYAajhkUYZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168320; c=relaxed/simple;
	bh=/WVcQLlNk/aV6Nye8xYIvAN+NSTVaTMU11hHIbRMkww=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k5tmt9N0sTVEkYA6Ht9LpXeDQ5pACFOHRdmKl7q14NlNXb5eKH8h7VAtIh7+WfviHTrGqYas/8KQYm7Ia7UeQNyqGeyHyRs4IrDb318VGf5lWyohQnDjVSNUkCXV5ODjFRGcOgj0y1pbpfgCjULs4Hj6smUKVmiTEMhlJdZK1Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VM9pY3/b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ygo98LSQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VM9pY3/b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ygo98LSQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VM9pY3/b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ygo98LSQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VM9pY3/b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ygo98LSQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16045337C3;
	Fri, 23 Jan 2026 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=unM8Cb5IzCo93kN1X52wjjPR+s/SWRdcMHKaGul083E=;
	b=VM9pY3/bTuUbI2RYUBPxQP6Ij2gBGmnscEwlsQnuKeWQ5177GEA47vqof1LZC3Gkm9OeIP
	L4f++RTCRQxcyY5ZDeyjRtKak4sIKlxB2prPh2b2LY8dvhTqOSpGnm/0QaiGhLQvrGcM7n
	B4yzAAZDgIgOYpJPZAre2iTSPhAlEiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=unM8Cb5IzCo93kN1X52wjjPR+s/SWRdcMHKaGul083E=;
	b=ygo98LSQYVsso0SL3O6fdyyfJOMiMiaWxlHnXlx1q7bbLdsVeFZaVogAMESwPlJjUnrVCX
	b66qpq4qeXpCXOAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=unM8Cb5IzCo93kN1X52wjjPR+s/SWRdcMHKaGul083E=;
	b=VM9pY3/bTuUbI2RYUBPxQP6Ij2gBGmnscEwlsQnuKeWQ5177GEA47vqof1LZC3Gkm9OeIP
	L4f++RTCRQxcyY5ZDeyjRtKak4sIKlxB2prPh2b2LY8dvhTqOSpGnm/0QaiGhLQvrGcM7n
	B4yzAAZDgIgOYpJPZAre2iTSPhAlEiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=unM8Cb5IzCo93kN1X52wjjPR+s/SWRdcMHKaGul083E=;
	b=ygo98LSQYVsso0SL3O6fdyyfJOMiMiaWxlHnXlx1q7bbLdsVeFZaVogAMESwPlJjUnrVCX
	b66qpq4qeXpCXOAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D777A1395E;
	Fri, 23 Jan 2026 11:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +IhBM7xdc2kIewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 11:38:36 +0000
Date: Fri, 23 Jan 2026 12:38:36 +0100
Message-ID: <87ecngftj7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Fixed speaker no sound for Lenovo
In-Reply-To: <f4929e137a7949238cc043d861a4d9f8@realtek.com>
References: <f4929e137a7949238cc043d861a4d9f8@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 23 Jan 2026 09:03:34 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will solve speaker no sound issue.

Applied now.  Thanks.


Takashi
