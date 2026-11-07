Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042075;
	b=qCtVoVkzvC9aNzndDvsS/DEQvwcL+rJYb33knDyVujHyXfxZD+HwIjjMxTRLZHkS2LMz
	 YcQ1FEOyyalRPWAdCpwRs4SNooB1bGS2VWPKh+hGtKhwliZdmMDy/vSsozf6MakRq+gl+
	 w9H7UC3yK89a7NF8zI8VmLNvjPvLBGtVBOu/S6EdAIS0GQExfknzttJb9yDb4eR6P/2u6
	 eEGnBotAYovEDFLehb6qzluRQFlRsEvnMNAkfeP2+FVgcuo6XMEG3qlWyrk66FXVa7I6I
	 CRW9mKwRPS8XsI3CBuLFmIVxki34P4l8K9Rf876SUqIfG+uRzIMCaduvGfqIlfa2oog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042075;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=93gQni038mE3dYG8KDdp+A9VwzsCnAOW2nIoZostcHo=;
	b=ZawR+bjjtlk+6ECKhqDgwXvd3GnDzcwdm4DgQcZ/vLiY6d5WxSyyoQCJI2mD8L1KCjTt
	 Fb24+v1ZHKIzQoeo0PHvuwmzENzTA98kjb3piIPZVHRME7I4vZ5dYTFpX3Gwl8wAUF4K/
	 dwQQJnX0but8fxQe8uLL28xsRbOYr8BS8ywB/vbxmoL6g8tpzFMGmPhUr5KBWEIIG9U34
	 s8Wg+29K319F6fhOlVzzlIFCE4wW3Dt52Wspq6iI1NcdGcWKEXGNf7+81bfCvc4rN3uDy
	 F9roJq12i9rR3o2jA6HekikNJquxEEi6I11agUjiEhOYxGp+uhJ8KhsNLWeyBhWmyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kJ9LYznk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Kmdzn4K0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kJ9LYznk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Kmdzn4K0;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2A8606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kJ9LYznk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Kmdzn4K0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kJ9LYznk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Kmdzn4K0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED3C51F797;
	Sat,  7 Nov 2026 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93gQni038mE3dYG8KDdp+A9VwzsCnAOW2nIoZostcHo=;
	b=kJ9LYznkIfi/qECk8MtCQmDkiByDoW5QboKw501v1dJBa3PSeHaS8OgZyajhmFu944wsiP
	zwUg2Z52Xed9YEavQwP7+zarQViFC08012D3jhjZQRC0ewCxkcwTYg6lCqGvo1I2pbs73w
	gsVQOLLosd57TTzznnJZW2J7KEKJG8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93gQni038mE3dYG8KDdp+A9VwzsCnAOW2nIoZostcHo=;
	b=Kmdzn4K0h6OZwl0SgiaBWKu0FHoJzL+GOyc5/5Y8AjSc/BAiJn4WJNCF47deedQ+IkfK9R
	23aITp3UeNUA49BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kJ9LYznk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Kmdzn4K0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93gQni038mE3dYG8KDdp+A9VwzsCnAOW2nIoZostcHo=;
	b=kJ9LYznkIfi/qECk8MtCQmDkiByDoW5QboKw501v1dJBa3PSeHaS8OgZyajhmFu944wsiP
	zwUg2Z52Xed9YEavQwP7+zarQViFC08012D3jhjZQRC0ewCxkcwTYg6lCqGvo1I2pbs73w
	gsVQOLLosd57TTzznnJZW2J7KEKJG8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93gQni038mE3dYG8KDdp+A9VwzsCnAOW2nIoZostcHo=;
	b=Kmdzn4K0h6OZwl0SgiaBWKu0FHoJzL+GOyc5/5Y8AjSc/BAiJn4WJNCF47deedQ+IkfK9R
	23aITp3UeNUA49BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC22B132C9;
	Sat,  7 Nov 2026 09:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VgJnINjo7molWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:01:12 +0000
Date: Sat, 07 Nov 2026 10:01:12 +0100
Message-ID: <87ik29yq07.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Devajith Jijush <devajuice@zohomail.in>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2] ALSA: hda/conexant: Add quirk for Acer TravelLite TL05-41M
In-Reply-To: <179397772915.270716.9671410898445846938@zohomail.in>
References: <179396062556.127350.15308705935335598574@zohomail.in>
	<179397772915.270716.9671410898445846938@zohomail.in>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: ED3C51F797

On Fri, 06 Nov 2026 16:08:49 +0100,
Devajith Jijush wrote:
> 
> The Acer TravelLite TL05-41M (subsystem 0x1558a600) uses a Conexant
> CX11880 codec whose analog output amplifier is enabled by codec GPIO
> bit 1.  The driver has no quirk for this machine, so the line is never
> raised and both the internal speakers and the 3.5 mm combo jack stay
> silent, while the microphone on the same jack, USB and Bluetooth audio
> work normally.
> 
> Add a CXT_FIXUP_GPIO2 fixup that raises GPIO bit 1 for this subsystem
> ID.  The verbs are registered as init verbs, so they are replayed after
> every codec resume, which matters because the codec loses the GPIO
> state on a power transition.
> 
> Note that the existing CXT_FIXUP_GPIO1 fixup raises GPIO bit 0, which
> has no effect on this board.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222238
> Signed-off-by: Devajith Jijush <devajuice@zohomail.in>

Applied now.  Thanks.


Takashi
