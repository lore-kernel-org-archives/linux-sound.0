Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5430BB8D
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292603; cv=none; b=kDBnYsgKTHu4AFcCUL1McPXEhPzP9E//W60UI285NioKB/nrgYoU4vTQi3Zc4EiJHUXzhbgJFM+NW8+EqW1Xb1NwPsvxRsoURnELctLoOp1fw4YT3ySE1UuLv4mZho7gBNoaoD73FNwpaSAwMeVcTWbYZneIuTa/iuw3itMgCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292603; c=relaxed/simple;
	bh=oq2roYZdmxdBwdKqU2FtK9GYW6csqPbOlscyjeTZV+c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DlOOGBz8wZ7WyR8GyApsyq66U+4RiUlsI65k75B1e4Vnf4zxeUCOxcp1sO1cDQ8CqL4S9qwJL34FesqZgEata+gJZXZR2krWpYvEUPCzD3WB2hHy08hYA1EUmb7vzss2BCKOJujJWLGBmkfby8zhh+Rlg2OtaIlqA/79AUN352g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g7sfO8oo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EUWNFBIk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g7sfO8oo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EUWNFBIk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g7sfO8oo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EUWNFBIk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g7sfO8oo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EUWNFBIk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97A835BD22;
	Mon, 27 Apr 2026 12:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0i2TF0unteKS++49PU3MRpsrm53fBNANDqDsaY5Nj/o=;
	b=g7sfO8ooIoi+YG24dFbr8afo7WqnIUhchEgMsMJd5fTHHFkb/7k8QxM+sYLV3NlGAjpXqA
	zrT2lk/k4ai9/K9K2jPJKX3zan2cIhgqfYtNcBGabF1wHCxTcDYGKIQDBOXXz8kv/brZjd
	APCjewJPCo+UsUaRPwnVwHG0FnlsM84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0i2TF0unteKS++49PU3MRpsrm53fBNANDqDsaY5Nj/o=;
	b=EUWNFBIk3HlmD78gMHU5pISjxwRZDZi05BbqLOkCq9q5U7riR+pPlhPnqHB16YPFAU85K9
	GcZ4uk6wso0yp6Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g7sfO8oo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EUWNFBIk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0i2TF0unteKS++49PU3MRpsrm53fBNANDqDsaY5Nj/o=;
	b=g7sfO8ooIoi+YG24dFbr8afo7WqnIUhchEgMsMJd5fTHHFkb/7k8QxM+sYLV3NlGAjpXqA
	zrT2lk/k4ai9/K9K2jPJKX3zan2cIhgqfYtNcBGabF1wHCxTcDYGKIQDBOXXz8kv/brZjd
	APCjewJPCo+UsUaRPwnVwHG0FnlsM84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0i2TF0unteKS++49PU3MRpsrm53fBNANDqDsaY5Nj/o=;
	b=EUWNFBIk3HlmD78gMHU5pISjxwRZDZi05BbqLOkCq9q5U7riR+pPlhPnqHB16YPFAU85K9
	GcZ4uk6wso0yp6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6269B593B0;
	Mon, 27 Apr 2026 12:23:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OuevFjhV72mZEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:23:20 +0000
Date: Mon, 27 Apr 2026 14:23:19 +0200
Message-ID: <87a4uozj60.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sasha Levin <sashal@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Remove duplicate cmedia entries in codecs Makefile
In-Reply-To: <20260426000327.56079-1-sashal@kernel.org>
References: <20260426000327.56079-1-sashal@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 97A835BD22

On Sun, 26 Apr 2026 02:03:27 +0200,
Sasha Levin wrote:
> 
> kconfiglint reports:
> 
>   M004: 'snd-hda-codec-cmedia-y' assigned with ':=' but was already
>         assigned at line 5; previous value is overwritten
> 
> sound/hda/codecs/Makefile contains duplicate entries for the C-Media
> codec driver ― both the composite module definition and the obj-* build
> target appear twice:
> 
>   Line 5:  snd-hda-codec-cmedia-y :=  cmedia.o
>   Line 10: snd-hda-codec-cmedia-y :=  cmedia.o  (duplicate)
>   Line 24: obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
>   Line 29: obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o  (duplicate)
> 
> This file was created by commit 6014e9021b28 ("ALSA: hda: Move codec
> drivers into sound/hda/codecs directory") which
> moved codec drivers from sound/pci/hda/ to sound/hda/codecs/. In that
> initial file, cmedia appeared once in each section.
> 
> Immediately after, commit aeeb85f26c3b ("ALSA: hda: Split Realtek
> HD-audio codec driver") reordered the entries and
> inserted cmedia at new positions near the top of each section, as part
> of splitting out the Realtek driver. However, the original cmedia entries
> were not removed during this reordering, creating duplicates of both
> lines. The second assignment harmlessly overwrites the first with the
> same value, and the second obj-* line causes the module to be listed
> twice ― neither causes a build failure, but both are dead code.
> 
> Remove the duplicate entries (second occurrence of each).
> 
> Assisted-by: Claude:claude-opus-4-6 kconfiglint
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Applied now.  Thanks.


Takashi
