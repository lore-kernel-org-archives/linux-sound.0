Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112638;
	b=rCP6EEU8wJZWzNm5mXwTyRjKO762n/2zwDNSqt674LeanpwE1l/s6eU6eI/JrUjsr5xQ
	 JSaHiw1Xd840Z9EOnK8+5DWXclhSq3QF5+TPqykjLv3CltZUdddK6chKn1HqEM4HOcZP6
	 1Uh4ETLXYYel1NCU8VOQjkvCXkH0j6qgSlbZkrAJMmgSF6OPc2ZtVElBKSQ3WulOGwqip
	 /zt5Vq69r3eAP12mm3vUKAKW6uc9BLjfshpq1182PHlWr1KGHsQWxM3wmVCcVw/wHAF/a
	 MxXcveun3dL1Qwdm7b5XPCiIZJZPTc8JiHINye7qMMy6zo7u4b+DaiP9GqV2Lqq+xJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112638;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=qcc4gZh4ddKDhIA04TtugUGyXpDCqRrij91vMBCINhk=;
	b=qgodEohbKx65CU24sB4+f4GrBf97uExIMlTg6XAfGiUCP5RHaQ2tqaJpik3sw2mhS6LG
	 JTegTdVBIvTmtD+TLmJjQMdhPsEhtkDXSsPJgSvrZ0KnfR5TkhxRF8RG4TOa7EOYwsd4p
	 V6v/1WAneJ7AXyiX7djV2gWzy7weJISihKYkhfs6wz9ENEW94hPeLxKIFvkiOzQ9IgOcA
	 HSabQLzFcUs8sEcL0/N7mUEZz+25JX8YQozOQLi3sFBpsOnXZpoVU591lENkHisrm9mx0
	 Y+GtAZFiTKATTrg5bld49mctOA/efdY6nP8CUyglUzFYwnK306J/BePLd0SJSKN5B2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wT1vZSMx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zcCdiY4J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wT1vZSMx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zcCdiY4J;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7738606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7738606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wT1vZSMx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zcCdiY4J;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wT1vZSMx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zcCdiY4J
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1499321F0F;
	Tue, 27 Oct 2026 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793112636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcc4gZh4ddKDhIA04TtugUGyXpDCqRrij91vMBCINhk=;
	b=wT1vZSMxj5aWf+yCBvSE2xZigGX0Aaj5ddfT1121nLXrE6jtgLHY4/auAJ5SbpG3SmQ84g
	x75Qd5TJMBuOkngexGoERSUkdGNquZtHvY/v/XHz3LodWdkZmNcVLTXu7TDo9bZbTRhv23
	0j1yAlb2RYd8mGvOf7FGk+DNC/osJuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793112636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcc4gZh4ddKDhIA04TtugUGyXpDCqRrij91vMBCINhk=;
	b=zcCdiY4JesD5AOgxTgPVc0sR7igWNJfP95h7lYZsh78WUxUIj0kyd1XbS+fW2ChjiADcn1
	dlflzuv+7RPTSpDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wT1vZSMx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zcCdiY4J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793112636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcc4gZh4ddKDhIA04TtugUGyXpDCqRrij91vMBCINhk=;
	b=wT1vZSMxj5aWf+yCBvSE2xZigGX0Aaj5ddfT1121nLXrE6jtgLHY4/auAJ5SbpG3SmQ84g
	x75Qd5TJMBuOkngexGoERSUkdGNquZtHvY/v/XHz3LodWdkZmNcVLTXu7TDo9bZbTRhv23
	0j1yAlb2RYd8mGvOf7FGk+DNC/osJuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793112636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcc4gZh4ddKDhIA04TtugUGyXpDCqRrij91vMBCINhk=;
	b=zcCdiY4JesD5AOgxTgPVc0sR7igWNJfP95h7lYZsh78WUxUIj0kyd1XbS+fW2ChjiADcn1
	dlflzuv+7RPTSpDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3E5F1321C;
	Tue, 27 Oct 2026 14:50:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S9LwKzu64GpCIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 14:50:35 +0000
Date: Tue, 27 Oct 2026 15:50:35 +0100
Message-ID: <87ld7j19l0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mikael Magnusson <mikachu@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: update state after xrun
In-Reply-To: <20261027131233.17692-1-mikachu@gmail.com>
References: <20261027131233.17692-1-mikachu@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 1499321F0F

On Tue, 27 Oct 2026 14:12:33 +0100,
Mikael Magnusson wrote:
> 
> If the snd_pcm_update_hw_ptr call from snd_pcm_status is what triggers
> the xrun state (eg, as opposed to an IRQ), the returned status->state
> was stale and told userspace the device was still playing, so they could
> get confused about device state and hang indefinitely.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222201
> Signed-off-by: Mikael Magnusson <mikachu@gmail.com>
> ---
>  sound/core/pcm_native.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 35152fae74..62a2bea043 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1132,6 +1132,9 @@ int snd_pcm_status64(struct snd_pcm_substream *substream,
>  	status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
>  	if (snd_pcm_running(substream)) {
>  		snd_pcm_update_hw_ptr(substream);
> +		/* update_hw_ptr may have put us in xrun state, update state */
> +		status->state = runtime->state;
> +		status->suspended_state = runtime->suspended_state;
>  		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
>  			status->tstamp_sec = runtime->status->tstamp.tv_sec;
>  			status->tstamp_nsec =
> 

Thanks for the patch.  I can take this as-is, but what Sashiko
suggested in the review is also valid -- we may copy trigge_tstamp_*,
too.

Also, we don't have to always overwrite the values.  As a further
optimization, check the return value from snd_pcm_update_hw_ptr(), and
update only if it returns a negative (-EPIPE).

So, in the end, it'll be something like below.
Could you check whether this works for you?


thanks,

Takashi

-- 8< --
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1131,7 +1131,13 @@ int snd_pcm_status64(struct snd_pcm_substream *substream,
 	status->trigger_tstamp_sec = runtime->trigger_tstamp.tv_sec;
 	status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
 	if (snd_pcm_running(substream)) {
-		snd_pcm_update_hw_ptr(substream);
+		if (snd_pcm_update_hw_ptr(substream) < 0) {
+			/* update_hw_ptr may have put us in xrun state, update state */
+			status->state = runtime->state;
+			status->suspended_state = runtime->suspended_state;
+			status->trigger_tstamp_sec = runtime->trigger_tstamp.tv_sec;
+			status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
+		}
 		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
 			status->tstamp_sec = runtime->status->tstamp.tv_sec;
 			status->tstamp_nsec =

