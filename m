Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800828;
	b=KNnuWxwL1Uw9f91ulgs6jt9kq6ZMx/OzlLC0UApLAT11SQOQnG9DaifrngLcYPTg97K+
	 jG1xTCCQoiDiItlmnvUG6z3JCn52ZGsLq9VuWijMeAmCanWxM8DH6xAEboy8M0jyke1ZC
	 XvgRfzawNcKUL3Yciu6Y4C9viwg9NGPqLUNnLdOVIzypp0Uw72RGqMN81kDXXfItycCSZ
	 YLAM7uC9vi3xj6KSeUJqoNipKi1RiqNIu4wAvSPBhQtDbUcVJSI5OOMqozidOuJaSl7kV
	 fN2gxXD5eeNXxAVRW+K+xRwY2tSJNa2X9+TU21nxcun7mvNQmkg73ETCKkCHJ2AFUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800828;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=bDm85IZEkUrpR+6tNdvJO0hw1xeLueIqun/d0DaVyXU=;
	b=0Me/2XqC58SyI+QOfq7tpr5+MRhTaePuQUIrvNlX2rOtLyEAQkEUymVoCHilcBJzPNPx
	 Ycx62sa8wayKjtfG5QROKnoGO+/TVLB2U1xIn/U5ycKujX9fUQBhSGTdyQDm0Zd3jjngC
	 PNOMamwxNeoUQLEKRd5OV49CTvIeTxljIV5bY3EhgPUz+wfzf0KQ3b0KdkUoMJ82qcJwF
	 1B+Dkn5dUweacs/Ut64Gp/BugM9+GBBQ2lxRnbraFYLNDoklyt2EC07NloX12F54shQMp
	 FCbwiuIZkVhpsAwJqlSUn0fYGIk2fMACYYIatN/w74dpkdlSSYOKFGaRcFiECbn42sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VuThTEPP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rFPfoO0i;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CDgDYvGx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LG9JBgYI;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5CD606A31E;
	Fri, 27 Nov 2026 17:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VuThTEPP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rFPfoO0i;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CDgDYvGx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LG9JBgYI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BFEB01F7F2;
	Fri, 27 Nov 2026 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDm85IZEkUrpR+6tNdvJO0hw1xeLueIqun/d0DaVyXU=;
	b=VuThTEPPm7RflOLshsTsWA2DduNH0Z2BgJ93DGlyyv2ASzc37KG0y1aG0YQ/V0wDcMTSnR
	M5da3w1OQSkypAHnLpyC/fat01ZB4zjh7mhrPdsOBLWXwFNwD0cdXvSMZbaXo3XM+mgyA1
	GY5XYiRwDi0XYZXNGK/Wtbt90NJoxW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDm85IZEkUrpR+6tNdvJO0hw1xeLueIqun/d0DaVyXU=;
	b=rFPfoO0iVnsRmg7HBc0qmJA7rcKaLhrmhdHhqBl9NWfd92XYfT35gZ7iohk/o94Fu6JE9f
	jKQt+bQL8gFhN5Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CDgDYvGx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LG9JBgYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDm85IZEkUrpR+6tNdvJO0hw1xeLueIqun/d0DaVyXU=;
	b=CDgDYvGx+qx1MO1+ziP5YshbmufxAFYBwxQYKKsVLSD0hd14U6H3sbZh4eLaTqc4F9ZC7Q
	uP+I1G8rlSD5/DJpNqSCcbV/fVBFQyL2S0O987xGDij1febuAiRG2bDzHXLKZhZoi98x7h
	45nJtNUV4TpouTPz8ZLx4Pluc0w47+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDm85IZEkUrpR+6tNdvJO0hw1xeLueIqun/d0DaVyXU=;
	b=LG9JBgYISgDsZ+wcLZcaJ+ATQ3pebrAj7vth8gk65GZDbRVLBFK3O/J1bmo5PfQQcoLPrC
	iw4DzYbhE0Er6ZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 760A8134E8;
	Fri, 27 Nov 2026 17:33:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HRvTE/i+CWvSEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:33:44 +0000
Date: Fri, 27 Nov 2026 18:33:44 +0100
Message-ID: <87cxrqmb5z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: coding@fpesce.com
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cirrus: Control SPDIF out pin on MacBookPro 11,1
In-Reply-To: <20261126-macbookpro11-1-spdif-v1-1-8316370457f8@fpesce.com>
References: <20261126-macbookpro11-1-spdif-v1-1-8316370457f8@fpesce.com>
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
X-Rspamd-Queue-Id: BFEB01F7F2
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,fpesce.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Thu, 26 Nov 2026 17:41:46 +0100,
Felipe Pesce via B4 Relay wrote:
> 
> From: Felipe Pesce <coding@fpesce.com>
> 
> The MacBookPro 11,1 (CS4208, codec SSID 0x106b5d00) has the same
> combo headphone / mini-TOSLINK jack as the MacBookPro 11,2, but is
> missing from cs4208_mac_fixup_tbl, so it only gets the default GPIO0
> fixup. As a result the "IEC958 Playback Switch" does not touch the
> SPDIF pin (0x21), whose pin control stays at PIN_OUT, and the red
> optical light in the jack turns on whenever the codec is powered up,
> even with no optical cable plugged in.
> 
> Apply the CS4208_MBP11 fixup to this model as well. Tested with
> model=mbp11 on a MacBookPro11,1: turning off the IEC958 switch now
> clears the pin control and the light stays off across runtime
> suspend/resume, while analog headphone, speaker and mic are
> unaffected.
> 
> Signed-off-by: Felipe Pesce <coding@fpesce.com>

Applied now.  Thanks.


Takashi
