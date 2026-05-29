Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3A3B7772
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044991; cv=none; b=rvKLjqXCELEpK+ZFHgRoms3pZPO4R5Mq90mqWPE7on0MAPYglXBdPrcR1cMe2b8TrOnwWZN0R4pohgaw5YBBdOd/I8cj5w7f/kPxViRJkfqxKFN9Cy+bv3GY2Zegm/yNSLz/0/zMu2wHitZAadZr3K9D/a8LAOeAyq1A0uo6SXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044991; c=relaxed/simple;
	bh=u52KAyKTKrEsEtp9L4qDBjRSU+DFB09wCNA3z0VHVeE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VNRAdR2Sl9M6Va+7w94uUnqQQVa63lQMBbcT/7qvSMU1wi71utpWNcMpg0oy4wCdLk+LK8hUi9JJwPK0iGraxqx2XOUzjzWjMy5C9K7KgXFfr1FQ4aeyU5SAfMTyg+o1+RWm2Q49LhGCzrKDJo+xIPdHmpY/vfdFKqgb16knP5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=woQRNOaB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=myLKF7mJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I2tFrNei; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L+7aQzFt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="woQRNOaB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="myLKF7mJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I2tFrNei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L+7aQzFt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C904267342;
	Fri, 29 May 2026 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780044988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khp8pgmNcLjpyYb+rARBaWJTHLVLheayc+s99XI06g0=;
	b=woQRNOaBvBFkps7k3GMPTevpmrd3nqKlL40d9POfYrBfv1sjc+LiqCAN2thrrggc/MnbNL
	dhV8WUf0sUqK/CcdB7wxTaujSyZIqpbLvHbJCmw6fVooUoJlSjZJ+F9mgmnAljVvvAknou
	N6/BBg/fFwQyYKAnsKPy7hTkLTHucTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780044988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khp8pgmNcLjpyYb+rARBaWJTHLVLheayc+s99XI06g0=;
	b=myLKF7mJmoz222nKWEujpCHI8Kv2J1AtxUDlgwPSzb4eZjye+Hpnmd1iVlomd5wvNdcx6P
	k21HKnRU8uKikLDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I2tFrNei;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L+7aQzFt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780044987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khp8pgmNcLjpyYb+rARBaWJTHLVLheayc+s99XI06g0=;
	b=I2tFrNei/TtjS892sMYrMaLf8yx1ZoIrIF3kpk7l76YOYB3QaA31P+EuEDeH0SMFjrSxy+
	jq2pseS6zi4D5RhaFOjAPxS+Ey0GDFJDY9YN/IGDZjna3XdlKyFHmKy6pwO+hEXeqNzcF9
	e9Vt720fWZpjw9rWaEFs8p/16E8avEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780044987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khp8pgmNcLjpyYb+rARBaWJTHLVLheayc+s99XI06g0=;
	b=L+7aQzFtYhCN0hnIJbTw9RhECiVPLNCFI565w9BkvedNt8qnYmIHwodOlWdWPgsptDoj+j
	WFolGtyDU4u7V7Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D484779A7;
	Fri, 29 May 2026 08:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3qAgIbtUGWpwMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 May 2026 08:56:27 +0000
Date: Fri, 29 May 2026 10:56:27 +0200
Message-ID: <871peusif8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Sennheiser MOMENTUM 3
In-Reply-To: <20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe>
References: <20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C904267342
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, 28 May 2026 20:38:54 +0200,
Rong Zhang wrote:
> 
> Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
> identify devices with sticky mixers. Unfortunately, even though most
> devices with sticky GET_CUR also have corresponding sticky SET_CUR,
> which I actually met more since the commit had been merged, there is
> also a rare case that some devices may have volume mixers that responds
> to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
> check to consider the mixer to be sticky and unnecessarily disable it.
> 
> As the sticky check can't distinguish between sticky mixers and working
> SET_CUR but broken GET_CUR, add QUIRK_FLAG_MIXER_GET_CUR_BROKEN to tell
> that the device should fall into the second category when GET_CUR
> returns a constant value. In this case, the sticky check becomes
> non-fatal and only disables GET_CUR instead of the whole mixer. The
> current volume will then be provided by the internal cache that stores
> the last set volume.
> 
> The Sennheiser MOMENTUM 3 needs the quirk flag. Though its UAC mixer
> works fine and precisely corresponds to the reported dB range, the
> mixer's volume GET_CUR method is somehow stubbed and returns a constant
> value (15dB), resulting in it being disabled by the sticky check.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>

Applied to for-next branch now.  Thanks.


Takashi
