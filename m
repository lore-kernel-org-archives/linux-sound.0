Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7F31B83B
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407626; cv=none; b=OkxCCdmIV8YLmcdGbfadvhyY2+duO3wGh4/h2b54D62ghWoyEwES1fB8mhETa38h9WOcs7NHgrsQYhPsH9faqEIDMkZQP6O7q+9Q6ysEKA5Kp9Y/fmp2RRJ7gAm3EzoHCnHFdSkmwKTU+Z+WV8E8U/DHfz+4bfdWYYhAHCKKb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407626; c=relaxed/simple;
	bh=xNJGMpfPDOsfn06FCqRcnYjZ7dBbvhe8X9L4MuLC7QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPrH7CttPZ2yDYCNsKhNWV9XApdLbyrl5kQnAO6Wa3mD3vlMva86N2qJQGU/cOTBRvWEAhELU6EbCxH00dR1V2ZxPvLMdlyMHxxrnfqLjeND1ov4gWJmOBsTTBlcM5Byhj8puk1S+jKMZ1CoB423L+kwxYqIcI4ej4uGdt0UdW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IvoyB9cJ; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IvoyB9cJ"
Message-ID: <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777407612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XLTSiDXIqZWt4cuAbWnGlToGHSWqZQsfyKvXxeLygIw=;
	b=IvoyB9cJXtjFC5xnjLpO7pvcJbcTtyFaScuqWg1pduDr0Wt2dSOi1Lth2zN03EHN/wyS5c
	5F/KLWVxrztkP36dAz7cdV8KxlOveWAKCkNp84SC0hzSCwYbJdXeqvukUsThBcwiyyRYA5
	yAsg0xaQYMv/zxBZLpA0azHhIAdwEUI=
Date: Tue, 28 Apr 2026 22:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
To: Aaron Ma <aaron.ma@canonical.com>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shuming Fan <shumingf@realtek.com>
References: <20260428073726.1611777-1-aaron.ma@canonical.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260428073726.1611777-1-aaron.ma@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 4/28/26 09:37, Aaron Ma wrote:
> rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=PS3 then polls
> ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data port
> is still streaming — the codec cannot reach PS3 until the port stops,
> so the poll always times out during playback. This blocks
> snd_ctl_elem_write() for 2-3s making mute unresponsive.
> 
> Remove the poll from PRE_PMD in rt1320_pde23_event() and
> rt1320_pde11_event(). The codec transitions to PS3 on its own once the
> data port becomes inactive. Keep the POST_PMU poll — on power-up the
> domain must reach PS0 before audio can flow.
> 
> Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  sound/soc/codecs/rt1320-sdw.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
> index 192faa431b5e9..e42e8b6de853e 100644
> --- a/sound/soc/codecs/rt1320-sdw.c
> +++ b/sound/soc/codecs/rt1320-sdw.c
> @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_dapm_widget *w,
>  		regmap_write(rt1320->regmap,
>  			SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11,
>  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> -		rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, ps3);
>  		break;
>  	default:
>  		break;
> @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_dapm_widget *w,
>  		regmap_write(rt1320->regmap,
>  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
>  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> -		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, ps3);

no, sorry, that's clearly wrong.

When we touch the requested power state, we *shall* wait for the power state to be reached.
removing the transition delay is silly.

You would really need to find out why streaming still occurs when you get a DAPM event. That doesn't seem right in the first place.


>  		break;
>  	default:
>  		break;

