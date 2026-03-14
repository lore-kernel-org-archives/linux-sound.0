Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82072D94B4
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625078; cv=none; b=sjYin3wYr6JCqvC6ZKt3wxHH7ekAj60h5BJGsl8GFOwb3Q5dUoa0PhyCWKbCkFM00MIVj6zGxCLXAG1GBHbMsgZvBXyLMc8CuTjtT9yd61q+GuXhpwt0+cgxfXFMIclCzpS6gPFSnPTEjqDFP0Fo3itqPadkylRNPtCUFtStVmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625078; c=relaxed/simple;
	bh=NanFKkiAIvOb4TFwXsZZtlDAaIsmGeozkOmuxjpEevE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d10n1xMrQtlyizUKJSJI5sOfOwsWd/88ZjSB7gQW6DiVDPk3eogQtqD/OynLTluNIvWZGWnC7iVBvxY5yKTezP+iqfZ4e0CBKhtR08Ee2THkLmPUMT41O+h7SqMEHHSIAorr2G7kozRB33sbVaJoG9hlIePFYE+QeKirB6lwfdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6EYk4Yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6EYk4Yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F15C4CEF7;
	Mon, 16 Mar 2026 01:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625078;
	bh=NanFKkiAIvOb4TFwXsZZtlDAaIsmGeozkOmuxjpEevE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N6EYk4YgZcVp/Zazv2F54iBx1A9WSkfLFrVRSEixkMiGHVW2Mg5kwxzqc2VY8shqD
	 P+gttbHNSbhNKmpkXCtTEFd2Y6QJCGdkebAQWrzf7Islbb8RzeIrA1bik4OSJGdbIB
	 gLU3PWUk/wnrMenBd7O+UkR7FTluEDqSXFYIEuZBDhzAuSz2SjvlOSyFmopk9K3zKV
	 0OT6vIuYsRqup5O+ORZqGwGDKPngIHbDJNRgr8jdiAx471VL+/W549XZX8bfEhmOnw
	 4JvBjNaQIphOkXU6LYoqpLpvumV3nHfOw0Z0sHs8ZnAzdLEKn3fwRa8/7N+Kyh1JFG
	 DaBsbRiW2Za7w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, Casey Connolly <casey.connolly@linaro.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260306174707.283071-2-casey.connolly@linaro.org>
References: <20260306174707.283071-2-casey.connolly@linaro.org>
Subject: Re: [PATCH] ASoC: detect empty DMI strings
Message-Id: <177352554283.149922.15557067667103028581.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:59:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NanFKkiAIvOb4TFwXsZZtlDAaIsmGeozkOmuxjpEevE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt17z/ypyFBpqIToGrDqDOr8Gra0HseN0zoDse
 8pU8th/4qKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabde8wAKCRAk1otyXVSH
 0PmiB/45rY/QWhebJlJx+XGq5987QhQ8n7x1WOuL9mLGtSmt1v9uu7MRpzu4uj7LkSnXp9v/o5W
 nxkHHUVgE4qTYPFKKFFqxYBVHCiywSQHShcCh7ncOLyBeitr4mRd8Hu+PIxdoIICCZrTyJHSTNN
 gh5TAs8O3sgmF0MIuc8Gt3ZgcR/b93p24TWuXf0zFlMe/Aafs1gHHEtXYiEHPPnZ0ZW0G8Cbc0s
 /VAQnlrij6M78Ny+gGsLmpIutS/HGOUc2NOqlfM7Wa3Jbp1KsLHYpnjP2rncn+7NAFAWYQ5c4Jh
 pNzpMhN6sMzfpIVysfM7FeUO2snxgJGn/MWNhbhLm5M0hmZq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Mar 2026 18:47:07 +0100, Casey Connolly wrote:
> ASoC: detect empty DMI strings

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: detect empty DMI strings
      https://git.kernel.org/broonie/misc/c/a9683730e8b1

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

