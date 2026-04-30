Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909D02F90E0
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538474; cv=none; b=sUku3N6rKVYl6KEFwE+LzKhyv3E1KLe9BJtMzxqU6UiTXQMskAgTY76FwFHjsNdcXKzKYB0SyJcTNhYa3srGRrdWhqgLZ/XfDs3MNY+kOG+UkZeDQ2T5bMJBnjEzTiH+dnPVWndhz7KRQsNhN3HCK0W6amofOpUlt5WhrHhMC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538474; c=relaxed/simple;
	bh=9vm5ehJ0GzQOXgHF9Ehwwdao12hR9XB8vWSyJWi1Jsg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NE/v7r0BA0lYnLY0NdVqNZ0JNG57jfqzbb+YpRpX0FW6UcqYcgUc7RKydAfuOOS5UGgDEGGVAeOlBVt2BUc/AU2MsF3/Sa1v2K9g/ca7R8q7nuD89b3CnHaOkr9Az8spMlqnifi7jBytV44tuWRaHPyNG6WN4Og86IMNO5hEzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SvcbXN+8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cIt8B6/E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SvcbXN+8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cIt8B6/E; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SvcbXN+8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cIt8B6/E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SvcbXN+8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cIt8B6/E"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 629525BD51;
	Thu, 30 Apr 2026 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777538470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vStvWdzKunQ7K9p19E2Plc2FQjOz4MVOgZJgHA/fFE8=;
	b=SvcbXN+8JV1JaUKi6ENzLeuxXi/xnnlS6sOXUVwOWWXKwSI6yfM17VuHUAtsH55wmEPs/s
	B8OsH1pkS1O2yXvZNalUgN0h/7SncLuShuYlW9UZsqqUaWy72q89HmkEwirOPmtA/czyhg
	tpPYQxioH9809AuovONEOQjUSX6mwPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777538470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vStvWdzKunQ7K9p19E2Plc2FQjOz4MVOgZJgHA/fFE8=;
	b=cIt8B6/EECgKZVAxX/DlPd/w1927LlnsyocRI8w2NhY9wAymWMr+eQWbHazv6jYUIr2YH3
	c8AG8keNJVDCK2BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777538470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vStvWdzKunQ7K9p19E2Plc2FQjOz4MVOgZJgHA/fFE8=;
	b=SvcbXN+8JV1JaUKi6ENzLeuxXi/xnnlS6sOXUVwOWWXKwSI6yfM17VuHUAtsH55wmEPs/s
	B8OsH1pkS1O2yXvZNalUgN0h/7SncLuShuYlW9UZsqqUaWy72q89HmkEwirOPmtA/czyhg
	tpPYQxioH9809AuovONEOQjUSX6mwPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777538470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vStvWdzKunQ7K9p19E2Plc2FQjOz4MVOgZJgHA/fFE8=;
	b=cIt8B6/EECgKZVAxX/DlPd/w1927LlnsyocRI8w2NhY9wAymWMr+eQWbHazv6jYUIr2YH3
	c8AG8keNJVDCK2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1502C593B0;
	Thu, 30 Apr 2026 08:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XMjlA6YV82kYEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Apr 2026 08:41:10 +0000
Date: Thu, 30 Apr 2026 10:41:09 +0200
Message-ID: <87cxzgon6i.wl-tiwai@suse.de>
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
	harshit.m.mogalapalli@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: qcom: move offload usage counting to stream request handler
In-Reply-To: <20260422022842.1543366-1-guanyulin@google.com>
References: <20260422022842.1543366-1-guanyulin@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,qualcomm.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 22 Apr 2026 04:28:39 +0200,
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

Does this work for the case where the driver gets forcibly removed
(disconnected) while being used?  That is, handle_uaudio_stream_req()
is guaranteed to be called at disconnection?  Otherwise it may leave
the refcount unbalanced.


thanks,

Takashi

> ---
> V2 -> V3: Fix canonical patch format error
> V1 -> V2: Add error handling path in handle_uaudio_stream_req()
> 
> v2: https://lore.kernel.org/all/20260421094337.740485-1-guanyulin@google.com/
> v1: https://lore.kernel.org/all/20260417054641.3814385-1-guanyulin@google.com/
> 
>  sound/usb/qcom/qc_audio_offload.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 2ac813d57f4f..6b4349d85665 100644
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
> @@ -1614,6 +1612,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  			ret = prepare_qmi_response(subs, req_msg, &resp,
>  						   info_idx);
>  		if (ret < 0) {
> +			usb_offload_put(subs->dev);
>  			guard(mutex)(&chip->mutex);
>  			subs->opened = 0;
>  		}
> @@ -1658,9 +1657,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  			uaudio_dev_intf_cleanup(uadev[pcm_card_num].udev,
>  						info);
>  		}
> -		if (atomic_read(&uadev[pcm_card_num].in_use))
> +		if (atomic_read(&uadev[pcm_card_num].in_use)) {
>  			kref_put(&uadev[pcm_card_num].kref,
>  				 uaudio_dev_release);
> +			usb_offload_put(subs->dev);
> +		}
>  	}
>  	mutex_unlock(&qdev_mutex);
>  
> -- 
> 2.54.0.rc1.555.g9c883467ad-goog
> 
