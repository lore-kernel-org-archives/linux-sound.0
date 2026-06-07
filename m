Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9C256C8D
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780817078; cv=none; b=jcZg7ToQI/pHGE/Yy0QooXR+QYPd3dXbB6rq8umr+/2hxOVKJ+NtTahhUWBWM9mo2gRkd2NLHohTQSs/Kj4B8ysi52YkzyBJR+gJF7I3ahIJbRw6lgOc1bCewXAjGzZoPWZRyw63e8v0DdAmS90lmayCNTglpOFbq09pPrii3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780817078; c=relaxed/simple;
	bh=r92reyPTghbSEpy3ifrby0DOJzWOJKOUq/IrCOsCjnY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=km0g0MsPZhbVIXVSgamLcEThT18GAC8rfaOPFgQVXf91ySwcVAXZn0zdU/IIuhIrPDIKThmuyVNmcmoe8JCeQw0r22zReQ6sUW1N9YvHOz1wBpF70h8Ueg+aXPoCFrTClbGZRoNgZy5RaRtKJEINbtHcVCzpV/fw5DlN1vYdkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IuAYbdtb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+D5f9+tC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IuAYbdtb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+D5f9+tC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IuAYbdtb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+D5f9+tC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IuAYbdtb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+D5f9+tC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A44616A887;
	Sun,  7 Jun 2026 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780817074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2WTIsede0O5ibQ/vGctnxiyQKgVELOYGnRs8On1SpVc=;
	b=IuAYbdtbECP0YU3C9dh8SclNtl0M2G1818yjU+WaSfnnCUPU6JBBVOZIZ1+RKrkw6vR8IL
	qZy8XqWEAO8eTnlAW+1cNghkJnqXlTCe+DOx7QuqXlLiVbeEjMeb21aD3aBpiJZ5nsDdZw
	2VFu5U2HRx1luDtOqg0L+6C4y6UOgCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780817074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2WTIsede0O5ibQ/vGctnxiyQKgVELOYGnRs8On1SpVc=;
	b=+D5f9+tCzb7RaKdTtMwbsiLRyaTrIbBGfzf1GcbdJzHAeFe4WO342UVc7aC9QZ2ujRyCVS
	UCfuIBvof3EsvzCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IuAYbdtb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+D5f9+tC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780817074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2WTIsede0O5ibQ/vGctnxiyQKgVELOYGnRs8On1SpVc=;
	b=IuAYbdtbECP0YU3C9dh8SclNtl0M2G1818yjU+WaSfnnCUPU6JBBVOZIZ1+RKrkw6vR8IL
	qZy8XqWEAO8eTnlAW+1cNghkJnqXlTCe+DOx7QuqXlLiVbeEjMeb21aD3aBpiJZ5nsDdZw
	2VFu5U2HRx1luDtOqg0L+6C4y6UOgCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780817074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2WTIsede0O5ibQ/vGctnxiyQKgVELOYGnRs8On1SpVc=;
	b=+D5f9+tCzb7RaKdTtMwbsiLRyaTrIbBGfzf1GcbdJzHAeFe4WO342UVc7aC9QZ2ujRyCVS
	UCfuIBvof3EsvzCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8501D779A7;
	Sun,  7 Jun 2026 07:24:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m978HrIcJWqSOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Jun 2026 07:24:34 +0000
Date: Sun, 07 Jun 2026 09:24:34 +0200
Message-ID: <87ik7usthp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kyle Zeng <kylebot@openai.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: seq: Clear variable event pointer on read
In-Reply-To: <20260607004129.61345-1-kylebot@openai.com>
References: <20260607004129.61345-1-kylebot@openai.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A44616A887
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
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
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sun, 07 Jun 2026 02:41:29 +0200,
Kyle Zeng wrote:
> 
> snd_seq_read() copies a queued variable-length event header to userspace
> before expanding the payload. Queued variable-length events use
> SNDRV_SEQ_EXT_CHAINED internally, and data.ext.ptr points at the first
> extension cell.
> 
> The read side strips SNDRV_SEQ_EXT_* bits from data.ext.len before the
> copy, but it leaves data.ext.ptr untouched. A userspace sequencer client
> can therefore write a direct variable event to itself and read back the
> extension-cell kernel address from the returned header.
> 
> Clear the temporary header pointer before copy_to_user(). The original
> queued event remains unchanged and is still passed to
> snd_seq_expand_var_event(), so payload expansion keeps using the
> internal chain.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

Applied to for-next branch now.  Thanks.


Takashi
