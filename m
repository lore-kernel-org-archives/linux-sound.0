Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FDB3AD53B;
	Sun,  3 May 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810206; cv=none; b=qiC9ZkRtBNiIM7bis5+S9ySLgQcyfLMpzMCV/hvSedXD4XQX2b9jMrK4ir/o1cH5Gdczutbfh+I59Y+6AIzDYLsLMoMrN8Kgr9tHoD5E9lFFIKPcMZWOXqYPw7oHaRtEGMiM4wvyv4ksecYd0dqbBqizRWWBpWOJuBS50QeAgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810206; c=relaxed/simple;
	bh=TrwSYASiwAn2wXslbk9LoH560GwPVOU2ySn9whSb3ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcSSZl56e+5cTS6ZuVONb4e6bXN+B5cQNDeNtGGidWEHgi6KnJcbDRVZKaZiWEqN1eVfgYBH+rpbB9SFcH9REPUibb6mh4uDAVQ7nyYyPPjblJu2R+WnxMzvF3OI+qtBQqoiBdH3gItTNJAMpYnboC0+x5zTbLQqSMsUvAWybOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h74OIVBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h74OIVBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F47C4AF09;
	Sun,  3 May 2026 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810206;
	bh=TrwSYASiwAn2wXslbk9LoH560GwPVOU2ySn9whSb3ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h74OIVBxEJJ70d8sD4ScGR36Bzs9m7qcUszUgEQD+E7cKxe2OrsaG+EeVL7htji0B
	 HQrUI/XHgjS65e3COBkuYHwpTBc0c8nUFvPf/Eeer5YyUuqtoWgOF7z9E5W/2+CEfv
	 XMyFDd2UPNiigJoMLgPk18E/7jyTR8ywBFtUxunmRKAnDoiBlu5pyEqGNS11kETK45
	 Z9baCnhuZM3dUb4+e2fss9Ipzpc4lxPYwCII8fPBkvImDAHNoWsuAS5RqGxXw2aM2B
	 f4HzLRoQGnsH1uabc5Hi3kF4lQiicwwLCKYTC25O1ykxLP0eJQ/WTvftFKJlmg2IcE
	 l/My6HJKHQQCg==
Date: Sun, 3 May 2026 14:10:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>, Adam Skladowski <a39.skl@gmail.com>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec:
 Document pm8950/pm8953
Message-ID: <20260503-furry-attractive-stallion-0d9d83@quoll>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-4-mailingradian@gmail.com>

On Fri, May 01, 2026 at 11:31:16AM -0400, Richard Acayan wrote:
> From: Adam Skladowski <a39.skl@gmail.com>
> 
> Document pm8950 and pm8953 analog audio codecs.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [richard: add back empty line]
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

