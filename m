Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB85B1D5AB9
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730830515; cv=none; b=bKz48IAhY3JzSauXJCdjlSe3gP/nKd6DDQNWF1zhYDwOFkMy1k56/94U/I+nxPJh/Ozq1v7SZUdEoTH8e8uW2vyhr+6UOvsbyG90IuPaSQafHTyzhSPBvfjexOTIvq53+XrQvKP0NPX2Lg2D0H6rRrs/qqKYuhNgV56nCKFGK0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730830515; c=relaxed/simple;
	bh=WsuzBocIubI2t2RizA0h7s/vXJbLgUM2sP+FKYy+X0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NjlpNirGiqQDWrKtTYyiyBI9TBlcn1qDpqlL3BlK5QmMiSWBhhl73n3Rmdzragvp+CaeQZV4+NNf1DX60elUjrfbBLQgay9KXuq2Dpg50s8+ujXfeqZxjcPNhSGBR7zWa4HrJkRn+djPuOK7zFIsePw7deH1E0erl1eALpr1Jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNH4KxOD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNH4KxOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9B1C4CECF;
	Tue,  5 Nov 2024 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830515;
	bh=WsuzBocIubI2t2RizA0h7s/vXJbLgUM2sP+FKYy+X0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KNH4KxODYUL5MSIvWC7SQQTSFYqEYZaPHARYb6/EG7RuxGwq7DvVQqEi65C8lwYaA
	 F9jJZu+h8DsSj6mz/IBDfLR2DrnqExGZU7aVDISAqm1Eo0ZRMGEbHGMkaInAmoP1Kb
	 l/nYm7pDWPT5Fs4lnWSVEosWAK0fztyrgKv/pmeQpd+lfOXYrkg0aUA6h2nwnSsi++
	 bO1lYqlCWOJG4PEU+rufnkMc8vKP1kDVM8iuXGPwsx0+q1z5Bxn4Ae/pt2QzMf2uMB
	 NtX+nwYNcr0aLE8Jm3hBsIBtZ8Cdq0T7zjxP1DVwquTU9uF3XdUFsqP9UcEAYkwBAT
	 y1i1iblG8iMjw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, deep_harsora@dell.com
In-Reply-To: <20241105111057.182076-1-yung-chuan.liao@linux.intel.com>
References: <20241105111057.182076-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add missing quirks from some new
 Dell
Message-Id: <173083051391.94172.4242002677659899261.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 18:15:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 05 Nov 2024 19:10:56 +0800, Bard Liao wrote:
> Add missing quirks for some new Dell laptops using cs42l43's speaker
> outputs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add missing quirks from some new Dell
      commit: af23d38caae5841bd7aa754a7e7205ab719f568d

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

