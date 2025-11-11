Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5614435CBA0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762895413; cv=none; b=M7wkW7NHGKC93UeqSIW1myAGluOQxXO3Bhm0qaFAt7eQzzRsw8ALF+rYEtgVCCx61VVsetgnBjd3zpTMrLhn00L2HzGn7rle6eYZObJtM48gTn95ljB3CxJnHK84nI2FwWgNpM6nEZ9NxLCXXCu82vu+gGjYkMz2wxUsSBXckXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762895413; c=relaxed/simple;
	bh=W/68ygwYQu3CVwigWaM6Sr5/MckTvpvknEwLOhxh4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=InLxXgC4+QzuUgRVMrw9SHTyPkdwwYzA4ax5FwoLGV6D62p4G2bH+1BcCriMjAbuD2dkh2c0uLq9fD9DAe9yKwcyFGkyOJc8Cjt3ENryuK8d090NG+OiWY+HHJzs4yi2dJgL9by4cfd+2/hvGllbkArwga2O0GBn4HSNDOxX0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mhac5XZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mhac5XZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBA7C113D0;
	Tue, 11 Nov 2025 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762895412;
	bh=W/68ygwYQu3CVwigWaM6Sr5/MckTvpvknEwLOhxh4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mhac5XZ9msdJ11BW+reQ4OMkR3UsF6LAJ8VBnU4aEOlpqu/StzJqagGwxMfkp7WOR
	 ao2WUtbvXU0lNgrKT22dIJIowiQ2z29OgfNenoLc12qfPHT5MDR/y8GUEf8/GM+z7t
	 dTNIvPWE03eK8yWmpD5y1yZkYFaKeCkbQW2UxJ3DODr4ikLYUXFTlmsLvsx4qL+nO4
	 mwf0PWIv7O9VuxdnK2V2RtNWY0zDA8uZD4W4YUpl9u7B4TqtKRSmAUdkfOhIR3kzvt
	 P6hFas5hsaU4EvXRQus4OXfnzw2nx3EY07t2mG44g2vIf8Xm2Vi84QcUAhvYQEC62X
	 QfFyBnGJ2Q8RQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20251111103512.244147-1-yung-chuan.liao@linux.intel.com>
References: <20251111103512.244147-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add quirk override support
Message-Id: <176289541150.189249.3558731923539662095.b4-ty@kernel.org>
Date: Tue, 11 Nov 2025 21:10:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Tue, 11 Nov 2025 18:35:12 +0800, Bard Liao wrote:
> adding quirk override support to configure different quirk configuration
> at runtime.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Add quirk override support
      commit: b3a5302484033331af37569f7277d00131694b57

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

