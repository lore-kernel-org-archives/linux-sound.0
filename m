Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621D4C612
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8kzE9f4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF12C433CD;
	Mon, 11 Dec 2023 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702311612;
	bh=3nTV0SkxLpCj5lGOPMqS4WVJVvWuXILN7ErZ+JOAhRo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=n8kzE9f4/kvptFZBIE/JI71gnycQC2TponbEtW3zPxbUNhCBYROwQ4lDynuoC65sd
	 9yTNY5awadulGSw2vQPRutWRnFonXii/po+AMg6Ws3rIVGXmLWgtL4AmK66hJL9tTC
	 /uuJ9ouluS0HVxpq6cLP6GlqvHTzodiU17K9zRRnUuo5EKE37sIpqlIKXUvqJFjOva
	 9O3oB3a381lQVF09tpclQHyk/VTlHbkR2wKh1aRnWutFODNSyUMQEFeY9/TYu76+MN
	 gJMyHt+QBFlze31vnHpWXw1nHGozEDCMHqkj8MLnUvpm6P1o3RnszyRXBBN+xFpSf/
	 dfQoiusfxSUvA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
References: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] ASoC: qcom: audioreach: Commonize setting
 channel mappings
Message-Id: <170231161062.85457.2289736198838739317.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 16:20:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 30 Nov 2023 19:07:56 +0100, Krzysztof Kozlowski wrote:
> Move code assigning channel mapping values to a common helper function.
> This simplifies three out of four cases, with the last case using
> incompatible type (uint16_t array instead of uint8_t array).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: qcom: audioreach: Commonize setting channel mappings
      commit: ef14f40a3613ddd43a8dd736b5df6f865dcbb817
[2/3] ASoC: qcom: audioreach: drop duplicate channel defines
      commit: bcd684eae5aefc0688fcf43fd555155dd57f27c9
[3/3] ASoC: qcom: audioreach: Add 4 channel support
      commit: 3c5fcb20e07e3681a645fc3a8d890478ca320825

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

