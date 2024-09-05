Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FBEDDBE;
	Thu,  5 Sep 2024 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546536; cv=none; b=Yzxx8aplfXORzRvrM5TWPv5VpsAK21vrCeKHAliwFX0f+kHMM0eg3yHigEoIBTKT7iJH2sdUNz/SumUHbJQJwwZJaOSkludSaSealri9NpqnftZt4vho0D/LKjZvNyyqsdfMsffb798r+IMfRHZBChj0C+gSWVcRhZJIryZBJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546536; c=relaxed/simple;
	bh=fZDckw7kSl1Hfmb5LzNIExLnGde3nsIt4LFmS7FrWQs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJby3xDdBx1MKsa57qVpbF4u7KFueXJpPFfSCa5JV0O7ettVysz+h9rPlQOqed+FZ4DfFz84ld2tMQ84U3fO9GPz5ZUlDw+0Ow86Y2ZuK9BI51yZkvnUwvqqBD+lvHcczXQDJQiog3GXImbSwwUMRxTruFLtiAVGllcrr7XjCBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cC9O47mq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NMnfVI6b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cC9O47mq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NMnfVI6b; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cC9O47mq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NMnfVI6b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cC9O47mq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NMnfVI6b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A95021A5A;
	Thu,  5 Sep 2024 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725546533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=46mMbCgCKb1+lzTeb6HN/ru3yJRDv8ge+rIuboASFGs=;
	b=cC9O47mqgiZnA9S5IJHbcx3QgbtsGJlu7ZQm8FwwF7geX3Wu+LJnndz4vtckj981zDVmns
	VDn3qAEAqNTJezpx6PoSiRJ643oYe8C27WrYfsifFbnbBa/DlkJZcUvaWnZ4t26wrQjOjd
	Fai01oTMZ7K3aam/j9ieecD6qKpfXpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725546533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=46mMbCgCKb1+lzTeb6HN/ru3yJRDv8ge+rIuboASFGs=;
	b=NMnfVI6bS59H45jMXjaOJhrBbI4/EaSQ1f6vmKJySWMMQfd/H8fQOM/Cqa3WEYsuZUTLQv
	P3RMSTTlm5f/j5Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cC9O47mq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NMnfVI6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725546533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=46mMbCgCKb1+lzTeb6HN/ru3yJRDv8ge+rIuboASFGs=;
	b=cC9O47mqgiZnA9S5IJHbcx3QgbtsGJlu7ZQm8FwwF7geX3Wu+LJnndz4vtckj981zDVmns
	VDn3qAEAqNTJezpx6PoSiRJ643oYe8C27WrYfsifFbnbBa/DlkJZcUvaWnZ4t26wrQjOjd
	Fai01oTMZ7K3aam/j9ieecD6qKpfXpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725546533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=46mMbCgCKb1+lzTeb6HN/ru3yJRDv8ge+rIuboASFGs=;
	b=NMnfVI6bS59H45jMXjaOJhrBbI4/EaSQ1f6vmKJySWMMQfd/H8fQOM/Cqa3WEYsuZUTLQv
	P3RMSTTlm5f/j5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AD0E1395F;
	Thu,  5 Sep 2024 14:28:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X79XBCXA2WZdGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Sep 2024 14:28:53 +0000
Date: Thu, 05 Sep 2024 16:29:39 +0200
Message-ID: <87y146fa24.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Fix inactive headset mic jack for ASUS Vivobook 15 X1504VAP
In-Reply-To: <20240905140211.937385-1-kovalev@altlinux.org>
References: <20240905140211.937385-1-kovalev@altlinux.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 4A95021A5A
X-Spam-Score: -5.44
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.44 / 50.00];
	BAYES_HAM(-2.93)[99.71%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 05 Sep 2024 16:02:11 +0200,
Vasiliy Kovalev wrote:
> 
> When the headset is connected, there is no automatic switching of the
> capture source - you can only manually select the headset microphone
> in pavucontrol.
> 
> This patch fixes/activates the inactive microphone of the headset.
> 
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>

Thanks, applied now.


Takashi
