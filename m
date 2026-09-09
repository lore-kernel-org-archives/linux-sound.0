Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D65448A7
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953369; cv=none; b=EtlqPctlCDCZc3NLZleolG0TozHlt8IqJDRZr/LLWMMLBQ2OIlOIUO71qxtShzjEgdm8cX2923FNQQSlQ5fQU8u0PuKOC/44tgE1CMLy2Unix+m0Pf/1ttLYw2tyJHzRqSnmSutfyWk1f0nx3ErSkyV1rwN9cvjNxbIlBy8SaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953369; c=relaxed/simple;
	bh=56QV56ucpbgS2qOQ9Q/zFhH/twhqdWpKNgDOES1MCW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjZwE+tKy6e1ugXuHEy7Hn8syNGW+x3yAsVKq+IaPKnGpELk2vPnIC/VkRfSuy5QH5j+1aFh23ot3/zKSVmzBxGtvT4mceKp14LLF0hUE9EZJx8Ci4KdHGEo0dd0eqjar8R6aAPg2xxO5SshQm2ApajSVy9i8IJWMIvA7Dni3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Yn7Q1Jgt; arc=none smtp.client-ip=95.215.58.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Yn7Q1Jgt"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=56QV56ucpbgS2qOQ9Q/zFhH/twhqdWpKNgDOES1MCW4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788953364; v=1; x=1789558164;
 b=Yn7Q1JgtLeCosfaZoJho2bGga5DyTDSt6aZj4pBe/5CPiEO2n1clPFF8Y6smFhCjewW5RJey
 Ft0MqYAq0g2ob7aM01ZYXVcMMLVZK/ryUlMlyoY/MJgOZ/Z6nZlw2SC8/j6/jFSggg4zVadhKTQ
 nN3tJUyCJXdztNIUnqtB9pHQ=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e038fb79e2ad4fb8;
	Wed, 09 Sep 2026 11:29:24 +0000
X-Mizu-Trace-ID: e038fb79e2ad4fb8
X-Migadu-Flow: FLOW_OUT
Message-ID: <3922a062-2e5a-4b9f-9d7b-34e41eb6c4a5@linux.dev>
Date: Wed, 9 Sep 2026 13:27:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt1320: avoid re-initialize in advanced mode
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
References: <20260909091806.872977-1-shumingf@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909091806.872977-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:18, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> On some machines, speaker protection is enabled.
> We call this advanced mode, which loads the DSP firmware and changes settings
> based on the basic mode, including blind writes.
> The amplifier can retain the advanced mode settings until a POR or power loss occurs.
> Therefore, the driver does not need to switch from basic mode to advanced mode
> when the system performs a warm reboot.
> We only need to check the function_status to determine
> whether the system has undergone a cold or warm reboot.
> 
> Fixes: 9b30521074f0 ("ASoC: rt1320: run the initialisation preset on the first hardware init")
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

this should also be done for all existing SDCA devices, no?

> ---
>  sound/soc/codecs/rt1320-sdw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
> index 72af413306fa..444a91755be9 100644
> --- a/sound/soc/codecs/rt1320-sdw.c
> +++ b/sound/soc/codecs/rt1320-sdw.c
> @@ -2470,7 +2470,7 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
>  	dev_dbg(dev, "%s amp func_status=0x%x\n", __func__, amp_func_status);
>  
>  	/* initialization write */
> -	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) || !rt1320->first_hw_init) {
> +	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {
>  		switch (rt1320->dev_id) {
>  		case RT1320_DEV_ID:
>  			if (rt1320->version_id < RT1320_VC)

