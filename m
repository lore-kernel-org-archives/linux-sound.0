Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9C84C3D4
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707425789; cv=none; b=Q2aW3E7GJBtIcaO6nbXxtXJD5zJL74ib1eTEa1zoUAks5sUAinjZwL/IYH2w0hipRzv+GCUUAFmP7zVXY55FoX0dWUuBAMPh3OprrJb/d+qPqWp7aDPG+NuIC7E26otKWhqljL3oeXG60awR0z1GqcsntT3KJlEDpBzwZPO4TEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707425789; c=relaxed/simple;
	bh=c4MBkbTMeZx0zTdqw1Ny9GkiiubPJWD6N2b0zTixMJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B3a99a9IPuv9flyH/g26EidAwGxok+JO6XnYkoumt2W2gtHKBb8oXRVaEnkD9wFymakb23tZF8Yj11eWMTmP8vOhCUzIhav6SCwiBp2MsgbrL0TXu88Bmf/MqNyJWoqRuDLXdMybbZJCxLKiWEYdJ2+Lplzm0C1LZUZlyuq/W3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEgchDKe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEgchDKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E8AC433F1;
	Thu,  8 Feb 2024 20:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707425788;
	bh=c4MBkbTMeZx0zTdqw1Ny9GkiiubPJWD6N2b0zTixMJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aEgchDKebHBI8qvnEprptRXS8WfUu2ujwTpk1LhtzsW34HLr1fI5cpkb8vyzvLLw9
	 zLp0Xlh4qM/mPTZ3BBwXcStG3AknaTg+pQnnkSTuz80inAFLIx77lI0QdMIXVqqpjT
	 W5qJ5leh8GMhzQo0UaUO4J5uZDh2IXRgQDJ+PbaBlYrHFb74n5ltIbxycIqIcWpqlO
	 xletU0wSxzBuJlHHfZfieSpyTYcWvqINyHlca+oWXVbefoYByGkA4pIAbGmXu262qg
	 o5Dm9nNf0SMDOARmpVyhFXy+mMzs6zizm/si+nzaEwhBtIWYnck+Hc660ZVVZV46s7
	 DHVqSjiagiY5A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
In-Reply-To: <20240208133432.1688-1-peter.ujfalusi@linux.intel.com>
References: <20240208133432.1688-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-topology: Fix pipeline tear down logic
Message-Id: <170742578669.2206785.14742293801368885196.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 20:56:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Thu, 08 Feb 2024 15:34:32 +0200, Peter Ujfalusi wrote:
> With the change in the widget free logic to power down the cores only
> when the scheduler widgets are freed, we need to ensure that the
> scheduler widget is freed only after all the widgets associated with the
> scheduler are freed. This is to ensure that the secondary core that the
> scheduler is scheduled to run on is kept powered on until all widgets
> that need them are in use. While this works well for dynamic pipelines,
> in the case of static pipelines the current logic does not take this into
> account and frees all widgets in the order they occur in the
> widget_list. So, modify this to ensure that the scheduler widgets are freed
> only after all other types of widgets in the widget_list are freed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Fix pipeline tear down logic
      commit: d7332c4a4f1a7d16f054c6357fb65c597b6a86a7

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

