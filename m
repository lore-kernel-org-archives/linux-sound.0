Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B24533CEA2
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771968129; cv=none; b=OCWvU7IuubNT0out1CyrP3pucMJ+UhdQHzyh6hdxzKkWIqhZEmjehBFIIH5AMroBE4Ly3VYGaa5GDyHc0JazAiolwheUjLtdOJPW5F5xKL4iCiabjJVZuHjq8/eYNTEHa9NaqT5cgz6dcSid+QZemD/SsLLoO044SMZhz4RjaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771968129; c=relaxed/simple;
	bh=1JpvtWKc9vhvqjrHoxu5GRc83YE/n8ciyu62pJbCEYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9sAeKoBBmqRvee5PJnxmI2YMlh8RE6cXGeTaSZXxn+ZUsL2YPgKrk96zT45FVyU+9IAbECQgufwil6+ZM1RxJkhnxgEUKDE/T2LTi1+L/eMv+18cG1XLbBg/hf63WjOUIXhalU3dmgQxLm3L7+uTCKqyFG0/bpn6Geuhwxtg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=ejxFBqBJ; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="ejxFBqBJ"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3FE72EC4;
	Tue, 24 Feb 2026 22:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3FE72EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1771968123; bh=69RePj1Qzd/chph290MPk2UbHwT2H5tTX8mtRwbM5DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ejxFBqBJS+l+5Tu/7DMnVsvme5sjGeKIbVAUwhrkIsmP8pnEppPVZnqynnmDOChrN
	 zgz0bu+mwl+tqz/Y8OjAG8wpixNBYE264oHWK7+FRqkjs4/aqs0SK+WUXtvoBKfnnI
	 HdNIt/ivxINTlYzoLeYOQGv6nfTvRx0GE4motF1E=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 24 Feb 2026 22:21:57 +0100 (CET)
Message-ID: <6886043d-01a2-42c4-9918-43e6a672da45@perex.cz>
Date: Tue, 24 Feb 2026 22:21:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] ALSA: control: Verify put() result when in debug mode
To: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com
Cc: broonie@kernel.org, amade@asmblr.net, linux-sound@vger.kernel.org,
 kuninori.morimoto.gx@renesas.com
References: <20260224205619.584795-1-cezary.rojewski@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <20260224205619.584795-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/24/26 21:56, Cezary Rojewski wrote:
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
> 
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.
> 
> Due to large size of struct snd_ctl_elem_value, 'value_buf' is provided
> as a reusable buffer for kctl->put() verification. This prevents
> exhausting the stack when verifying the operation.
> 
>>From user perspective, patch introduces a new trace/events category
> 'snd_ctl' containing a single 'snd_ctl_put' event type. Log sample:
> 
>    amixer-1086    [003] .....    8.035939: snd_ctl_put: success: expected=0, actual=0 for ctl numid=1, iface=MIXER, name='Master Playback Volume', index=0, device=0, subdevice=0, card=0
>    amixer-1087    [003] .....    8.938721: snd_ctl_put: success: expected=1, actual=1 for ctl numid=1, iface=MIXER, name='Master Playback Volume', index=0, device=0, subdevice=0, card=0
>    amixer-1088    [003] .....    9.631470: snd_ctl_put: success: expected=1, actual=1 for ctl numid=1, iface=MIXER, name='Master Playback Volume', index=0, device=0, subdevice=0, card=0
>    amixer-1089    [000] .....    9.636786: snd_ctl_put: fail: expected=1, actual=0 for ctl numid=5, iface=MIXER, name='Loopback Mute', index=0, device=0, subdevice=0, card=0
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> Changes in v7:
> - relocated kfree() for ->value_buf to snd_card_do_free()
> - appended control's index, device and subdevice to the trace log

LGTM

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
