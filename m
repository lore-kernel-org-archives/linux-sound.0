Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991023D7D76;
	Wed,  8 Apr 2026 18:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775671553; cv=none; b=rS5IHFAYgOri8n2WjtbhxEDFnZqELtsFrlLYkQ6bEj2TSGfBGE23oGkN0dYchYwhAVjIsQS86awvwrenZG5PpFcJQL0r5R+Nr4TY+hjcLNcQLwu9jQpyV06VP8WGqbYU5Qkbg4B261rQzOANFMO+QYX45wXAUhrmXtFjZNmN4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775671553; c=relaxed/simple;
	bh=1YyUQKrS6Jgi2V2vsvvvkZ/uJw01Zbzn31qRiqouNX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZMmmS+USncfAFxtPwj+ndZn5LbERO1w3wJJGe1JjVxsxih7E8a1h34Ut7Yye6ZC3IQ9DKdPbX+4vgJ9Ro7iYYMZ5tbMt+glkahK2j/4HjA0Wm1eYcsGtPFF11oxUJ5eki3vSV1AcmuE3UkEyl9v7GlpxXZXXB5WdR9GT5AgNcXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFckpQpY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFckpQpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3B6C2BC87;
	Wed,  8 Apr 2026 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671553;
	bh=1YyUQKrS6Jgi2V2vsvvvkZ/uJw01Zbzn31qRiqouNX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sFckpQpYSP1WzxKA1MGyU9kovarxHIhC9KiBiWm7kcB+6892fEF2XLVIe1Nqw7c59
	 Sn5r94/QJi1JO2olGQtGqsy3TQJyt53sJ+T72X/SPOMx1bUrZC0B4yf5e9p37EQOD3
	 d2fGIPnXSbFuQmLxZoD9roGhQmt+4Iu83r4PvMO5Hxv4WQJP7g3HrRp89NII3TBcex
	 ObcF6Ej+3Kp0QZURogDhtweIdNwG2+i8yidt1e0l/WbFVakm+MXqR69mEGxV1AbSoX
	 qKKlR3n2tKF/7xRahGluvW1ErEI32k7nsGU4+ss+8N5rfbGuKOADTt+h1x3hhUMmwM
	 t17fhMiU5TEGQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Neo Chang <YLCHANG2@nuvoton.com>
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@oss.qualcomm.com, 
 dan.carpenter@linaro.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com
In-Reply-To: <20260408052639.187149-1-YLCHANG2@nuvoton.com>
References: <20260408052639.187149-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8325: Add software reset during probe
Message-Id: <177564972157.101848.7395395479165358647.b4-ty@b4>
Date: Wed, 08 Apr 2026 13:02:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1YyUQKrS6Jgi2V2vsvvvkZ/uJw01Zbzn31qRiqouNX4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pj+5ndOXsMXYrF3K4p5svBnjTZsvpys8bcK9
 uN5xoNdsriJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaY/gAKCRAk1otyXVSH
 0HtHB/9MAqdQ6+uJoGwlJ+w850rb+zj/Fd7JKPBTylmIew0DAeHjRNt2ipxODfDkJeTywm49Ve4
 x8dPcM6oVpooEhfltgWfMJM0ImXSZHEcRl48W0phcHrSFtD6AIu+pFnHKrJoEc3Wo7dpAFEUUTA
 U7vbdaG/InK/+H9YpzulOXHWfIZegDcJpknP3qkfLpZM5XxzdRtVBccF7NtjT2oKXdIkFEbErSq
 /d6AyD33bK4wzzuE+xu7DFcYFleO+AQ+JPvzLF1wZW2HMErnBv43BVM+xkwy+OiNr//j0HX3kwM
 ZbMBU++z4ZRyWthAlufP085xmY/XUMpVBvenf/zIVfPv32GO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Apr 2026 13:26:39 +0800, Neo Chang wrote:
> ASoC: nau8325: Add software reset during probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: nau8325: Add software reset during probe
      https://git.kernel.org/broonie/sound/c/f4c90fb761f6

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

