Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE69572672
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963791; cv=none; b=eOgziooKydSJ75u+4FReQs97/IeOBWDe5cbl16VBuT396HT0cGlS+vDtmHg1ubc7WbHsi1m14qim1gmuKWsBXyibqEuN76FzJ5uivEnRwLJ0h0rK8XAZudvp7er1Xf6FA/hrK2jXnAkDnYBI8s7Z7A5Ay1FFs/0z+pWS3p9Jy0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963791; c=relaxed/simple;
	bh=N9XH4xraaOU3ttBM32K7I2Bu7WhsWxTKWbYdTqmusvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dt3sfq9aT1AUQBLDhzzBfI0IxoMqJLR8cQ6Vy9Hx2YM57A0PCQWZgFf1NJZCnrX3PmqC/+QHl2Cbz2a19klEanknCzotJbAUjXotWpKFG6TfYL8FnMGBbfzK6V92uFe8doXZbBUSPvTohR+UfnuEqpdVlCvksZ5DUMoj6K2VvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GBgPCdo3; arc=none smtp.client-ip=91.218.175.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GBgPCdo3"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N9XH4xraaOU3ttBM32K7I2Bu7WhsWxTKWbYdTqmusvU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963787; v=1; x=1789568587;
 b=GBgPCdo3Qcvn3vhNsDBITrZwXODULhzI7ztywDjwyuDp8xnZ/AKW6BjnvX2td1HjzJ0B5tez
 8EvepNhe5EabNwr+uAN3yjp/z7AfqbacMu2MSvd23mDR+4Q32+b3n2POsNk+008WVLC6ZeD0RFd
 ltrGcUZ7TwX24mCdxccHL1NI=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3b2977a1f4c11fd5;
	Wed, 09 Sep 2026 14:23:07 +0000
X-Mizu-Trace-ID: 3b2977a1f4c11fd5
X-Migadu-Flow: FLOW_OUT
Message-ID: <f0dfb60a-27e4-40e6-8ba4-401634ef7fd7@linux.dev>
Date: Wed, 9 Sep 2026 14:45:27 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/24] ASoC: SOF: intel: hda-stream: Clear the current
 position when releasing stream
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-13-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-13-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> After the host DMA ID is released, reset the curr_pos to 0 for a clean
> start for subsequent stream starts. This is not needed for PCM streams
> but for compressed streams.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/intel/hda-stream.c | 1 +
>  1 file changed, 1 insertion(+)

move to preparation patch to reduce the volume of this patchset?

> diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
> index c95230487a1b..5097a497188d 100644
> --- a/sound/soc/sof/intel/hda-stream.c
> +++ b/sound/soc/sof/intel/hda-stream.c
> @@ -317,6 +317,7 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
>  		if (s->direction == direction && s->stream_tag == stream_tag) {
>  			s->opened = false;
>  			found = true;
> +			s->curr_pos = 0;
>  			if (pair)
>  				link_stream = hext_stream;
>  		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {

