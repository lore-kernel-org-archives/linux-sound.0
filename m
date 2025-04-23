Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B428B50C
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429366; cv=none; b=trNftDfliB5IQsEMPFYalalZk9pwxPgz+QHwGmZNQQ6GotGHJZxqsWLrDIAmhnxFUkeqHf6zFvD1lWJ7l9jNr8R9yhqz5C+LnX9kZTdOPLdMwonlpu+ST3FDugpahMtSzlGTvH794AaPoQzoC2QE+px9hS5QWMhfaUvfiw4jct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429366; c=relaxed/simple;
	bh=gXzjSWRkBICuJ97ne1vNFk0ZoXX0OFJ8iDz7+iGmURs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hbpGSoVaV1Zt7UZcsatzdsgTzJwqLRCQTI6mTL5YbEuPvgCFpwCEEintsvUVpqRxrFr7M4EpJxZkKe9lQ+3Ui15Vd8XTsDRY+hWePhtcWg/QwR02+rbmWc7veHPLv/n4aVSrrhcJqE+sqSg8fYMeQ8BR4058n0I22H58pVIcYn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yq3+qfHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yq3+qfHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A56EC4CEE2;
	Wed, 23 Apr 2025 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745429366;
	bh=gXzjSWRkBICuJ97ne1vNFk0ZoXX0OFJ8iDz7+iGmURs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yq3+qfHoIULgsX3/KA8kXu5DGJ18kCMkbuLgxFzkflO7NL6rhdEz6nKLzpzHlWNfI
	 +IrB3x5G2q5od3OWPUCIyAAYgVAPhrE7lVj41609UTn15RjyqcgVVXNs7P1QWihhph
	 +0JS2G2Dpb3zm1H7nzOE5tW593IiJNfzmyoZOD9rwoIoR8e6q+/0JPHJQ+x2HWcqOx
	 dN30LD45OgT5F06w+/UXMHvJUQbJzyEqJqdqJNqBisGcPGL4Fpf3TIBbzXCpDnUwtQ
	 tRdo1AfBWyhXA1fO/gN2eg7Lft9TFyB+e878BKoD01eah/9A0siA/Ki9O5rmLnf2+u
	 zpCnx+lb7HszQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20250423055722.6920-1-yung-chuan.liao@linux.intel.com>
References: <20250423055722.6920-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-acpi-intel-ptl-match: add empty item to
 ptl_cs42l43_l3[]
Message-Id: <174542936509.938066.7349866136834674868.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 18:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 23 Apr 2025 13:57:22 +0800, Bard Liao wrote:
> An empty item is required to terminate the look up loop.
> 
> Fixes: ac5b4a24f16f ("ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-acpi-intel-ptl-match: add empty item to ptl_cs42l43_l3[]
      commit: da6d7db8b1620521d093a973a0110898f6585ff9

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

