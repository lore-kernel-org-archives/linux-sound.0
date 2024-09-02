Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267C1388
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 01:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725239963; cv=none; b=Ff79CmewMUul1Bea/gxCrBaBdPq78nJOybyKwYCOaGpjCbeaRP1Egj6siTYcaa+zuczEqKPOQcp/EVpCksoIfvtdN7G553njJnClq7deca6y0EZSwvmYuxtqGPe9zbQqtHVmzx2rzP+/EtzAhd5D6g+1u9NXRPBW0Dm6s3Pi1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725239963; c=relaxed/simple;
	bh=y+8KocR2wbAvFJS0H714rtRG6ca+3rGKDYgAZAVkPIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RU3lxoGWBykT3Mw0W0LvXMbAeu4ZOpU/iPw2IU9QwBGLUWp9YkW16iPsXZlKsf2e5ccjOHAdV3I4O1zDqjE/PrEVZLznjP9Q3EqbViyGgPhOL9b4rY8TC/X2OXdojuvDEKU0JAohaA5bl4uTGM/WrobcgIOjca/LUQm+qF0lH7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WxrRR4gsGz1HJ3x
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 09:15:47 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EEF318002B
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 09:19:12 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 09:19:12 +0800
Message-ID: <20c39479-0c42-4c44-8841-b1d1c7dc0216@huawei.com>
Date: Mon, 2 Sep 2024 09:19:11 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Fix the previous conversion to kstrtoul()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
References: <20240901134524.27107-1-tiwai@suse.de>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <20240901134524.27107-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/9/1 21:45, Takashi Iwai wrote:
> The previous replacement from simple_strtoul() to kstrtoul() forgot
> that the passed pointer must be an unsigned long int pointer, while
> the value used there is a sized_t pointer.  Fix it.
> 
> Fixes: 61bc4deff033 ("ALSA: pcm: replace simple_strtoul to kstrtoul")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409010425.YPS7cWeJ-lkp@intel.com/
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/core/pcm_memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
> index 73d4fc49a0ca..5001181208df 100644
> --- a/sound/core/pcm_memory.c
> +++ b/sound/core/pcm_memory.c
> @@ -183,7 +183,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
>   	struct snd_pcm_substream *substream = entry->private_data;
>   	struct snd_card *card = substream->pcm->card;
>   	char line[64], str[64];
> -	size_t size;
> +	unsigned long size;

Sorry, I haven't noticed this.

Reviewed-by: Hongbo Li <lihongbo22@huawei.com>
>   	struct snd_dma_buffer new_dmab;
>   
>   	guard(mutex)(&substream->pcm->open_mutex);
