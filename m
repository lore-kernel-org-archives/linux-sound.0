Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F66260A5B
	for <linux-sound@vger.kernel.org>; Tue, 11 Feb 2025 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300112; cv=none; b=gQpn3KU8a2iTHR0YBnm3SUEZKcXnerKOnhWvt41MYE5husvDHdUM3kczDipY/TR2LGHkdFxsPEd9EQekWhSTkMMDhryF7dcyFm4t8YkxozH6zAKEh3y6nR7qDjaprbScl6Box/Yrf37EmAeRIZOl94qLC/U0x0JYbaXycK0ZFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300112; c=relaxed/simple;
	bh=2NFgTKZpUWVZdAUiFKPyuSsYRytI7F1lf/BkXz3fClY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tL7gZGqx3iTpq+nIjGkOcF08BGRfg2zaP2K7A+yLVLJBknwdJ/Z3YnNTRq/hh6DX4ju7M54YM+5yHWMeWv971at6DN/5OwCmLOhTNo3Kxw7n2k5oZCIA6ChuoFZAFqqlBl+ZwbKAY/Yzsz4dXsTWLljWPirk4sfXP5g5zFPjOvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WYOu5hLC; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WYOu5hLC"
Message-ID: <a97bf84a-21e8-41ce-8679-332630136ec5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739300097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYTA8Yg9YQQb28J/lnoc+xxJ4BC+fKNM3Ta76gIp5j4=;
	b=WYOu5hLCkrrt4uzQ3yU43CXEEAHmWLvmQTb1EmVfay/eIQdb88ImxkP7CrO0urIhlt6WYQ
	eh/ShQLv8OVTiBynTSOLY45HHI+eomYCxPeAvfiBU2PJQBOKGjXusTrDomit8CgCDAvbe/
	MIuIyYDUDdBxyNeIVvjYtkt9qu5bWZo=
Date: Tue, 11 Feb 2025 12:54:52 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: initialize ret in
 asoc_sdw_rt_amp_spk_rtd_init()
To: Mark Brown <broonie@kernel.org>,
 Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, shumingf@realtek.com
References: <20250210-soc_sdw_rt_amp-v1-1-1ee1afcd8941@ethancedwards.com>
 <ad5eb513-d3ef-42b8-b4a7-88a6ecf08804@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <ad5eb513-d3ef-42b8-b4a7-88a6ecf08804@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/11/25 07:13, Mark Brown wrote:
> On Mon, Feb 10, 2025 at 11:08:27PM -0500, Ethan Carter Edwards wrote:
>> There is a possibility for an uninitialized *ret* variable to be
>> returned in some code paths.
>>
>> Setting to 0 prevents a random value from being returned.
> 
> That'll shut up the warning but is the warning trying to tell us that
> there's a logic bug somewhere in the function and we're for example
> forgetting to look at a return value in some path in the function?

The problematic code is this:

for_each_rtd_codec_dais(rtd, i, codec_dai) {
	if (strstr(codec_dai->component->name_prefix, "-1"))
		ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
	else if (strstr(codec_dai->component->name_prefix, "-2"))
		ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
}

return ret;

I am not sure if it's possible that either the for_each does nothing or that the two branches are skipped, but certainly initializing the 'ret' value makes sense to me.

Bard, Shuming, what do you think?



