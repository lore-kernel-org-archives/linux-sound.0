Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556721E52D
	for <linux-sound@vger.kernel.org>; Sat, 31 Aug 2024 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725090420; cv=none; b=gtwZDqP8wzbAxQme4y/er3sU2mMw44hmsJh9LP1CKLjctbjDJLBUXhRfxT1lHd6X9/kGNmaVBe27Ae6EmJ/IWfkgJhcIguFxwyaHFzZP+sT2lhID5c3mfKKvho9/vS6j6B2AOV5BQyG9cU9xAbeWDiWmlJ9UHmva4jZ5I3UIRto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725090420; c=relaxed/simple;
	bh=WtC2CSIAmId0Gltt9yn+m8o5KF9jHAm3kLziCmmAdZE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1LvDRk5gqRNMk0joL8bpduGaVM0xY1YACb5eGUXL4FiV+x8pJ3FUjEERAZ8Cr5ReJpLhve11XrJpPWDxXKZnfvHSdkMfyCdwdSSvWwh2EoHqSI06qXNEjMrr4X8IF1zYgdAsnXgxa4kjOq1jQgsxSJmfYUkenEfOpVp/6XzUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J0fePawk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZjTP9K4i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J0fePawk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZjTP9K4i; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J0fePawk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZjTP9K4i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J0fePawk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZjTP9K4i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C8E621A96;
	Sat, 31 Aug 2024 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725090416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ra1ejfsgceAPBojEdDORBD1rMooUordR370Wb7Gd6o=;
	b=J0fePawk7PxkeyFt7h/54gzR6LG4KsvGVS/Vg5XLf9CI+gfnsRfFPBndMJgdFPMlL66q6h
	etjva8DnqtptD3DTjaXwjgW1c/DCnMD8N0o2aC3yKj1MlEhpkyvRYjWZz+IntJCS7w0Dbs
	HFIpGFM2meZP69GZLi02KwvTlK4lrYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725090416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ra1ejfsgceAPBojEdDORBD1rMooUordR370Wb7Gd6o=;
	b=ZjTP9K4iCPpJCVLGMPCgo23ygIgHY8zu0Oc3j+GDVSSZyXiX0u/xV8a1T5yEsJkwjROWQs
	hHHmcDxowuSJPBDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725090416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ra1ejfsgceAPBojEdDORBD1rMooUordR370Wb7Gd6o=;
	b=J0fePawk7PxkeyFt7h/54gzR6LG4KsvGVS/Vg5XLf9CI+gfnsRfFPBndMJgdFPMlL66q6h
	etjva8DnqtptD3DTjaXwjgW1c/DCnMD8N0o2aC3yKj1MlEhpkyvRYjWZz+IntJCS7w0Dbs
	HFIpGFM2meZP69GZLi02KwvTlK4lrYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725090416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ra1ejfsgceAPBojEdDORBD1rMooUordR370Wb7Gd6o=;
	b=ZjTP9K4iCPpJCVLGMPCgo23ygIgHY8zu0Oc3j+GDVSSZyXiX0u/xV8a1T5yEsJkwjROWQs
	hHHmcDxowuSJPBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C5D6139D3;
	Sat, 31 Aug 2024 07:46:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xIUXAXDK0mbPcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Aug 2024 07:46:56 +0000
Date: Sat, 31 Aug 2024 09:47:41 +0200
Message-ID: <87le0djfqa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH -next] ALSA: pcm: replace simple_strtoul to kstrtoul
In-Reply-To: <1e4bee4b-023c-40e2-ac4a-f71299fa2efd@huawei.com>
References: <20240830080135.3544948-1-lihongbo22@huawei.com>
	<87frqml8rr.wl-tiwai@suse.de>
	<1e4bee4b-023c-40e2-ac4a-f71299fa2efd@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 31 Aug 2024 03:19:06 +0200,
Hongbo Li wrote:
> 
> buffer->error
> 
> On 2024/8/30 16:22, Takashi Iwai wrote:
> > On Fri, 30 Aug 2024 10:01:35 +0200,
> > Hongbo Li wrote:
> >> 
> >> As mentioned in [1], "...simple_strtol(), simple_strtoll(),
> >> simple_strtoul(), and simple_strtoull() functions explicitly
> >> ignore overflows, which may lead to unexpected results in callers."
> >> Hence, the use of those functions is discouraged.
> >> 
> >> This patch replace the use of the simple_strtoul with the safer
> >> alternatives kstrtoul.
> >> 
> >> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
> >> 
> >> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> >> ---
> >>   sound/core/pcm_memory.c | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
> >> index 8e4c68e3bbd0..fea8bed02604 100644
> >> --- a/sound/core/pcm_memory.c
> >> +++ b/sound/core/pcm_memory.c
> >> @@ -185,6 +185,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
> >>   	char line[64], str[64];
> >>   	size_t size;
> >>   	struct snd_dma_buffer new_dmab;
> >> +	int ret;
> >>     	guard(mutex)(&substream->pcm->open_mutex);
> >>   	if (substream->runtime) {
> >> @@ -193,8 +194,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
> >>   	}
> >>   	if (!snd_info_get_line(buffer, line, sizeof(line))) {
> >>   		snd_info_get_str(str, line, sizeof(str));
> >> -		size = simple_strtoul(str, NULL, 10) * 1024;
> >> -		if ((size != 0 && size < 8192) || size > substream->dma_max) {
> >> +		ret = kstrtoul(str, 10, &size);
> >> +		size *= 1024;
> >> +		if ((ret != 0) || (size != 0 && size < 8192) ||
> > 
> > The parentheses around "ret != 0" is superfluous.
> > And you can set the value to buffer->error, too.
> > 
> > That said, it's better not to put the ret value check in that if
> > block, but put another check right after kstrtoul() call.
> > 
> Do you mean :
> 
> buffer->error = kstrtoul(str, 10, &size);
> if (buffer->error != 0)
>     return;
> size *= 1024;
> if (size != 0 && size < 8192)) {
>     buffer->error = -EINVAL;
>     return;
> }

Yes, something like that.


thanks,

Takashi
