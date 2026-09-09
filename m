Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BA56E060
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963794; cv=none; b=hU8cNCdaYORudWKfF5bhgyvV1RA2lRGIDhw/nt2+H9S15MHMPP1uZ17V/3dynEZyfHxW/P9ST2ajNpPcP8tNpwLwOWSM9KVbBJP53EeqzEp8NOEid0UOf5L7x5KhGQ3LsNT6mkdtcpH0P+EbUr/or9n+2QkAVq96v7fuNGjiEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963794; c=relaxed/simple;
	bh=WjmbMu1sa6kiwuG2+FVkRJ2OHuC24/cfEPhoForvaMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiKstICdr+oWLGDh6/dhUQAt/7Z7Qk7ZPACrtbBseuM+08/QIxOPrgzRPhdGnKrtknG1kzsh3ISLY7rL+BWDLKlbpcbTVP7dsYtEV3G591jlTdoJT5Yxwg+WQLTrUNLv8FbstfpSZ719LCPlB2k2if7UV+wdWALVFHb9t3po1Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BtK/R6ke; arc=none smtp.client-ip=95.215.58.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BtK/R6ke"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WjmbMu1sa6kiwuG2+FVkRJ2OHuC24/cfEPhoForvaMo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963791; v=1; x=1789568591;
 b=BtK/R6keMvrs0eKZjXNclvzau/Laa+vhsmo+nMrkFrV0lNxiMEkDbW1eyDO2nFhHO+1Q9Gu7
 0tUJS82KDhjPxncS9ZNPZmxonsDV4FHr+7Q/iKFqHc2iRaILVHJ/+wjcQpyO5fHaQOKAbU9qv1k
 1ihAhm4h3D11PX8eBlvQeFSY=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06ad494b273ae87f;
	Wed, 09 Sep 2026 14:23:10 +0000
X-Mizu-Trace-ID: 06ad494b273ae87f
X-Migadu-Flow: FLOW_OUT
Message-ID: <e97fa9fe-4728-4d05-b4fc-e2cc39259183@linux.dev>
Date: Wed, 9 Sep 2026 15:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/24] ASoC: SOF: ipc4: Handle compressed drain done
 notification from firmware
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-22-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-22-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> The decoder module sends a drain done notification when the last chunk of
> the stream after the EOS from host has been decoded.
> 
> The notification is a module notification with 0xc0c0 as magic number in
> event_id upper 16 bit.
> 
> Call sof_ipc4_compr_drain_done() when the notification arrives to handle
> it.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  include/sound/sof/ipc4/header.h |  3 ++-
>  sound/soc/sof/ipc4.c            | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
> index dd1e0d1cf0d8..c0216f4b14c2 100644
> --- a/include/sound/sof/ipc4/header.h
> +++ b/include/sound/sof/ipc4/header.h
> @@ -647,9 +647,10 @@ struct sof_ipc4_notify_module_data {
>   * The event_data contains the struct sof_ipc4_control_msg_payload of the control
>   * which sent the notification.
>   */
> -#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK		GENMASK(31, 16)
> +#define SOF_IPC4_NOTIFY_MODULE_EVENTID_SOF_MAGIC_MASK		GENMASK(31, 16)

not clear why you have to rename the MASK but not the VAL?

>  #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL		0xA15A0000
>  #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK	GENMASK(15, 0)

<dad joke> always stay away from paramid schemes </dad joke>
> +#define SOF_IPC4_NOTIFY_MODULE_EVENTID_COMPR_MAGIC_VAL		0xC0C00000

maybe just add this one and avoid the confusing rename above?

>  
>  /*
>   * Macros for creating struct sof_ipc4_module_init_ext_init payload
> diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
> index e77f73390bd8..b9dd798e59bc 100644
> --- a/sound/soc/sof/ipc4.c
> +++ b/sound/soc/sof/ipc4.c
> @@ -776,12 +776,21 @@ static void sof_ipc4_module_notification_handler(struct snd_sof_dev *sdev,
>  	}
>  
>  	/* Handle ALSA kcontrol notification */
> -	if ((data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK) ==
> -	    SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL) {
> +	switch (data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_SOF_MAGIC_MASK) {
> +	case SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL:
> +	{
>  		const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
>  
>  		if (tplg_ops->control->update)
>  			tplg_ops->control->update(sdev, ipc4_msg);
> +
> +		break;
> +	}
> +	case SOF_IPC4_NOTIFY_MODULE_EVENTID_COMPR_MAGIC_VAL:
> +		sof_ipc4_compr_drain_done(sdev, ipc4_msg);
> +		break;
> +	default:
> +		break;
>  	}
>  }
>  

