Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F07226B760
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802978; cv=none; b=Is9r59n/BoiBLI3/15ZTDtvvv185RJh9S9+KPOWyGfC1cqipDnTCsGgiXzZ0MiLphtMp0U98EdVnd+Hckiokw+w386JsP+gkWFKWt7b7fgSOP5VYMe7je90lD4nYr8fS4YUxPV7UCyWS6xGYx5C4Wb0s8rSy6wjNVJxBjz7+Kik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802978; c=relaxed/simple;
	bh=1cHxRpEN5AFZ+mv7c0moqdoBjHPG9KmLOf6P72+KvIc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=op8srwsIvjjQYypDSvvVglA6Pn/1/0JALrt0crNp7vPuCJcNvDTtcZkRMpCaB8E9/C54IQ2DTxi0P3MwGe1263OQClvoC3XUvw7cKtf6FDnknzDXZEeADcWYOYxDYL1uoe3zvqd94AeG6ZCsCwG1/QvKB5ZnHAFrVaOacVQemkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jFftS8L/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7sLUlKxr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jFftS8L/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7sLUlKxr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jFftS8L/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7sLUlKxr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jFftS8L/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7sLUlKxr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54FEB1F7E8;
	Fri, 13 Jun 2025 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gtm2xUuR8zc4oSWqks7xYNWtqnY1C2Gsf3TdH2mgmCs=;
	b=jFftS8L/YWN1y0WRcMtSw7tanV+pmp9whLABV/37qgf7VqqFf0wA/NDDQi57w9bG7B9+b/
	pvLpMZ0XVhen57HRA3BvD3QKQ38AeN0UuJOrD04pDafAi5Oc7Ydyl20d5ngAnm4ha16X1V
	JYP/I7rPX9rtkG3+jj6un/zILrXWFFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gtm2xUuR8zc4oSWqks7xYNWtqnY1C2Gsf3TdH2mgmCs=;
	b=7sLUlKxrX1Ul6YMc114na7H6dVZJ+pBgvLuOVdNGEO9767l0csP+wt8TC4/w7cqIpIEg4x
	v04HNVub+4u3cUDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gtm2xUuR8zc4oSWqks7xYNWtqnY1C2Gsf3TdH2mgmCs=;
	b=jFftS8L/YWN1y0WRcMtSw7tanV+pmp9whLABV/37qgf7VqqFf0wA/NDDQi57w9bG7B9+b/
	pvLpMZ0XVhen57HRA3BvD3QKQ38AeN0UuJOrD04pDafAi5Oc7Ydyl20d5ngAnm4ha16X1V
	JYP/I7rPX9rtkG3+jj6un/zILrXWFFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gtm2xUuR8zc4oSWqks7xYNWtqnY1C2Gsf3TdH2mgmCs=;
	b=7sLUlKxrX1Ul6YMc114na7H6dVZJ+pBgvLuOVdNGEO9767l0csP+wt8TC4/w7cqIpIEg4x
	v04HNVub+4u3cUDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3416B13782;
	Fri, 13 Jun 2025 08:22:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2ujmCtvfS2jQKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 08:22:51 +0000
Date: Fri, 13 Jun 2025 10:22:50 +0200
Message-ID: <87ikl0rqxx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jonathan Lane <jon@borg.moe>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged
In-Reply-To: <20250611193124.26141-2-jon@borg.moe>
References: <20250611193124.26141-2-jon@borg.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Wed, 11 Jun 2025 21:31:25 +0200,
Jonathan Lane wrote:
> 
> Like many Dell laptops, the 3.5mm port by default can not detect a
> combined headphones+mic headset or even a pure microphone.  This
> change enables the port's functionality.
> 
> Signed-off-by: Jonathan Lane <jon@borg.moe>

Thanks, applied now.

But at the next time of patch submission, please put maintainers to
Cc.


Takashi
