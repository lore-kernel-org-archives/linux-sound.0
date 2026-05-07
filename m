Received: from smtp.smtpout.orange.fr (smtp-12.smtpout.orange.fr [80.12.242.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75172C21C5
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173539; cv=none; b=ujyf1RpU92Wz+QacKX+DiZkIFTWx2JfiltviV8isCACFCfx7QKxNUdFys7k//tJfD5yMN7ZjSUiagWDtERCXuqSmOmklB0R/WswiPorRCVoLmMPKzrXqGBsFBRKTBZRAza4HKajRa1eKk1ByT+H0DzzQCp+e/HUOp6ogPwafWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173539; c=relaxed/simple;
	bh=LgrmyCXF9pBHH24NUWUDbO0zMsnNJGKur+oP3lTdoBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pO1AaPj2NzL5oJWz0waYkRg74a0me/2UOVUbEuiw+8SPJKeoQ3wVjlLLLV/1RizDvHJfkiv7B0dHPrtDI3mEohTNq1tdVwYDbx5RzzX/zvr4fM0o5nl0IEF6bCGdO3i5lLGEFNNEee+Br1x+wVZhdqs6e6GXqNTSge+7dQ+we8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sO4k7w3A; arc=none smtp.client-ip=80.12.242.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sO4k7w3A"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662] ([10.64.95.113])
	by smtp.orange.fr with ESMTP
	id L29CwCSDZYKcaL29Cw9XwS; Thu, 07 May 2026 19:04:26 +0200
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id L294wE2ZFKQy3L294wbFbC; Thu, 07 May 2026 19:04:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1778173459;
	bh=Xfj6xOAAVZsg96hKQbKbMUlMmwM7NkOunH7IYAxcliU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sO4k7w3ATzggScDJT1oTCKQf7IfMrjQoejXmKtHVBuvoVS2HnVKN//P9o6bJ9OFAp
	 cirhXCxgIdfn2uAuAeOOqIlAMNbspuDqg5IWD4huBct8jkJszabVNDEoDy4PalVhZJ
	 BTnj8LSdETbNAfTaUjAnNe1SFOZGbWOwPDsMXWsMBKBD5jS/huWUxXB0I/Bc9zpiQn
	 BdY8vRkgR3ggzntm1N75YrNM+FpQYS6eNv6ZtYZpmt+YTVqlQkwPDtANjOIBv9XWhk
	 btMXnMcxkr3eOCys5xIGv2fDmlUULSB+yU1u3Ry1wni8XSOTenVhLxWqitJIdMd3l3
	 xomIqMjG86q9A==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 07 May 2026 19:04:19 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <87657a15-0087-48f2-b700-8e21a5ad2e30@wanadoo.fr>
Date: Thu, 7 May 2026 19:04:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: cs35l56: Use devres to destroy workqueue
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260504151006.3374934-1-rf@opensource.cirrus.com>
 <e322b673-0eda-4342-bebe-2a444b004bc0@wanadoo.fr>
 <c376b094-9724-4605-aaf4-0b4592b74a48@opensource.cirrus.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <c376b094-9724-4605-aaf4-0b4592b74a48@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/05/2026 à 11:46, Richard Fitzgerald a écrit :
> On 4/5/26 17:46, Christophe JAILLET wrote:
>> Le 04/05/2026 à 17:10, Richard Fitzgerald a écrit :
>>> In cs35l56_dsp_init() use devm_add_action_or_reset() to add a devres
>>> cleanup function that flushes and destroys the workqueue. This replaces
>>> manually calling destroy_workqueue().
>>>
>>> The error path in cs35l56_common_probe() did not call 
>>> destroy_workqueue().
>>> Using devres keeps the destroy_workqueue() automatically ordered 
>>> relative
>>> to all the other devres-managed cleanup.
>>>
>>> The call to destroy_workqueue() in cs35l56_remove() has been changed to
>>> flush_workqueue(), as pointed out by Sashiko:
>>> https://sashiko.dev/#/patchset/20260504110743.3341869-1- 
>>> rf%40opensource.cirrus.com
>>>
>>> The use of devres cleanup was suggested by https://sashiko.dev to 
>>> avoid a
>>> small cleanup inversion window if destroy_workqueue() is called in the
>>> error path of cs35l56_common_probe().
>>>
>>> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic 
>>> CS35L56")
>>> Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1- 
>>> rf%40opensource.cirrus.com
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> ---
>>> Change in V2:
>>> - Call flush_workqueue() in cs35l56_remove().
>>>
>>>   sound/soc/codecs/cs35l56.c | 16 +++++++++++++++-
>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
>>> index 378017fcea10..26fa94c98775 100644
>>> --- a/sound/soc/codecs/cs35l56.c
>>> +++ b/sound/soc/codecs/cs35l56.c
>>> @@ -1627,6 +1627,14 @@ static int cs35l56_control_add_nop(struct 
>>> wm_adsp *dsp, struct cs_dsp_coeff_ctl
>>>       return 0;
>>>   }
>>> +static void cs35l56_dsp_workqueue_destroy(void *data)
>>> +{
>>> +    struct workqueue_struct *wq = data;
>>> +
>>> +    flush_workqueue(wq);
>>
>> I don't think that an explicit flush_workqueue() is needed here.
>>
>> destroy_workqueue() already does the job ( destroy_workqueue() --> 
>> drain_workqueue() --> __flush_workqueue())
>>
>>> +    destroy_workqueue(wq);
>>> +}
>>> +
>>>   static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
>>>   {
>>>       struct wm_adsp *dsp;
>>> @@ -1636,6 +1644,12 @@ static int cs35l56_dsp_init(struct 
>>> cs35l56_private *cs35l56)
>>>       if (!cs35l56->dsp_wq)
>>>           return -ENOMEM;
>>> +    ret = devm_add_action_or_reset(cs35l56->base.dev,
>>> +                       cs35l56_dsp_workqueue_destroy,
>>
>> so, I guess that destroy_workqueue() could even be called directly 
>> without the need of cs35l56_dsp_workqueue_destroy(). Not sure it is 
>> cleaner.
>>
>> CJ
> 
> Ok, I will change to manually destroying the ASoC component in the
> driver remove(), instead of using devm_snd_soc_register_component().
> That would make it safe to directly call destroy_workqueue() from
> driver remove().
> 
> 

Hi,

That's not my point.
Using devm_add_action_or_reset() here looks safe to me.

What I mean is that maybe using:
	ret = devm_add_action_or_reset(cs35l56->base.dev,
				       destroy_workqueue,

*if* it compiles, could save some extra lines of code, if desired.

CJ

