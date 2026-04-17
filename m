Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC8A3AE1A6
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415755; cv=none; b=OF1SHYMfMmcM8bUpcoYxUF2i+3wUGRcjjzBFsKvWzgMqjXURnUB/SDuhnlUctL/pbc+6YgWEyQ36O7lsDg0fGd2edBj5azJrSLcksbj49kaAVrSaWaFOFE54WlDuyt6oBpKtbnp8EiuhyZsMiUtIPflafLWRuP6tb+knnDkhGs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415755; c=relaxed/simple;
	bh=S89rYj36SueKjTEa8OelPHVRy+PlGWaRwyfhLow/5Rc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEQ9+nKkX4K5TY8Ufya6SWvE1AcOvG9MQUVyarOW82Agt4NhoKjO40Kjp/dJ9KUhd8T5K8ULM8g62MOFj/hZoAwiBIkvljXCqim2LrfC1LLZwIs1sOh+X8ZJyAMT98F4HrjyJu/Cf8k4Or4RhoanVf/4jOZ8nYlixK9jJSqPxNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bosJE8Hi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zTLiSqwH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OeCF5xTk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZFgyK4ue; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bosJE8Hi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zTLiSqwH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OeCF5xTk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZFgyK4ue"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 478805BE44;
	Fri, 17 Apr 2026 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776415751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omzGKxlYSf9Dlad0/pBuO6I16G9M3itn7SBz92Wlt3g=;
	b=bosJE8HitNN0Vz87n0xabFyHhbSpW6Lo+K91wBrW469DfScEOQUpigTuZ7owJPwKsWfbRE
	1PjzLdK6Fd31eQtYMvDQM6lBSkD6XNirbXIfoo+1sLRJMWJoM9V/Uf3cS+RsYo8vhkdj4p
	oIiEQqJlEs51o0CPfm2gajFIYggGbWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776415751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omzGKxlYSf9Dlad0/pBuO6I16G9M3itn7SBz92Wlt3g=;
	b=zTLiSqwH7Z9gFkJ/5Ebg+p5dvQtXb3+iod5MQHSUKgxqEA5ZSJtQerAvPUgPPxymX77lbS
	DLSKinwVCF3aqCAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OeCF5xTk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZFgyK4ue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776415750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omzGKxlYSf9Dlad0/pBuO6I16G9M3itn7SBz92Wlt3g=;
	b=OeCF5xTk41JoDao3Lzl66PEOhevf5pPx8swix1UVfbU5HFoDgPiDLgxIuD0NhXmJSKYdLG
	z4cl9JS/Wnv2wIXXlZEIMHBSZaTSXOy7BQzClqR6+f6CeS/PLa6OslWcgndZ+vWKsql6qE
	qzpF8TGTCma79uOFUyLsIHDqbx/xuCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776415750;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omzGKxlYSf9Dlad0/pBuO6I16G9M3itn7SBz92Wlt3g=;
	b=ZFgyK4uemSbtfb0mvJ1klSKkPnq1AM1A/IiJyKInP8uw1dEb/vVeQV9UT2GEL/2gRulsCW
	d2ZYhXOTflLSwwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA26C593AF;
	Fri, 17 Apr 2026 08:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2NHeNwX04WnhUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 08:49:09 +0000
Date: Fri, 17 Apr 2026 10:49:09 +0200
Message-ID: <87a4v2dla2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org,
	perex@perex.cz,
	kees@kernel.org,
	tiwai@suse.com,
	quic_wcheng@quicinc.com,
	arnd@arndb.de,
	wesley.cheng@oss.qualcomm.com,
	nkapron@google.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: qcom: move offload usage counting to stream request handler
In-Reply-To: <20260417054641.3814385-1-guanyulin@google.com>
References: <20260417054641.3814385-1-guanyulin@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,qualcomm.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 478805BE44

On Fri, 17 Apr 2026 07:43:30 +0200,
Guan-Yu Lin wrote:
> 
> Centralize usb_offload_get()/usb_offload_put() calls from various helper
> functions to handle_uaudio_stream_req(), which ensures the usage count
> is tied directly to the QMI stream enable/dsiable requests from audio
> DSP. Such design provides a clear synchronization point for the
> offloading lifecycle and correctly balances the count for both playback
> and capture paths while avoiding redundant increments during auxiliary
> operations.
> 
> Suggested-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 2ac813d57f4f..cddab55d4691 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -699,7 +699,6 @@ static void uaudio_event_ring_cleanup_free(struct uaudio_dev *dev)
>  		uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE,
>  				   PAGE_SIZE);
>  		xhci_sideband_remove_interrupter(uadev[dev->chip->card->number].sb);
> -		usb_offload_put(dev->udev);
>  	}
>  }
>  
> @@ -1183,16 +1182,12 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
>  	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
>  	er_pa = 0;
>  
> -	ret = usb_offload_get(subs->dev);
> -	if (ret < 0)
> -		goto exit;
> -
>  	/* event ring */
>  	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
>  					       0, uaudio_qdev->data->intr_num);
>  	if (ret < 0) {
>  		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
> -		goto put_offload;
> +		goto exit;
>  	}
>  
>  	sgt = xhci_sideband_get_event_buffer(uadev[card_num].sb);
> @@ -1224,8 +1219,6 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
>  	mem_info->dma = 0;
>  remove_interrupter:
>  	xhci_sideband_remove_interrupter(uadev[card_num].sb);
> -put_offload:
> -	usb_offload_put(subs->dev);
>  exit:
>  	return ret;
>  }
> @@ -1489,7 +1482,6 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
>  	uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE, PAGE_SIZE);
>  free_sec_ring:
>  	xhci_sideband_remove_interrupter(uadev[card_num].sb);
> -	usb_offload_put(subs->dev);
>  drop_sync_ep:
>  	if (subs->sync_endpoint) {
>  		uaudio_iommu_unmap(MEM_XFER_RING,
> @@ -1605,6 +1597,12 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  	uadev[pcm_card_num].ctrl_intf = chip->ctrl_intf;
>  
>  	if (req_msg->enable) {
> +		ret = usb_offload_get(subs->dev);
> +		if (ret < 0) {
> +			guard(mutex)(&chip->mutex);
> +			subs->opened = 0;
> +			goto response;
> +		}
>  		ret = enable_audio_stream(subs,
>  					  map_pcm_format(req_msg->audio_format),
>  					  req_msg->number_of_ch, req_msg->bit_rate,

I think the usb_offload_put() is missing at the error handling of the
call above?


thanks,

Takashi
