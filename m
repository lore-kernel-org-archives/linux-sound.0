Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD33A63F4
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 14:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127769; cv=none; b=IxrWWmiN23KPzswENmVsmN2IK7nwocPBrzLyQ1TTviphUfqe21inFtq5ZqcOTjuxQrIloRt3amnxMZmS8kS3Q1Q3YjiKmXIuzoTNh8lZvGE0OdLfSr+8E3+Qg3mQ+2vH1U+HDV+Kb2isICPEWPohFz9ApAUgNleM/TI035ISeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127769; c=relaxed/simple;
	bh=By0ou5JwzrABtksRqyuPHmSJcIevsPgSDMKLio+WVqU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rqz+/BxN3JR1PUdaMAOlIi/KlEWSz32EYFa7TVSuWT5ZmkYhmD+G1fSqCdkFwULmejDjnsldHh5cv9/wiTZTBC9Q5AylM5YJzMO5dSsb9VHuTenezGIhyPl9bEXgZ997v7tFig4FPq2ej6vye0Q8hCNhlUxV1Wz6kwYMaoErc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wvhbhspc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EMrSuzgo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wvhbhspc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EMrSuzgo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wvhbhspc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EMrSuzgo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wvhbhspc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EMrSuzgo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94ED63E6C3;
	Tue,  3 Feb 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770127766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBX82XI6fyGMracgbQK9c7h9khoUQsqfsvGecX1OKA=;
	b=Wvhbhspc37wA8fH1zyjf2bf6ei5Qn51fkQUUTM1gRJ2YNXE8ezaASUuUugHM6JdjDsXr4v
	johsXQHzD4+lDjricDRuk95QGL75dgUCn8oMQ41lCFODPMDkJ4+e82E75ZOkGaVErUXvZ5
	VhgYc/3qEvxZOPWGUZebwK2vujAVQR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770127766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBX82XI6fyGMracgbQK9c7h9khoUQsqfsvGecX1OKA=;
	b=EMrSuzgoQzt7MG9dNZI69+xjTPZmVvyw8MmJvo7BbMKzx5Xp8DecRcnSyJLoOOQmCCK429
	WidRrRSnbsmMyRBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770127766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBX82XI6fyGMracgbQK9c7h9khoUQsqfsvGecX1OKA=;
	b=Wvhbhspc37wA8fH1zyjf2bf6ei5Qn51fkQUUTM1gRJ2YNXE8ezaASUuUugHM6JdjDsXr4v
	johsXQHzD4+lDjricDRuk95QGL75dgUCn8oMQ41lCFODPMDkJ4+e82E75ZOkGaVErUXvZ5
	VhgYc/3qEvxZOPWGUZebwK2vujAVQR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770127766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBX82XI6fyGMracgbQK9c7h9khoUQsqfsvGecX1OKA=;
	b=EMrSuzgoQzt7MG9dNZI69+xjTPZmVvyw8MmJvo7BbMKzx5Xp8DecRcnSyJLoOOQmCCK429
	WidRrRSnbsmMyRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73C953EA62;
	Tue,  3 Feb 2026 14:09:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rQO2G5YBgmnUbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Feb 2026 14:09:26 +0000
Date: Tue, 03 Feb 2026 15:09:22 +0100
Message-ID: <87a4xply0d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?wO7B+tDL?= <coregee2000@gmail.com>
Cc: syzkaller@googlegroups.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Kernel Bug] KASAN: slab-use-after-free Read in loopback_trigger
In-Reply-To: <CAHPqNmzY=zVGq0r7g-ED0Rtmi-7udMW51AAb7rex5A0vcBJMjA@mail.gmail.com>
References: <CAHPqNmzY=zVGq0r7g-ED0Rtmi-7udMW51AAb7rex5A0vcBJMjA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 02 Feb 2026 07:27:45 +0100,
ÀîÁúÐË wrote:
> 
> Dear Linux kernel developers and maintainers,
> 
> We would like to report a new kernel bug found by our tool. KASAN:
> slab-use-after-free Read in loopback_trigger. Details are as follows.
> 
> Kernel commit: v6.18.2
> Kernel config: see attachment
> report: see attachment
> 
> We are currently analyzing the root cause and  working on a
> reproducible PoC. We will provide further updates in this thread as
> soon as we have more information.

Thanks for the report.  Judging from the stack trace, I believe it's
the same bug that was reported recently:
  https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com

I'm going to submit a fix patch.


thanks,

Takashi
