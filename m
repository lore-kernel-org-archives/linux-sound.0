Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDE18E03A
	for <linux-sound@vger.kernel.org>; Sun, 20 Apr 2025 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745138327; cv=none; b=CWZcdjF2POuoSJ51wpmxtWb9BTq3/nMMHSK414OhQeUbwGpuBWGF4eRchO1xXZSMvFn73ZwRu9k6WYR9YfwWfO12o874arBakYpvSO9r9iTauVPEOC+WXAovrxRg6+kjZLzdsNVdKro/veHm77OKXOj2Zq42hjXxcgfF/TXyAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745138327; c=relaxed/simple;
	bh=J2vxkB8G9nSLmIczLbfocpuao2CBH0Qrr9SrqTq8QYE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LA6+LVOVI+9BjaQOqiOAep9CqaKfBhUInLHtrWZyVxJdgyHYWO95qd/gHRw92VbwJ8SW5A2NG2IDNvDzkCnina3Iy9R5QbLheFg1IoyWmF++N5DHbds1ig8VpHFdCYnrcZfkNArfId9HFelsiGioY1ggG31LjUNVaZRV2CQtPwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A7IVJH+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R7E6kLH9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A7IVJH+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R7E6kLH9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A7IVJH+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R7E6kLH9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A7IVJH+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R7E6kLH9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E57621226;
	Sun, 20 Apr 2025 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745138318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SxmEwWnpoI2L77S2kubfikbUct1deoc0yTK4X7LKGC8=;
	b=A7IVJH+5+VoE3XnIORDMBpTXaIUVGHm35PkTyOzdGueHh0N3u+rteu+W0tqtkfWS+4DbJG
	sI2tcP6Ah097nLznprCoI+/wfD6FDOoFEBxs4dCUM6pSBJ8oh9sB39RV/khnjq/iPiyQSw
	PvS4KPQk8bCztpWYaqn0XM2/PGRBIW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745138318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SxmEwWnpoI2L77S2kubfikbUct1deoc0yTK4X7LKGC8=;
	b=R7E6kLH9588FfHCNAol2tkuq3QR+5+8/5iUrk1J8Gz9VgD0nsh7m2fUopT2M7CiZaV0Kvv
	K8wLxdlg2i3X8AAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A7IVJH+5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R7E6kLH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745138318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SxmEwWnpoI2L77S2kubfikbUct1deoc0yTK4X7LKGC8=;
	b=A7IVJH+5+VoE3XnIORDMBpTXaIUVGHm35PkTyOzdGueHh0N3u+rteu+W0tqtkfWS+4DbJG
	sI2tcP6Ah097nLznprCoI+/wfD6FDOoFEBxs4dCUM6pSBJ8oh9sB39RV/khnjq/iPiyQSw
	PvS4KPQk8bCztpWYaqn0XM2/PGRBIW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745138318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SxmEwWnpoI2L77S2kubfikbUct1deoc0yTK4X7LKGC8=;
	b=R7E6kLH9588FfHCNAol2tkuq3QR+5+8/5iUrk1J8Gz9VgD0nsh7m2fUopT2M7CiZaV0Kvv
	K8wLxdlg2i3X8AAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12623137CF;
	Sun, 20 Apr 2025 08:38:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D5LnAo6yBGgfIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 20 Apr 2025 08:38:38 +0000
Date: Sun, 20 Apr 2025 10:38:37 +0200
Message-ID: <87y0vvtegi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Speaker can't mute when headphone was plugged
In-Reply-To: <eb4c14a4d85740069c909e756bbacb0e@realtek.com>
References: <eb4c14a4d85740069c909e756bbacb0e@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 3E57621226
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 17 Apr 2025 10:08:48 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Speaker can't mute when headphone was plugged for HP platform.
> Add attach patch will solve issue.

Thanks, applied now.


Takashi
