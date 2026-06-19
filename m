Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2D1E2614
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876961; cv=none; b=TuqY12eUi3a6rC6LFDfbrTR0vYaJxaGxxvg5JW+l2sdO6nOjzj4TGWpy/j04LrFoVjUpisiGNaaUh7ftPGKlu690RhRxjxGhwU2RQ/XzW4wAwKJu0Jvpuk4AqS7AOCEAthP2St949DQy6yvaklljYRzmOTRPUS1Z+XCaRrpeNNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876961; c=relaxed/simple;
	bh=Sam6EPJaCexQ3I3zbuUzs5FX9ML6yb8YpL+9zFyX51c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTrpCwkGqazjtcXID24L8idxzkutPnH0YO2TMeCI3qLL3zBu1NVpf90szokU24SXZ+1np5dDjm/fOCRhc9Ki0u51lriKyAmP8EGgPHDOUmA18SeqDYZnxgIeIfr+m+vIz13cr6Y1PFiLPMSaTkYR+2ZIqA1i1QMWJSRBRXbryd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZBFTtVbY; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZBFTtVbY"
Message-ID: <0129e948-25e3-4249-b026-11d7694114f5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781876948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w860LzwcP5mt072tzT4xKQbJlL2qIopWUFPn5m1+QX0=;
	b=ZBFTtVbYk16UY/MacgryNzawzVFM+HF8BDaibK178CUzYESqExCM/J1MHwXXxRPjl3b94i
	+kr6cgOQonj8zyujWWYpxaSzU0h9CujjccPMjxN8qlilc94rW/Df03x5Jkk+lzJAT2EBp9
	HbefrICa0c0lM/5Bv8Nv9FysfolT5xk=
Date: Fri, 19 Jun 2026 15:49:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] ASoC: rt700-sdw: always drain jack work on remove
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Oder Chiou <oder_chiou@realtek.com>,
 Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rander Wang <rander.wang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619080334.2296419-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260619080334.2296419-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/19/26 10:03, Runyu Xiao wrote:
> rt700_sdw_remove() drains jack_detect_work and jack_btn_check_work only
> when rt700->hw_init is true. That state bit is cleared by
> rt700_update_status() when the SoundWire slave becomes UNATTACHED, but a
> jack work item can already have been queued by rt700_interrupt_callback()
> or rt700_jack_init() while the device was initialized.
> 
> Do not use hw_init as the remove-time guard for draining these work
> objects. The delayed works are initialized during rt700_init(), so remove
> can cancel them unconditionally and pair the object lifetime with the
> codec-private data lifetime instead of a mutable hardware state bit.
> 
> This issue was found by our static analysis tool and then confirmed by
> manual review of the SoundWire status, interrupt and remove paths. The
> remove path should drain work based on whether the work object exists, not
> on a runtime hardware state bit that can change after the work was queued.
> 
> A QEMU PoC queued jack_detect_work, simulated SDW_SLAVE_UNATTACHED, and
> then entered remove. DEBUG_OBJECTS reported an active timer/work object
> associated with the rt700 jack work path after remove skipped the cancel.
> 
> This is sent as an RFC because the practical trigger depends on SoundWire
> core remove ordering after an UNATTACHED status update. If remove cannot
> run after hw_init has been cleared while jack work is still pending, this
> is a defensive lifecycle cleanup rather than a reachable race on current
> systems.

The SoundWire core doesn't deal well with devices going off the bus anyways, so this feels like an academic improvement IMHO.
In addition this codec isn't used in any production systems to the best of my knowledge, it's likely this driver could be removed without impacts.


> Fixes: 737ee8bdf682 ("ASoC: rt700-sdw: use cancel_work_sync() in .remove as well as .suspend")
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  sound/soc/codecs/rt700-sdw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
> index 44543c0da177..f7bd793e3e67 100644
> --- a/sound/soc/codecs/rt700-sdw.c
> +++ b/sound/soc/codecs/rt700-sdw.c
> @@ -459,10 +459,8 @@ static int rt700_sdw_remove(struct sdw_slave *slave)
>  {
>  	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
>  
> -	if (rt700->hw_init) {
> -		cancel_delayed_work_sync(&rt700->jack_detect_work);
> -		cancel_delayed_work_sync(&rt700->jack_btn_check_work);
> -	}
> +	cancel_delayed_work_sync(&rt700->jack_detect_work);
> +	cancel_delayed_work_sync(&rt700->jack_btn_check_work);
>  
>  	pm_runtime_disable(&slave->dev);
>  

