Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C19A17DE36
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965975; cv=none; b=cYpdIsoHkV5NYGxHrbQlUx7KpenNl4Zp9xv3m8Xwv4XOe0BDA6FkOSSqvZCO29k6BEs4L5+jllsvwWeKs7Sqw5BAEu9zgktKb+r9fQYTMoqRBRxw8pl3r3hszl+wICFbaMKtMLYRLLDqRf5tAmJBAspQKYc54KoXMgeTQiEuaTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965975; c=relaxed/simple;
	bh=DsqjufcGNpjIp/iuqxdyDx9/1xjCIO2qnGhxX4bxXao=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ajVXHgbSu8ZRKoJAwW+SWyYmrYeOwgX6bndE/P32RJ8XVvYjEcBhFJ/owdZrLA/AMlRdWJuKQlxjK4iPGzF4qGM9SZb5qERo+MOsEX0f0bXFQ9WJwDLzMm7oAnDZiknsvZr8+ogQnIa1jCUw+QYyWAnzcG8eXTVnQwQNcKoKU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEfwXjO2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEfwXjO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730965974; x=1762501974;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=DsqjufcGNpjIp/iuqxdyDx9/1xjCIO2qnGhxX4bxXao=;
  b=LEfwXjO2IOBDmjJCDyAcK4MDxoCieagfjZ02cxD407G1lx4m1EEdn/g8
   8koV/TopENbRztjUli73PA2f/LqF+Gzbm6Uv3Ru9LiOJ5H3108blxAmRH
   z5WRIWmPLOqznP2+roPCe0ceDZm2N4iiCkDsFKu/3VrqQ7h6Q8n1kMhlt
   CLsM11GkYkGglJ8aIkPiV0i2Oa8Cm80NpC4zlSJR0pSm+9K7lV2ernJmc
   C6SIipeGcC8IhQylm91RugK1rToZPhqt5NfNTztGcliJlVAYODwIGl84b
   VLKnx3qjjqOAmm2ogpdrTJmp3z7EKL4IJl4IbjSzl1/fqVyAoKEdW1bdF
   A==;
X-CSE-ConnectionGUID: iJ7PQwwAR5WeG9foYd+eLw==
X-CSE-MsgGUID: oi8yVPNEQheGhKR82LILog==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34720734"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="34720734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:52:53 -0800
X-CSE-ConnectionGUID: czLT/cipRymTWsdkv/2MyA==
X-CSE-MsgGUID: P6OYNxoKSiaLiLhYl4TGCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85313059"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.205]) ([10.245.244.205])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:52:51 -0800
Message-ID: <00502783-96e3-40cf-bc22-3a012b50fa3a@linux.intel.com>
Date: Thu, 7 Nov 2024 09:52:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Intel: Kconfig: Add ACPI condition for
 ACPI_INTEL_MATCH in INTEL_COMMON
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev
References: <20241107071825.12704-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20241107071825.12704-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/11/2024 09:18, Peter Ujfalusi wrote:
> Only select SND_SOC_ACPI_INTEL_MATCH via SND_SOC_SOF_INTEL_COMMON if ACPI
> is enabled.

Still not quite right. This can result:
ld: sound/soc/sof/intel/pci-apl.o:(.rodata+0x80): undefined reference to `snd_soc_acpi_intel_glk_machines'
ld: sound/soc/sof/intel/pci-apl.o:(.rodata+0x140): undefined reference to `snd_soc_acpi_intel_bxt_machines'

Please ignore this patch until I sort this out.
 
> Fixes: b6bd3f3b6357 ("ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  sound/soc/sof/intel/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 2c43558d96b9..e22b5bbb47f0 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -26,7 +26,7 @@ config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
>  config SND_SOC_SOF_INTEL_COMMON
>  	tristate
>  	select SND_SOC_SOF
> -	select SND_SOC_ACPI_INTEL_MATCH
> +	select SND_SOC_ACPI_INTEL_MATCH if ACPI
>  	select SND_SOC_SOF_XTENSA
>  	select SND_SOC_INTEL_MACH
>  	select SND_SOC_ACPI if ACPI

-- 
Péter

