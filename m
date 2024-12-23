Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6F52F3E;
	Mon, 23 Dec 2024 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734934105; cv=none; b=RVNsfW+SKClW3JbLELgzi09LMY4zyg7eVhVfy+QBP7SUIvsNfG7aqObxP7POJq+N11uQEWPlm/COrnj8xXTlf7xfsKWi1ukO/T1sk6HF22mFe544m728ZCpct5iCEPbOWFWtazLIKQ/bo+omBIpMYxp/im72Av0W1mnl0zQ87Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734934105; c=relaxed/simple;
	bh=nrc+SD0Pj5qDjajWk+2G/s3HKYE8BMI6C86R4ElicOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjR9A2Vw8fECVxTKM+b5k4AhgxzmOKrkAMrVqtN/UExqRiUbTSeL0yCJR57VX2sbWqyn0jy4fv8X5IKxjBMfeAzFkgk/3ip7EBF3CKIen6v+LPb22x/x8yrq919FQ/StG9CVNCFfcN/oA4pN/bbXoCBfwBPBXQJw7IXGS4QtzQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnC5SB/i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnC5SB/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CC9C4CED4;
	Mon, 23 Dec 2024 06:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734934104;
	bh=nrc+SD0Pj5qDjajWk+2G/s3HKYE8BMI6C86R4ElicOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnC5SB/iZFWwSOqNZbSJFTPwaMrVuVcgAkI3PdGL5v4KrbvqcYfKJo9BedLt2xyhl
	 upxOhx/JG5tlbb5r5/EqF8r0ZvDbEIWmqioAmARydlGZ7+yDH5MGWTSHYq+JUI8FDe
	 R7c7askD710cGKs0/tFWaeNarzi+jZOglcwLmQgERM/UuN0XN2/c14Ipau0Ui81/5C
	 Lzx1UuKHg7biPYQ4OGsMz/1l/9P9oj27OtE9dKGm2VXobubnLH6F2+gnUtEJZGVYTx
	 X0eoOiYMRpRiwhs8Ji8uMcfPT9uzuQWJIRSHvh7DS6QbNccEiNi4jUGU1+MZ4AVuIh
	 iXgTcznbRMy6A==
Date: Mon, 23 Dec 2024 11:38:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
Message-ID: <Z2j+VQ4BPjr3HXsX@vaman>
References: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>

On 03-12-24, 14:40, Vijendar Mukunda wrote:

for...? Pls write the full subject

> As per design for power off mode, clear the wake enable register during
> resume sequence.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5a4bfaef65fb..96a3aa6da711 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>  		return amd_sdw_clock_stop_exit(amd_manager);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));

no need for 0x for a zero value

>  		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>  		if (val) {
>  			val |= AMD_SDW_CLK_RESUME_REQ;
> -- 
> 2.34.1

-- 
~Vinod
