Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2615FD1D
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092509; cv=none; b=ltQaD3KIRXvMwMmK3sSBiLu3w6mbxD+Zo4x7vXgukC4pEhcMf/q9drw1lCSIpJmKOvCJ18QUYvipae1G/8gsOSkVtjBMCKujt2VB5BprMPGTrCKWkjsYQFUCOAP3vBSXNn1238dSJkHD5X8e1if+/lrEDPpaABJVKSb5fFfk1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092509; c=relaxed/simple;
	bh=3AZkPRrRshY93Q6JptuwVd5oSxqFvcglCxVwlhrT5zQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fscfD9VGhJAtMUQBhZUz1xH76+GLPSWCMt1H0vnZm1LqQtgaMwz3HjGIETykLb0czaxJCGWdcFrtuF2OENcDfNEo/vCBXyrjRDMsO4CXH9xmrMkrAEMZC/ekkNTSmTa/dDtGmK+9WE8rJs2Zn4anqB79kKuKCCtSCrJTEAJxzao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+G9Ej0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+G9Ej0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57BDC4AF67;
	Tue,  7 May 2024 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092509;
	bh=3AZkPRrRshY93Q6JptuwVd5oSxqFvcglCxVwlhrT5zQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G+G9Ej0GUDMbx8En+DsBZ6tKZztNh3L2Zko9I+4aPB15k0Ikcl2VZ94nFkuDtk9sr
	 GkMXmTMpjP/NxaaE+ceqJPFH6xX3q9tqHgQ1/buqO42jyBRm4eksWT26UmWZqU4YuO
	 cVOrZ4QMjGcm6SqRAq+QJ0HGqSsZqmQLprpvP8z5r6i0/3mKFu8vtWoAP+gge0LYJQ
	 1xhoHqI1qPLoH5NyVpzUzWQ3+5nmG3c7AptJf1P1ihWNqEKTijjqiaIb6jYkn1V4C0
	 TBxB5yp2VNoQxvjXYB2960/7apx38R5IQdwDiAsl+U2AVK00n3GIl+euIaA/KX7p9k
	 obDUYgQE+spOw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/9] ALSA/ASoC: Intel: clarify Copyright
 information
Message-Id: <171509250762.1985791.12584556363311325143.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:35:07 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 03 May 2024 09:03:50 -0500, Pierre-Louis Bossart wrote:
> This patchset does not change any functionality. It only clarifies the
> Copyright information in ASoC/HDAudio contributions, where an "All
> rights reserved" notice was mistakenly added in a number of files over
> the years, likely due to copy/paste. The Intel template never included
> this statement.
> 
> I chose to group all these patches together, they could be merged with
> either of the ALSA or the ASoC tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Intel: clarify Copyright information
      commit: 293ad28116e2c3e4d3eb28bd0378558edc897f55
[2/9] ASoC: Intel: boards: clarify Copyright information
      commit: 0e0440535de8e7c5c0ae0bd469b6ae184f9c732c
[3/9] ASoC: Intel: common: clarify Copyright information
      commit: 5cf4ffa4113da2e797c8281bac2838d29f5a03bf
[4/9] ASoC: codecs: Intel: clarify Copyright information
      commit: 884077bd7110db61eddff086f9ab7f2c6748d169
[5/9] ASoC: Intel: catpt: clarify Copyright information
      commit: 618ae0d7e740d212044ba25d0f1013374eda448a
[6/9] ASoC: Intel: avs: clarify Copyright information
      commit: 94001147a09ffeaf0657db7c189af77cda427f30
[7/9] ASoC: soc-topology-test: clarify Copyright information
      commit: 83e495d7b29b663861c68a1ad77710b6315472ad

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

