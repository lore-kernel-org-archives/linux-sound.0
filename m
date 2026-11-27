Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800476;
	b=5teUba/LiEuVYbcz+1661+mWbmm35Okyoifv66exZtqXH/w9eaSxHDOwh0Wr1euvUvfE
	 Dl8300uTurlFC3gRjPISKEcKEX9l/qrCL17UqxJEg9soodIkXSTuIfZDeu4VckwFhSAv9
	 jS3p/fVRvMrAI8n/D42KHktIM2jL4jTKPYJAtpFwATv+iikydqa1IDJvLPsmO59+rnbsk
	 fkRRTHQYqTgeEJ30zv9X9jkVdibneek5S+dtM1YtI8GF7SzSlru7mHRdvjFWjRSVGXhBg
	 ImZMoYiecPnwWLKlM4ArmAMC5zJiJ5424j10VnsrXO1yDQQUutfeSYcy48WacdWqYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800476;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=VR0uH1F3b6mTGi6lgL5A4cX1F/jrWocQf8pwCPqd+uk=;
	b=FQYI2nnL1ZzOppfKV6deFdIpbvCYSPzzO+1gX1vCnJVmkuPCHqb0Iu1RLn85O8Z3nF8s
	 ju7B/TcCm2oZTybe1uwtLAEm5EUEEX+0OpnsPzxtIaw/n6NGIEtACp+H2m7L43UVP89rX
	 4DzuZ4gOluLPa3GFw7s66uGYJtU6QLkjK4FhXCmln8yjlxIrOeL2LasanpM0Sn0VSaBCW
	 n3RHJiUfIpDJBCoycsxK+fESLqBB4TehTSk/nkegkJARR7e6YDltQbEB7dKpXeDUXdxRn
	 fL2FzwddAdwQGoyl51ASLWdgGONuHyEIYMRx+SoFfmsB9dUqi635NKYySVq+qJks5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VSNp2O2b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cB5srzyR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VSNp2O2b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cB5srzyR;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D40606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VSNp2O2b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cB5srzyR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VSNp2O2b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cB5srzyR
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A01981F46E;
	Fri, 27 Nov 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VR0uH1F3b6mTGi6lgL5A4cX1F/jrWocQf8pwCPqd+uk=;
	b=VSNp2O2bE/USYq8jeaVKPraz8LdhFqMxc449s5++DLCTLAhF7/3hCf3GKhG80gRo6RE/W8
	TOikFC1s/gpdgbU1RHb/gfIHQSc4NfxkrfvJ6rqXRoYT7EMbk1HkB0NSNG5+Yb3nQcu/h0
	0Rg9aZEfWKWxQ4+Uv/qbv4Z27bgHuFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800474;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VR0uH1F3b6mTGi6lgL5A4cX1F/jrWocQf8pwCPqd+uk=;
	b=cB5srzyRXHwhVtgHI2zmh/6gsC4H8NxU2pkXZOfIQTeif3GCNCHRR6P9WUnkH3xtmUtGKD
	HIeF6Fhu2nxPXkDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VR0uH1F3b6mTGi6lgL5A4cX1F/jrWocQf8pwCPqd+uk=;
	b=VSNp2O2bE/USYq8jeaVKPraz8LdhFqMxc449s5++DLCTLAhF7/3hCf3GKhG80gRo6RE/W8
	TOikFC1s/gpdgbU1RHb/gfIHQSc4NfxkrfvJ6rqXRoYT7EMbk1HkB0NSNG5+Yb3nQcu/h0
	0Rg9aZEfWKWxQ4+Uv/qbv4Z27bgHuFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800474;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VR0uH1F3b6mTGi6lgL5A4cX1F/jrWocQf8pwCPqd+uk=;
	b=cB5srzyRXHwhVtgHI2zmh/6gsC4H8NxU2pkXZOfIQTeif3GCNCHRR6P9WUnkH3xtmUtGKD
	HIeF6Fhu2nxPXkDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BF3913432;
	Fri, 27 Nov 2026 17:27:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id es8WAZq9CWuzDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:27:54 +0000
Date: Fri, 27 Nov 2026 18:27:53 +0100
Message-ID: <87jylymbfq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Carmel Okun <Carmel@aperio.ai>
Cc: "shenghao-ding@ti.com" <shenghao-ding@ti.com>,
	"kevin-lu@ti.com"
	<kevin-lu@ti.com>,
	"baojun.xu@ti.com" <baojun.xu@ti.com>,
	"sen@ti.com"
	<sen@ti.com>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: Re: ALSA: hda/tas2781-spi: NULL pointer dereference in tas2781_hda_remove() on sysfs unbind
In-Reply-To: <AS2PR02MB10038DB2CE8CAE659D35B9F1AC8792@AS2PR02MB10038.eurprd02.prod.outlook.com>
References: <AS2PR02MB10038DB2CE8CAE659D35B9F1AC8792@AS2PR02MB10038.eurprd02.prod.outlook.com>
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
	RCVD_TLS_ALL(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -12.30

On Thu, 19 Nov 2026 10:08:48 +0100,
Carmel Okun wrote:
> 
> Hi,
> 
> Same machine as in my other report (HP EliteBook 8 G2i, 103c:8ed5,
> TXNW2781 on SPI), kernel 7.2.6-200.fc44. While trying to re-initialize
> the silent amps, I unbound them via sysfs:
> 
>   echo spi0-TXNW2781:00-tas2781-hda.0 > /sys/bus/spi/drivers/tas2781-hda/unbind
>   echo spi0-TXNW2781:00-tas2781-hda.1 > /sys/bus/spi/drivers/tas2781-hda/unbind
> 
> Each unbind first logs a WARNING in component_del(), then oopses in
> __pm_runtime_resume() with a NULL device:
> 
>   WARNING: drivers/base/component.c:839 at component_del+0x149/0x170, CPU#9: tee/374653
>   Call Trace:
>    tas2781_hda_remove+0x16/0x60 [snd_hda_scodec_tas2781]
>    device_release_driver_internal+0x19e/0x200
>    unbind_store+0xa4/0xb0
>    kernfs_fop_write_iter+0x178/0x200
>    vfs_write+0x281/0x560
>    ksys_write+0x7b/0x110
>    do_syscall_64+0xe2/0x570
>   ---[ end trace 0000000000000000 ]---
>   Oops: general protection fault, kernel NULL pointer dereference 0x1d1: 0000 [#1] SMP NOPTI
>   RIP: 0010:__pm_runtime_resume+0x1a/0x90
>   Call Trace:
>    ? component_del+0x149/0x170
>    tas2781_hda_remove+0x23/0x60 [snd_hda_scodec_tas2781]
>    device_release_driver_internal+0x19e/0x200
>    unbind_store+0xa4/0xb0
> 
> A later "echo ... > bind" then hung in D state, and only a reboot
> cleared it. The same thing happened for both devices (oops #1 and #2).
> The full log is attached (oops-unbind-7.2.6.txt). I have not
> re-tested this on 7.3.4.

Could you verify with the latest sound.git tree (or the upcoming
7.4-rc5) later?  It might have been addressed.


thanks,

Takashi
