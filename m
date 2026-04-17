Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4036895D
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412037; cv=none; b=UPYYT1LqKpwCcFt6LmSdhRCGq1mlsj8PHeuZkzVhZEUQGK0V9lkt71advalF2kqooEz1BWu8vz6Io0V1tEqA2T25cQIy0ZRX3uFx4Hz/f90PDgPrkZWNNy3OU+3wTHZbsamAQba4LyYGs093b7QP9YsTaZ1TDp6wiqelG4p6+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412037; c=relaxed/simple;
	bh=ejz4D2MBX0RfM6LWerhLANqbEp6oTfj4bnnLoLAiSps=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B3Ev+7uwqX42jrfpVtg+o6AmNAJ2GWHVnR9wjHir4DSewwAnOytph3WMZz6aNKcb540xM/dfaWq0qZxuP/CS0THN4wvHUkynV0EhinPEPW0O8BYtgs2TEI1pYohG3vzHX4f+N67EkvnPUCJYqDu1B9So7Jxih1cySYlBTXeTtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FBCRL/Kg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iqoIhFgj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FBCRL/Kg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iqoIhFgj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FBCRL/Kg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iqoIhFgj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FBCRL/Kg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iqoIhFgj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 776246A991;
	Fri, 17 Apr 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776412025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AFxx5oLwBgSxrkFfMA46Ljy+DqasIL63sVcf7J/iv4k=;
	b=FBCRL/KguwnuEnrGFqWJq5PJOJwoz5Si7jKfxpGvokgg5e5l00iuewv/m0zymW4A+5C/bK
	yG5WDM/TlqvsV3+UO7sfN/pRQq97pN0WlcB+XILMKivSRHTH6SNN4n/qJifmVajusfNYPc
	JbFfanUlDj8j1EKqs5LmB4x8eLn2gIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776412025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AFxx5oLwBgSxrkFfMA46Ljy+DqasIL63sVcf7J/iv4k=;
	b=iqoIhFgjnaJPM8WQCXE4F/2mD/tXf89ADdhq1MC9x8mvUlrEyJuOwQZGcOQx3eCymSDS0b
	yO+v6benXykvJjAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="FBCRL/Kg";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iqoIhFgj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776412025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AFxx5oLwBgSxrkFfMA46Ljy+DqasIL63sVcf7J/iv4k=;
	b=FBCRL/KguwnuEnrGFqWJq5PJOJwoz5Si7jKfxpGvokgg5e5l00iuewv/m0zymW4A+5C/bK
	yG5WDM/TlqvsV3+UO7sfN/pRQq97pN0WlcB+XILMKivSRHTH6SNN4n/qJifmVajusfNYPc
	JbFfanUlDj8j1EKqs5LmB4x8eLn2gIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776412025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AFxx5oLwBgSxrkFfMA46Ljy+DqasIL63sVcf7J/iv4k=;
	b=iqoIhFgjnaJPM8WQCXE4F/2mD/tXf89ADdhq1MC9x8mvUlrEyJuOwQZGcOQx3eCymSDS0b
	yO+v6benXykvJjAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 564EB593AE;
	Fri, 17 Apr 2026 07:47:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fPahE3nl4WkQFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 07:47:05 +0000
Date: Fri, 17 Apr 2026 09:47:04 +0200
Message-ID: <87o6jido5j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
In-Reply-To: <20260416191149.12088-1-jpfuentealbabizama@gmail.com>
References: <20260416191149.12088-1-jpfuentealbabizama@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 776246A991
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 16 Apr 2026 21:11:49 +0200,
Juan Pablo Fuentealba Bizama wrote:
> 
> Add quirk entry for SmartlinkTechnology M01 USB microphone to enable the standard mixer interface.
> 
> Signed-off-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>

Thanks, applied now.


Takashi
