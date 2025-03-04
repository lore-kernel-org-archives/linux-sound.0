Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DAC20459C
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741091632; cv=none; b=Q5cXvCeqgdYyxkD2doesCumEgvTygZrMGb2Bc1E9LaTInz8C9W+CLA8vMreMOQepBW5ejXArHRHEJfAcXdRkPxegTYA02RwoPUC4aWptE9/CDyhzG3xgYmrVkomjZOzSGR5VbaVyz1a+dJ/oz18n2sM45gq4CopBTDc2t/w6GI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741091632; c=relaxed/simple;
	bh=7UMOiOc34dn65R7OKnRMJciolX/oG5hBC2JynSPZq6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tDKE31Bt8IwWW6feiT7vTtyrb9BeZ9RvUrBH5c89l3HMbAKrjAgNAhz0Olkr0+S4oWQBseZP47SujeT2eAlDSeld6lEXeAl64TaGmIGS2cwu39pJ5Yq03IMceSfaAo46WEHiZ0pMT6NELlrCQ8zgiQ16zBpZjvE2u4RLlNCxXl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRM0dihJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRM0dihJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDF3C4CEE7;
	Tue,  4 Mar 2025 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091631;
	bh=7UMOiOc34dn65R7OKnRMJciolX/oG5hBC2JynSPZq6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XRM0dihJjAg1+gP7fbTkBDuTGuaVzGCOnAk5TSFD1YAcWEdEJ4ZfoBpHgJ8tJxG0K
	 SUQmJ9g7NwxwjzLCmr7Om6sdVFVJcvswf41joSW00IXObst+qldaWMdU8R9zPEyBjK
	 vvjZJkqwFwsidxAtmC8Rwpq3jlbXirH8zPrDYk5JS1bkUmLeUWRGEojn7ZbOuY/0ZP
	 JNCxDQlfJi2LW2YL4VwDzcLAr5qcjkCWPORTJyv+swVbHG82Al2UbP948VT24Fiot5
	 ceM7Rs5Zp/Uc1xyGRbKz2js71UZmwXEG7EwvZPDZyW1FTX/opfI6HCQbKQQMgyHlKp
	 BN570RZ+An6Mg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250303065552.78328-1-yung-chuan.liao@linux.intel.com>
References: <20250303065552.78328-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Fix unlikely uninitialized
 variable use in create_sdw_dailinks()
Message-Id: <174109163064.25452.334539203885204913.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 12:33:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Mar 2025 14:55:52 +0800, Bard Liao wrote:
> Initialize current_be_id to 0 to handle the unlikely case when there are
> no devices connected to a DAI.
> In this case create_sdw_dailink() would return without touching the passed
> pointer to current_be_id.
> 
> Found by gcc -fanalyzer
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
      commit: 4363f02a39e25e80e68039b4323c570b0848ec66

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

