Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5F3A3E7F
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561000; cv=none; b=IQqxx+kdlxHV2CCM438ou/mAkqfuVPYpS4hUXTFOGFqgBShde0xKHYTupROAnYfqLdcGQTeXE9hJuwgFyFiXgMhHEDSRmT7sAwNFzi4g3tL8nHdmVqZ5M/s8DWoyixuBiFGZwZ94kia8RrenhmBiRdY/7CdK5/yXLsALgZSReyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561000; c=relaxed/simple;
	bh=7BiW+jmuXSfowNkMnQshW0mUD3WcwNl7PDrdWT8ejmA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o81xBAQZvuTUYqkpSoI9BpXCxZd8xIEuL5mDKvR+dbSfUl6SHimctpkv+ncLUVRZ2lqwjUU+OvqOr2z2WCsUEbZxv2F1JltS68zM6L5nvWkv7m/Io67E+FouoYoOGmEPo3wz/99waqMpaKR0+rIhQOCSDiJ0a5Sg7vcv3lS4534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uqC8/ufe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zmGP6wzy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uqC8/ufe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zmGP6wzy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uqC8/ufe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmGP6wzy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uqC8/ufe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmGP6wzy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1F5267EA6;
	Thu,  4 Jun 2026 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780560995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uf4TNrwLzVQqqWik+eL6akOClSvyi3duiCd8meZ3wlo=;
	b=uqC8/ufeiCx8gAXclx2T9RTswX9Qok+rmruR85PbCuc+km+99WKwHTTIQJ9F8Cv4Vjg8Mb
	Z/LmhtrraC6GqRmtW62P8G1r7gx95CBkOertkW60PAaOHEh1V2Lh2Fw0Boqrz1WkYvlfqS
	gWJsohW+Izko4lmjkd/OsOpHg/XtHqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780560995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uf4TNrwLzVQqqWik+eL6akOClSvyi3duiCd8meZ3wlo=;
	b=zmGP6wzyaDdQC7ldB41NWevIOhjFtENtNKfzO9Xvso6rH+RWVHndCDAl0UTtyxWQFkeEcA
	qVYRRtMxMpX54wCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780560995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uf4TNrwLzVQqqWik+eL6akOClSvyi3duiCd8meZ3wlo=;
	b=uqC8/ufeiCx8gAXclx2T9RTswX9Qok+rmruR85PbCuc+km+99WKwHTTIQJ9F8Cv4Vjg8Mb
	Z/LmhtrraC6GqRmtW62P8G1r7gx95CBkOertkW60PAaOHEh1V2Lh2Fw0Boqrz1WkYvlfqS
	gWJsohW+Izko4lmjkd/OsOpHg/XtHqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780560995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uf4TNrwLzVQqqWik+eL6akOClSvyi3duiCd8meZ3wlo=;
	b=zmGP6wzyaDdQC7ldB41NWevIOhjFtENtNKfzO9Xvso6rH+RWVHndCDAl0UTtyxWQFkeEcA
	qVYRRtMxMpX54wCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D445779A8;
	Thu,  4 Jun 2026 08:16:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g/BwGWM0IWpHAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 08:16:35 +0000
Date: Thu, 04 Jun 2026 10:16:35 +0200
Message-ID: <87cxy6wwik.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ALSA: usb-audio: qcom: Improve error logging in USB offload
In-Reply-To: <20260603091102.231370-1-wangdich9700@163.com>
References: <20260603091102.231370-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 

On Wed, 03 Jun 2026 11:10:59 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Add error codes to error messages for better debugging.
> This helps identify the root cause when USB audio offload fails.
> 
> Error messages now include the actual error code returned by
> xhci_sideband operations, making it easier to diagnose failures
> during USB audio offload setup.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied all four patches to for-next branch now.

But, at the next time, when there are a series of patches, please give
a cover letter to understand better the big picture.


thanks,

Takashi
