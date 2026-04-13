Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EBC34028B
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104322; cv=none; b=aPFbM/BLJAEFha5aBUUDiz93vkJskche70EXTU3k4BGBvruRZZ98V0R4xEdTrDw7aQsy0d5QsOvtlfJrsHAsx5pkOpI351+gA3a2TtQKD2/S3ku2ATa3egK+fMCDKxyzAUPvZFH+Gww5YYt0egXcNPo2CnZa8LDMcnQa8YHytrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104322; c=relaxed/simple;
	bh=kib4dpjKNDV8GcR7C8BcnWoP0nPepltsTWs2JIovkFs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVnQrPT5eGNXNyqPjPosdj1artVAJLNgYKwQbucvmM0mHE9mnGcJChhDwH45I+ji+myqRLZ5NwBfFdF5MZ5lEheFlw716+c8GhPksfQiIYDEz8L0R//9cQUNcieinWqLeRKHiHusxuBNhHgg1p0n1innelBMcguFwH1jG0hJrn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AbVMqlJ8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nvWvjdXT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AbVMqlJ8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nvWvjdXT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbVMqlJ8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nvWvjdXT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbVMqlJ8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nvWvjdXT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 896905BE4C;
	Mon, 13 Apr 2026 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776104318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdGJ+eT9P/YL/Do4T/hYX5l1K/wRVwAIJjf4Bu1dqx8=;
	b=AbVMqlJ8XCntU3deu8HMBt4GLLO32B+WysFEpfzMQ97HjQT2BkDgoExDokF4ni+VUEGbid
	k+X5nL8cFPbv4oMqThUD6T0316aTOZxaKnRAaYSXbqAKOdhFSzAV2bZDdY1r1/aTIBjkKT
	BlxcLeUN5TwLOum5ChPlkM52LWWRk4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776104318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdGJ+eT9P/YL/Do4T/hYX5l1K/wRVwAIJjf4Bu1dqx8=;
	b=nvWvjdXTSkxSsK5BxqRqd9iep6Xj4VsSa7Ya4Vmo3PYipxxm9ALdd6uldDAcde0thNQAq9
	xxLomH+pLb0q0sAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AbVMqlJ8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nvWvjdXT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776104318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdGJ+eT9P/YL/Do4T/hYX5l1K/wRVwAIJjf4Bu1dqx8=;
	b=AbVMqlJ8XCntU3deu8HMBt4GLLO32B+WysFEpfzMQ97HjQT2BkDgoExDokF4ni+VUEGbid
	k+X5nL8cFPbv4oMqThUD6T0316aTOZxaKnRAaYSXbqAKOdhFSzAV2bZDdY1r1/aTIBjkKT
	BlxcLeUN5TwLOum5ChPlkM52LWWRk4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776104318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdGJ+eT9P/YL/Do4T/hYX5l1K/wRVwAIJjf4Bu1dqx8=;
	b=nvWvjdXTSkxSsK5BxqRqd9iep6Xj4VsSa7Ya4Vmo3PYipxxm9ALdd6uldDAcde0thNQAq9
	xxLomH+pLb0q0sAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DC464B007;
	Mon, 13 Apr 2026 18:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hSJ6FX4z3Wn+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 18:18:38 +0000
Date: Mon, 13 Apr 2026 20:18:37 +0200
Message-ID: <87bjfmu3k2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Exclude Scarlett 18i20 1st Gen from SKIP_IFACE_SETUP
In-Reply-To: <ad0ozNnkcFrcjVQz@m.b4.vu>
References: <ad0ozNnkcFrcjVQz@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 896905BE4C
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 13 Apr 2026 19:33:00 +0200,
Geoffrey D. Bennett wrote:
> 
> Same issue as the other 1st Gen Scarletts: QUIRK_FLAG_SKIP_IFACE_SETUP
> causes distorted audio on the Scarlett 18i20 1st Gen (1235:800c).
> 
> Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
> Reported-by: tucktuckg00se [https://github.com/geoffreybennett/linux-fcp/issues/54]
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
