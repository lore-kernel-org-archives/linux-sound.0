Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF256F9E8
	for <linux-sound@vger.kernel.org>; Sat, 31 Aug 2024 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725067153; cv=none; b=ZRJKUNcOos0e4IfirkCMAAPnQ9cCHnHECjOIJmB/wyhUGpkjblFK6PIOZpZIUflQuE+EUMafsPbC7+Hy7yC4Hb4OYLIJ6DHG8tGA76Y5Ik1qJb6tV9UxNU9ofZkrRxp+EqS15RZiLecbJ93PEMFW+Hq7Kv3PAC0UR+h5hmJTsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725067153; c=relaxed/simple;
	bh=jpc+E1/HaYKb/BbRnwRL5ROsE5LtdLQNPxclYoPmMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CSay7JZHzOqzJ+X5GyY1CQCqfRyPElBy6ja8IUROGMRhvJLJtXw+HOfjQeVp970z4V2ew9s7WGzc8xGqK789B5rA3ApcuiGMsjFOmeAIfasXbHvIfoWpCrutKO7myqGhHrOty6MwW1XaPqAcyd60HPDUh/DTRu7/uT7GVLFr3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wwcbw50v3z2CpFH;
	Sat, 31 Aug 2024 09:18:52 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 608DB180041;
	Sat, 31 Aug 2024 09:19:07 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 09:19:07 +0800
Message-ID: <1e4bee4b-023c-40e2-ac4a-f71299fa2efd@huawei.com>
Date: Sat, 31 Aug 2024 09:19:06 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] ALSA: pcm: replace simple_strtoul to kstrtoul
To: Takashi Iwai <tiwai@suse.de>
CC: <perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>
References: <20240830080135.3544948-1-lihongbo22@huawei.com>
 <87frqml8rr.wl-tiwai@suse.de>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <87frqml8rr.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)

buffer->error

On 2024/8/30 16:22, Takashi Iwai wrote:
> On Fri, 30 Aug 2024 10:01:35 +0200,
> Hongbo Li wrote:
>>
>> As mentioned in [1], "...simple_strtol(), simple_strtoll(),
>> simple_strtoul(), and simple_strtoull() functions explicitly
>> ignore overflows, which may lead to unexpected results in callers."
>> Hence, the use of those functions is discouraged.
>>
>> This patch replace the use of the simple_strtoul with the safer
>> alternatives kstrtoul.
>>
>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>>
>> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
>> ---
>>   sound/core/pcm_memory.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
>> index 8e4c68e3bbd0..fea8bed02604 100644
>> --- a/sound/core/pcm_memory.c
>> +++ b/sound/core/pcm_memory.c
>> @@ -185,6 +185,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
>>   	char line[64], str[64];
>>   	size_t size;
>>   	struct snd_dma_buffer new_dmab;
>> +	int ret;
>>   
>>   	guard(mutex)(&substream->pcm->open_mutex);
>>   	if (substream->runtime) {
>> @@ -193,8 +194,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
>>   	}
>>   	if (!snd_info_get_line(buffer, line, sizeof(line))) {
>>   		snd_info_get_str(str, line, sizeof(str));
>> -		size = simple_strtoul(str, NULL, 10) * 1024;
>> -		if ((size != 0 && size < 8192) || size > substream->dma_max) {
>> +		ret = kstrtoul(str, 10, &size);
>> +		size *= 1024;
>> +		if ((ret != 0) || (size != 0 && size < 8192) ||
> 
> The parentheses around "ret != 0" is superfluous.
> And you can set the value to buffer->error, too.
> 
> That said, it's better not to put the ret value check in that if
> block, but put another check right after kstrtoul() call.
> 
Do you mean :

buffer->error = kstrtoul(str, 10, &size);
if (buffer->error != 0)
     return;
size *= 1024;
if (size != 0 && size < 8192)) {
     buffer->error = -EINVAL;
     return;
}

Thanks,
Hongbo
> 
> thanks,
> 
> Takashi
