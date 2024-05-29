Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E639FD6
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974885; cv=none; b=r2elypDEOJ6Mn0Sjv+6rLorRPV5gUQuIouFStVekFj0BDdKv+oSky9KlG2hama9ZLBiJfpkx+tPZGrO0kB9undATjLqsK7Py9Sn/tr5dLz667Z8bc5cuenaoRTIniBaEqDmeo1mTUapZnT5jppCM8ZqUFRULCy8ZQnE6UbTy4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974885; c=relaxed/simple;
	bh=FnKd5nzM8mR2FvKTirbhBssTJd+tTuzMgMhZji/i2vg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBVF8YaFpubXqXxKbI6WYzJ1FEeU6ArhXbTbwD57ukwtAaIy8c4XrrI2j+pJi33YXwfJshnK8K0AuJZq91wa/T70L+et2ZETSoSsVsRgeKSF9r9OUy7FTYfaYPbhftjo20OiGXzG6v1Ijsa8J6hgZsEwg5iKOS5ykqsy2hob+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CNygjdhq; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CNygjdhq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T71lYf017078;
	Wed, 29 May 2024 04:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=WlccN8jb3Q5to6M1Eg
	/oq2y4/iT4u5AUxawzHNNeQbI=; b=CNygjdhqwbMv3X5jbA88rlXBo4vRPoLY4x
	KpTRbIqGAhYoNvMopEuu7mU3MsgeWkjsmpTBR2ciuXnXtv3jVQx5lj4wdkVz5nZi
	aQWM8/IO5LB0Nco+eonvd9X850AmoC1SPhWVaCuO+58x3WFx7NBIZ5EEQhoPK6TM
	HR7pvznvVcfQ5F8m+xJd7v6wFJeQY5GOm83zxfb9/eRbgCiMR+Sp3oiky+ek+tpW
	l8r0eAAOvVbaHu5n0vMTKdZRh9tOZMQsvSsxWVvnCTOjRnB18pjFCLHQwrPCynMg
	fzmnFGPCHKMx1G88bBA2rvWXbXBe0615O2y4j/uhwO/ZY3y24XWA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwubdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:27:50 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 10:27:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 29 May 2024 10:27:48 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 66448820270;
	Wed, 29 May 2024 09:27:48 +0000 (UTC)
Date: Wed, 29 May 2024 09:27:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <tiwai@suse.de>, <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency
Message-ID: <Zlb1E1KWt9zNVj0s@opensource.cirrus.com>
References: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
X-Proofpoint-GUID: 6S_Ye5YPmcC-XCDvqhj8du9Xmp-iezy3
X-Proofpoint-ORIG-GUID: 6S_Ye5YPmcC-XCDvqhj8du9Xmp-iezy3
X-Proofpoint-Spam-Reason: safe

On Mon, May 27, 2024 at 02:19:40PM -0500, Pierre-Louis Bossart wrote:
> The addition of the Cirrus Logic 'sidecar' amps adds a dependency on SPI_MASTER.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
>    Depends on [n]:
>      SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] &&
>      (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
>    Selected by [y]:
>     - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y]
>       && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
>       SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] &&
>       (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) &&
>       (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST
>       [=n]) && SOUNDWIRE [=y]
> 
> Fixes: b831b4dca48d ("ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405140758.o2HY4nYD-lkp@intel.com/
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
