Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8863BF676
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932595; cv=none; b=WdQih8tGz7IyA0r3PnJf4lV7H8Y54rU6TWqL7bSXCQKdXjQ6XJv/jiWuhWx6gtLdtI3/AJ+eNwfbaHExgdUA5o63RC6CGv+xfYJs0/iXwdw6cHyCSH7PGy0lCj7zkBlH2esILiTZGOG2oLXDw3J1oW4KcAoUX5a3Jh0uo4Oy0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932595; c=relaxed/simple;
	bh=zLZA/0N6r6WXd9eNjmThABurDW1rwbmaTtXQowEsKpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsRH25KVq+x+465caSOfsXIC9ktC/IFj8dDArbVslYJ1PT6mwKG1P8PIa/ufdPs8hZNMdHR74uWaMNqPzRmxMfKhhTVz6DbHvAeo/MHNBshdIkmk46kkhD578W77ESRyb4zWtRgzo/0TQWkpTBPIfChFLAA29EDVT1uZVBbJ2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K9KGQzu4; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K9KGQzu4"
Message-ID: <cf0a24a9-40f1-4669-b616-9e244c1e7876@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783932590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kI5E+2L/tBVmnurmjL+L658ui+35MfSI2UylhZheeQ=;
	b=K9KGQzu46LgqzD/nEuPPfkLT24+AQ3P4n/KfvSA+4KnQwBwa6EEZ6RjQpcg/KYJ9jKl6vT
	a8v60kWVjfTQKsAKpuNvNppMl1txJn63+AuamYrMKUi3UY/arnMaXP1OnXx6P2aiAYjZDa
	PwQe6QaTMbXJ1vLyBTgOY4QIT7geoa4=
Date: Mon, 13 Jul 2026 10:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: stream: validate slave port against DisCo port
 bitmap
To: Eric Wu <kunjinkao.jp@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713071544.35722-1-kunjinkao.jp@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260713071544.35722-1-kunjinkao.jp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Thanks for the patch.

> sdw_slave_port_config() checks that the port number falls in the
> generic valid range, but never checks whether the Slave actually
> exposes that port for the requested direction. An in-range but
> unsupported port number (or the right port with the wrong direction)
> gets accepted without complaint.
> 
> sdw_get_slave_dpn_prop() already does this lookup against the
> source_ports/sink_ports bitmaps for other purposes, so reuse it here
> instead of open-coding a new check.

Smart, good idea. I would recommend adding the first sentence as code comments, I had to look up the code to figure out what it did.

> Slaves that don't report source_ports/sink_ports at all (both zero)
> are left unchecked, since that's treated elsewhere in the driver as
> "property not provided" rather than "no ports supported".
> 
> Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
> ---
> Only compile-tested: x86_64 gcc, arm64 and arm32 clang (LLVM=1),
> all clean with W=1. I do not have SoundWire hardware to test with.

That's a problem in general, maybe push this patch first through the Intel/SOF CI to check that some SoundWire platforms are tested?

>  drivers/soundwire/stream.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 4ed8fb7663ad..30cb8a8552d8 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1054,14 +1054,23 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
>  
>  	i = 0;
>  	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> -		/*
> -		 * TODO: Check valid port range as defined by DisCo/
> -		 * slave
> -		 */
>  		if (!is_bpt_stream) {
>  			ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
>  			if (ret < 0)
>  				return ret;
> +
> +			/*
> +			 * source_ports/sink_ports are optional DisCo properties:
> +			 * both zero means "not provided" rather than "no ports",
> +			 * so only enforce the check when the Slave reports them.
> +			 */

That comment is a tad misleading.

In the real world, all drivers ignore DisCo properties provided by platform firmware, and hard-code the values, e.g.

	prop->source_ports = 0x14; /* BITMAP: 00010100 */
	prop->sink_ports = 0x8; /* BITMAP:  00001000 */

Those properties are really not optional at all, what's optional is that they are blindly read from firmware.

> +			if ((slave->prop.source_ports || slave->prop.sink_ports) &&
> +			    !sdw_get_slave_dpn_prop(slave, s_rt->direction, port_config[i].num)) {

This test is a bit odd, there could be cases where only source_ports are defined so you would try to check for a sink_port in sdw_get_slave_dpn_prop()
It probably works in the end but maybe you could check s_rt->direction with source/sink port first?

> +				dev_err(&slave->dev, "port %d not supported for %s\n",
> +					port_config[i].num,
> +					s_rt->direction == SDW_DATA_DIR_TX ? "TX" : "RX");
> +				return -EINVAL;
> +			}
>  		} else if (port_config[i].num) {
>  			return -EINVAL;
>  		}

