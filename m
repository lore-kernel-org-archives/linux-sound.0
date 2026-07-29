Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC443A7EF
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311327; cv=none; b=fdQf0XDL7N9XeyaTBoWkP8c07+20eC9WGFxGuab4PU1llIVDF9s/Ux24H2VWcHE7ZwuMKW6oVCQAVkoqapyNw2GXgoLfzYQFpbLx5EsYCfNwWYtthp4vh39QRFflPXX+1W3/0+x5xyFpUMyH+lec/CN7VxegjeJe0reg/c9Y0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311327; c=relaxed/simple;
	bh=opZhn+bGDN4pDqfREAIVIOG3CquLi4y10ad2T0Ic1XA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzbDlDylRZuEQBYxatSZpvIJlwglY1+d63KZuM2fzuGwA+YHPadVDQ6CHvRu5bcbqt71AxfwrRs4OqSTqdhBCCNWmjjkmCZ1VFAQhKNAC9+4QPbB4xV0ZLlcZVSgEhaOSCKsPvFmKebDLYdp9dPWreED9oOaealhflLw7nBffes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YBquoABG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pu72MtY9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hCJD9Lmh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ROn1T1C2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YBquoABG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pu72MtY9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hCJD9Lmh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ROn1T1C2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D0547C958;
	Wed, 29 Jul 2026 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FsEn9iqIs1zMXxvcxsci61aY9+V2CJob9ihz9KOf6k=;
	b=YBquoABGoADBhn3ZgscAkNVn3OHVfPD73xdY1ps9wQSjYBkn7iTbQ7Z6YiOU7JKG+v2mgk
	5goGnO6SYbzmSCH9boY8wYZTWM1DCg1CbIpvOlvrbJdnhOJ1OS0A49mFGnTp65thlqMBg+
	WxUzMPtoaMm4pRXJlPxBG316XgX/u+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FsEn9iqIs1zMXxvcxsci61aY9+V2CJob9ihz9KOf6k=;
	b=pu72MtY9Qw1lpyTI+6ekR3sB+5zBFdYw3JrX8Fitvun/3GPdGuGqo/i/2xMgf0vV6M6K/I
	y+JF75bbKCuV2BCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hCJD9Lmh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ROn1T1C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FsEn9iqIs1zMXxvcxsci61aY9+V2CJob9ihz9KOf6k=;
	b=hCJD9LmhihZpKYTVUbUTQIPeI1kLT4Yequjx/xS8HZ4dvDSUauJiDqKTEQLxOLIHA3wDkc
	aZ5JdMjX7pTggECOD/9aT/zADwdd59sLSdGyDkoMIbHfrMzjvchutxrJnUFqFgC/xE/bbc
	XriycBt1jwwYPF9Ar6gE5+ncpmE53BQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FsEn9iqIs1zMXxvcxsci61aY9+V2CJob9ihz9KOf6k=;
	b=ROn1T1C2q3fcfqBT+YJBFp7m2N7iu8RVg/7v3wji31x+wOARQC0yKnEDbUwrE3DeMHqjed
	YQUHdml8jXM1OeBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3438E779B1;
	Wed, 29 Jul 2026 07:48:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QrEBC02waWoBJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:48:29 +0000
Date: Wed, 29 Jul 2026 09:48:28 +0200
Message-ID: <87bjbq5j8z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: Re: [PATCH 2/2] ALSA: hda/conexant: Add NULL check for dc_mode_path
In-Reply-To: <20260729070935.548050-2-wangdich9700@163.com>
References: <20260729070935.548050-1-wangdich9700@163.com>
	<20260729070935.548050-2-wangdich9700@163.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 6D0547C958
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Wed, 29 Jul 2026 09:09:35 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> snd_hda_add_new_path() returns NULL when no path exists between the
> given NIDs, but olpc_xo_update_mic_pins() passes dc_mode_path
> straight to snd_hda_activate_path() which dereferences it without
> checking. Add the missing NULL guards, same as the local path
> variable already has in the same function.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
