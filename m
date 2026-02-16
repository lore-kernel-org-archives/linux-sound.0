Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B7C1C1F02;
	Mon, 16 Feb 2026 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245563; cv=none; b=So1cUrDy3VAek8jFyMWHLqjohjJmKc2/NtwQL/2RLcRwhM5Y2dYXKsha7AVgy9KNI6R0o0+u3QmByaGdRv2c3Jbz7FANc0vhXV02jjPyM0kkW1ubBstt/241zM2uFLphRJTJiifB7XiXrKDTRLyYYCJJJCwHwe1/hWFbRHBd6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245563; c=relaxed/simple;
	bh=Li0OTzOGnf5gYzC2Wy0M2WlkXwnBBvzo0k8CbhncHgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXSZItfiuaJBzSB+M3nGofwhThRUNWoyhDf/1ncWcS/lckEWy+9w8r3sSmaZHZZB3FYpUmRbqfzS2nNM0Dcpeyk/W8V4Cp0IVeYjY9tVV25okOql2vELP0K6GgwyFHs2XsQv1uySHOQzNUEq2x8/t7zSzsNf/Cm33weNIDUvHtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n55B+uhZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n55B+uhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771245562; x=1802781562;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Li0OTzOGnf5gYzC2Wy0M2WlkXwnBBvzo0k8CbhncHgY=;
  b=n55B+uhZo+2h7//UG/HKR+2uaaHxBVXfu9MpimroJBP175IWVJgH+QrL
   jbEgMZWgNFVu/HHngxP99lYa0Zfkua/knltNQkgqYWXN4B+/RfhzOV3j3
   rNNm3WVgu6Sz3OKG3cnTSX0U6JeuKiIknvNKes41XnPa260xhl6NflJ7I
   S7O3Ek2RkrGhp0WTteezvLn286Yuib3PbIodcfZIAGnvUUbNzq34aNv6l
   BG1acYmaev04g4UBtkX89uOdaxKFjjdrqgv3pOlmktsqOPJj61U41gtLf
   ZWpMpVfKGER7M6VQED43rAlLc+8T9tHHf0CsAtkxBLm7IJBaRtQW63EU7
   A==;
X-CSE-ConnectionGUID: +zpjd0GiSSyc5qSV1zL9og==
X-CSE-MsgGUID: YUTZUc8nQDyvK4fs6uJeFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72420614"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72420614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 04:39:21 -0800
X-CSE-ConnectionGUID: 1vzLBX32QOONlETDt9YRGA==
X-CSE-MsgGUID: 7wCTKMHbRsmH8aM7pZozXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="213606471"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.251]) ([10.245.246.251])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 04:39:17 -0800
Message-ID: <6dfb6f6a-3729-4fd0-9ddd-690728ef94f8@linux.intel.com>
Date: Mon, 16 Feb 2026 14:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: SOF: Replace IPC TX busy deferral with bounded
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
References: <20260214064054.19961-1-cole@unwrap.rs>
 <20260214064054.19961-2-cole@unwrap.rs>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260214064054.19961-2-cole@unwrap.rs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/02/2026 08:40, Cole Leavitt wrote:
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

I do wonder how this can happen as we only send IPC messages when the fw
has booted up and thus the fw should be replying to messages.
The delayed message handling meant to handle the case when the firmware
sent the reply already, but the TX doorbell is not cleared, FW is not
yet ready to receive a new meesage (or if we send it might be lost) or
we will never send such message (and send it after the next firmware boot?).

see:
47772f905cd8 ("ASoC: SOF: Intel: ipc4: Wait for channel to be free
before sending a message")

I agree that rapid IPC sending attempt would drop messages and will only
send the last one. This would be visible with:
https://github.com/thesofproject/linux/pull/5521

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
> 
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---

...

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
> index 095dcf1a18e4..24dec128f589 100644
> --- a/sound/soc/sof/intel/mtl.c
> +++ b/sound/soc/sof/intel/mtl.c
> @@ -101,12 +101,8 @@ static int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *ms
>  	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
>  	struct sof_ipc4_msg *msg_data = msg->msg_data;
>  
> -	if (hda_ipc4_tx_is_busy(sdev)) {
> -		hdev->delayed_ipc_tx_msg = msg;
> -		return 0;
> -	}
> -
> -	hdev->delayed_ipc_tx_msg = NULL;
> +	if (hda_ipc4_tx_is_busy(sdev))
> +		return -EBUSY;
>  
>  	/* send the message via mailbox */
>  	if (msg_data->data_size)
> @@ -559,7 +555,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
>  {
>  	struct sof_ipc4_msg notification_data = {{ 0 }};
>  	struct snd_sof_dev *sdev = context;
> -	bool ack_received = false;
>  	bool ipc_irq = false;
>  	u32 hipcida;
>  	u32 hipctdr;
> @@ -576,7 +571,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
>  		mtl_ipc_dsp_done(sdev);
>  
>  		ipc_irq = true;
> -		ack_received = true;
>  	}
>  
>  	if (hipctdr & MTL_DSP_REG_HFIPCXTDR_BUSY) {
> @@ -628,13 +622,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
>  		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
>  	}
>  
> -	if (ack_received) {
> -		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
> -
> -		if (hdev->delayed_ipc_tx_msg)
> -			mtl_ipc_send_msg(sdev, hdev->delayed_ipc_tx_msg);
> -	}
> -
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
> index a4a090e6724a..2e24308ef9cc 100644
> --- a/sound/soc/sof/ipc4.c
> +++ b/sound/soc/sof/ipc4.c
> @@ -365,20 +365,33 @@ static int ipc4_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
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

The reason why I ended up with the dead simple delay msg handling which
sends the message when the ack is received rigth away is to avoid delays
without a need of a busy loop.
Before that I had similar approach, but dropped it due to the delay it
introduced on the message sending.

The delayed message combined with IPC timeouts are an interesting
problem to tackle, the PR I mentioned:
https://github.com/thesofproject/linux/pull/5521
plus this patch
https://github.com/ujfalusi/sof-linux/commit/e6c6ca613e60c477dcc025207f9732c8ae4a1b33

worked locally for most of the time, but I give that I have not faced
with the issue that I have lost IPCs.

I'm not sure if the two approces can be somehow combined.
Receving the reply to the message does not mean that the FW can receive
a new message, but from the kernel pow the IPC sequence was done (when
we receive out of sync ACK, the reply data might not be valid anymore).
We cannot make the IPC completion based on the ACK as I have seen in
debug logs all permutations: ACK then REPLY, ACK and REPLAY at the same
time, REPLY followed by ACK.

Having said that, I think this is still a bit safer to not loose
messages, 200us is close to polling.

> +	if (i == SOF_IPC4_TX_BUSY_RETRIES)
> +		dev_dbg(sdev->dev, "%s: TX still busy after %d retries\n",
> +			__func__, i);

no need to print the __func_ it is added by the infra.

Can you add
dev_dbg(sdev->dev, "message sending delayed by %d loops for %#x|%#x\n",
	i, ipc4_msg->primary, ipc4_msg->extension);

when the message got delayed due to EBUSY?

>  	if (ret) {
>  		dev_err_ratelimited(sdev->dev,
>  				    "%s: ipc message send for %#x|%#x failed: %d\n",

-- 
Péter

