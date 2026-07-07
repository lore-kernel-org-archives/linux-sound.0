Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63852F6560;
	Tue,  7 Jul 2026 17:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446543; cv=none; b=ddAe0RhxvVUg/wxAb39SAe9iYHfPCV613X1svoTKd4WxyTJPqlbi1TAUBh4lMJSiUvIXpSSlyyC8qcDUjZKYYr826qhoRdSXhsW/KjFGbvns8+mk28NP/C4qZD1reTAsjDsOiLPqUcVNTcORSl5NQOaI6UMXTUSRNifye05Fb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446543; c=relaxed/simple;
	bh=qWnQgyBnZDBHSwtoI0LfA2dP8RZtk8e+vVoTkj4+Jro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVsGCc7w4UERwWgxcqMgGQXhO9Lp3OMgJLicxvSfRXprrHzeEO5ZcjRIwwT81e5K3iYHwyWFCNAe/T02rmCrgimq+DADgsxp3sZ3YB75uH+JZbRkNkgwH5VKWxZpeMzp3FDg4oAZdGyqD6F3pvbqR8tAOaBj3M9FLztgEzl975c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+vV0D1D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+vV0D1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7171F000E9;
	Tue,  7 Jul 2026 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783446542;
	bh=ZLYjcTt9DoOST5WxM8wszRJzNwSbozG9PunZC26e8Rw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U+vV0D1D6iWyROSyJ/81LeTr6as+BY5+OPNe/v1402JeIkYRTr/tOKiWlVaOMZRPo
	 hxWFSqwOvMaSNydjeQcGNW5msqvYExwo+rsfwzGQizCwViYuRahjpEZodVm7Rvzsze
	 6NXFumZ1Y/6M9PRb9cpGbEI9JVB2TPzzcizSqYBihs+bEKbtLs2ivlO26MBaejh4qq
	 iHvT2Gr2GKIbO/hNl27Xjf9koVZtAbdwKNNoRy4BtY3TS77/AcXe2IkXrFoOzQd1hx
	 7SrdegEPBhfaOvRzX/muS7lApCcof6qW1up3wCku8tQmpowZcPjfSs+YjdSi1abfLz
	 XkqyXJ4zzqqvA==
Message-ID: <22b0795c-64d0-4a39-8f21-c24ee5a5853e@kernel.org>
Date: Tue, 7 Jul 2026 12:49:00 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: ps: replace bitwise OR with logical OR in
 IRQ return check
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 syed.sabakareem@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
 <20260707060130.2514138-4-Vijendar.Mukunda@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260707060130.2514138-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/26 00:59, Vijendar Mukunda wrote:
> The condition 'irq_flag | wake_irq_flag' uses bitwise OR to combine two
> integer flags that are used as booleans. Replace with logical OR '||' to
> correctly express the intended boolean check.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Fixes: 7f91f012c1df0 ("ASoC: amd: ps: fix for irq handler return status")
> ---
>   sound/soc/amd/ps/pci-ps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 1162d13d8505..729f9aaba69e 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -248,7 +248,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>   	if (sdw_dma_irq_flag)
>   		return IRQ_WAKE_THREAD;
>   
> -	if (irq_flag | wake_irq_flag)
> +	if (irq_flag || wake_irq_flag)
>   		return IRQ_HANDLED;
>   	else
>   		return IRQ_NONE;

