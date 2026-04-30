Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FAA3A6B76
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580723; cv=none; b=qFjjTE3uxydlLv9xzboYnBWLK3uCADkKJ6Vu2UadUSwV8lYZu3Yj0LMnAoama7CEQGvbHmAh4CTAw3n8pwExmndUkRgbu0Pz2+/ewUDx8/+bxDJ3TihO2lAeQdmJjfxmnYIb4cUxsyh6lyN41N4YtEnH9ckXkYIL0nDeczB4C+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580723; c=relaxed/simple;
	bh=rXhUL3CQnj8JY80S2QYzdYw0hx2AT4Yp0bBgbVx7WVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6xr1NNG/y1lzLznrv5ZkkbjN1jZPRfR/0Y+UIwFJGE46zt5nlvKluBURfA2+fpdrpeiUVFoPYjWfY/ExW8yNyPgJujOlil8oHtlGRg0TKXtqWW1x+KvSHwFbFV3tOQkQtYKaWH0FMdeJUh2BZsJ2FO/q0IwXxLFkNI0Ovb8k4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ajiqw0XQ; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ajiqw0XQ"
Message-ID: <510d048c-288e-469b-9d64-720aeab36398@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777580718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wY/4TfjCrZ1Y4po4PH+NxY7Ja4ymh/2kdaR4Blxsuoo=;
	b=Ajiqw0XQFwN9METSvN9m3EblbfHZ608vemAoaBmk9HClew+6osZIOhc08/28s89zp4aO3X
	7KJ1BwimLJLPWYPm/4Cxd0iMFVAWFnamsp++1sKRVn8vksX/GogJZtTPSvloLGsVz79/jc
	mYMGsvf+ThXZg8A1EJyVNCrN7SLamTE=
Date: Thu, 30 Apr 2026 22:01:13 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: stream: sdw_stream_remove_slave(): Check
 stream is valid
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260430143353.2702714-1-rf@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260430143353.2702714-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/30/26 16:33, Richard Fitzgerald wrote:
> In sdw_stream_remove_slave() check that stream is a valid pointer
> before passing it to functions that dereference it. Return 0 if the
> pointer is invalid.
> 
> This is a convenience for callers. They can safely call this function
> during cleanup code without needing a pointer validity check duplicated
> at every call point.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  drivers/soundwire/stream.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 4ed8fb7663ad..c1ef177a0021 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -2229,11 +2229,15 @@ EXPORT_SYMBOL(sdw_stream_add_slave);
>   * @slave: SDW Slave instance
>   * @stream: SoundWire stream
>   *
> - * This removes and frees port_rt and slave_rt from a stream
> + * This removes and frees port_rt and slave_rt from a stream.
> + * If stream is NULL or an ERR_PTR, do nothing and return 0.
>   */
>  int sdw_stream_remove_slave(struct sdw_slave *slave,
>  			    struct sdw_stream_runtime *stream)
>  {
> +	if (IS_ERR_OR_NULL(stream))
> +		return 0;
> +
>  	mutex_lock(&slave->bus->bus_lock);
>  
>  	sdw_slave_port_free(slave, stream);

