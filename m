Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDAE368D7A
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402023; cv=none; b=Rcpf4wCCFFXUMqtjSV1Czc9FAxPzwnBwPWh0u2Y7Uj87uB4fSmCWhZTbQK1Bk3CdfWCfIe7CXW5oUaR8/MHf6hqonbw12izTw7DbI+0mUnlTnLQUuIQEroWqYWfHiGnSkzbSCUH1T6JrZE0gf5P3yQjGj6jAznv+icYLguAmnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402023; c=relaxed/simple;
	bh=VNK1pUFIP2yFXjfUk1xz4IQD0yBRq+cD4UqZRw8Txks=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSud6lHoLPRh9I/uj/vPMN486mzGzhVFTRnc7DDZ653PNSkvkkvtO9n3zssbL1Q4HkGBkaaL/NDKcETD/xlovQfForMsaRRP2kK0QOELldqetZZ9WtGmqFD5NXDIVqf/A9jMnv77lBYJ1apNjKVsZWIOPiGsUgqFKBM5tPJr0X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ztZRXaCV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VYV5s9rC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TWvVzA1N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=84CJi1NA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ztZRXaCV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VYV5s9rC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TWvVzA1N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="84CJi1NA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5C1F2127F;
	Mon, 14 Sep 2026 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFGJosFMsbJaNRAGFDyj7ar5hJu8DkdSlykmVwOfVrA=;
	b=ztZRXaCVIDFWQK9+bu+cTyemuwq6wNxYtO0okp1bbs2D77x7/Myd3jYTvx3fGzeCCIAa9K
	G5BWIFq4e1oe6kIBfGS5iuHpwofzxFEbl52hA+Pxd1ELAoH5yizqDKoGZOpg1fX6vtXcAt
	KcLDBVk6kgeafVeGOxc/KrOpwRo1hJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFGJosFMsbJaNRAGFDyj7ar5hJu8DkdSlykmVwOfVrA=;
	b=VYV5s9rCI4531jVZvy/ZVNBr19Pu0oPzdsjs8+ecsI2U9ZSh4Xjl3i488dIagEWILcV6uU
	/8y7MilHCuWi/7DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFGJosFMsbJaNRAGFDyj7ar5hJu8DkdSlykmVwOfVrA=;
	b=TWvVzA1NNTNyLfcFmeJYhM7d+1m645PdvrEx1PGwKTTDSyW8TZvphymbd2axjIjXvP8HA2
	Zn2BsCU8mn/SAacESivJNgEbmulcXw93hm/gj0m+GA2/EwKICX1OqPgNLLa3+cdgyiFtdb
	mf9p89OK+NEbG+CrZGAJ4xyifAn74F8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFGJosFMsbJaNRAGFDyj7ar5hJu8DkdSlykmVwOfVrA=;
	b=84CJi1NA14+SWM7TFDgWvELfjUTgdkdeMP/ANumpAKcyasClCx4R9GKpmnOt27aqjFjbql
	KecBKMmSTLe9QbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CC7813515;
	Mon, 14 Sep 2026 16:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDIIJZsbqGozFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:06:51 +0000
Date: Mon, 14 Sep 2026 18:06:51 +0200
Message-ID: <878q53om04.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-2022-JP?B?GyRCPH43ejEnGyhC?= <997536907@qq.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1 (ALC256, SSID 0x2782:0x0206)
In-Reply-To: <tencent_A89516B196B5F3484ADDB96992501D676B09@qq.com>
References: <tencent_A89516B196B5F3484ADDB96992501D676B09@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[qq.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:url,suse.de:mid,qq.com:email,imap1.dmz-prg2.suse.org:helo]

On Wed, 09 Sep 2026 09:05:41 +0200,
周建宇 wrote:
> 
> Hi,
> 
> The internal speaker on the IPASON SmartBook S1 (an Emdoor ODM laptop)
> is completely silent under Linux. Bluetooth audio works, and the same
> machine's speaker works fine under Windows 11 / Windows PE with the
> vendor Realtek driver, so the hardware and amplifier are all good.
> 
> Root cause (found):
> -------------------
> The BIOS reports the real internal speaker pin, NID 0x1b, with
> Pin Default 0x411111f0 (DefAssociation = 0xf, i.e. "unconnected").
> ALSA's pin parser therefore drops that node at pin-config time: no
> mixer control is ever created and the pin is never driven, no matter
> how 0x14 is configured. Enabling 0x1b produces sound immediately.
> 
> The existing model=alc256-honor-mrb-xxx-m1020-audio makes the speaker
> work because it is an HDA_FIXUP_PINS that also rewrites 0x1b to
> 0x90170110, but it additionally rewrites 0x19 and 0x1a with Honor-
> specific values that add a bogus "Dock Mic" device that does not exist
> on this hardware. A minimal two-pin override is preferable.
> 
> Hardware:
> - Codec: Realtek ALC256 (0x10ec0256), SSID 0x2782:0x0206
> - Controller: Intel Tiger Lake-LP SST 8086:a0c8
> - BIOS init pin configs:
>   0x12 0x90a60130  0x13 0x40000000  0x14 0x90170110  0x18 0x411111f0
>   0x19 0x02a19040  0x1a 0x411111f0  0x1b 0x411111f0  0x1d 0x4067b945
>   0x1e 0x411111f0  0x21 0x02214020
> 
> Proposed fix:
> -------------
> I do not have a kernel git tree at hand to produce a proper unified
> diff; the two hunks below are the exact entries to add. Please let me
> know if you need a formal patch.
> 
>     SND_PCI_QUIRK(0x2782, 0x0206, "IPASON SmartBook S1",
>                   ALC256_FIXUP_IPASON_SMARTBOOK_S1),
> 
>     [ALC256_FIXUP_IPASON_SMARTBOOK_S1] = {
>         .type = HDA_FIXUP_PINS,
>         .v.pins = (const struct hda_pintbl[]) {
>             { 0x14, 0x90170111 },
>             { 0x1b, 0x90170110 },   /* the real internal speaker */
>             { }
>         },
>     },
> 
> Verified on kernel 7.2.0-1-MANJARO (also reproduced on 6.18.45-1-MANJARO),
> in both the SOF and legacy HDA driver paths.
> 
> alsa-info output:
> https://alsa-project.org/db/?f=4c555d942f5cef14cac55e34b2236238ae909af3
> 
> Happy to test any patch and provide further hda-verb dumps on request.
> 
> Signed-off-by: 周建宇 <997536907@qq.com>

Could you send a proper patch for upstreaming?


thanks,

Takashi

