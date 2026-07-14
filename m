Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324B73BBFAE;
	Tue, 14 Jul 2026 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034143; cv=none; b=fjpUb/XhlRTqAf5MAPAGWr6fvRftmvSN7nW1gk4NfxeHcv9vezTrUxSUgcVkbzRP1K7SjzsjkJl90LSjJ7Mn/nN3YyMwezgzA6V3skj+UkRxQrG6sgY3j6mr6RBobrw2YuCy13jn77K+dJI6NEiVTI1lgP0/cuTqc4qE6Onhqkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034143; c=relaxed/simple;
	bh=jIMu7VNkBnisQF+WiIZCPNTjG5XuLTJFxUzNch7rp1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPzWVCeLm5PpR1pFuyM+jctecN43QwQgJlvDt+O9O8suQFfM5PGDpEUFheSs+EiWI8bC2D5+3vT274zjIUGiqJ0zWdotROoNWFDiX5PzGmbuKwRzlfhiwIUC1vLi8jML/1hNm/mOVO4QYYm9CRZj9a/bIq+nu9sOkISO0G885fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3b0574c27f8411f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f7b7b950-284d-44ec-9469-46baeac8b644,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dafe997d1209d6f13553bc411b42027c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|817|865|898,TC:nil,Conte
	nt:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b0574c27f8411f1aa26b74ffac11d73-20260714
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2040321335; Tue, 14 Jul 2026 21:02:12 +0800
Message-ID: <474deb99-7ac2-40cf-a5a3-c2a3feb064b9@kylinos.cn>
Date: Tue, 14 Jul 2026 21:02:09 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio
 device
To: Takashi Iwai <tiwai@suse.de>
Cc: Gordon Chen <chengordon326@gmail.com>, perex@perex.cz, tiwai@suse.com,
 kees@kernel.org, jussi@sonarnerd.net, hulianqin@vivo.com, i@rong.moe,
 g@b4.vu, cryolitia@uniontech.com, pav@iki.fi, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, mathias.nyman@linux.intel.com
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
 <18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
 <5ed9e0a3-e8ac-4295-b876-dcda8b96ca1e@kylinos.cn>
 <87tsq2yq70.wl-tiwai@suse.de>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <87tsq2yq70.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> On Tue, 14 Jul 2026 03:58:08 +0200,
> Zhang Heng wrote:
>>> On Mon, Jul 13, 2026 at 04:10:48PM +0800, Zhang Heng wrote:
>>>> +		/* Generic USB Audio (0x1e0b:d01e): use SIA for consistent scheduling */
>>>> +		if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e))
>>>> +			u->urb->transfer_flags |= URB_ISO_ASAP;
>>> Not a maintainer, just a bystander who was Cc'd -- two small notes on the
>>> form of the patch, plus one question I can't answer myself.
>>>
>>> A per-device usb_id comparison in the endpoint.c fast path seems like the
>>> kind of thing the quirk_flags_table in quirks.c exists to avoid. Would a
>>> QUIRK_FLAG_ISO_ASAP (set in the table, tested here as
>>> chip->quirk_flags & QUIRK_FLAG_ISO_ASAP) work for you? It keeps endpoint.c
>>> device-agnostic, and the next device with the same symptom becomes a
>>> one-line table entry rather than another if.
>> First of all, let me clarify: this issue occurs when there is startup music,
>> but it plays normally after entering the system. There is a heavy creaking
>> sound when the system is turned on here. Based on the information from dmesg
>> and syslog, there are a large number of xhci hcd frame synchronization
>> failures. I tried adding URB_ISO_ASAP here, and it will be much better,
>> with only a little noise.
> OK, but it still makes sense to deal URB_ISO_ASAP workaround more
> generically.
>
>>>> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
>>>> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
>>>> +		ep->skip_packets = 4;
>>> The block immediately above this one already does exactly
>>> "type == SND_USB_ENDPOINT_TYPE_SYNC -> skip_packets = 4"; adding the ID to
>>> that condition would avoid the duplicate if. Also, the changelog doesn't
>>> say what this hunk contributes on its own -- is URB_ISO_ASAP alone
>>> insufficient, and if so, what does skipping the first 4 sync packets fix
>>> that ASAP doesn't? Right now the two changes are indistinguishable in the
>>> commit message, and skip_packets = 4 reads as belt-and-braces.
>> As mentioned above, there is still a bit of noise when only adding
>> URB_ISO_ASAP,
>>
>> but skip-packets=4 can solve this problem.
> Well, one missing thing is to understand why this fixes.
> Originally, the skip_packets=4 for Playback Design devices was
> introduced for bogus feedback packets at the start of the stream long
> time ago.  But that's the only known device that needs it.  Does your
> device send also 4 bogus packets?
>
> The skip_packets=16 for M-Audio devices are rather for avoiding the
> latency.  And, speaking of latency, I have a patch for the lowlatency
> support of implicit fb mode, but never had a test environment.
> Could you check the patch below and see the patch below has any
> positive/negative influence?  Just to be sure.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> index 682b6c1fe76b..6d144e39a849 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -265,6 +265,7 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip,
>   	return 0;
>   }
>   
> +/* stop both data and sync endpoints */
>   static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
>   {
>   	bool stopped = 0;
> @@ -280,6 +281,24 @@ static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
>   	return stopped;
>   }
>   
> +/* only start sync endpoint */
> +static int start_sync_endpoint(struct snd_usb_substream *subs)
> +{
> +	int err;
> +
> +	if (subs->sync_endpoint &&
> +	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
> +		err = snd_usb_endpoint_start(subs->sync_endpoint);
> +		if (err < 0) {
> +			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* start both data and sync endpoints */
>   static int start_endpoints(struct snd_usb_substream *subs)
>   {
>   	int err;
> @@ -295,14 +314,9 @@ static int start_endpoints(struct snd_usb_substream *subs)
>   		}
>   	}
>   
> -	if (subs->sync_endpoint &&
> -	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
> -		err = snd_usb_endpoint_start(subs->sync_endpoint);
> -		if (err < 0) {
> -			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
> -			goto error;
> -		}
> -	}
> +	err = start_sync_endpoint(subs);
> +	if (err < 0)
> +		goto error;
>   
>   	return 0;
>   
> @@ -656,12 +670,16 @@ static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
>   		return false;
>   	if (in_free_wheeling_mode(runtime))
>   		return false;
> -	/* implicit feedback mode has own operation mode */
> -	if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
> -		return false;
>   	return true;
>   }
>   
> +/* return true if it's a normal playback (not in implicit fb) */
> +static bool is_normal_lowlatency_playback(struct snd_usb_substream *subs)
> +{
> +	return subs->lowlatency_playback &&
> +		!snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint);
> +}
> +
>   /*
>    * prepare callback
>    *
> @@ -709,9 +727,11 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
>   	runtime->delay = 0;
>   
>   	subs->lowlatency_playback = lowlatency_playback_available(runtime, subs);
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
> -	    !subs->lowlatency_playback) {
> -		ret = start_endpoints(subs);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		if (!subs->lowlatency_playback)
> +			ret = start_endpoints(subs);
> +		else if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
> +			ret = start_sync_endpoint(subs);
>   		/* if XRUN happens at starting streams (possibly with implicit
>   		 * fb case), restart again, but only try once.
>   		 */
> @@ -1539,7 +1559,7 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
>   		frame_limit = subs->frame_limit + ep->max_urb_frames;
>   		transfer_done = subs->transfer_done;
>   
> -		if (subs->lowlatency_playback &&
> +		if (is_normal_lowlatency_playback(subs) &&
>   		    runtime->state != SNDRV_PCM_STATE_DRAINING) {
>   			unsigned int hwptr = subs->hwptr_done / stride;
>   
> @@ -1625,7 +1645,8 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
>   			subs->trigger_tstamp_pending_update = false;
>   		}
>   
> -		if (period_elapsed && !subs->running && subs->lowlatency_playback) {
> +		if (period_elapsed && !subs->running &&
> +		    is_normal_lowlatency_playback(subs)) {
>   			subs->period_elapsed_pending = 1;
>   			period_elapsed = 0;
>   		}
> @@ -1677,7 +1698,7 @@ static int snd_usb_pcm_playback_ack(struct snd_pcm_substream *substream)
>   	struct snd_usb_substream *subs = substream->runtime->private_data;
>   	struct snd_usb_endpoint *ep;
>   
> -	if (!subs->lowlatency_playback || !subs->running)
> +	if (!is_normal_lowlatency_playback(subs) || !subs->running)
>   		return 0;
>   	ep = subs->data_endpoint;
>   	if (!ep)
> @@ -1705,6 +1726,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
>   					      prepare_playback_urb,
>   					      retire_playback_urb,
>   					      subs);
> +		/* start EPs for both normal and implicit-fb modes */
>   		if (subs->lowlatency_playback &&
>   		    cmd == SNDRV_PCM_TRIGGER_START) {
>   			if (in_free_wheeling_mode(substream->runtime))
Regarding your patch, I am unable to test it because my current
kernel is based on a certain stable version of 5.4. The
differences in pcm.c are too significant, so the patch cannot
be applied directly.
