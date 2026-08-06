Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE2140A93F
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018009; cv=none; b=pkHFJnqcVDv7e+xfMsDXSwVFUlUzxJAzP804mO29q2u/h3cxM7eR7aW95Wm5S7Q4qRJ0y5aa5DxgW/7CRuB0znVTi8K0eHZjQR4c9eru4cPRJjSt6Qjn4/1nOOH4z0IMTWtIJV8vIHogDMNdBBHXZ6EDNJImbU+WLDPMBgNhPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018009; c=relaxed/simple;
	bh=p1bycw2zbAwGgf/9mx9OllINHj5orzt5ZGWa5kid+Rw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tw9NmxMOSWaiWZcsNajJjsGYwnaZ7j6VR7ekGyMB/wnu3LYF4a9zd1LHHYV5B2lmFHzQas72V8tIPIKNhQs52Vf8CSZyxVEKl7MvvU+t3QZRVYru9IXoOvS0dvt011BJ4PYZ0CqrPiOD4951fx/+Pa+GK9aGk1GABjfDM20yQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zAC2tnVT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WifKwuQS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xXJZGHJh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AQJ6RXUk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zAC2tnVT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WifKwuQS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xXJZGHJh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AQJ6RXUk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 641FC3E06;
	Thu,  6 Aug 2026 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786018001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xA9wEuYQkJoWl9ocfZHhgF0Gc3YW1sp9J4GDAQvHAc=;
	b=zAC2tnVTlyxF2DbUUJFFlgoGMeAd0+SpFboxdaTChC7N5w5XopdxUDMYhkGBB+sI0ew2K5
	eizs40bvlGTPuvATg+ib/u5pHd1bOSM3J7RHKXJ4EIFL6ZmEu4E0kfyur2/OER1PRT6lT1
	OGWp74+OAZMATl7kyIBs8nGyerWSDIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786018001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xA9wEuYQkJoWl9ocfZHhgF0Gc3YW1sp9J4GDAQvHAc=;
	b=WifKwuQSfEZgma4SpRrQWl382/1Rm3N80jjUxAOBQF9H0vQj8Gy2kVKdwK8gOQb90GJyrw
	nxPPtud1g85W9UBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xXJZGHJh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AQJ6RXUk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786017997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xA9wEuYQkJoWl9ocfZHhgF0Gc3YW1sp9J4GDAQvHAc=;
	b=xXJZGHJhRbyP7Z6csgJBukFLahGHQrpFjDkWEy1eZGsmkf7dOBl3WjFIMl5UvKWoyM3hQB
	iwwYaZq6Vz2jQQgZ5sk6LjcC3zWzq6Z2FzHmLwuih/oTZoe4KD57XNlGUfKXAyzYy5WFay
	C5LAfzPAZmJB/Ua6z+2aStDDQLt61cI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786017997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xA9wEuYQkJoWl9ocfZHhgF0Gc3YW1sp9J4GDAQvHAc=;
	b=AQJ6RXUkaJ1VNTMxhdVBawGxGGYPL/FLJFEvrT7vIGltmrnr3FNS7OpnplJKxHhvc3kiX5
	cYhGSm64pIzBd7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17CB2779B6;
	Thu,  6 Aug 2026 12:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UJWgBM14dGpCSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 12:06:37 +0000
Date: Thu, 06 Aug 2026 14:06:36 +0200
Message-ID: <874ih7e9mb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 31/31] ASoC: SOF: Use auto-cleanup for firmware loading
In-Reply-To: <a06c0cde-e321-4fa6-9743-23bf9826edf6@linux.intel.com>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-32-tiwai@suse.de>
	<a06c0cde-e321-4fa6-9743-23bf9826edf6@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,vger.kernel.org,gmail.com,linux.intel.com,nxp.com,linux.dev,amd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim,amd.com:email,nxp.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 641FC3E06
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Thu, 06 Aug 2026 13:56:30 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 05/08/2026 16:52, Takashi Iwai wrote:
> > Simplify the code to manage the firmware loading with __free(firmware)
> > and __free(kfree) auto-cleanups for the firmware data and the temporary
> > string or array.
> > 
> > Only the code refactoring, no functional changes.
> > 
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/soc/sof/fw-file-profile.c | 19 +++++++------------
> >  sound/soc/sof/topology.c        | 20 ++++++--------------
> >  2 files changed, 13 insertions(+), 26 deletions(-)
> > 
> > diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
> > index 76bde2e0be1d..fcd57f04ca36 100644
> > --- a/sound/soc/sof/fw-file-profile.c
> > +++ b/sound/soc/sof/fw-file-profile.c
> > @@ -16,20 +16,19 @@ static int sof_test_firmware_file(struct device *dev,
> >  				  enum sof_ipc_type *ipc_type_to_adjust)
> >  {
> >  	enum sof_ipc_type fw_ipc_type;
> > -	const struct firmware *fw;
> > -	const char *fw_filename;
> >  	const u32 *magic;
> >  	int ret;
> >  
> > -	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
> > -				profile->fw_name);
> > +	const char *fw_filename __free(kfree) =
> > +		kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
> > +			  profile->fw_name);
> >  	if (!fw_filename)
> >  		return -ENOMEM;
> >  
> > +	const struct firmware *fw __free(firmware) = NULL;
> 
> can we keep this at the head of the function?

We can, but for the auto-cleaned stuff, it's rather recommended to put
the declaration at the position that actually starts using it.  Then
you can avoid the unnecessary handling of the auto-cleanup.

(I don't find whether it's mentioned, though; the documentation about
the auto-cleanup isn't well organized yet, unfortunately...)


thanks,

Takashi
