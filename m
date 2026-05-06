Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648EA46AF0F;
	Wed,  6 May 2026 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076480; cv=none; b=BeWBh1SMROETjWXR9JNJd4aG1/tzvz87sH34r2D9i8u+7EkOQVqyE3tV7lCXOZiDcraBABpBAwnda8upC37J6SEUxNNoxky76kwFyhD8Yj0Xj9VNuJhIy/GF9YIpciRLtamPywsyDwiIkbwOm4dm0pdjhL8TvLKKCvpyLsY9llA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076480; c=relaxed/simple;
	bh=H+HfN7ujzTQGYKd6Cz298VWZI0mcKpDMIqxi3eB1jcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V3k9jahmrehZMrTmmJjCmAlK9/uRtzOqspk1quDp0dZe4rBQVIlE1W4ZBXTMr1H10J6VWmXyYnJcdSi+1XQP2Z1O3K9jxzei/jzDXTnr4TMLs69DSiThd55Y5QuhywJzCnT8QcvQv2nV8e0v8gzoHWX7ILxSDXIJ3rGjOpPKGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQsdU3Oz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQsdU3Oz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F8CC2BCF4;
	Wed,  6 May 2026 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778076480;
	bh=H+HfN7ujzTQGYKd6Cz298VWZI0mcKpDMIqxi3eB1jcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TQsdU3Oznk+h54k2a4ypoGoUElxumRexK4R02A9lw+1fXibM+DiUzyYHoDR8+Y+0F
	 lbXgTOHMtinpGyjTcL2+kdaNaypSvS2sgbMstQTTWSwGXhnw0KCfTetp1nAvftIzQ4
	 gTsIcan+2J6hAfN+SolCv4TgWAAKOemUjh/hSYICCz9DQxUHrl5rdKEnnFKLNxgBPU
	 P6t4NeIPcBHepwk3s1vxvrVgaI+fzW8x9DZeMMod6fmZbJeF2D0YHWLLIVbiPZSjW3
	 Gsfs+NduGee8lyy18RbNocnNJYv0uBEWL6TJVPnYYlMgjI3TC9W3iqN0DmFx59NDQv
	 95OtV08Gos7tw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260505161124.3621000-1-rf@opensource.cirrus.com>
References: <20260505161124.3621000-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: cs35l56: Fixes for driver cleanup
Message-Id: <177807017701.624351.307607727304147728.b4-ty@b4>
Date: Wed, 06 May 2026 21:22:57 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H+HfN7ujzTQGYKd6Cz298VWZI0mcKpDMIqxi3eB1jcs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+0s+jwsYDNJ0PNXVEOg4wijEBxVtWdBbP+PAK
 J2QxTkxN+mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaftLPgAKCRAk1otyXVSH
 0OLeB/9YRfG8kEpjmNw7IiS2ux5aghLmL7qeyaZlg7f1xVAWafMI/edf7cXB9ZBoPSqmrbAsMYk
 I3Ia9eXDC+iCRPc2Rq0WbJmfmede/huTrBDCFB5rDdakwFFvKsLQlLlKDYDoJubaIsMLLEb5gus
 7VIQI0YzHVLe7xDNfR0GFRmYFIou77EPN30LTHztMao7sLpvSrQHlSJnD14+soUh7EiEJteWs2W
 nfuafFlz7Lrls/8NjrSP4wYqGFadAgiP8J0i0D73OWB437khmkod5Uf2YaC2GWCZsa0exl6CHhX
 hUSKV5jYmDA00ay/I+IaO//3KR3CpYsPrTYfeCw86p5bYMKY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 17:11:22 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fixes for driver cleanup
> 
> Two patches to fix cleanup during driver remove() and the error path
> of probe().
> 
> The main purpose is to fix cleanup of the workqueue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: cs35l56: Don't use devres to unregister component
      https://git.kernel.org/broonie/sound/c/bee87cf0f124
[2/2] ASoC: cs35l56: Destroy workqueue in probe error path
      https://git.kernel.org/broonie/sound/c/fd4d83e1437d

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

