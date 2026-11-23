Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424682;
	b=hEOYyfexkdzrKenBzUiDN3eVpzqFMtqUjZeM2NQHlazIzpFoaaCnNDT2kOQe7c/IBe/e
	 1WiSlVL4v5nNAwrJ/deoquYB4ubhQRVOuWHuYTip1vSIqX8YJluAQMF18t6LQrD8qeXro
	 44teZ3N/+EMAXUPcXGgkGiQOs81Bz1ipp6yyo6Vlouxco2shbw5HVlXZRmYyzXJ8Won/z
	 AycOVRKQyAwsMMSQSSVViIsUXM6aA8lW7WcGeZw7hRqXp8Sgn58sc2QMotnr5uu2ErQ5b
	 dxjPE/3GUnZL9fWQ0J6sinrPm6thToOG4XrVTp8xdTbxX+hKLe5hUOHxVZi3FfKhlNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424682;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=DCSrFa8n//ZJUgIHCT2j7/r2nX1i1if+yUJjFUVuHaI=;
	b=hJ+qgL3dxeP4LfrcPjJCJDUxrmaOId6XB9ydeeNaWb5RHBKjDa11s+QqHUAYMSzd7Uqm
	 83GMpbx4xPG04s9qcXl7JkEsO9+njm9eN2w8NZaM3w2ZAvVymy1S3QCRoGWafZfNoWiUE
	 FT3txj2nG70XJa8b6d7mnhfp7xVd8oanflEpDgj7PS3WXihwBD7ts84LSkM/SBcyB4WlR
	 UplzhRN6gDPKt4lX+UzvE4hBk6ot+iiwJUl/galtjoO0IKcZb5sWqZN1HUISKN6kWkIY7
	 jEEPR7NY1b/PMkB9Mrb+x8utzh6YwCuohQ/TOZlsOhFnS2zd6Wg9mbEimbc00QyxFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K2QnLqxE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FuWVlpNH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K2QnLqxE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FuWVlpNH;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF40606A31E;
	Mon, 23 Nov 2026 09:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K2QnLqxE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FuWVlpNH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K2QnLqxE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FuWVlpNH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A2641F7F3;
	Mon, 23 Nov 2026 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCSrFa8n//ZJUgIHCT2j7/r2nX1i1if+yUJjFUVuHaI=;
	b=K2QnLqxEqWh/kTorZPRvQ+zZHbCgC0Z9YnQWQLv7zIRWfgjgvy2WOllQXAQajjSKLyI11D
	c3GJCGiWye3lTvyaXu3LQoMyIT4Mj635AURknwc4wTpgWiGZYvtDx4btgd5pSQ6JrBWeAE
	ORyGUp5A9F/qpP4J9AB4Erp0/VT1/qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCSrFa8n//ZJUgIHCT2j7/r2nX1i1if+yUJjFUVuHaI=;
	b=FuWVlpNHZcxBck7ChKTfzNzGaOO51hyZgUBpmTUtD6U0Gnul/tHmTGwhw3ET7L5JHDokU4
	lpejuZnxpleSEuBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K2QnLqxE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FuWVlpNH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCSrFa8n//ZJUgIHCT2j7/r2nX1i1if+yUJjFUVuHaI=;
	b=K2QnLqxEqWh/kTorZPRvQ+zZHbCgC0Z9YnQWQLv7zIRWfgjgvy2WOllQXAQajjSKLyI11D
	c3GJCGiWye3lTvyaXu3LQoMyIT4Mj635AURknwc4wTpgWiGZYvtDx4btgd5pSQ6JrBWeAE
	ORyGUp5A9F/qpP4J9AB4Erp0/VT1/qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCSrFa8n//ZJUgIHCT2j7/r2nX1i1if+yUJjFUVuHaI=;
	b=FuWVlpNHZcxBck7ChKTfzNzGaOO51hyZgUBpmTUtD6U0Gnul/tHmTGwhw3ET7L5JHDokU4
	lpejuZnxpleSEuBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA5401352B;
	Mon, 23 Nov 2026 09:04:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4/4HIKcBBGtSCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:04:39 +0000
Date: Mon, 23 Nov 2026 10:04:39 +0100
Message-ID: <87qzgbdil4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: shyckless@gmail.com
Cc: o-takashi@sakamocchi.jp,
	clemens@ladisch.de,
	tiwai@suse.com,
	stefanr@s5r6.in-berlin.de,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ALSA: firewire: Abort transactions on a bus reset
In-Reply-To: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
References: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 0A2641F7F3

On Sun, 22 Nov 2026 14:46:28 +0100,
Suyuan Wang via B4 Relay wrote:
> 
> fcp_avc_transaction() and snd_efw_transaction_run() resend their
> command after a bus reset but never move the transaction back to
> STATE_PENDING, so both loops keep resending without a retry limit
> until sending fails.
> 
> As Takashi suggested, v2 no longer resends: on a bus reset the
> transaction is ended and -EAGAIN is returned, following the AV/C
> general specification, which says that a target discards any
> transaction in progress on a bus reset.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> only (x86_64, W=1); I don't have FireWire audio hardware.
> 
> Changes in v2:
> - Abort the transaction and return -EAGAIN on a bus reset instead of
>   rearming it and resending (Takashi).
> - Drop ERROR_DELAY_MS (and <linux/delay.h> in fcp.c), now unused.
> 
> v1: https://lore.kernel.org/all/20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com/
> ---
> Suyuan Wang (2):
>       ALSA: firewire-lib: Abort the FCP transaction on a bus reset
>       ALSA: fireworks: Abort the transaction on a bus reset

Applied both patches now.  Thanks.


Takashi
