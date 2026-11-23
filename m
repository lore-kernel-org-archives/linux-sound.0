Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424446;
	b=Um/IvToKvrYiEh0s9FX52MJk08/G4Rhbu1EIDn4HnZsE424w8/Kb2NBcRySKgRGdNTFd
	 LRdQHUMEiJr7cOZxvSVsOv/3te7X9Lyo0Gt2AYdzJhMsUlmUR7rAskMhg8836XpJm5Lrl
	 k3OnBDuL93j0ehoEWDrWhirVYhpzS4KKJk/ULU4wV3Azgy0cva4EazUY9W7g0tZozpit9
	 HJnWbNCNLenK6otZbrV/x8QyBTX2ds3lPaGj7CcIH/WDNvlb3k3FNrkfG+N05rGYbz2MZ
	 4uISglBGupmhuzHwyfZBx+grpEIOq86r7FX0fkPqCsY4qQG5IL8/rAO4IpYi+0Hr/0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424446;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=NivKEz8a8pVq07v+YP4kvbe5IjDXt+db4hxVDYzCckI=;
	b=kA22Z0LfGyih4y72HS96HT5ZJGSPULArFt7XukwYVJIMQmcN2KH2XHE4ICcesg/EzdJC
	 cCcZBp1BCX6NYHfz/hfD02tbngrlMkwl29ytltvriNeygWe0WVUBn2sdf62ozCOCMxyQV
	 rFYUAJrNWCFpv8pc5Mpfjr79KqtWYr0wRK4fI8sQFDb7fM6ZXbPeWM2G5xTR9xiWLRqE0
	 D7hDchjl9ZpcLpf0DBbGLVXJuVF1/hUdDOhOBmNZazGUS+fveUnZtJq4q8OQdu6J+JU/t
	 qUysXF43tYilRjbOHVKVUB+EDtCmPZG6GI4HUAg0br7thMlyEo5BXA83xNb1+Lj7rOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fCshL0Dt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=81b2OGPr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fCshL0Dt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=81b2OGPr;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0C606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA0C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fCshL0Dt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=81b2OGPr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fCshL0Dt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=81b2OGPr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 28AFE1F7EF;
	Mon, 23 Nov 2026 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NivKEz8a8pVq07v+YP4kvbe5IjDXt+db4hxVDYzCckI=;
	b=fCshL0DtSyUBeILvbkMp5KQjJ0b7rtMAp5x3RbSMeSRr3N+t8C4pes+RbL2Et/fcoM+DEY
	2KhzTchxEMiZECOap/tzw8Q/3ZSS+OKwj5AhePbScx5mtdfXh/MyTN6GgyKYPf0vwOln8A
	YPW0YQldojmDJT9OFSDehuCLau7dxe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NivKEz8a8pVq07v+YP4kvbe5IjDXt+db4hxVDYzCckI=;
	b=81b2OGPrI4ZQjpY10VoBMoODP8q2yScy/9PDlRU2J9fnmlTne2/HqC30E8VgXzVbRfq1lq
	ZQdu7fVlNsaWZmBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fCshL0Dt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=81b2OGPr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NivKEz8a8pVq07v+YP4kvbe5IjDXt+db4hxVDYzCckI=;
	b=fCshL0DtSyUBeILvbkMp5KQjJ0b7rtMAp5x3RbSMeSRr3N+t8C4pes+RbL2Et/fcoM+DEY
	2KhzTchxEMiZECOap/tzw8Q/3ZSS+OKwj5AhePbScx5mtdfXh/MyTN6GgyKYPf0vwOln8A
	YPW0YQldojmDJT9OFSDehuCLau7dxe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NivKEz8a8pVq07v+YP4kvbe5IjDXt+db4hxVDYzCckI=;
	b=81b2OGPrI4ZQjpY10VoBMoODP8q2yScy/9PDlRU2J9fnmlTne2/HqC30E8VgXzVbRfq1lq
	ZQdu7fVlNsaWZmBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAD391352B;
	Mon, 23 Nov 2026 09:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H1FkLLsABGu9BgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:00:43 +0000
Date: Mon, 23 Nov 2026 10:00:43 +0100
Message-ID: <87zeuzdiro.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Barnette <calmasacow@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: usb-audio: Add generic implicit feedback quirk for Elgato XLR Dock
In-Reply-To: <20261123081549.2237366-1-calmasacow@gmail.com>
References: <20261123081549.2237366-1-calmasacow@gmail.com>
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
X-Rspamd-Queue-Id: 28AFE1F7EF
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Mon, 23 Nov 2026 09:15:49 +0100,
James Barnette wrote:
> 
> The Elgato XLR Dock (0fd9:00a6) returns digital silence from its
> microphone when the playback stream is started before the capture
> stream. Starting capture first works.
> 
> Enforcing the generic implicit feedback mode
> (quirk_flags=0fd9:00a6:0x20000) fixes it: with the flag set, capture
> returned valid data in both start orders, while without it every
> playback-first trial captured 0 nonzero samples.
> 
> Add a quirk entry for the device.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: James Barnette <calmasacow@gmail.com>

Applied now.  Thanks.


Takashi
