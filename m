Received: from out28-111.mail.aliyun.com (out28-111.mail.aliyun.com [115.124.28.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ADC3E5ED3;
	Fri, 27 Mar 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616458; cv=none; b=Mv9KHvTdslHJEvYi1DE32n3ETLW//f1ubo14svpzY8m5xgsCG+tIKyK+MnRJIUWB0m46A4onFntSsaRNYPyw7pkrCfqOkI+lvVvKHllboR8N77ttsFqi/8YfQi451pZwqpRCW8b99Z6KyYn2FcUo/jRj99rNVp6z1MObk8b37J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616458; c=relaxed/simple;
	bh=BZez2Jr41Bj4x/Urc86qOo5bnx5ib0OSkXFCduHVZ9E=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bMIillK+HBInT1bNrGcUitjKajOqAD5IPhQSLc40QRymudqM1eMD//RMTb9aFmWnah1FdJoSfOF6g78EniPgzNjzzREw2WdiCuwkcEW5EDHlFbYnXr9W+scywrK8DnI0VlGbpy4IjEK6avjXrOYPF/W1XF6E0ZqqlINeQYHNm6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07637633|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.0982931-0.000253955-0.901453;FP=17201444164198264218|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h.Xj83v_1774616122;
Received: from 172.25.21.240(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.h.Xj83v_1774616122 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Mar 2026 20:55:23 +0800
From: Fu Hao <fuhao@open-hieco.net>
Subject: Re: [PATCH 7/8] ALSA: hda: Fix single byte writing issue for Hygon
 family 18h model 5h
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1774595153.git.fuhao@open-hieco.net>
 <b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
 <87ikahqxou.wl-tiwai@suse.de>
Message-ID: <2dc24ca9-6899-e7ac-65cd-f6b36ed4b4c2@open-hieco.net>
Date: Fri, 27 Mar 2026 20:55:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87ikahqxou.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2026/3/27 20:11, Takashi Iwai wrote:
> On Fri, 27 Mar 2026 09:11:13 +0100,
> Fu Hao wrote:
>>
>> On Hygon family 18h model 5h controller, some registers such as
>> GCTL, SD_CTL and SD_CTL_3B should be accessed in dword, or the
>> writing will fail.
>>
>> Signed-off-by: Fu Hao <fuhao@open-hieco.net>
>> ---
>>   include/sound/hdaudio.h       |  1 +
>>   sound/hda/controllers/intel.c |  4 ++++
>>   sound/hda/core/controller.c   | 10 +++++++--
>>   sound/hda/core/stream.c       | 42 ++++++++++++++++++++++++++---------
>>   4 files changed, 45 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
>> index f11bfc6b9..57a144fec 100644
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -352,6 +352,7 @@ struct hdac_bus {
>>   	bool not_use_interrupts:1;	/* prohibiting the RIRB IRQ */
>>   	bool access_sdnctl_in_dword:1;	/* accessing the sdnctl register by dword */
>>   	bool use_pio_for_commands:1;	/* Use PIO instead of CORB for commands */
>> +	bool hygon_dword_access:1;
>>   
>>   	int poll_count;
>>   
> 
> I hesitate to add another flag just for this platform.
> And looking at the changes, all appear to be about the dword access
> for sdnctl writes.  So I believe we can simply extend
> access_sdnctl_in_dword to do the dword access in each write access,
> instead?  The performance shouldn't matter as it's no hot path.
> 
> Alternatively, you can enable bus->aligned_mmio flag, but this needs
> to enable CONFIG_SND_HDA_ALIGNED_MMIO.  That's a visible cost for
> other platforms, though.
> 
> 
> thanks,
> 
> Takashi
> 

OK, thanks!I will try to use access_sdnctl_in_dword in
next patch series.

-- 
Regards,
Fu Hao
