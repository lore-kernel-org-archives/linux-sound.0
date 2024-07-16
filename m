Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E89199E92
	for <linux-sound@vger.kernel.org>; Tue, 16 Jul 2024 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141145; cv=none; b=r9t+UYE/m0QFFvotG9FfZK+2ox4kiHuOxxhmokYpWApU2nnLyWop4flfB1+ruHdRyGJSKbfTApIS4Yu7aQql94o4kEnd8zb6iV7pZzPEof5GPRst4sTNLFoDa7NzW3KdoXf2yfLzhpLXqyde5X8MaNhI2cdY6i6WV97RT063BPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141145; c=relaxed/simple;
	bh=RjRpkJFPLTVtr7FF7jRiRNR6NNoZv16lBsE1D8s+HyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ajyD48zTviA683+V8yivljh9+1A7S3TjVTHwd5y3Z3ULp3Mjkjy1ZRwIouZRKYLeaP1owtJBGrYSEF6FCadAYU7LbrZRbzU3kkAskv+f8bA6F41sn/FvBJiwvMcRSaasVYffrBAHBgr/WYod3l/D3G59mp4uyPCS/nm13fQjOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sj+axYiS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sj+axYiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FEAC116B1;
	Tue, 16 Jul 2024 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721141144;
	bh=RjRpkJFPLTVtr7FF7jRiRNR6NNoZv16lBsE1D8s+HyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sj+axYiSmlSi+MkvpWpxTS1N8uxL9VMoiU8AcXl4XS7m2ab9LYR1068jHGefOaONN
	 BDhKLU341oD3jKQMrZjYiA/i4tXrewK0dARKfSkdiSVB14kiFN5E5NZ1GmYlS+owvB
	 UGqQ26Yp1LpMscUU32E716f7CsNMhLKUzEiyvu5vnxECh/ztJoYmivaIRih+NrxZnu
	 mZ9WMpi1lWytxJCAlZJ0BaJqNaHxdhJ6KIzXgbU8qVXcZge/SKlpPtW0a8iB9V643y
	 akJlnLVOOImx+IdeJS3bVEOi7OBboG/cRlnXNFqGWlhQoAjmtinnlKEvi/d36GtnBN
	 UtCkiHaY9kCog==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Curtis Malainey <cujomalainey@chromium.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240716084012.299257-1-pierre-louis.bossart@linux.intel.com>
References: <20240716084012.299257-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Fix RT5650 SSP lookup
Message-Id: <172114114300.56252.16479559406586120577.b4-ty@kernel.org>
Date: Tue, 16 Jul 2024 15:45:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 16 Jul 2024 10:40:12 +0200, Pierre-Louis Bossart wrote:
> Commit 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for
> sof_card_private initialization") migrated the pin assignment in the
> context struct up to soc-acpi-intel-ssp-common.c. This uses a lookup
> table to see if a device has a amp/codec before assigning the pin. The
> issue here arises when combination parts that serve both (with 2 ports)
> are used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Fix RT5650 SSP lookup
      commit: 6f6a23d42bdfbbfe1b41a23e2c78319a0cc65db3

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

