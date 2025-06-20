Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B830E828
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420271; cv=none; b=HPHrsN5y3DlLCPpFe4v4EQmY+hQqwPqRJ0bgvkGrHD3sE6+GJaBYawY/8FbPsNOFi/JUC/zySoYJg0OESZNRS1zCokShuNopIrBoamTXuG21uuuBs0DXroxMz6Sy8U8SFyxzOmFHdcLBPgbsRBVGXK1O/H33JTGGnAG56xTAuBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420271; c=relaxed/simple;
	bh=pyxJ+718/Xlfk7owjr78XcIdxzHc3dPqU6hJsbfQ11s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HP0hg6IUu6CCUB1uLpVmvIEW3W0O5mQJKO8o6sDCOI39wsb7NjPN9v+jgUnz7DbCVsRCD/AaD7xT+VBNCYFRAX59y+9y9MmG05tCEqpfvihrYXVAts+QgvtC/CmYWjfC5dRI2m6TbZTk53Mqx7JPlTA/PWK1lBfJ45rLkXNPQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oDsOnjsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wq0FzKdY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eneDD1ZM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9Q25c5EM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oDsOnjsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wq0FzKdY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eneDD1ZM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Q25c5EM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E473821190;
	Fri, 20 Jun 2025 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750420265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tD/Z/p3qc8QgM1uIYMvK1IgJOzGnqI494XzwnQ2UBr4=;
	b=oDsOnjsSIQL60WB/iS9cGKjIN11xBHyFLAM1MxbmlJhUJR5PIA83dKU1Nezb7834MnvWdW
	KisJVR0/FvYI+XVAEN9jZ0UD/p0570ECuUnAhU+2I0CTFYzYC6ejjVQIiAJ+tjQnxJxDHE
	pSTthbKgyUBFEhe/ernsOr3YIdA68aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750420265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tD/Z/p3qc8QgM1uIYMvK1IgJOzGnqI494XzwnQ2UBr4=;
	b=wq0FzKdYgGPLwOvd7H4VsSZqQ26LJ3Idaahmi+koo+I1H0TJih/jcB4PySsl5qMA+IjJhx
	I27JI2vAqs2zWqAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eneDD1ZM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9Q25c5EM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750420264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tD/Z/p3qc8QgM1uIYMvK1IgJOzGnqI494XzwnQ2UBr4=;
	b=eneDD1ZMjjA/ycoebHvwNhQwnlkL6E9DJcqWuroPilkejHb1niuMjBDUvGL3pHR1OIIi1q
	EG1X7d/BqiCprx9R2a9NpJ3ADSui5CuHrFD0o4Llv48IrjeAMuiYzRy4DacmzeeRwFNzRN
	0HdAxyTpTRWKgyEGv4evUTeumxgX+Lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750420264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tD/Z/p3qc8QgM1uIYMvK1IgJOzGnqI494XzwnQ2UBr4=;
	b=9Q25c5EMeoZku35qgSJ8SoMzrbsuDYVoZC023DwPmX9Wxde8rrW6cEd8Vafyb/LAJLBPa/
	gWE+FqWHTo8fh2BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A62DA13736;
	Fri, 20 Jun 2025 11:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n6ewJihLVWjsHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 11:51:04 +0000
Date: Fri, 20 Jun 2025 13:51:04 +0200
Message-ID: <87frfuws0n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 0/4] ALSA: hda: jack detect fixes
In-Reply-To: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E473821190
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Thu, 19 Jun 2025 04:08:40 +0200,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
>  - fixes for hda jack detection with polling mode
> 
> Joakim Zhang (4):
>   ALSA: hda: fix controller cannot suspend when codec using jackpoll
>   ALSA: hda: add no_pin_sense_update flag for jack detection
>   ALSA: hda: disable jackpoll_in_suspend when system shutdown
>   ALSA: hda/realtek: fix mic jack detect failed on alc256

Thanks for the patches.  Indeed the polling mode has been little cared
for now.  I'll comment / suggest in each patch reply.


Takashi
