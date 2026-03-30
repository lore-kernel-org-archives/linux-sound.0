Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409103BBA1E;
	Mon, 30 Mar 2026 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910575; cv=none; b=tjnNEne2FJLMqlKzDrvy0fBsNKK8rPg6QWy36J81fA3vXReutvjvJB5vhxV0+jf1IlvS3fFMbiFi2aSj9jccA363cl6+tPhAMOjHY79roG2E5MlfFrqO8f5jMFiiRlk3NwUpFDG09t13vPPH27zDsy4hhcAJsDlzAGYJH8UTxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910575; c=relaxed/simple;
	bh=GqpzoDCFTJfoLnaHO7wXjnorLWXqzpoJWjBhaAG/Ka8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mhl3CLS8bLvtNUlmBpteT9+vshoZx6o+qng2zBFcNXpIc9gT3TWs6XcvYAo+fwq5mPd6UX92bPfKDBJeu1/GZmB5z85aYWNodgkSnqBg08o1jF1L+vNfn9JTetDqUS2rHlwjlUYVda+HupU12ShTGxei5gmnVY/g63sw+S9uZNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ7s+DEt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ7s+DEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8781DC2BCB2;
	Mon, 30 Mar 2026 22:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910574;
	bh=GqpzoDCFTJfoLnaHO7wXjnorLWXqzpoJWjBhaAG/Ka8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RQ7s+DEtVImbc6UC+lmIWawtOk8YclIx/J+CJPIjCIO/DbOVToD2p3l6L7y6VzXFS
	 Qe43Hkj31XIapeKVhjEPN+3w+UZN+2uKwmrL68a0v0QA8DHYj3uiUaeF5wnlplYfCB
	 lPSe9i/uVIqj5GsG/jPuRcZo6EUMhIkxbOhEuxtHrTUN/u8dNbe/BBA4Fl2hckc73G
	 bne7E1UjBEQqJN0BjKyMGiTYWOgUEUMTrxInF8X1SEz823qS58mK3x/0YCsWC8KScN
	 Z9dUN6ZB+2XCZkED58o9saKDOY8efKbW84RtzDrW5aAIYUESth21QxYthvq3iM8m3e
	 aT9tZuYmwyeeQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, superm1@kernel.org, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260330072431.3512358-1-Vijendar.Mukunda@amd.com>
References: <20260330072431.3512358-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] ASoC: amd: acp: update dmic_num logic for acp pdm
 dmic
Message-Id: <177489805339.241608.457985521728695060.b4-ty@b4>
Date: Mon, 30 Mar 2026 20:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GqpzoDCFTJfoLnaHO7wXjnorLWXqzpoJWjBhaAG/Ka8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxrvnKwYZKb/FYJByGw+1cECrBgjCaBtd8N3
 AYqJvA4B7yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8awAKCRAk1otyXVSH
 0J2CB/9y9dTQDHVYPXL12ZUub+LiJHmnIdvOPAzGLG+j0pWfXiNXXkw9YsNFO0DWYVPI7wvlvBP
 FRm83qZKYLPtl21q7po1fpNyo1O7JU8zj3KNaqr29hVyUmzRlfBIMF42wTvvxyw7vMBNtwL4uT3
 PpVbx9gJVYrG8VQWzNTr7Yce22MQ0kqg1PmSy1jy1KeHLQkpNw132GrlBQvVfWGEQ5DteaeimnJ
 fo4ADFQyA4B0aMUtwXFxh7sW2ocP3gcHTHchsdMPIi3UMzfgrq1/s9iP4bSHbD0/JPklKH3vhLr
 AhR4a8rSYwdJUM0i74g6w0zcWo131+SbENRZdVGvpNTxjne7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 30 Mar 2026 12:50:26 +0530, Vijendar Mukunda wrote:
> ASoC: amd: acp: update dmic_num logic for acp pdm dmic
> 
> This patch series updates the dmic_num logic for acp pdm dmic and
> renames the dmic component name in acp soundwire legacy machine driver.
> 
> Vijendar Mukunda (2):
>   ASoC: amd: acp: update dmic_num logic for acp pdm dmic
>   ASoC: amd: acp-sdw-legacy: rename the dmic component name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: amd: acp: update dmic_num logic for acp pdm dmic
      https://git.kernel.org/broonie/sound/c/5902e1f3c501
[2/2] ASoC: amd: acp-sdw-legacy: rename the dmic component name
      https://git.kernel.org/broonie/sound/c/371f6a1d2a97

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

