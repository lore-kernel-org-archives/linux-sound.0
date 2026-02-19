Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB28284665;
	Thu, 19 Feb 2026 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771485064; cv=none; b=ARyysKCtYzNMaB22iqfgHdrGMfhBBH2mXzi3nXOn7yF530/IJc8bQcxnptD/6RiTEZFnzwNDPDiNQekeApM/s+DIBfQKJM9r1Y39oejPYLABVfZApoRFW2DEUcwwVBqcQF3rM1aNsvUAkrJ9VxCy5C+aF5iBVnLs3PjhVBnekGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771485064; c=relaxed/simple;
	bh=8gMN6FPkofMiiA2pPI8osAabJws1yYM+jZHkydW2yuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogB9ganMiug0MZyC7nWthdR67gCNpuZr6s0nOfX255YLTueyoQI1E34HQrsUR6IWCNsschyQftIH3VT+qPB6G3UbpJIf77JT26uv4uRWPw4G5OhSKybryb2ChiOIGMMcG5uSDuzO4IRFn5wRm/xSXgNfEbziXYxkK+H48l37qkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdgOrgv2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdgOrgv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771485062; x=1803021062;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8gMN6FPkofMiiA2pPI8osAabJws1yYM+jZHkydW2yuI=;
  b=NdgOrgv2lQCfNw0imk/RwbZTUpcuORC75BvV2OcTR9h+RKxgL69z2ts3
   /1hmw0g9N0ieB8jbk/x0aX1yCp2PNjP3eHIWgshB3ICfFAkZOZ0GJs5QF
   tnuLEP26zrbq42uMW7B1VWfIk262lIp60SlENH/+eZ1Kmm9IFsEWvz87c
   O+rpaSWOPvLwW5qSlecKYKBSe4keMaU4urHXpg3UWu0bz92RuQelMnX+h
   uanY7rneZ4RL6OYqxub09PAmVBAcrtpOWH4JiWIXDoRaVeG4nxhOHGdq4
   nunoffjpSdHcR5DNp/7Q7ETJB5B1sjcEQ4NU5Ef7dEK3qKx2xgsGJPZpB
   A==;
X-CSE-ConnectionGUID: 7rnjL4NVTUyHK1mdexsFJw==
X-CSE-MsgGUID: xSD7pOZKQKWAWtz4x5pmZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72478052"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72478052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:11:02 -0800
X-CSE-ConnectionGUID: iJF/AlF9TE+3pWS6MLeKgA==
X-CSE-MsgGUID: Y3H4rWHQRRyXVyafOUjtCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="214450150"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.121]) ([10.245.246.121])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:10:58 -0800
Message-ID: <c67c6b38-a455-429a-aee3-ec378c1d85f4@linux.intel.com>
Date: Thu, 19 Feb 2026 09:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: Replace IPC TX busy deferral with bounded
 retry
To: Cole Leavitt <cole@unwrap.rs>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6dfb6f6a-3729-4fd0-9ddd-690728ef94f8@linux.intel.com>
 <20260217214945.6493-1-cole@unwrap.rs>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20260217214945.6493-1-cole@unwrap.rs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/02/2026 23:49, Cole Leavitt wrote:
> The SOF IPC4 platform send_msg functions (hda_dsp_ipc4_send_msg,
> mtl_ipc_send_msg, cnl_ipc4_send_msg) previously stored the message in
> delayed_ipc_tx_msg and returned 0 when the TX register was busy. The
> deferred message was supposed to be dispatched from the IRQ handler
> when the DSP acknowledged the previous message.
> 
> This mechanism silently drops messages during D0i3 power transitions
> because the IRQ handler never fires while the DSP is in a low-power
> state. The caller then hangs in wait_event_timeout() for up to 500ms
> per IPC chunk, causing multi-second audio stalls under CPU load.

I think the agent get this a bit wrong and there is a cause effect mixup.

> Fix this by making the platform send_msg functions return -EBUSY
> immediately when the TX register is busy (safe since they execute
> under spin_lock_irq in sof_ipc_send_msg), and adding a bounded retry
> loop with usleep_range() in ipc4_tx_msg_unlocked() which only holds
> the tx_mutex (a sleepable context). The retry loop attempts up to 50
> iterations with 100-200us delays, bounding the maximum busy-wait to
> approximately 10ms instead of the previous 500ms timeout.
> 
> Also remove the now-dead delayed_ipc_tx_msg field from
> sof_intel_hda_dev, the dispatch code, and the ack_received tracking
> variable from all three IRQ thread handlers (hda_dsp_ipc4_irq_thread,
> mtl_ipc_irq_thread, cnl_ipc4_irq_thread).

No messages were dropped, but if the firmware locks up during suspend
then we might enter low power while an IPC is delayed and send_msg is
wating for a reply (or timeout).
Yes, irq will not come, but it won't came even of the system would not
be on it's way to suspend.
The delayed handling as it is now is OK, it never looses messages,
everything is linear, it just takes a long time to go through several
messages when each of them times out because the fw is locked up.

In essence this patch reduces the 500ms default IPC timeout to 5-10ms
after an IPC timeout, levaing the FW less time to recover and not wating
for a reply.
It can also introduce a new race: if the FW clears the BUSY first and
then sends the reply and we were 'spinning' to send the next message we
might do so before receiving the reply to the previous message.

Which is fair, I think, but the commit message should be clear on this.

Please can you file the issue for sof/linux as I have asked with more
information? We had similar issues 2-3 years ago, but they were root
caused and fixed.

I'll need to think about this a bit more...

one commnet for ipc4.c

> 
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
> Changes in v2:
>   - Removed __func__ from debug prints (dyndbg adds it automatically)
>   - Added dev_dbg() when message sending is delayed due to EBUSY
>   - Dropped patch 2/2 (dai_link_hw_ready) per Pierre's feedback
> 
> diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
> index a4a090e6724a..ad99e2e07b66 100644
> --- a/sound/soc/sof/ipc4.c
> +++ b/sound/soc/sof/ipc4.c
> @@ -365,20 +365,36 @@ static int ipc4_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
>  	return ret;
>  }
>  
> +#define SOF_IPC4_TX_BUSY_RETRIES	50
> +#define SOF_IPC4_TX_BUSY_DELAY_US	100
> +#define SOF_IPC4_TX_BUSY_DELAY_MAX_US	200
> +
>  static int ipc4_tx_msg_unlocked(struct snd_sof_ipc *ipc,
>  				void *msg_data, size_t msg_bytes,
>  				void *reply_data, size_t reply_bytes)
>  {
>  	struct sof_ipc4_msg *ipc4_msg = msg_data;
>  	struct snd_sof_dev *sdev = ipc->sdev;
> -	int ret;
> +	int ret, i;
>  
>  	if (msg_bytes > ipc->max_payload_size || reply_bytes > ipc->max_payload_size)
>  		return -EINVAL;
>  
>  	sof_ipc4_log_header(sdev->dev, "ipc tx      ", msg_data, true);
>  
> -	ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
> +	for (i = 0; i < SOF_IPC4_TX_BUSY_RETRIES; i++) {
> +		ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
> +		if (ret != -EBUSY)
> +			break;
> +		usleep_range(SOF_IPC4_TX_BUSY_DELAY_US,
> +			     SOF_IPC4_TX_BUSY_DELAY_MAX_US);
> +	}
> +	if (i == SOF_IPC4_TX_BUSY_RETRIES) {
> +		dev_dbg(sdev->dev, "ipc tx failed: TX busy after %d retries\n", i);

this needs special treatment with unique error that can be used for
debugging purposes, something like:

	dev_err(sdev->dev, "IPC busy, msg %#x|%#x cannot be sent\n",
		ipc4_msg->primary, ipc4_msg->extension);
	snd_sof_handle_fw_exception(ipc->sdev, "IPC busy");

	return ret;


> +	} else if (i > 0) {
> +		dev_dbg(sdev->dev, "ipc tx delayed by %d loops for %#x|%#x\n",
> +			i, ipc4_msg->primary, ipc4_msg->extension);
> +	}
>  	if (ret) {
>  		dev_err_ratelimited(sdev->dev,
>  				    "%s: ipc message send for %#x|%#x failed: %d\n",

-- 
Péter

