Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035E1EE7A3
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594652; cv=none; b=ji13NSHsSlal4X5VcIMsSwudCPUwGoVVE4nqlX2UoSTCFT/bzPha9cAH8TByUPpj5rXijaKUHVW887gLaQfRNtu9jvtPsd1/kHZtHVA49AoxgTfipOWIf6/ASAAsDIMRf6IGpXQK5+dX++rde7SwJH5PeGLcNs21oUpjK18+Qv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594652; c=relaxed/simple;
	bh=Sb2UGreSG5sjbqagJp8nK0csFn9u6ObqhmVe87A0iGU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k15g9DCbyUXqpYKNBdlOP5Ex2FBOe2/mY06Vsm1KdY92eHAnU0APYcIG2dtjUEmyIh5VENv0cFhkc71amoTIgCxE5JPFTm3Cp1LsOIlbLxXebND4hPW1BC/o7a0EjMhKGzhjYxYKGffg+o/M7sHnb7ulD1RiB4EtiVFBmT2Wpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1o8lfOwP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+CNuGroc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1o8lfOwP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+CNuGroc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1o8lfOwP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+CNuGroc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1o8lfOwP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+CNuGroc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CC0421186;
	Wed,  2 Apr 2025 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743594649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwDkMnn4uSlGHMbeRnfJwbAMTshQudmRo2wAGb4uBZo=;
	b=1o8lfOwP7qApCJe+l18IaztgDBpHDuJXvo5RvzWesJ/2DURKhV96AaC/JRpJea95OYl1Cm
	guSMJTDcAGdHYNubgI9jJ7uJgsyFQBqaTpeYv6ObNdgkhRDdCXW9gVLxiqGPhkWdTJXIGf
	4aMvFISjEN7vMDCj/uhS+hlX5bBcQ7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743594649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwDkMnn4uSlGHMbeRnfJwbAMTshQudmRo2wAGb4uBZo=;
	b=+CNuGroc8cKA/MzlqCfdMfu8Z7uqNWR2G7znzSaOEa43aDZQRkJfrqVaebYAAQtkxSANqf
	DgSwUQT3/WWi52BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1o8lfOwP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+CNuGroc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743594649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwDkMnn4uSlGHMbeRnfJwbAMTshQudmRo2wAGb4uBZo=;
	b=1o8lfOwP7qApCJe+l18IaztgDBpHDuJXvo5RvzWesJ/2DURKhV96AaC/JRpJea95OYl1Cm
	guSMJTDcAGdHYNubgI9jJ7uJgsyFQBqaTpeYv6ObNdgkhRDdCXW9gVLxiqGPhkWdTJXIGf
	4aMvFISjEN7vMDCj/uhS+hlX5bBcQ7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743594649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwDkMnn4uSlGHMbeRnfJwbAMTshQudmRo2wAGb4uBZo=;
	b=+CNuGroc8cKA/MzlqCfdMfu8Z7uqNWR2G7znzSaOEa43aDZQRkJfrqVaebYAAQtkxSANqf
	DgSwUQT3/WWi52BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFFCD13A4B;
	Wed,  2 Apr 2025 11:50:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aQZRMZgk7WdgdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 11:50:48 +0000
Date: Wed, 02 Apr 2025 13:50:48 +0200
Message-ID: <87jz82ye7b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
	<87h637znpp.wl-tiwai@suse.de>
	<35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
	<8734eryn21.wl-tiwai@suse.de>
	<ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
	<87v7rmylc5.wl-tiwai@suse.de>
	<d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
	<87o6xeyfkk.wl-tiwai@suse.de>
	<69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2CC0421186
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Apr 2025 13:43:57 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 02/04/2025 14:21, Takashi Iwai wrote:
> >>> On the second thought, yet another variant would be to introduce only
> >>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
> >>> PAUSED state as a step before stopping the stream.  This can be
> >>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
> >>> If the driver doesn't support this mode, the PCM core may fall back to
> >>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
> >>
> >> This looks identical to my proposed
> >> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
> >> explanatory. It's not clear what PAUSE_RESET should do (probably the
> >> stream should be kept inactive).
> > 
> > There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
> > doesn't have to stop the stream by itself, but it's only a preparation
> > for stopping.  That is, a proper TRIGGER_STOP always follows after
> > TRIGGER_PAUSE_RESET.
> 
> But what state that we move after we reset the PAUSE? is it RUNNING
> (iow, equals to PAUSE_RELEASE) or something else?

It'll be temporarily set to RUNNING.

> In case of suspend while the state is paused we will:
> TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?

For suspend, PAUSE_RESET, then SUSPEND.
For dropping, PAUSE_RESET, then STOP.

> Most drivers are doing the same thing for STOP and SUSPEND trigger,
> however it is possible to do extra steps for SUSPEND to make sure that
> the whole system is in a lowest power state.

Yes, that's the reason I proposed PAUSE_RESET.  Then the driver can
handle the following stop or suspend operation differently.

That said, PAUSE_RESET is just another variant of PAUSE_RELEASE.
But this shouldn't actually enable the audio output again, but prepare
for the next SUSPEND or STOP trigger.


Takashi
