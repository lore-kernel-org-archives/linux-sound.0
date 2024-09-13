Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD71D86E3
	for <linux-sound@vger.kernel.org>; Fri, 13 Sep 2024 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223988; cv=none; b=lH0/sKcEHzbo5QbxQf91XNgO4hWakokOTksorqid1o5X5R0KS6yrncU4cd5WOvOEM+u+Eg2CWCt8vwL4XApN/zMoe25dwbBJ/X0IrA1TTQ/DUziJiNycm+utYVgetMWWqItiVDVvKuauWs55kdZ0Ws9zzbRtbBPjM4n8co9eHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223988; c=relaxed/simple;
	bh=U21chPZrgYTZgYWX5e+urW1x9wDDhoMRvcX3jdVOvbI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfKPzFe8EwgzpHkW6nCN8/iHxCYmbEm3yAS4yf3T0A/Cqh7qLVCoCZ3fRP8ARLC/E6jXoZLy7gVxe973Dj50T9bk0P5EdlBbUSnA1Ooit4AB7yMEkBMPbBkfh6krUybBoocHW8tqzrsg6RJiopk23T7P95tnr1lSxg/QV+8tGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hzXeHin5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ah+WggB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcSPZNnt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqKo4EMp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hzXeHin5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ah+WggB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcSPZNnt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqKo4EMp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C50A51FBEE;
	Fri, 13 Sep 2024 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726223984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tGJl9NK9IyCwgBxq4s9At7Pz6C5c3+9/Bal9pzkeuWE=;
	b=hzXeHin5KBAR0sVyGueE7F2RvW+KHYyaW5wwWwn1XUpyakBiX+wXHn3ZzTKLBVzmrTNni6
	ZMA+4AgD4pFLCmWJvQvv+CPosbeztKURZQPa5KE3VYapSG2UkBnz+1rd9YEb6x78v/o7wV
	6SzNwYJw19p6BC+GYtvziYXZyKw6SrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726223984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tGJl9NK9IyCwgBxq4s9At7Pz6C5c3+9/Bal9pzkeuWE=;
	b=0ah+WggBy785fSe0L4xjqT1zS9L4/LZJD96C3cxhaBjZlkCuyh5gAnUJrEzLlZ0yV/msWE
	N2XJCJvBlgE2UxAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RcSPZNnt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zqKo4EMp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726223983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tGJl9NK9IyCwgBxq4s9At7Pz6C5c3+9/Bal9pzkeuWE=;
	b=RcSPZNntpUAIbXCJXlXrSj2NA0q3ImE/qrP9AhztRP+mMRkmNxBynbp6E4DKsaU1fX+L/V
	GUZWhie4p4svgW6/M6EgJMpnRVg21T5NbjZWvlgBHnet54e/NWRtBFng0YKsDmNy9pdzn2
	Bn1vXiWKxyZbTkER/LAWYzE0Y2NO3EY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726223983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tGJl9NK9IyCwgBxq4s9At7Pz6C5c3+9/Bal9pzkeuWE=;
	b=zqKo4EMpAMOb3zIOMsd2NgAhGA5wRQU/VeGeozKqYV3j1OaNG4T93zAeOI52g/y0PuJOXG
	nlVBovUuLpcUv4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0E4E13999;
	Fri, 13 Sep 2024 10:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fDOwJG8W5GaAaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Sep 2024 10:39:43 +0000
Date: Fri, 13 Sep 2024 12:40:32 +0200
Message-ID: <878qvvet0f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add support for Galaxy Book2 Pro (NP950XEE)
In-Reply-To: <20240913080055.10807-1-josh@joshuagrisham.com>
References: <20240913080055.10807-1-josh@joshuagrisham.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: C50A51FBEE
X-Spam-Score: -5.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 13 Sep 2024 10:00:55 +0200,
Joshua Grisham wrote:
> 
> Adds support for GB2Pro Arc variant (NP950XEE) based on successful
> test and information provided by Github user drewdrew0 [1].
> 
> [1]: https://github.com/thesofproject/linux/issues/4055#issuecomment-2346890020
> 
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>

Applied now.  Thanks.


Takashi
