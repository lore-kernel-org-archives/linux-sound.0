Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097CC3B776A;
	Tue, 21 Apr 2026 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768147; cv=none; b=p3Spbt7NhbLJguSFa/7MAvSBn5kuNw9aASjSyOeq8zCofgY2HrjqxIaUZt4Dnuh5V6d8mjWfZ1JX1LMAOcay0Q1o8ujkfV6vpvOkjvnmP8KoZHjgkugORBdzpDLKDKZmfJs3czDCy91RlKdMGpwRM4ibAUDVyACOOp4r2xQmKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768147; c=relaxed/simple;
	bh=gHrP+KUJduKFI2aGpELFvOKolKtK+YiYl/Eu6/jSKvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXGCUK03wyi0I7dCGqZGUo46lJo7HaVaH4yK7IC+UuWkn+PkDHJcjEN8mCqcXzCLC0vasbIgZfCEgZiXwCm0x9Aj1Tjv5IopRboZjh6EApO2jB79dFnE9qIdE73Sb4bCVdV281uj4YWY2bUoInoEGy/ziTnmZ41zZ9cI5Wj8Vt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bj8EAPCC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bj8EAPCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB69C2BCB0;
	Tue, 21 Apr 2026 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776768146;
	bh=gHrP+KUJduKFI2aGpELFvOKolKtK+YiYl/Eu6/jSKvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bj8EAPCCcQLiEmx0C8LVzprk+v/FOuFs1PlnKnUiLlL2pM1f6zBkqOBI48+florEa
	 CL+u5UEXKFiQE2I9q4cZmMCMqD2Y42Jyb1HpM8iOsWOj8tExnbKa4S1j4PeK7pQxFZ
	 m5dAMt8bFibjon1U8Of5oNy6veLtl+toq/PSrzis=
Date: Tue, 21 Apr 2026 12:42:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: perex@perex.cz, kees@kernel.org, tiwai@suse.com,
	quic_wcheng@quicinc.com, arnd@arndb.de,
	wesley.cheng@oss.qualcomm.com, nkapron@google.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: qcom: move offload usage counting to
 stream request handler
Message-ID: <2026042106-icy-gerbil-2ca1@gregkh>
References: <20260421094337.740485-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421094337.740485-1-guanyulin@google.com>

On Tue, Apr 21, 2026 at 09:43:35AM +0000, Guan-Yu Lin wrote:
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
