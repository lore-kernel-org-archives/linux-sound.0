Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB73921C1;
	Thu, 16 Jul 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189497; cv=none; b=Hj4QY3xccmVt0FtswbrHFtLXeChMj5MpMUiEOvOxDRbJ5B08B6Hs1zi72piMi0tm3W4ZprLG9UBlekQ1AEHjnL4aI+01UzWBs6Ux1Cvys4bnMOEolq8UFf8450Owbg+CZtg72H5IA2DsxSj19NA7YYTdQhCDzbduatzE3efkbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189497; c=relaxed/simple;
	bh=HB1j74UiBHuIWmdO5egw7hpTIeDZXXB7AVcy0PCo1p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7tWTxhlY+PJi5axFvOYo5n+E7Dmurab2AcdOzmxK/hgcMoyJYgezY6kvfI+l+trI9XybODoOufKXk5Xite4tEc07DtK2U37PqfpA4Pp1SJeU+j3NvSEWH7gbpptpl4emNS5+G3sIlHhfiMBKYxqalLuMZvRiEoX+mAfZkYqeQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAk1Zb3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAk1Zb3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C011F000E9;
	Thu, 16 Jul 2026 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189496;
	bh=4iIOcznXBpkZ6Fm860txG91UQp8xaLaiJm94RrZgTQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAk1Zb3xnbnFdksqHGANt5i+jREgod8NzPDC9ZJw+tEsQIM0yOqnDDtxiC+nx4hqu
	 hWrgLK8R5s3kfzSoFQWlO40HoWgzXy+9aNTp6I5VyVoL4+Snh2pfri/f/k+wY0FkAU
	 keNdEE2mtn/OzpzQpGAzaLc4lrmV82XsB5RJDTIol4PT0HWcRasda5WqOOB/WJEB5j
	 05SEivbimKdSecoKs7xc7MmdCO774P2AulPR9GAb20V9xKO5JLxxXd921H7b4LiZ1F
	 q6YKr0AXdIXgdsLA4yH4uFaPs8hrXvS/Hq34eKzjCFifyKhb/YDkO21zlu7dRlBLiZ
	 3iqNmFQRArX1A==
Date: Thu, 16 Jul 2026 10:11:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Srinivas Kandagatla <srini@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Add audio support for QCS6490 RubikPi3
Message-ID: <20260716-valiant-elegant-wren-fbad5d@quoll>
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>

On Wed, Jul 15, 2026 at 10:02:49PM +0800, Hongyang Zhao wrote:
> Add audio support for the Thundercomm RubikPi3 board based on QCS6490.
> 
> RubikPi3 uses AudioReach/GPR on the ADSP. An ES8316 codec connected to
> primary MI2S provides headset playback, headset capture and jack
> detection. The LT9611 bridge connected to quaternary MI2S provides HDMI
> audio playback.
> 
> The series first documents the existing ES8316 jack-detect inversion
> property and adds a board-specific Qualcomm sound-card compatible. A
> generic Qualcomm headset helper is then added for codecs which implement
> component jack detection but are not connected through a WCD codec DMA
> link.
> 
> The sc8280xp machine driver board data is converted to a per-DAI
> representation. This allows each backend to select its own DAI format,
> clock programming and jack setup. RubikPi3 uses this to drive the ES8316
> with a 19.2 MHz MCLK and to avoid unsupported sysclk programming on the
> LT9611 HDMI link.
> 
> The final patch describes the two audio paths, clocks, pin control,
> codec power and jack-detect wiring in the RubikPi3 device tree.
> 
> This series is based on next-20260710 and depends on Rafi's
> q6apm-lpass-dais MI2S clock control series and Neil's q6prm MCLK clock
> ID patch:
> 
> Depends-on: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/
> Depends-on: https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org/

That's RFC with comments, so why do you send your patchset knowing IT
CANNOT BE merged?

Last days Mark complained, Rob complained, sure, we can ignore
maintainers, but just stop for a second and think: what can we do with
your patchset? Really, what can we do?

Best regards,
Krzysztof

