Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ACF2770B;
	Sun, 29 Dec 2024 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735461144; cv=none; b=rUNieTdMM1jB1IaE6enIFRdw4zcyukmYgv+TXgOMzbELeQgdyl4807RQY/BxjtGUyshCF4lxJXjBD8ZifCQhcaK0Pprk8LBuojvFzwGKoT7Rq+Y4RrHOJ9+uMLb3jbAYJbiJuxGswlrJrGCUw6vzHujXz43S5UjrWyej7Je0tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735461144; c=relaxed/simple;
	bh=VoP9fqUqkbmFEriUbrNCDx5BiUG6QLIQIoUeo1n7cJE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSoYxDMkCMBuXhnxODM0bnxQ6mHeivZxEFnZdxTLaO41hYqjOeG26XYjBGtp9SIE4xIzVeketL07XoTllFgZSjfNH14FcCu7VI/61zS11V5/vt9Jhq395ckhS0J31E7VEtwIxgwjvqoaX+FOayyYZCz9LkthKNY2HHJR6/NMWjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fKsCiCus; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gETDlPDp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fKsCiCus; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gETDlPDp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fKsCiCus";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gETDlPDp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fKsCiCus";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gETDlPDp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B727634BFD;
	Sun, 29 Dec 2024 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735461140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LiBbneBccxUc7/hdzcgfEJeLAE1EdeaqUGvLJnfBb30=;
	b=fKsCiCuskYZhHjLC/iRd+uBHOw3C12iHChOMVK9NR8vcJFt/tz3hKRs1Mab56zGVXH2X1n
	SCg5TjGBVULCs/cvCYRuK+E9tahnWcxxh5QsNaiPrfdRW1VayDdL9ggPcjaY0YdZektHJl
	15UICkzt/Y8UCo5TPxTCZIIerMUnvKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735461140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LiBbneBccxUc7/hdzcgfEJeLAE1EdeaqUGvLJnfBb30=;
	b=gETDlPDpkqQ3j9SszbHjNbgGgOQqWTnlKvm8gA2V1UrP5n3ptP+tAhvG18D9vYygxqE8u0
	KubGKwDfjY0b/FBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735461140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LiBbneBccxUc7/hdzcgfEJeLAE1EdeaqUGvLJnfBb30=;
	b=fKsCiCuskYZhHjLC/iRd+uBHOw3C12iHChOMVK9NR8vcJFt/tz3hKRs1Mab56zGVXH2X1n
	SCg5TjGBVULCs/cvCYRuK+E9tahnWcxxh5QsNaiPrfdRW1VayDdL9ggPcjaY0YdZektHJl
	15UICkzt/Y8UCo5TPxTCZIIerMUnvKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735461140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LiBbneBccxUc7/hdzcgfEJeLAE1EdeaqUGvLJnfBb30=;
	b=gETDlPDpkqQ3j9SszbHjNbgGgOQqWTnlKvm8gA2V1UrP5n3ptP+tAhvG18D9vYygxqE8u0
	KubGKwDfjY0b/FBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80442139D0;
	Sun, 29 Dec 2024 08:32:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eDaIHRQJcWcHQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 08:32:20 +0000
Date: Sun, 29 Dec 2024 09:32:20 +0100
Message-ID: <87plladh4b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "wychay@ctl.creative.com" <wychay@ctl.creative.com>,
	"ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
In-Reply-To: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 25 Dec 2024 00:16:17 +0100,
Ethan Carter Edwards wrote:
> 
> Hello all,
> 
> First of all, happy holidays. 
> 
> I was browsing the ctdaio.c code and I noticed a lot of 
> duplicate code and functions, specifically:
> 
> dao_set_{right,left}_input and
> dao_clear_{right,left}_input functions.
> 
> The functions are pretty much identical. They only 
> differ in the side (left, right). What was the original
> idea in doing this? Wouldn't it make more since to just
> have an ENUM (left, right) as an argument that would 
> determine the side and just reduce the function to 
> dao_set_input and dao_clear_input. 
> 
> I would be more than happy to send in a patch doing
> these changes, but before I did I wanted to ask if
> there was a reason the code was written in this way.
> I am pretty new to kernel development.

Yes, the code simplification would be appreciated.
You can create a common function and call with the left/right
argument from each callback or change the call pattern from ctatc.c.


thanks,

Takashi
