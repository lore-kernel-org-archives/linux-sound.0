Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6BA3451CF;
	Tue, 24 Mar 2026 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381453; cv=none; b=QHd86smJs+kV3o9pz7ssPQp3HpR9pBCHEY9yox5n6xkkuv89o3th4grfOasWX0gBBUoUYDrfmxAppmhtRm3oiSHKspx+vIuThp/iPlk6UPTyLAStg02DHJoYTLfqSQzTHGn0Fdk30u+BtLqKSSU5bABi9yBSmz80nptNiyCDzEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381453; c=relaxed/simple;
	bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uESouTD0V2ftmfQQYc5D8Vna/adFLAwSLLyKs+5ajitGDrN76r8tf1U9HTUPV6RjMLHsFCd6W86z0tcs9DFo+FmZ1v2Jn+4cBPyc102MzDUkDgt/Nsw6WdfmJDQtWy7MFoFW5pO6bkUY8qL4EAzZZIM2RUpA2I6IerAizqfMuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arziCHdE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arziCHdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26723C2BCB1;
	Tue, 24 Mar 2026 19:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381453;
	bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=arziCHdE1NM/Gy9crGNG7EEgv2FMpcFZIO4abbT+YWJj+HU1tqEHcrSTx+WSmC1UC
	 VJJrPh72PUwadrlL6ZagpMVKh6avIAXhgSuLazTlf0zw6eT5XXca547HsEvCwO5yLs
	 GxJBu9BnDp2lOll/Dtb8tcwb+EVb8lowGO4L76ldkInJTGRpE4CZ/SLo12UBQTrpWh
	 oRIVWBWT6udtulx2JvyAiSqfQDdLsT8sF38BjT186AX5r95aoNH52vZcgzAggQ5wNY
	 SyBjuPebkNnlsJYgjRSmCtqDSxDoSfIpqDpORNrtrc61A/txyIzcQCCgj5TDpspwUc
	 IqmHP6TQdWjag==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lgirdwood@gmail.com, krzk+dt@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible
 string in stm32h7-sai match
Message-Id: <177435712084.80116.5302380668283249517.b4-ty@b4>
Date: Tue, 24 Mar 2026 12:58:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=broonie@kernel.org;
 h=from:subject:message-id; bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumKdqUnr28hTL5soqDMs+G6Rv0vwemjk3MdZ
 6pYqlb7Wu6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpigAKCRAk1otyXVSH
 0IvqB/9D5tShr/o1I2myc+UJ63dP7OyphYGaE1zN3aptMeKDcvAVsBE/xXuVYn4kb7jZyn7i/YK
 6z4wA3la+lr/ye1loftr0T85d0CGjZJFjz3vRGcLmNk4N5LMeyOm0F74kGn++skaK46qOJustqK
 utK4ZQU+Jk/qhH463CQA58v188a8ZYJueoJ9/7Ui5orpLejlZR8jGNxIJt0lCVTrw7YHT0pN9On
 eu9+3kIHPT9nL4gJtvWjOmuAw049QYDVYz/BH5LpWZZ0BaMjm3sTAQxFFqmwPPQnnR0UfF0qw3B
 64aRhp0qVp5vWYYfA6jmr9IX19juUTvnWpM29cRLdQybJR08
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Mar 2026 02:20:11 +0100, Jihed Chaibi wrote:
> ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
      https://git.kernel.org/broonie/sound/c/91049ec2e183

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

