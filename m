Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E0241E4
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVwbO2l0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64251C433C9;
	Mon,  4 Dec 2023 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701693235;
	bh=+77X1yTHGoZ6/peS7Dk73aNb2pKF+nsPMu9+E5xI4yk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aVwbO2l02TYFwFd16DAOemiS5rQMaHLiWSSry78cuj4+e10bzPETUZTsYcvP2m9dE
	 HoHRQF8NX2PhpqEfN9pbFYDgSUpCsM1zK4IE85CoHXVSHpsb9T6L956yGaJC39I3KP
	 GNzp4vkkB2XtugeISJ0Lh8A64s0/fdBMFke+CI4+Crd5wdmhJPFueYx9/stYsHwEk7
	 /7FICdBFCCdCyy3x5TpUIDCsA1Y/jJMCwhIK4rvJNdm8j2RAQUzZg3BkdSzVZcxwOG
	 klxFbxOT19yvUbCikt6JFVt+rZyIupxDAzmEDZay32sor+S2Jyb+daIgbIEapF2Lph
	 EdxUjQlQoPUaA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
References: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: sc8280xp: set card driver name from
 match data
Message-Id: <170169323312.40199.10496089708040196942.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 12:33:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 01 Dec 2023 14:53:31 +0100, Krzysztof Kozlowski wrote:
> Sound machine drivers for all newer Qualcomm SoC platforms are the
> exactly same, therefore it makes sense to use same machine driver for
> newer platforms as well.  Choice of sound topology and user-space Alsa
> UCM files depends however on card driver name, which must be customized
> per each board.  Allow such customization by using driver match data as
> sound card driver name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: sc8280xp: set card driver name from match data
      commit: 625ed9457de50d7726ccb3f2bc4e01e543ceb126
[2/2] ASoC: qcom: sc8280xp: Add support for SM8450 and SM8550
      commit: fdcaecfc71e2f4ab70ce9469f14dd64c23bf401a

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

