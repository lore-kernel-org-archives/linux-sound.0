Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619D36BCE2;
	Mon,  9 Feb 2026 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648230; cv=none; b=aENynHDblZz71Easlkzeg/1JK5RR0tbBW80gb6Lxc8Q4bL/70A5jAs+shm05vk7kwuXrS4geJP6mmh0Ko2KJ1nTNkO+CH4FP70U5f9ptVVopIGgIwynqzK6Jdj+oHvMVPKQnEhuXv4lsgGTZEKhMHzAk1cvTrpb4+iTRjQwdXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648230; c=relaxed/simple;
	bh=00rOhvs5qc6QTK9XcwiJLsjBLBDJxPh3bJZcNCGKFxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpmbtYDGISAkxxxkzii6h3LPVDIUkpRbtGPB6c+N5xQ5JCYEp/MdMEbdnEnpoDhTUC/8BNfFAATnXqNJhsBpd7h+ZTuQmGCPc7gMlF3bSd7d7Ih46I2NnghfSHHD4I9GZ3d/b/7BbaxjiGoyhzbl4buYl3V2Q5b20u7fWvDZDbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DnkF5hRW; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DnkF5hRW"
Message-ID: <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770648227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhXKLl2uXpP817f1WZGWWnuqUMaj0deJkohjQB02LEw=;
	b=DnkF5hRWEfEwHfrphundW+hcvKewGMX197CJlvXPaxwJaHzx6R5IlNiPJhG/nhkJ8iuQPO
	Y91kmUQX8pdzCaRmBnw0hXCV9LBcnybJYSz+tXP+j/+WyAEMlit3NAZVhzaBzuQaYC3n8K
	/IRmrLOZ8SNL1FA3ukn9JlyWTDcxYYE=
Date: Mon, 9 Feb 2026 15:43:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yung-chuan.liao@linux.intel.com
Cc: broonie@kernel.org, ckeepax@opensource.cirrus.com, shumingf@realtek.com,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 kai.vehmanen@linux.intel.com, vkoul@kernel.org, shenghao-ding@ti.com,
 baojun.xu@ti.com, sandeepk@ti.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260209070905.10749-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/9/26 08:09, Niranjan H Y wrote:
> As defined in the MIPI SoundWire specification v1-2 for
> Simplified Channel Prepare State Machine (Simplified_CP_SM):
> 
> * Figure 141 for the Simplified_CP_SM in the specification
>   shows the "Ready" state (NF=0, P=1) that can be reached via
>   "Prepare0 OR Prepare1" transitions.
> * Table 115 (Stimulus to the Channel Prepare State Machine)
>   indicates that Prepare0 and Prepare1 are read-only/"write-ignored"
>   bits for Simplified_CP_SM.
> 
> In TI device implementations, we've found that some devices with
> Simplified_CP_SM still benefit from receiving the Prepare command.

This is a bit weird really...

There is no such thing as a Prepare command, what is used is a regular write that sets or clears Prepare bits in port registers. If those bits are NOT read-only/write-ignored, then presumably they are writable. One could then argue the device does not follow the Simplified_CP_SM state machine but the generic one.
It would also be good to clarify when the device is actually prepared after the bits are set, if the implementation cannot guarantee that the prepared status is reached by the end of the frame where the write occurs, then it's definitively NOT a Simplified_CP_SM.

What happens is the simple_ch_prep_sm bit is not set for those devices, and the regular state machine is used instead? Is anything broken?

> This patch modifies the code to:
> 1. Send the Prepare command to all devices, including those with
>    Simplified_CP_SM
> 2. Ignore errors returned by devices with Simplified_CP_SM that
>    might not support this command
> 
> This approach maintains compatibility with all devices while ensuring
> proper functionality of dataport operations for devices that can
> make use of the Prepare command despite using Simplified_CP_SM.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Tested-by: Shuming Fan <shumingf@realtek.com>
> ---
>  drivers/soundwire/stream.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 38c9dbd35..33605dc83 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -504,14 +504,19 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
>  
>  	/* Prepare Slave port implementing CP_SM */
> -	if (!simple_ch_prep_sm) {
> -		addr = SDW_DPN_PREPARECTRL(p_rt->num);
> -
> -		if (prep)
> -			ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
> -		else
> -			ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
> +	/* For Simplified_CP_SM, MIPI SoundWire specification v1-2 indicates
> +	 * Prepare bits are "write-ignored" - this means devices may ignore the command.
> +	 * Some devices still benefit from receiving this command even when using
> +	 * Simplified_CP_SM, so we send it to all devices and ignore errors from those
> +	 * that don't support it.
> +	 */
> +	addr = SDW_DPN_PREPARECTRL(p_rt->num);
> +	if (prep)
> +		ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
> +	else
> +		ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
>  
> +	if (!simple_ch_prep_sm) {
>  		if (ret < 0) {
>  			dev_err(&s_rt->slave->dev,
>  				"Slave prep_ctrl reg write failed\n");
> @@ -530,6 +535,11 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
>  			return ret;
>  		}
> +	} else {
> +		/* Some device return error for the prepare command,
> +		 * ignore the error for Simplified CP_SM

that comment is misleading anyways, it's not 'some device' it's ALL the conformant devices that will return Command_Ignored when trying to write read-only bits. You haven't described what the TI devices would return in this case.

> +		 */
> +		ret = 0;
>  	}
>  
>  	/* Inform slaves about ports prepared */

