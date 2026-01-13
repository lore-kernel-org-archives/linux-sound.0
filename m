Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A8B35B12B;
	Tue, 13 Jan 2026 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305305; cv=none; b=r+FndR9BTM1Ytaw671wgsQpEMZP7R9ksv3ECG4E8/CYV9WEd7E3wc/VQLTjaYEWPuCyxCdxCVOt4ONl4XvGwoIVU280f99+7EMxCHuz/gro1ePdlah7FWiBt+GbBtNnqZyoi3MlqfobSuDYuGrhDAOuVz5B0NcIWJbHAJWpD3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305305; c=relaxed/simple;
	bh=oF1v6/lszOahvJxtjXIH9MtYyYVYxwF5DZZbX1G5X/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hdTKtKN3A/IfpR1ursJNqQuu1jOgFs5/xAoeh7kBrps+CMpvD3CAJnNg40apKykKYOPiFzuPnveFxdOLQkea20t10NBejt0ZLJ5Skqp/veO4Pzh+5PLD5oeJrrXjf1e1Se+fY2p342h4hW8g3nnoV2mueTTcZmPt1EfdGfZg0lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlJ+U9fW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlJ+U9fW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027E4C19424;
	Tue, 13 Jan 2026 11:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305305;
	bh=oF1v6/lszOahvJxtjXIH9MtYyYVYxwF5DZZbX1G5X/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tlJ+U9fWoqLAu0PZYP1F6SF2nzsdXJqBskrYPDSNwY6FiYrgnKGkm9eHGdU30kZhS
	 +rREQk5KBLRocAUD5p8168xYxmZAwCPHeWaop+RJNtvZ5UN1k4VtsgFQ7Q7z9El5Xo
	 ySrSP2hYWq9aJR6YEmdUvi/ZRsqo8EUe8650kRSgkdjuvP28tjdBk0ZevYBdq65/4Z
	 jkUPnjJlgMYE5kSmkdf+BcosSgbJeA2ou1AIPgWUZ0EGbKjN6lj58LMFtxnrtWXfqF
	 CUBD9l41tmauPNFtZ59s39StLX5F5g8m66BAEjQ+K+hIjMzNpsWeJkCOOKLPHBtrVc
	 1ma8BoSqNLEtA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20251228190542.2482910-1-rdunlap@infradead.org>
References: <20251228190542.2482910-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: amd: drop unused Kconfig symbols
Message-Id: <176830530374.30686.15801293026413068293.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:55:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sun, 28 Dec 2025 11:05:42 -0800, Randy Dunlap wrote:
> Remove the dangling Kconfig references to CLK_FIXED_FCH since they
> are not used anywhere else in the kernel source tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: drop unused Kconfig symbols
      commit: 0bef51df7cf882e2b4ec0f7d52c311b09c850b9a

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

