Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217C3B3C0F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489752; cv=none; b=EYpMUk2VOimGvsDAeESWOTgaFgjpajHFblvXhnfXI/Fl/1EAenaToC4RvFYSgKzXlqoNP5NB3Y49UJxTIXewbz00148AfrWUHQVN4H31x++15ytCDdypv08Koxz1Dd0TRgNwGtQDYVdFVUrgSmyQINygfIDxpdWUSDQO4jy7dP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489752; c=relaxed/simple;
	bh=+U2HTE4ybw4BlAnWroHEzLSnQ1ZybWREYfhNzEBNaPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hU3R+dTcuQqjpFRXxOTgWGFAz/7eLprHuns5vxQIGIELe6IneYarWdvgfOH4k4m7cPqsKU5vNZu7OK3S0YQMGDAWa073gRO8qq3BvBbIM2WK5FskFqlvBlE+C/w0fq4CNMBXSeBkXU9obpffV0pWmcOIKIueznVQg69nmLy6m/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TLaBApvX; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TLaBApvX"
Message-ID: <c1ed5264-9a03-4436-b17c-8c1f59289b5e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785489746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0fgZdCFG9uZcK5pHdJ1v9AQElQOzLGicTdFtmebVk4=;
	b=TLaBApvX9LTVEjv3ob2Q7mXIQPTUbiYbuBLUdm7esbYYcnpyjoZOK2VfSTg4CShCU9qkEH
	iGhYD3hPnbfYaiF56LYbX2MaMnRhQVBDEmrGZLHF/JK2W8FeOHPYlusAEw51U3r5NU5G5m
	6l5qBtFMSzDliJHfSsQ0gV80Zbw6mR0=
Date: Fri, 31 Jul 2026 11:20:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period
 elapsed
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yuhsuan@google.com
References: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 7/30/26 15:04, Peter Ujfalusi wrote:
> From: Yu-Hsuan Hsu <yuhsuan@google.com>
> 
> The snd_sof_pcm_period_elapsed function currently schedules work on the
> system-wide workqueue. This can lead to potential delays or jitter in
> audio processing if the system workqueue is busy with other tasks.
> 
> To improve real-time performance and ensure timely processing of PCM
> periods, we can use the system_highpri_wq instead of the default work
> queue.
> 
> In performance testing, this change significantly reduced the observed
> scheduling delays. For instance, under load(stressapptest -M 15000 -m
> 60), the maximum delay dropped from 9ms on the system workqueue to 5ms
> on the dedicated high-priority workqueue.
> 
> Suggested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@google.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Sounds good but should this higher priority queue be used for other
things as well?

e.g.

period-elapsed for compressed streams:
schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);

and the SoundWire interrupt handling with additional workqueues:
schedule_work(&amd_manager->amd_sdw_irq_thread);
schedule_work(&amd_manager->amd_sdw_work);
schedule_work(&cdns->work);

Not sure what the rules are to define what's high-priority and what's
not... It could be that different systems have different requirements...

> ---
>  sound/soc/sof/pcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index b2071edeaea6..f748d072109a 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -62,7 +62,7 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
>  	 * To avoid sending IPC before the previous IPC is handled, we
>  	 * schedule delayed work here to call the snd_pcm_period_elapsed().
>  	 */
> -	schedule_work(&spcm->stream[substream->stream].period_elapsed_work);
> +	queue_work(system_highpri_wq, &spcm->stream[substream->stream].period_elapsed_work);
>  }
>  EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
>  

