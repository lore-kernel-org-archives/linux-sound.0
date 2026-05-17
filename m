Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDBE1B808;
	Sun, 17 May 2026 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034748; cv=none; b=DfpaSv+c5YwQg24jXUU3lR+i5cM/xn7CkNYRQIVXns25U8ugeT5V8B24QSVNklDIzdB0bUReg1olrrP4vKxaH49/szy1U+YcyE9koOWL5wqLethSOEvIWXyfzGiXYy8et4MNrqfBcWXrNwncSH420JwX2MzWUTEBsJsO7n+Pafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034748; c=relaxed/simple;
	bh=/ei5SGT6Zh/13qQKCMhGdk/NpF6IwfMoUdXncf1icq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aw7um0191oxSPUpV+SeP5IeGk+8iOjy4YgH8gWDyYE0BAigkVtQ0L3dKZpDYPUaaba4CrSvBDsO/W/XrJnvs1k29UDWBZK80Fs41uVd+0Q6wTsmY221UN0VzbJ61YHOtFFVRgUk61twTMHF4Db3Zt+xcymwaWzcqvqO1jLjqc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjM1YuNx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjM1YuNx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E70C2BCB0;
	Sun, 17 May 2026 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779034748;
	bh=/ei5SGT6Zh/13qQKCMhGdk/NpF6IwfMoUdXncf1icq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjM1YuNxqGSO8ZjG+/Udq2iYhQyQLHFLT1nlagatKvyQhpd5Km1ProUnaCHq2wDCD
	 MJ1Fn5Vq9tQZuZlwWiTBB5vGlpJn7OCsCvLBU2YA1UNj0RCc6AvqFe6dhzjd/QMfZw
	 sSAE7vK+s9o4trQUbI49sVx71q0oZn4pTPAKdtKwh/0dDx25xwI7dDJBt+AecWDYqo
	 IXNhkWczQGk38dzMPppgHcBMOXqFshIupRlOHY7bxP8rjpSaPFR5XaaShyDmv6IdEe
	 XnI/blgXlZvnxPZxHaMHrRoBlDV8bpatDBAy9SlAXdd0tKljt9Ue4kaC8qwRPzeMo4
	 AEbaQPNPd9reg==
Date: Sun, 17 May 2026 21:49:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: Re: [PATCH RESEND] soundwire: intel_ace2x: release bpt_stream when
 close it
Message-ID: <agnqdyt12rh5OAlM@vaman>
References: <20260514141625.1834216-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514141625.1834216-1-yung-chuan.liao@linux.intel.com>

On 14-05-26, 22:16, Bard Liao wrote:
> The BPT stream was allocated in intel_ace2x_bpt_open_stream(), we need
> to free it in intel_ace2x_bpt_close_stream().
> 
> Fixes: 4c1ce9f37d8a8 ("soundwire: intel_ace2x: add BPT send_async/wait callbacks")
> 
No blank line here please, I have fixed it up while applying

> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> ---
>  drivers/soundwire/intel_ace2x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
> index 0a97253fe0c2..b37933efac5d 100644
> --- a/drivers/soundwire/intel_ace2x.c
> +++ b/drivers/soundwire/intel_ace2x.c
> @@ -317,6 +317,7 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
>  		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
>  			__func__, ret);
>  
> +	sdw_release_stream(cdns->bus.bpt_stream);
>  	cdns->bus.bpt_stream = NULL;
>  }
>  
> -- 
> 2.43.0

-- 
~Vinod
