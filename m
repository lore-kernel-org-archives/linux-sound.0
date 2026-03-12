Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F9398900
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 04:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290660; cv=none; b=IBAKFltqfqrlFwiVPS868RlNqRUuG+mcJCpmClDelg+7VPNhQWq4vPrY0qp0dNB6lOujVnFfrgMTBuIJEnWrV3Jp87s2HjY8rlSrKoUHbxknw57MLwHbwEhKkvM+HGuvpbAwHZIKhuKUlMrGyAOcng14nsaEQYDcjnWj1IGakv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290660; c=relaxed/simple;
	bh=2O77vFYxe4s139LG3le5/bTujuAyznMsAswt0RlaFLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4vxax4l2CHSuN+hZ5LfRffGz61QHiT41upL8OW/M3Q+YI6jxjhQ3e4hl79OTTnoZL4W0e6i6idj6j7RZdB+hGLd0PfMWoHuu3cKp86UeWJlKcj/D429kYKxNAjubH680++zWkAV+8FCt7egtMwCS2YZgNRE4kN59iNxNcl279g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fq3GvbNQ; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fq3GvbNQ"
Message-ID: <5e488437-68eb-43e9-a774-babea5879e4a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773290657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7qIC1KY9FFhtX93qUfzvqKXNfPgZFHBgtjBMwn299Y=;
	b=Fq3GvbNQtO+qm+FlZQnykfJDdiv8/JsnLy/MvO+RFaO4AQgkAgJgtfKF1OrCf3+1XPhs8q
	ZBP7IvcKjSxirdm6YPCLkuSaZpha1G12VAceEycyOM6u+Ia3Ohll1ns0513YH0RBDj1T/Y
	9SfZv/TZg3n2/KdVUNUxV47axK6JKzs=
Date: Wed, 11 Mar 2026 21:34:43 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: cadence: Clear message complete before
 signaling waiting thread
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260310113133.1707288-1-rf@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260310113133.1707288-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/10/26 04:31, Richard Fitzgerald wrote:
> Clear the CDNS_MCP_INT_RX_WL interrupt before signaling completion.
> 
> This is to prevent the potential race where:
> - The main thread is scheduled immediately the completion is signaled,
>    and starts a new message
> - The RX_WL IRQ for this new message happens before sdw_cdns_irq() has
>   been re-scheduled.
> - When sdw_cdns_irq() is re-scheduled it clears the new RX_WL interrupt.
> 
> MAIN THREAD                        |  IRQ THREAD
>                                    |
>   _cdns_xfer_msg()                 |
>   {                                |
>      write data to FIFO            |
>      wait_for_completion_timeout() |
>      <BLOCKED>                     |                       <---- RX_WL IRQ
>                                    | sdw_cdns_irq()
>                                    | {
>                                    |    signal completion
>                           <== RESCHEDULE <==
>   Handle message completion        |
>   }                                |
>                                    |
> Start new message                  |
>   _cdns_xfer_msg()                 |
>   {                                |
>      write data to FIFO            |
>      wait_for_completion_timeout() |
>      <BLOCKED>                     |                       <---- RX_WL IRQ
>                           ==> RESCHEDULE ==>
>                                    |    // New RX_WL IRQ is cleared before
>                                    |    // it has been handled.
>                                    |    clear CDNS_MCP_INTSTAT
> 
>                                    |    return IRQ_HANDLED;
>                                    | }
> 
> Before this change, this error message was sometimes seen on kernels
> that have large amounts of debugging enabled:
> 
>    SCP Msg trf timed out
> 
> This error indicates that the completion has not been signalled after
> 500ms.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 956baa1992f9 ("soundwire: cdns: Add sdw_master_ops and IO transfer support")
> Reported-by: Norman Bintang <normanbt@google.com>
> Closes: https://issuetracker.google.com/issues/477099834

Makes sense to me, nice fix!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  drivers/soundwire/cadence_master.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index f245c3ffb9e9..b8b62735c893 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -933,6 +933,14 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
>  
>  		cdns_read_response(cdns);
>  
> +		/*
> +		 * Clear interrupt before signalling the completion to avoid
> +		 * a race between this thread and the main thread starting
> +		 * another TX.
> +		 */
> +		cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_RX_WL);
> +		int_status &= ~CDNS_MCP_INT_RX_WL;
> +
>  		if (defer && defer->msg) {
>  			cdns_fill_msg_resp(cdns, defer->msg,
>  					   defer->length, 0);

