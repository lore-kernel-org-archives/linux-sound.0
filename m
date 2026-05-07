Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0776F47F2E4;
	Thu,  7 May 2026 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778182607; cv=none; b=aHOGnJB9uWfJ0b/RrQ+DaBpci7s8Va5Xn+d+4BGzprtI42EklXJL2ZahZjHAFK2P7ZDZSIM5C9U59OsVw5SznnN534qb4QtZiwC+sSjbmlekiQl+LT6WBbIT+YOpyfXCB7QnDTixt8q0465xZXmGnl14xUH1Xsf1PH0mCuVxoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778182607; c=relaxed/simple;
	bh=QsLYeqoRpxH6BMcbjJy4UDYAnoo+40W8WyaEDfEFP8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WW5bFn1IOlIl5jmwGfxs4Fyl5hchNO7phqNr4OLLr54UtL98gi5y9T6gnehzmhH5D8LY1JAXAr6q+0n0p8TqhyT5t69AI4pWss0Gsn6Yaf53WdHTUCKmkTreNDbb7VXFcvk28VdAc1hh0Ix7EXxdmygeM/WELD6efziGvrL6IvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYxE/qFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYxE/qFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F18C2BCB2;
	Thu,  7 May 2026 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778182606;
	bh=QsLYeqoRpxH6BMcbjJy4UDYAnoo+40W8WyaEDfEFP8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XYxE/qFqUg6HhMwU7PT3a3S9A3FcURy+akKstjw046typ3LWImxDTvYt4OSwv0CXa
	 khkh0E9OyTryf4gT+4Iws81NRNN+aFui4pOa6mRZutHVdG3RXd6yuAzIbZN0wAo3xY
	 0HyjFQAehPmDPq8KyWNxu5IeI6FysnvK/nK4rKkI+FvZsBgJOnqGeU96It6sRSRDa+
	 leUmLm7L1CroVbf2vSFgPkqzpMcVdpBRk6va4fkttLsYYRl0GBlakf+5fBoNSlNcOd
	 fLYW+S4JtyK3TvrEjVS7CS113p7o6ax3hQYyT8MjXyelP2mQoocg37tHHUWHDnomzv
	 F7Mpgk3G4JKSw==
Message-ID: <1cb541aa-13f4-4836-b4d0-fe3c50c032af@kernel.org>
Date: Thu, 7 May 2026 14:36:44 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: amd: enable acp7.x drivers build
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
 <20260507181251.20594-5-Vijendar.Mukunda@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260507181251.20594-5-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/26 13:11, Vijendar Mukunda wrote:
> ACP7.x drivers can be built by selecting necessary
> kernel config option.
> The patch enables build support of the same.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   sound/soc/amd/Kconfig        | 10 ++++++++++
>   sound/soc/amd/Makefile       |  1 +
>   sound/soc/amd/acp7x/Makefile |  5 +++++
>   3 files changed, 16 insertions(+)
>   create mode 100644 sound/soc/amd/acp7x/Makefile
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index 53139766fafb..9f4f1f4ac3f8 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -174,5 +174,15 @@ config SND_SOC_AMD_PS_MACH
>             Say m if you have such a device.
>             If unsure select "N".
>   
> +config SND_SOC_AMD_ACP7X
> +        tristate "AMD Audio Coprocessor-v7.x support"
> +        depends on X86 && PCI && ACPI
> +        help
> +	  This option enables Audio Coprocessor i.e ACP7.x
> +	  variants support(ACP7.D/7.E/7.F). By enabling this flag build
> +	  will be triggered for ACP PCI driver.
> +	  Say m if you have such a device.
> +	  If unsure select "N".
> +
>   endif
>   endmenu
> diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
> index 23b25ff0d800..ef2b36d47705 100644
> --- a/sound/soc/amd/Makefile
> +++ b/sound/soc/amd/Makefile
> @@ -18,3 +18,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
>   obj-$(CONFIG_SND_AMD_ACP_CONFIG) += acp/
>   obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
>   obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
> +obj-$(CONFIG_SND_SOC_AMD_ACP7X) += acp7x/
> diff --git a/sound/soc/amd/acp7x/Makefile b/sound/soc/amd/acp7x/Makefile
> new file mode 100644
> index 000000000000..9426e3b47c08
> --- /dev/null
> +++ b/sound/soc/amd/acp7x/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# ACP7.x variants platform Support
> +snd-pci-acp7x-y := pci-acp7x.o acp7x-common.o
> +
> +obj-$(CONFIG_SND_SOC_AMD_ACP7X) += snd-pci-acp7x.o

