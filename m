Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6791FDA
	for <linux-sound@vger.kernel.org>; Sat, 13 Dec 2025 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618452; cv=none; b=fFJMJ8SCJ/+dlURRwZZrtHee4jKEgIX5Zi3Z5Crk4R9zm/MkFt03HQi/Efimg1+krjQM5viacdenutWDjqBK1lzfHx3sEUxiC/HKwJbeOKd5Z/NNXJum6UbYAcn4FElZ+Vy/7kh2YV1mKvRu3G2UyMoAzou2u5uAh9mbmknVZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618452; c=relaxed/simple;
	bh=952Zsf2UbmLg+afOqb7sF1xivo5VJQaglXlKabQCHG4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHMFtIAwjVwKwh3c78vms96q5ieEmWB806lLd9kv0wxo2dpX7jj2LKXS0Vr5WW+Mme2B1AJ7PWlUlvZJNaEb+ckqL2UaseUpGeMStaZRgjTDX7J+SKEmQtvI3BowH5UVeIobSzIRpjbuzf9B0MPA9q8K58TRZTTJAWf27nikP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rtHwEo9q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GdO2t5sz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rtHwEo9q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GdO2t5sz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rtHwEo9q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GdO2t5sz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rtHwEo9q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GdO2t5sz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E3FE5BEA0;
	Sat, 13 Dec 2025 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765618448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5NFiZ3H8RjzZAmcf6ObggXS4th7qqHuTmEK5VH2Jus=;
	b=rtHwEo9qxEyy53WaFReB8AVV4cYiLgksrNCfjC4REtmBKrEWitVqQYQVBSTbukmNQW4Auz
	0V8CzHQTZ6GHtnsJ94C2gykRmlaLFDnHgVEpFP4+mnXT+rg0SD0IzUwu0ANoNfzKzZ4L0D
	G/QHSwoVPmz8XazfC7XRtC9sfUewk0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765618448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5NFiZ3H8RjzZAmcf6ObggXS4th7qqHuTmEK5VH2Jus=;
	b=GdO2t5szuiXgNmc5+5mV19+GtQ1oqkCd87Da21pOB0gmXWc8SAoTVD/e3P1IKtk+VVmk3t
	DkUu0vex9qH8mnCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rtHwEo9q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GdO2t5sz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765618448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5NFiZ3H8RjzZAmcf6ObggXS4th7qqHuTmEK5VH2Jus=;
	b=rtHwEo9qxEyy53WaFReB8AVV4cYiLgksrNCfjC4REtmBKrEWitVqQYQVBSTbukmNQW4Auz
	0V8CzHQTZ6GHtnsJ94C2gykRmlaLFDnHgVEpFP4+mnXT+rg0SD0IzUwu0ANoNfzKzZ4L0D
	G/QHSwoVPmz8XazfC7XRtC9sfUewk0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765618448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5NFiZ3H8RjzZAmcf6ObggXS4th7qqHuTmEK5VH2Jus=;
	b=GdO2t5szuiXgNmc5+5mV19+GtQ1oqkCd87Da21pOB0gmXWc8SAoTVD/e3P1IKtk+VVmk3t
	DkUu0vex9qH8mnCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A4153EA63;
	Sat, 13 Dec 2025 09:34:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z5UsCRAzPWnxKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 13 Dec 2025 09:34:08 +0000
Date: Sat, 13 Dec 2025 10:34:07 +0100
Message-ID: <87o6o2914g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de,
	Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	davplsm <davpal@yahoo.com>
Subject: Re: [PATCH] ALSA: hda/realtek: enable woofer speakers on Medion NM14LNL
In-Reply-To: <20251212174658.752641-1-kai.vehmanen@linux.intel.com>
References: <20251212174658.752641-1-kai.vehmanen@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 6E3FE5BEA0
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,realtek.com,canonical.com,medip.dev,vger.kernel.org,yahoo.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Fri, 12 Dec 2025 18:46:58 +0100,
Kai Vehmanen wrote:
> 
> The ALC233 codec on these Medion NM14LNL (SPRCHRGD 14 S2) systems
> requires a quirk to enable all speakers.
> 
> Tested-by: davplsm <davpal@yahoo.com>
> Link: https://github.com/thesofproject/linux/issues/5611
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Applied now.  Thanks.


Takashi
