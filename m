Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823E13AFAFE;
	Thu, 21 May 2026 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363792; cv=none; b=NK2SPWZqCSVxl/+dtNEoQoNKjpLlXVcqNOjpIiGRglD9BIu4ZX9DBi0tv608N3XJruodDAmpowqPzi89owAeD93Sr8i3MvBzAja047hHviXqmrdLVsIzxhCHPtg6/Xc0Iucs9lbTfqgX6Oy8VoDaolDXEtsCc/U5yCj0lsBXnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363792; c=relaxed/simple;
	bh=OKfkpQ0NnBSMoIX3yZjPs7WX/VwicQJLrijB1e7OyJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLqBRBz46TNJ7sbd98xePORdhqUnbc6QnL67zqAVEDM+KcWra4MdZR7bq5MHQkUjplQG3L5ro6LpzToJD/F4RYZvbM1gYzh2f8o1XNvGdRAmWOixps28iuEomNlboEp/7z42QwXnfmE976H7qelt5xcZe0J/jmHHaqLQyMwXlog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+yuIoNz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+yuIoNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9021F000E9;
	Thu, 21 May 2026 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779363791;
	bh=6exLDUNMJShJVw6ZjJRpJgvDUskVpNhcpmEurhYGDKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E+yuIoNzVnIUyez445DTnTp9HI9tsQ8Z1hfPvkMh88OvgOmooLJpUe9cZwU/yMKa0
	 DaWOLJMsObARGQfiKWcu6RJodcSv58/t7FTL8TIQC9QKjhxkaas4A4ba+MRGIeKANN
	 9GslTqdxFyDG/XjSjicNz1K06BZdufuBIYHokQlKe6lNPq29O8+4W6uyvLGBYQvCth
	 D89OUxyP8h+wajNhyJoDybnyOvu9KehEPMeQnBVMhScHSawLvQHk/qVFcQUPEX9s7u
	 lGdS9P0Q/fFP0FRH1kOmyspu95kHxrWfXxuWSIsY7eebvcrgGpIz7aJbBBDGlLvqJv
	 FXri71qWhShCA==
Message-ID: <2feeb837-ba7a-497b-be94-67756019b5cf@kernel.org>
Date: Thu, 21 May 2026 06:43:09 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: amd: acp7x: add system and runtime PM ops
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
 <20260507181251.20594-6-Vijendar.Mukunda@amd.com>
 <905bfeff-ab78-4299-a2a4-45fb8f05e716@amd.com>
 <fe98d961-c02c-4794-868e-7911991f7321@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <fe98d961-c02c-4794-868e-7911991f7321@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/21/26 06:41, Mukunda,Vijendar wrote:
> On 08/05/26 01:03, Mario Limonciello wrote:
>>
>>
>> On 5/7/26 13:11, Vijendar Mukunda wrote:
>>> Add ACP7.x PM callbacks and hook up system sleep and runtime PM ops for
>>> the PCI driver.
>>>
>>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>> ---
>>>    sound/soc/amd/acp7x/acp7x-common.c | 43 ++++++++++++++++++++++++++++++
>>>    sound/soc/amd/acp7x/acp7x.h        |  3 +++
>>>    sound/soc/amd/acp7x/pci-acp7x.c    | 31 +++++++++++++++++++++
>>>    3 files changed, 77 insertions(+)
>>>
>>> diff --git a/sound/soc/amd/acp7x/acp7x-common.c
>>> b/sound/soc/amd/acp7x/acp7x-common.c
>>> index 68f9b47766c4..df94864a1693 100644
>>> --- a/sound/soc/amd/acp7x/acp7x-common.c
>>> +++ b/sound/soc/amd/acp7x/acp7x-common.c
>>> @@ -75,8 +75,51 @@ static int acp7x_deinit(void __iomem *acp_base, struct
>>> device *dev)
>>>        return 0;
>>>    }
>>>    +static int __maybe_unused snd_acp7x_suspend(struct device *dev)
>>> +{
>>> +    struct acp7x_dev_data *adata;
>>> +    int ret;
>>> +
>>> +    adata = dev_get_drvdata(dev);
>>> +    ret = acp_hw_deinit(adata, dev);
>>> +    if (ret)
>>> +        dev_err(dev, "ACP de-init failed\n");
>>> +    return ret;
>>> +}
>>> +
>>> +static int __maybe_unused snd_acp7x_runtime_resume(struct device *dev)
>>> +{
>>> +    struct acp7x_dev_data *adata;
>>> +    int ret;
>>> +
>>> +    adata = dev_get_drvdata(dev);
>>> +    ret = acp_hw_init(adata, dev);
>>> +    if (ret) {
>>> +        dev_err(dev, "ACP init failed\n");
>>> +        return ret;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static int __maybe_unused snd_acp7x_resume(struct device *dev)
>>> +{
>>> +    struct acp7x_dev_data *adata;
>>> +    int ret;
>>> +
>>> +    adata = dev_get_drvdata(dev);
>>> +    ret = acp_hw_init(adata, dev);
>>> +    if (ret)
>>> +        dev_err(dev, "ACP init failed\n");
>>> +
>>> +    return ret;
>>> +}
>>
>> Both of snd_acp7x_runtime_resume and snd_acp7x_resume look identical. Will
>> there be later code (when machine driver and IO enablement come) that makes
>> them different?
> 
> Yes, when IO enablement code is updated, both the functions are going to be
> different.
> We need to keep it separately.
> 

Thanks, no concerns with the series then.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
