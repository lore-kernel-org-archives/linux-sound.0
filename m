Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1BF2797AC
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108491; cv=none; b=SqeD9sj0pE/O3tSD0UUp23JmxoWqcMoTDQRbd9ehxBDpsl601SjWfbccSZUtjqaQu0vBmOashkOMG0GA39rzzbVayfj9A4EQWfpv0NUsKYcj2g1eaQBdorZbta4dsDrWJxXyH0N9E//DsV0XjosDVi1bvaFsLUP5w5Bwry+wbNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108491; c=relaxed/simple;
	bh=TZdsfRxKpEJINsy8idthSp790IozmKnfcbSo0smK0bI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLqgGoiNy852TFcYKXGuJhKww3Zt4JnaiDlr0fD1tHFKz+BkA8+f+u8vBD0e+kcb9VdkDVYWSmRCYVrDRct8lkUAvCJL2SL9xEJUjgmmMpevH8uKrzrghkxfIHQ1vrXD/ollpnrbnfRaPZaupY5r43qN+RQuxaaGw0kwA11Poxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MWiKGJE8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ry8ji8HY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WXoZ0o9D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z+sVtZAF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MWiKGJE8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ry8ji8HY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WXoZ0o9D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+sVtZAF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB7AE1FA8A;
	Thu, 26 Feb 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772108489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hm01u35oqWyz99ZtKeAU9bbK+aymaWt8edjCklFAGJA=;
	b=MWiKGJE8cyM+yulcRZhmzRwOwkN3j1uRdWn/5bYAOCaf+B8w/dyZpMigOu/r7zHuBdnFxC
	Vudop/NjHYf10biotOdNUUhT9z+RIstI6WiYy0QndHl9OBjt8lLYnD7WnZU44rm48t0gYs
	0B/sWW3tN3OH55pWaQM8WlDFwE7JjJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772108489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hm01u35oqWyz99ZtKeAU9bbK+aymaWt8edjCklFAGJA=;
	b=Ry8ji8HYNAqUHELqPvrIXxHQTdX9aGmISdlzOdp9DPRZyEksVw2GHbEthQmxtn0/9Fs7fO
	9SXFGc+27FLja5Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WXoZ0o9D;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z+sVtZAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772108488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hm01u35oqWyz99ZtKeAU9bbK+aymaWt8edjCklFAGJA=;
	b=WXoZ0o9DEzIje7xh1ElUGh5TiMawjU2l/RJlHSgKo68tZV0Gm7dtuMBDezpUZqBpwuqRs6
	5zcq+TVbcweAlbF1xuRXCRDukpjaOYVwxAIXoTS+cMMTes4ASmn0V4AkPQkCQURRaQKUJr
	QIz0ZaQRpfD5+6HRkc4LI5RcgCodjAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772108488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hm01u35oqWyz99ZtKeAU9bbK+aymaWt8edjCklFAGJA=;
	b=z+sVtZAFDWf+BVc/Y9qSf17MVVy+iMM2WdpDk/HY0EOXMjNIhMl1kxNEEwVuKrZeVsi9TO
	bGqL1sc67LyOFgAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A115F3EA62;
	Thu, 26 Feb 2026 12:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2R/iJcg6oGntEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 12:21:28 +0000
Date: Thu, 26 Feb 2026 13:21:28 +0100
Message-ID: <87tsv3bsqf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc1
In-Reply-To: <de64faa8c22aa935fb62b898f33f7f58@kernel.org>
References: <de64faa8c22aa935fb62b898f33f7f58@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CB7AE1FA8A

On Thu, 26 Feb 2026 13:13:35 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc1
> 
> for you to fetch changes up to 32fc4168fa56f6301d858c778a3d712774e9657e:
> 
>   ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table (2026-02-23 14:52:11 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.0
> 
> One quirk and a fix for handling of exotic peripherals on cs42l43.

Thanks, pulled now.


Takashi
