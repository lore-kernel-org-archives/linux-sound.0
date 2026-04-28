Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27853384223;
	Tue, 28 Apr 2026 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365317; cv=none; b=BFmzu4rX74UUCXkYRrvGUplhFkzQfV8UUkgmel7KFbpNQjtnEMOWkU7ecwX3cYmCyIZOFo00fRiR76tTOpdTvcnAJf3xdxwen1J1nPHTllJ+L1yrJ3exCwtK/8+v0rDH0UeGQxaNaJzgyIkgbg544GQZl8KgFWNxbsb8Q3zdt8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365317; c=relaxed/simple;
	bh=y7f7thE0c7H7QKR/Sh1tVFiwIU6Py6GwbGku01ZkESc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISbm5+yxX4RFwlbEOj9kKwOvBZ6fpHz9owPknAgFF9JaMUqdBOwviZiIHfmhjOX1JwyMwcyLRwL27JRP1ikggesFRFSdVXHE4p1DBXQ3YlkTXrNG6Usxh2pQm4cjBR/9SiZWdVgBEWl/rNlDDDE96XLjklP2Fl5tvApNY9Sa2Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsZ6x+Jx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsZ6x+Jx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EB1C2BCB6;
	Tue, 28 Apr 2026 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777365316;
	bh=y7f7thE0c7H7QKR/Sh1tVFiwIU6Py6GwbGku01ZkESc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EsZ6x+Jx8FgriqINKdQ25ELru/DWpXZhmJEgGB3CHJ16DoQgXaIXJqhE1rK6IqBG2
	 CLkIBMW8Cl0MrVrRuSrRc00HW3zE9VhVuXJPwpEZ8DitfVpf240Pf9FPqkr/1AV65V
	 wC4aFr51qPjCTNqkYG+kCzCf6tAN4FPI/Kcd9nyW1zjuEx3QUiTcDiy1cP51qoe8OL
	 5SJtxJJh1YhDEJZCAecffu/MJyTObAtZVUcAgjKKjf/u0kmLGzpH2hJpgjshZTRkRc
	 P6sVMhjvTWf+P/AD05D+HI8YParZiYgjKaMOoOJLFzb76Lk8i2nsFQtuWrzh5DPvO3
	 TkAi3aaJawhaA==
Message-ID: <d846992e-2ae4-4db1-8401-f740bf6cb575@kernel.org>
Date: Tue, 28 Apr 2026 10:35:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix MCLK leak on
 platform_clock_control error
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28-Apr-26 04:38, Cássio Gabriel wrote:
> If byt_wm5102_prepare_and_enable_pll1() fails in the
> SND_SOC_DAPM_EVENT_ON() path, platform_clock_control() returns after
> clk_prepare_enable(priv->mclk) without disabling the clock again.
> 
> This leaks an MCLK enable reference on failed power-up attempts. Add the
> missing clk_disable_unprepare() on the error path, matching the unwind
> used by the other Intel platform_clock_control() implementations.
> 
> Fixes: 9a87fc1e0619 ("ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

As Andy noted there are other drivers under sound/soc/intel/boards/
which can likely benefit from a similar fix.

Regards,

Hans



> ---
>  sound/soc/intel/boards/bytcr_wm5102.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
> index 4879f79aef29..4aa0cf49b033 100644
> --- a/sound/soc/intel/boards/bytcr_wm5102.c
> +++ b/sound/soc/intel/boards/bytcr_wm5102.c
> @@ -170,6 +170,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>  		ret = byt_wm5102_prepare_and_enable_pll1(codec_dai, 48000);
>  		if (ret) {
>  			dev_err(card->dev, "Error setting codec sysclk: %d\n", ret);
> +			clk_disable_unprepare(priv->mclk);
>  			return ret;
>  		}
>  	} else {
> 
> ---
> base-commit: 98421d94a1a6dcc3e8582eb62bedeccecda93339
> change-id: 20260427-bytcr-wm5102-mclk-leak-88016072a63c
> 
> Best regards,
> --  
> Cássio Gabriel <cassiogabrielcontato@gmail.com>
> 

