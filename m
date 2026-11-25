Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614178;
	b=OZlEB53kkufJTFAepTXeg6SB4+Lh9/u3uj8Pc8qPfbJmQmjO4M1OE/a7ihl9umharFsb
	 mIwAenRdopADeEXuAvwpX+zQRO557qZiorK7zDBEHqIqqU1cbkRRX6FjoM8k3uZlUP0FX
	 Vvkf96v2u4OHjpgjcIAnNhMvg1ZRg++CjtUTyLyT8oemlb6NgkcHxFfS1JHvdpeapWloe
	 ph0nRTh2vklQmnMDQhYNT2P7XC5UBD6pkTpwOqWLPoybbpST1hbcdq+C5uWzHIfcc3VO6
	 c8GEbhlcF6MCXPuFmTpJH4kvbn9AKbjLijxiwwZHSrN70SxVOtFdYX21UvAgGBzrSSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614178;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=EtfHkyG0TI1AIEN3iCr0BQBdYHS/LFMHBwSAmXjWlpg=;
	b=M6OR+ya0iZPcWQvLnZrax3MFWxYZaYdr+wqWtbF26/aXjna/89g0hgyTEsVhtRjxAwO3
	 KP00QUxDac2vqm3xnCborfpoWPiTNbGjpdna5zr4b+T8r3TfDjzKVA22ynLclpAlTcnVm
	 XojLktZwqCd1mmfO4qsrfMe6NFj0EOAr8OJtHxzJrVKJIPhzleS7+hLTDzDUyv4wZtP5M
	 V16yxQS/IxFY2rXp6RxgPwiLU73fcq6wawjKnPuQKHxQwDlhRnl+EyZ4WwomG5Scq0cxU
	 cL7l4HTNPuZ07TLpRHnJylFvdICs7tCyO78UcONHzYBI0lEtSFODFs9VNsJlwBuXqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LpcTYigv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RThW3YGg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LpcTYigv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RThW3YGg;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8324A606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8324A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LpcTYigv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RThW3YGg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LpcTYigv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RThW3YGg
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6A471F790;
	Wed, 25 Nov 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtfHkyG0TI1AIEN3iCr0BQBdYHS/LFMHBwSAmXjWlpg=;
	b=LpcTYigv+S4eQhy9acpZSkLMQ+lw930ZfAsri/HnpvQyUt4ZTtd2Tm/sD2yIPQ3gFIJ811
	9YL9VhgnohSVdax5xfImFO0K0rLzRFjxvtBuZlZlhMk7iMcSTWDYeW3bY1jBJjigMrrd9f
	VWy+cObfvME7oDUw3pqvAezRYEiHYeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtfHkyG0TI1AIEN3iCr0BQBdYHS/LFMHBwSAmXjWlpg=;
	b=RThW3YGg6uSKFy087xbDt81TuIINi49XqLD1tEGf280OGv2HOKZkNODtlRMQ8+qJZhT6PT
	dF50is511mkr/9DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtfHkyG0TI1AIEN3iCr0BQBdYHS/LFMHBwSAmXjWlpg=;
	b=LpcTYigv+S4eQhy9acpZSkLMQ+lw930ZfAsri/HnpvQyUt4ZTtd2Tm/sD2yIPQ3gFIJ811
	9YL9VhgnohSVdax5xfImFO0K0rLzRFjxvtBuZlZlhMk7iMcSTWDYeW3bY1jBJjigMrrd9f
	VWy+cObfvME7oDUw3pqvAezRYEiHYeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtfHkyG0TI1AIEN3iCr0BQBdYHS/LFMHBwSAmXjWlpg=;
	b=RThW3YGg6uSKFy087xbDt81TuIINi49XqLD1tEGf280OGv2HOKZkNODtlRMQ8+qJZhT6PT
	dF50is511mkr/9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6370C1339F;
	Wed, 25 Nov 2026 13:42:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dDHbEN/lBmuANQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:42:55 +0000
Date: Wed, 25 Nov 2026 14:42:54 +0100
Message-ID: <87y0ah6n8h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 0/5] ALSA: Remove orphaned prototypes
In-Reply-To: <20261124195704.41649-1-amade@asmblr.net>
References: <20261124195704.41649-1-amade@asmblr.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Tue, 24 Nov 2026 20:56:59 +0100,
Amadeusz S³awiñski wrote:
> 
> Some of the ALSA code either declares functions that were never
> implemented or at some point were removed leaving orphaned declarations.
> 
> Clean up by removing them. Build tested with make allyesconfig.
> 
> Amadeusz S³awiñski (5):
>   ALSA: hda: Remove orphaned function prototypes from hda_local.h
>   ALSA: hda: Remove orphaned snd_hda_get_codec_name() prototype
>   ALSA: gus: Remove orphaned snd_gf1_mem_free_owner() prototype
>   ALSA: sb8: Remove orphaned PCM open/close function prototypes
>   ALSA: emu10k1: Remove orphaned snd_emu10k1_memhdr_init() prototype

Applied all patches to for-next branch now.  Thanks.


Takashi
