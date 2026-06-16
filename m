Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7B349CE9
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594695; cv=none; b=UxfR5JRcX0RvOSdwju16ZD5yF54qnkqv/dmzwh2SMAAuOUXD6NBHkZG1/mU4X5RedSF9afMt9DxvO1zH620ScpxUiLp4a/zPKg392O9ciwhbh6KcLLyll9rKxdTbk8RQcfBWetAvam7Tnwu+8LlZOz+J/ao0KrkU5MnmWylQqJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594695; c=relaxed/simple;
	bh=1aizsr/ZAErlIyh8I+1fKQB7XSg/xQo+gGIAYlPQuHE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3a9+YTjkooJEslb7kvpl8PniGtJJl2BTx2sGoUUK7A4IdaCDZv8RbllY1VSQBogKxetwIF1LwUBT1oKQz4mPLJ5h2jr+CBm0KrxGxYYJZhUdSwzMudJROvO1fb81Nr4sItrQ26Emc3tB2R1d5Jb/nNXtuKToR1aXpmLZph8gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L5ELzNzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3WFylrpQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rRpsZsnh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DSQJtfMn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L5ELzNzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3WFylrpQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rRpsZsnh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DSQJtfMn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 47D51758DC;
	Tue, 16 Jun 2026 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781594692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DBS5FjR9bA6WAYLZtl1jM64SBUnvii836fJdPNw9+wY=;
	b=L5ELzNzVMBZD9qSlX5F+wFC1z3zBaklpHwJyCe/iSKZYj2qqgDY4x85iDxRACu/rLENxvz
	wxL6+/XXXvOHq+fnqWj9B/1IGEevUu2cSRvZYKVfqvUtR8EuGSw1aHsvEXMP2jEIOttMoS
	0IKa6A9lEku7J8e6SuAQyea30IfPm2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781594692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DBS5FjR9bA6WAYLZtl1jM64SBUnvii836fJdPNw9+wY=;
	b=3WFylrpQlujCW+2xMWakZdJk7AZLTB0YEE0dWN4I4/wUe9rm41A6anGyp7FGSo5cDSYKH2
	EjUPiDziqF2Kr1DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781594691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DBS5FjR9bA6WAYLZtl1jM64SBUnvii836fJdPNw9+wY=;
	b=rRpsZsnhECQuUy2M/4VTfRfzKRhn3fitMEpdBnmH8VWy4QUxojBweIe5wqkZBDln5MltSz
	ISvWOZSX1ZgNFbcy4289ZRgJNhgAOF8Y+iSD9FPMXGThzNNcYLkflIRVzXeT8WXKHTQXa0
	ttiMG1U9ZFWENe3PBpf00+F8rPIFzaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781594691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DBS5FjR9bA6WAYLZtl1jM64SBUnvii836fJdPNw9+wY=;
	b=DSQJtfMnVn+RB8PSaFG+yVnN28h2+HPAUyThd1oTzTfwIVlyQh1gv6vJ1bYH4vnf2P/ARW
	eBEantSZuCfYEZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0347779A8;
	Tue, 16 Jun 2026 07:24:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TNSGNUL6MGomOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Jun 2026 07:24:50 +0000
Date: Tue, 16 Jun 2026 09:24:50 +0200
Message-ID: <8733ynrlq5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
In-Reply-To: <20260616020601.2106490-1-aichao@kylinos.cn>
References: <20260616020601.2106490-1-aichao@kylinos.cn>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, 16 Jun 2026 04:06:01 +0200,
Ai Chao wrote:
> 
> Hello Takashi
> 
> >Hmm, why it must be that?  The state is shown as "DISCONNECTED".
> >
> >IOW, does this matter for which application and how do we have to
> >imitate as if the file got closed?
> 
> Test Environment: Dual-boot Linux and Android system.
> 
> Issue: When a recording app is opened in Linux, the system is switched to Android,
> and then switched back to Linux, the recording app fails to save the recording
> and keeps prompting "generating recording file".
> 
> Note: The USB hub resets during the system switching process.
> 
> Root Cause Analysis (from App Engineer): The recording app relies on the driver to
> report the IN_CLOSE_WRITE event. Upon receiving this, the audio service
> checks /proc/asound/card0/pcm0*/sub0/status. If the value is not "close", it assumes
> the sound card is occupied and skips loading; if the value is "close", it considers
> the sound card available and loads it normally.
> syslog:
> [ 1140.495952] retire_capture_urb: 17 callbacks suppressed
> [ 1140.583090] usb 1-2.4.2: USB disconnect, device number 53
> [ 1140.583965] usb 1-2.4.2: cannot submit urb (err = -19)
> [ 1140.588816] usb 1-2.4.2: cannot submit urb 0, error -19: no device
> [ 1140.662630] usb 2-4.3: USB disconnect, device number 15
> [ 1140.722584] usb 1-2.3: USB disconnect, device number 51
> [ 1140.722605] usb 1-2.3.2: USB disconnect, device number 52
> [ 1140.805724] usb 2-4.4: USB disconnect, device number 16
> [ 1141.352341] usb 1-2.3.3: USB disconnect, device number 54
> [ 1141.558840] hub 1-2.4:1.0: hub_ext_port_status failed (err = -71)
> [ 1141.613714] usb 1-2.3.5: USB disconnect, device number 55
> [ 1141.757651] usb 1-2.4: USB disconnect, device number 49
> [ 1144.324836] usb 1-2.4: new high-speed USB device number 56 using xhci_hcd
> [ 1144.473047] usb 1-2.4: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.11
> [ 1144.473065] usb 1-2.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
> [ 1144.473072] usb 1-2.4: Product: USB 2.0 Hub
> [ 1144.473738] hub 1-2.4:1.0: USB hub found
> [ 1144.473765] hub 1-2.4:1.0: 4 ports detected

Thanks, it's a bit clearer.  But it still means that it's a cargo fix
only for that specific application.  The program should receive an
error for any further syscalls, so that it can close gracefully by
itself.  Or it doesn't work as expected?


Takashi
