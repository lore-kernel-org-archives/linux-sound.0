Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE430E0C0
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625275; cv=none; b=K9edL4jgU29kd0BbarGvC1dP2mdhGp41owFp6nxNbnBNGmDeWRLMauWlz1hHPB/CMGgluFRySfZQzpAX4CF3GhR1MGy1lCtwDXwOxoQd+Ju9RLvZbM8Auutbzmy22CEYiUYp9If5B/UnEaiP8/pD7hPgY/vKVAeAtCaihNQK3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625275; c=relaxed/simple;
	bh=VroXkPZmmvoWcNuiRkosMT53FMmE3kDvK+Ery/KPUeo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMqX/g+UJ6Sf8pcQG8+RVSjcplBBeDiB0DO0Ua+His6Ie7x2C7zg9Mb3GGXC7fYITX30S2aAS+vXIqz0ZL8ieLE+ClZsmdYldUfjhvp5V8vqGdsqkW7DebmCc6SaFcNvt1q+/UaVJQ0xARV3z8uAAM9CgmdzvhRUk2Sy1DE3Yno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDOE0cwI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9XOPdkaa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDOE0cwI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9XOPdkaa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDOE0cwI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9XOPdkaa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDOE0cwI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9XOPdkaa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1DDE94D327;
	Fri, 27 Mar 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774625272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sayXwtszF68+i5Cg5atePSOC1Jqw64nkxC42Jm5klE=;
	b=BDOE0cwIdZBUHyvO19MwY1Mt+1sgK4OmTsFk2PnP5ybcb1/TpKt9YclF91Tow3mWVcD6WX
	YPcOYZqe+JevoMEOVr06u4CMaSYHv1yKbMSnKRO8Be1lwN420FkR66VYly+JDjFkfRYcKB
	SkVUwmuHiBdg885JNxwbJM5griHNVOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774625272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sayXwtszF68+i5Cg5atePSOC1Jqw64nkxC42Jm5klE=;
	b=9XOPdkaadZgHTJ4BZp9UZincPe3IupDBqJU37YvSLJq0ObHDxs+ZJT6wieuNKBLWnaz+EO
	z12Vfidq7D0LQoAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BDOE0cwI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9XOPdkaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774625272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sayXwtszF68+i5Cg5atePSOC1Jqw64nkxC42Jm5klE=;
	b=BDOE0cwIdZBUHyvO19MwY1Mt+1sgK4OmTsFk2PnP5ybcb1/TpKt9YclF91Tow3mWVcD6WX
	YPcOYZqe+JevoMEOVr06u4CMaSYHv1yKbMSnKRO8Be1lwN420FkR66VYly+JDjFkfRYcKB
	SkVUwmuHiBdg885JNxwbJM5griHNVOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774625272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sayXwtszF68+i5Cg5atePSOC1Jqw64nkxC42Jm5klE=;
	b=9XOPdkaadZgHTJ4BZp9UZincPe3IupDBqJU37YvSLJq0ObHDxs+ZJT6wieuNKBLWnaz+EO
	z12Vfidq7D0LQoAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C79D04A0A2;
	Fri, 27 Mar 2026 15:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id woslL/ehxmleDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 15:27:51 +0000
Date: Fri, 27 Mar 2026 16:27:51 +0100
Message-ID: <875x6hqolk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	"Artem S . Tashkinov" <aros@gmx.com>
Subject: Re: [PATCH] ALSA: hda/realtek: change quirk for HP OmniBook 7 Laptop 16-bh0xxx
In-Reply-To: <20260327101215.481108-1-zhangheng@kylinos.cn>
References: <20260327101215.481108-1-zhangheng@kylinos.cn>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,canonical.com,realtek.com,opensource.cirrus.com,vger.kernel.org,gmx.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,gmx.com:email]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1DDE94D327

On Fri, 27 Mar 2026 11:12:15 +0100,
Zhang Heng wrote:
> 
> HP OmniBook 7 Laptop 16-bh0xxx has the same PCI subsystem ID 0x103c8e60,
> and the ALC245 on it needs this quirk to control the mute LED.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221214
> Cc: <stable@vger.kernel.org>
> Tested-by: Artem S. Tashkinov <aros@gmx.com>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Thanks, applied now.


Takashi
