Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC238B7BD
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940180; cv=none; b=nEv2IKw2ylKLmehvdy87ExXp1PDCOniNOyRcl/C/qFUwsd6kXhCIHLOHWTDVaXG6LH63HkRwU8KhLipQuhb7enMk9AYu6eZz9ICl8lYXmbJn40Bxmlk3BxePz5joAaZpF/j0OSTNEWTMNKGfrY7+Zw8t3GWwmS7K3TtpWfXm+3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940180; c=relaxed/simple;
	bh=pO8WtoMl/CilB3Ax18/PcN+Uq3vb0Fkl6JeJNs6FF7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Taeqcy+BJeaKDSMP2x0u0DIHgwaiw4PvbfaigV+WELO7CgngV8QFeWgeTnxngh+offrnCvlSTnhYhTeJnfgZRRXXbrc9no4QggWRDiScueJ3c0VPUAokFQ6E8FzDyTKWPlp3z+wXWg9JblIQXhqvVEdXjM5c9KRM3Ovt8a2j9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTVAQcQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTVAQcQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B43C16AAE;
	Tue, 20 Jan 2026 20:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768940178;
	bh=pO8WtoMl/CilB3Ax18/PcN+Uq3vb0Fkl6JeJNs6FF7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FTVAQcQeY1buMg+fJeiPgDT2wMgySY6jtN3HmWYS8fdf7x78/685xpoaFG2Mej3qg
	 9haZL+/U6UyL/i9rkNdzI3fuPodjVe0kh2a/twbWNNeA34Fb02ZsYO2+UkBFnhrHo/
	 wao7asW7HiOq17KKZjtUAMW6MZfQP3+i3oF3uFThK424QfetF0YyFPFAxPLTO2/k4A
	 phJB2UUahSPV2vGuk/7JYnkLAXjTHuxAPLErZ6xNElSXKtFRz8zGW90+iHuUsMg5lc
	 kV2ztER+2fDuCLQJWJdoleMwjot4nPltP+id7cIT6mTmQVMXdDbxZ+mcy6eUm+cuAG
	 SQZtzfPgb3v6A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
References: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: soc-acpi-intel-arl/ptl-match: use aggregated
 endpoint in rt722 configures
Message-Id: <176894017719.787825.17574510963860154835.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 20:16:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 19 Jan 2026 17:17:47 +0800, Bard Liao wrote:
> When rt722 work with other amps, the rt722 amp endpoint is aggregated.
> Set .aggregated = 1 to represent the fact and avoid unexpected issue.
> 
> Bard Liao (2):
>   ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to
>     aggregated
>   ASoC: soc-acpi-intel-ptl-match: use aggregated endpoint in
>     ptl_rt722_l0_rt1320_l23
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to aggregated
      commit: 08c09899960118ffb01417242e659eb6cc067d6a
[2/2] ASoC: soc-acpi-intel-ptl-match: use aggregated endpoint in ptl_rt722_l0_rt1320_l23
      commit: 4fbd3b2ec04dc6ef93090ec24733a5c5671fb71f

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

