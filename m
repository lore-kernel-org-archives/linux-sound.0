Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59243B9930
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729568; cv=none; b=UXsIrWMA2b11STW5cJ+Xzr5A1EEjvUgY3CDet7RMeEc0l2J/kpSeGN+WCIEsbpCnwL65dyk8lGvgap5d8uNIpSwqE5ES8hVfiCxXLWV0LQp6EHOdrILn5wT6QZVTsM9yceJm83bJ4F66ZbOMjcuYnoAzNvyVcAvK05zxW83HL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729568; c=relaxed/simple;
	bh=OROLGHE/1SHt4kic8E4BhFiSQF4b8D8eBPkZEWa75wk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kycxeTRtdxg5XHzUmM4vs9pdlQwEbStuSo9mNsGAjs53EphC7bFdJ0byR7AZsOI1X9QOMa/LquCeR3VIG36h12KHz1H/Di2z+xSfUY0Xx59YtQGXEZ7yzPDKINthRrYy+2zBMq7SRS4POuR78Gtun/UsRtC0vZcSP5bF4RqyUEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mTXomne/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xKCrSnZ4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mTXomne/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xKCrSnZ4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTXomne/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xKCrSnZ4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTXomne/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xKCrSnZ4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1EC0375DA2;
	Mon, 29 Jun 2026 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782729565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=haZ5nblLK70Xa+ESGA7quSTc+JT2nZt6lIA7RyS34Kk=;
	b=mTXomne/4Axtx5lUIhSrRTes0RUrKsPVa6Vi3h5Ie/CkomsVTihwGKKy8hIbBGmV0NIAEA
	IsdOokU40gjWxTQuI4GHGrnV0wnk9HKlWwSCJ3u17HshiI8v46z1nboe2E346g00+Wkbnb
	0qYiQayT2AijfdScMgQr1H4MLxezwPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782729565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=haZ5nblLK70Xa+ESGA7quSTc+JT2nZt6lIA7RyS34Kk=;
	b=xKCrSnZ4gtBqx+m+LLXl8VM2fnGE12F2Jae1J+n6PH1RnIDmZvpB7BcSKALRkrevqcTekI
	HeucCfIKkwN05dCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mTXomne/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xKCrSnZ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782729565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=haZ5nblLK70Xa+ESGA7quSTc+JT2nZt6lIA7RyS34Kk=;
	b=mTXomne/4Axtx5lUIhSrRTes0RUrKsPVa6Vi3h5Ie/CkomsVTihwGKKy8hIbBGmV0NIAEA
	IsdOokU40gjWxTQuI4GHGrnV0wnk9HKlWwSCJ3u17HshiI8v46z1nboe2E346g00+Wkbnb
	0qYiQayT2AijfdScMgQr1H4MLxezwPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782729565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=haZ5nblLK70Xa+ESGA7quSTc+JT2nZt6lIA7RyS34Kk=;
	b=xKCrSnZ4gtBqx+m+LLXl8VM2fnGE12F2Jae1J+n6PH1RnIDmZvpB7BcSKALRkrevqcTekI
	HeucCfIKkwN05dCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0D29779A8;
	Mon, 29 Jun 2026 10:39:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IQCcMFxLQmrsJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jun 2026 10:39:24 +0000
Date: Mon, 29 Jun 2026 12:39:24 +0200
Message-ID: <87wlvhpr4z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22N=EDcolas_F=2E_R=2E_A=2E_Prado=22?=
 <nfraprado@collabora.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Force resume if acomp notified during system suspend
In-Reply-To: <20260626-hda-force-resume-eld-notify-v1-1-a92cb01393e0@collabora.com>
References: <20260626-hda-force-resume-eld-notify-v1-1-a92cb01393e0@collabora.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1EC0375DA2
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 26 Jun 2026 17:47:22 +0200,
Nícolas F. R. A. Prado wrote:
> 
> Currently if an HDMI cable is connected while the system is suspended,
> the HDMI audio jack status stays off after resume.
> 
> This is due to the jack state not being synced by the HDA HDMI codec
> device's runtime resume, as that never happens if the device was runtime
> suspended before the system suspended, or by the acomp notification
> triggered from the DRM side if that happens before the HDA HDMI codec
> device has resumed.
> 
> To fix this, if snd_hda_hdmi_acomp_pin_eld_notify() gets called before
> the HDA HDMI codec device has resumed, mark it to be forcefully runtime
> resumed at the next PM complete time.
> 
> Do this using a separate acomp_requested_resume flag that can be
> temporarily set without overwriting forced_resume for drivers that
> always want to force resume.
> 
> Assisted-by: Copilot:claude-sonnet-4.6
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied to for-next branch now.  Thanks.


Takashi
