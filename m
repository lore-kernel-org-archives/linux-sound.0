Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94882E06D2;
	Fri,  3 Jul 2026 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106344; cv=none; b=bj9u8A6/7t0khhj415xZ4cUDk4NfnoH6zTjyvBPEnoixXKIlAEbCmU/KYDsWZJaZg/uHn3WwL4JLL2nzjhldg/bqtb9PGkeH0l/N/y+EPFyaf0qD37tFGps9lDTPios5uB3MitmDXtP4f4oTWnNEq5RuQGeIXTfXVeEo9ahM88g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106344; c=relaxed/simple;
	bh=xJuVLJzroWMBD9DD71kNfwj90ClarasYnSkGTpNHemU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PKbsgdYcweyfMpd/5NNz4ghHPpQ3oHKKb+D0secc7JCFySvZH3wzIhZzj1EPnvjfoatUZkEiRj9uMf0Pt5RKT0YOw9sqSjMuRea4GlBJEZHs1+3ZG9x0ZuRscpbt/OmKNuZhXUAj4mE79N+ZY173uKyHnO88tOD1p2IqQtdXo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcrLOfl8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcrLOfl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99A51F000E9;
	Fri,  3 Jul 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106342;
	bh=i5y2X3HFGbM7t4zbeA3K3meHSTZdNQp9aSf6Dom1Xwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AcrLOfl8B4z2JUdJyLFQAe6iR/8N0ju4KeavUvXaCrsxSJcXf+Sd49VTbj+g4bX6N
	 3QoZ3008RgXNBC8wDahrTCycDczKMiRvw+gLDN0fKnmIQtXVvrmgkrqAJWHmjP0edY
	 YwQQfuw/bM1wNysUf9juOFrMa0KS3t9u/47sIlQ3q3s6cDmzNPkCGnXexgMh/Wwwfg
	 O0w+M3ZaaQAE1d0hVCPfpmBBn39sXfQFxKZ0e0Xxv+ay7gbjdABhzHL3q/ZJkuwZS/
	 SW6fxZNUARfThHbGNn7uZV4Jm3tMuWCB3lxRLT8dxNGOEc6RPI3b4MZjXjA3LRr4j1
	 K++m+7O58IxzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
Message-Id: <178308705893.53103.838784798451369843.b4-ty@b4>
Date: Fri, 03 Jul 2026 14:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xJuVLJzroWMBD9DD71kNfwj90ClarasYnSkGTpNHemU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqSAsjRF0Ry17bJGK5+GHbUbUg/TJoZ4yshEzSY
 /r0ECHBARuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakgLIwAKCRAk1otyXVSH
 0EBbB/0TXgJGgUK4XdbWCpEU42NWKXx+ghMyla2oUGD8TD2DYyf8jX22czJ48zyVf9qsGNgbV74
 AxKMTT0HBsk8+A+jY2hRCVDJWqpMl8PXwX4d+d/Zq+dmpuc68JILsjgUqPpoFKPP8qTgyHGzKsF
 /25vhLzpq+nGWbO8TiISw8GNMj4WFVBGeJBpsrLSPoR8OH1HHB8+XoH7YbZdxr8qpZ8AXkZ7XpF
 uIR0M/9lowk7ptV4z8cnhB+QWh56bzM0hwUOz5tGjQIkTXmo3QE5Qls/sW3TlNzwX0/QUfLoBfM
 ZTt0hxlWBZuySq7Ff+wiP+cuYTWz+7xb2pS3fHJNAmfRI7J/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Jul 2026 00:14:56 +0530, Ajay Kumar Nandam wrote:
> ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
> 
> Hi,
> 
> This series converts the LPASS WSA and VA macro codec drivers to the
> PM clock framework for runtime PM clock handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      https://git.kernel.org/broonie/sound/c/cd054a6e272c
[2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      https://git.kernel.org/broonie/sound/c/eb667d0fbdd3
[3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
      https://git.kernel.org/broonie/sound/c/541735571578

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

