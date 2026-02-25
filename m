Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCE1C84B8
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023433; cv=none; b=ssAPUp2vdoKcbTgIS9XmOmFc28ng2/m60xrdwFxepsI10p+OdyMc/3PKQt+BPYzAI+vvoLWtbceK2dtOViXRq2g6LbFWdD4m61FW5zU1/b+mmbU6X4lSXl79O9XpITGHHpt7GCnBTNwENfyveBkzp1Svh/HtvvJMl3SZ0QmzVF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023433; c=relaxed/simple;
	bh=39Z4OXPoONI2vMYR1AP//7D7Cd3IJVPzxqcAulD+F1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sa//K5SxWOtMRvZu567FULskZTwXwNnIv4n8EPeuRiJchdRAs2eyfA+XoMG+TW2hW5SFUp6titsxKUVmdaxiCTKFtS0Ov+dQFDquD/SDeOQpzWNd2g502LzwVq9jhbuBU3q8ulOyRCd5Rr1yN/tlHQHUHdNnXa0/0M9tCjCdpCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ccw/meEN; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ccw/meEN"
Message-ID: <f2dd6593-4a00-4a40-acd3-575ac940dafc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772023430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHwKhSGtJYIaahdFTNnmOZNJBzC29s1xXi0emXmXfFk=;
	b=Ccw/meENwyEbKPMTrHkGLmPukMizpefI7Kf8ASusxMF7fnl+y5Ppva6fZQrenmmm7TVWhi
	/V0B+kRhxaE6J4ZNOpF76fl4f7kb+eQvF2EBDci/Ppx+0KIP8AangRTqjlZGSDu+UYjRxU
	+q9iadWovB2y2OuGktT1ejj9sSp3MoM=
Date: Wed, 25 Feb 2026 13:43:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51
 (2025) 0CCD SKU
To: Oliver Freyermuth <o.freyermuth@googlemail.com>, tiwai@suse.de
Cc: linux-sound@vger.kernel.org, broonie@kernel.org
References: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
 <20260224190224.30630-1-o.freyermuth@googlemail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260224190224.30630-1-o.freyermuth@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/24/26 20:02, Oliver Freyermuth wrote:
> This adds the necessary quirk for the Alienware 18 Area 51 (2025).
> Complements commit 1b03391d073d ("ASoC: Intel: sof_sdw: Add quirk
> for Alienware Area 51 (2025) 0CCC SKU").
> 
> Signed-off-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
> Tested-by: Oliver Freyermuth <o.freyermuth@googlemail.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
> v4:
>  - Fix format of commit reference, cc: the ASoC maintainer.
> v3:
>  - Fix signoff, add Tested-by.
> v2:
>  - Resend using git-send-email to fix whitespace/tab corruption.
> 
>  sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index c013e31d0..f486bd74b 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -749,6 +749,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
>  		},
>  		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
>  	},
> +	{
> +		.callback = sof_sdw_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CCD")

If we keep having more skews then dropping the exact match may help reduce the number of entries in this table.
this can be reviewed later if and when such skews appear.

> +		},
> +		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
> +	},
>  	/* Pantherlake devices*/
>  	{
>  		.callback = sof_sdw_quirk_cb,

