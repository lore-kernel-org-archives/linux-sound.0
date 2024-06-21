Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4F16DEA8
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718961235; cv=none; b=mj7zghDXyYUwcbbCCBUMZ7DcDRxYC2caqQMXjVGFZhFxy7cKhSD7+WcwMVFUX5ufGgDqY2nykdoX93S7au7TBuRV+Y0oKun4Mjkyp4Im7qMFIW/uz0aE6/FYkbA308BgKAfdQXxcGYXWRTQ+0mGAMeWO/MLMQ5WqHxC43FnCYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718961235; c=relaxed/simple;
	bh=pC8V6qkx253Ke16OEZIotlFTsjkmhI5/0EymmuzGnzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ATP1U0ymyc2qz4ko1JwHGzKvcVGLM8/Fl0Hv10SlGKQTJ0cRmBseQ4+stV8PxrT9RkQaySv/2aKVBd3+1a3K1dHdPCbOhp0K74Qsxv/v02kf04MOD6B2szCfdTL1KTMEnc96RXg5P68SkTq5J6bct7CZw32gY6bHF6HqUTSKor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jFsQDhjV; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jFsQDhjV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L5ZfvP028264;
	Fri, 21 Jun 2024 04:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6mdX4IsID8DwTBeLk+1PTgj2npLZy4gl5uvpTHO5kMU=; b=
	jFsQDhjVT/iSoMB3ZlXH3B9jfrZPu/OLv/Y1m21Q2jTWh2/5w20JQoIs/O3ZUqcR
	8uLKh0IS86wkkxxpH1Iw/8FOakqSrrNEgTeiwlXEYZay1sU7td8WBa+JmzVmZ0C+
	FbGS9g7yK6Xp3P16dB8T7N18Ov3xYbs2pNCSmdZK5oUypnLXT6J24Rt3Q6nWRTIG
	MBDmrMY/eBg18fx8vXrqxerjqLbAc6sEmplesIJ4E+9+Q0KrO7UNLk9hdpCjuL7Y
	wn5cSKjpGvFEoodoq7ZQ1x6k57eraFbRCg7v8bw050AhBlNBnt+mi1PJ0ihVFV4g
	5E9xRmzhg+azbWN4dt4lzg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yvrk3gnxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 04:13:48 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 10:13:46 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 21 Jun 2024 10:13:46 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8471F820244;
	Fri, 21 Jun 2024 09:13:46 +0000 (UTC)
Message-ID: <40b32545-ea8c-4120-a024-cb5da63a39ac@opensource.cirrus.com>
Date: Fri, 21 Jun 2024 10:13:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Use imply for suggesting
 CONFIG_SERIAL_MULTI_INSTANTIATE
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
CC: Simon Trimmer <simont@opensource.cirrus.com>
References: <20240621073915.19576-1-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240621073915.19576-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rnxj5Nv9EwyLIvGwaOdjjEAwJ93LPG8P
X-Proofpoint-ORIG-GUID: Rnxj5Nv9EwyLIvGwaOdjjEAwJ93LPG8P
X-Proofpoint-Spam-Reason: safe

On 21/06/2024 08:39, Takashi Iwai wrote:
> The recent fix introduced a reverse selection of
> CONFIG_SERIAL_MULTI_INSTANTIATE, but its condition isn't always met.
> Use a weak reverse selection to suggest the config for avoiding such
> inconsistencies, instead.
> 
> Fixes: 9b1effff19cd ("ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406210732.ozgk8IMK-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202406211244.oLhoF3My-lkp@intel.com/
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/pci/hda/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> index e59df40a0007..a3cf0725fc43 100644
> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -162,7 +162,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
>   	depends on ACPI || COMPILE_TEST
>   	depends on SND_SOC
>   	select FW_CS_DSP
> -	select SERIAL_MULTI_INSTANTIATE
> +	imply SERIAL_MULTI_INSTANTIATE
>   	select SND_HDA_GENERIC
>   	select SND_SOC_CS35L56_SHARED
>   	select SND_HDA_SCODEC_CS35L56
> @@ -179,7 +179,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
>   	depends on ACPI || COMPILE_TEST
>   	depends on SND_SOC
>   	select FW_CS_DSP
> -	select SERIAL_MULTI_INSTANTIATE
> +	imply SERIAL_MULTI_INSTANTIATE
>   	select SND_HDA_GENERIC
>   	select SND_SOC_CS35L56_SHARED
>   	select SND_HDA_SCODEC_CS35L56
Sorry about that. Thanks for fixing.
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

(Though I think this points at a bug in serial-multi-instantiate
dependencies. When SPI support was added it was made mandatory
to have both I2C AND SPI. But you shouldn't need to build in a
subsystem if you don't have any devices of that type.)
