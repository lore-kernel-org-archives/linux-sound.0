Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0334B68F
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602555; cv=none; b=GwRTv0HHCnS4rdkDZlHV/D/UnT7ngKE6VpuGDlKmQVlb9nUJXBQgAIe0qjT89qE2DkrgCyL4D/RTbQjKHHotRdkT4okwwXZPAKD57fFBKJ71fP8opR5e/xcxXBvXJPeEis7xB24hIhcPq9QjPYYuZaX+54IiobvC/+y/LdFTrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602555; c=relaxed/simple;
	bh=DbCNPocwG0B6Nz6qRLmSK5WUNAykh43JJ00fyZd1XqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRE/Xw9UhdgTx5uLr/mAZkEAVHFnHZN95x3w4qQCb8u/OVNWvNeK4l7HKg0ejj8prctfkGKNnJ3ytnM8eIIZ599/rEfDxUwGzqE9XHboAC2tgIP7kXw7gyQON8S78OCF1W2r87d802it+/akkJ/CRwlkD0MaqiCBO3m75HeglB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8/qI17p; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8/qI17p"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5069ad750b7so18319001cf.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602553; x=1772207353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6LoJ75EgE4N9tYxSOxvVmCDYlAbN9HmsVc+u6xnBeI=;
        b=T8/qI17peIPoroe6st7InwPQhOm6akjZrlicBzAxC0MaZZD6DhR8+VP1S0Mm5tDt6u
         XAIIZoPFjYpgg9Dd/egpT3pHQySeSETiZYb4qQZtTW/Ao+mH9bKd17BMtmIz0XDZGmMt
         L4t8h23vx81EIAhYPHZKz5Xg89IpU1CtnKZ9dz34Cq+L+JZ326w65txOCDxqk1zkugxv
         Nml++9cTFGxJLI0+VEiQzNfprx7jgU+ACYA8nHA31fhyamxXUJ6T4OOb8uBjK1n3w0Ab
         wxvE3WMVFm40RX99o2Yze4+Nr1sK6wm7iujcAoXu6/Hec2FFsGhgGBPuuRNn18ptpLqi
         vOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602553; x=1772207353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6LoJ75EgE4N9tYxSOxvVmCDYlAbN9HmsVc+u6xnBeI=;
        b=xDrOgr7GoMdzH9Mw5lPksAQEr1pH62clHZjvO2ugXaDuM0v159OvMdpLsPjw7f7EaP
         uDFELPyFFWaD9w0QBWCLfkMCXtPF1nzNFZRXJu6XjZjiP4oxElDzUCtmEt3OW/LKvkoW
         5ZvgGpIcJqtx3ZD6HsF5AcnafMJZDE3xYtk/08s8kUxLJeaTkQYpg3blWaLBD/QbI/KY
         98oWrumTRCN19PLXqbV5osceXwKHG7gEpPD456wQxbQFj+jlu9wY6/6rpIC6HKdR2zKI
         8Zulrm/CSG1kE1F6sxlwwVkliMn87hykHfIiPoA2QK6IpWPoqCHbQ/feFZxn9fDkw+5q
         q+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzMsQyh9ajE9R5bBeWelIZ5WNN57Ov+/aRCrxHaeQ0BYbN/XtQ2IKIOcx1prbZ9UmoAN/aAk0tKIPssA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwHD4lHwmxgBPO8piO7moSIQoCsbNRX5KLsF1ZrDyKOkqPv7aF
	xKfylWTvIkKDo+2DAihM0dq/uwqcUHzP9j3h7I9jWYhq2Ovd4fRmoFgt
X-Gm-Gg: AZuq6aKA32bT9qEyL0tzEi6G7im4harvB7SZGAl/Gbh8gl8s88Y7/Go/xfOf+dxtnaH
	swjg46Z/ywigh8gQR8cDZy8v7Se1I+4MUyL3L00wx1Emp9n6HH8WG8cpZTspyzkxO7N+AXtWRUm
	rYNEWInm/IQ6xxki02xB1LClu8TFuvx5J9tNSY5LAD8EbiJLxf2UjQXWfQwxFc7cSJv7wfXJwKG
	QxYU57v/2IsgezwnTglESMmhRvESGCKavCprnpxNseYyZK/637Oa2vQFZjbK1uHAd3z8Fudplox
	I37FdtV/RCDHkB2PKAN3/J7rPsEfljIgNgGvtztewq6fYBuigWSElBjT5x6ESy1b0U2oY+gRk1P
	I84o2pOMwrhfaPEP7Cg61IzIdO3IQLB/dtLBFRNlgtWl1Abf2tM7pUaw19c3RvfeG2UAp0yDrAj
	i8NLSG9ReT2UYgJP5co4Q4YuqJ/jmKjA==
X-Received: by 2002:ac8:5a10:0:b0:503:3838:ac1e with SMTP id d75a77b69052e-5070bba1c14mr3307421cf.2.1771602553436;
        Fri, 20 Feb 2026 07:49:13 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89949b3d543sm112192996d6.16.2026.02.20.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:49:12 -0800 (PST)
Date: Fri, 20 Feb 2026 10:49:39 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 09/10] ASoC: qcom: add sdm660 internal sound card support
Message-ID: <aZiCkxWLHzgvHnvP@rdacayan>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-10-mailingradian@gmail.com>
 <05873ad7-ca35-4542-b064-5b401f7bd069@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05873ad7-ca35-4542-b064-5b401f7bd069@kernel.org>

On Mon, Feb 16, 2026 at 01:34:20PM +0000, Srinivas Kandagatla wrote:
> On 2/11/26 2:03 AM, Richard Acayan wrote:
(snip)
> > +	case INT0_MI2S_RX:
> > +		data->int0_mi2s_clk_count++;
> > +		if (data->int0_mi2s_clk_count == 1)
> > +			snd_soc_dai_set_sysclk(cpu,
> > +				Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> > +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> > +
> > +		/*
> > +		 * Downstream specifies that the AFE is a clock consumer, but
> > +		 * the sound is distorted (loud on the right channel and sped
> > +		 * up) unless we set it as a producer.
> This comment does not make any value, Who is driving the bit clk and
> frame clock is totally depended on the hw setup on the platform, Driving
> incorrect clock would lead to such issues. Does the codec drive on the
> platform that you are testing?

I dug into the downstream Q6AFE driver a bit more. It actually inverts
the logic and specifies that the codec is a clock consumer (instead of
taking Q6AFE's perspective), so it is equivalent to setting
SND_SOC_DAIFMT_CBP_CFP.

Downstream (https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4347):

	case SND_SOC_DAIFMT_CBS_CFS:
		mi2s_dai_data->rx_dai.mi2s_dai_data.port_config.i2s.ws_src = 1;
		mi2s_dai_data->tx_dai.mi2s_dai_data.port_config.i2s.ws_src = 1;
		break;

Mainline (sound/soc/qcom/q6afe.c):
	
	#define AFE_PORT_CONFIG_I2S_WS_SRC_INTERNAL	0x1
	...
	case SND_SOC_DAIFMT_BP_FP:
		pcfg->i2s_cfg.ws_src = AFE_PORT_CONFIG_I2S_WS_SRC_INTERNAL;
		break;

I don't think the downstream code needs to be explained so I would
simply drop these code comments.

> > +		 */
> > +		snd_soc_dai_set_fmt(cpu, SND_SOC_DAIFMT_CBP_CFP);
