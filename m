Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A336CE00
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046670; cv=none; b=KLoM61EVDdRh4N3J0Llz4B4GFi8/8InNMP8lRSiY4/qpWEBWipnqdworKBq3Xckl9iWskWDzc6z5joJZh5zgYby18MBZXYhAraSwgRuHo8hEWJld5IZAJ3tZyWo2tgFeFA9Q3QfT7XftXoSnvW1OQ9lpo2F6vr47men9x2ihngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046670; c=relaxed/simple;
	bh=fQJ0UXG2kf8KyP1XU0VhuYjSRfRal9IucY0H/E4y+MQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuwVR4GeFf3tIRx8yyDeJ8y1VUeVrsbHq+oUdKgdNtc4o+iq0MvdjTc8KulUJcSJJZM+r3rhui9plpmlob//X/s6SbWOo28782gdBuGBGAG0D6pJ0EA1QeYEwKdcOfcbns2qt+gbYTkkrXROzz4dlSu2J5uxb1yufi2W6e3jVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LeU2biAp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LUMLP3L8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gO4fsQXt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SEUgaEqj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LeU2biAp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LUMLP3L8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gO4fsQXt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SEUgaEqj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ECF815BF00;
	Mon,  9 Mar 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LluGB8RqD53f19h7j7KBpMHnGphjDy1l+y6eHu9RGko=;
	b=LeU2biApOCPyoErXeibA6k5SvvQBE7VeYgkIuP8N/w8Cmptz24jw29IpUPT5EKUKL7vW2g
	iQNbHXwrEBDbzYtdiQYMiaKMVTd1iMCK6miZHlh5HDaVykpmZB5vbKOOKF+6N6SfStidH7
	xH1YOajFv2yrCNiM1YQhFQzMvxUFxD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LluGB8RqD53f19h7j7KBpMHnGphjDy1l+y6eHu9RGko=;
	b=LUMLP3L8HOFESWJscyD9jNx0blGHFCOEF1VhdTuOCNxWpOGAXeFM6Qy/IX1Q5lUBrYEcWJ
	yI8wF341RZKDLBDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gO4fsQXt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SEUgaEqj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LluGB8RqD53f19h7j7KBpMHnGphjDy1l+y6eHu9RGko=;
	b=gO4fsQXt5g/oSUqkkwuEyb5j6HmYYTyzmWYpVappawQAH/JPz5fh9HGfqFybmAbaFs9a7Q
	xP7ZtTmB56xJemCPDhEFyuTcgRWfR31xlmJi8fyYCM+e9aiCC8fQO6XfVeAJ6q4TioatYj
	+y2p6no/fqpN5ZrcZRieE/zPuDZ6FVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LluGB8RqD53f19h7j7KBpMHnGphjDy1l+y6eHu9RGko=;
	b=SEUgaEqjl529Kiqv91x7cjP/l7eafu2fP52jtctwKI1ergReAVqdsBWsPpaWRhXbz1UrYP
	O9Ay1uKZu+UsyBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE8493EDF8;
	Mon,  9 Mar 2026 08:57:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iuhCKYmLrmkySQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 08:57:45 +0000
Date: Mon, 09 Mar 2026 09:57:45 +0100
Message-ID: <87pl5dtm5y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for ASUS UM6702RC
In-Reply-To: <20260306123317.575346-1-zhangheng@kylinos.cn>
References: <20260306123317.575346-1-zhangheng@kylinos.cn>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ECF815BF00

On Fri, 06 Mar 2026 13:33:17 +0100,
Zhang Heng wrote:
> 
> The sound card of this machine cannot adjust the volume, it can only
> be 0 or 100%. The reason is that the DAC with pin 0x17 is connected
> to 0x06. Testing found that connecting 0x02 can fix this problem.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220356
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Thanks, applied now.


Takashi
