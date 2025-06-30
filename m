Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558E260569
	for <linux-sound@vger.kernel.org>; Mon, 30 Jun 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283619; cv=none; b=KBK9ChxVbpsmeH3o6gU8q1sIZ/bP9zoWidrsZgR8xdiID/kLdkKrimJBGd2xp+Z3vKAv3GLoMVVdLmeAJ+B4ZUA46hQZNaBZ1gD0nmpID0tPdHEu2FNVpx1ONCWn36cw+oKRVFgGRTLhvsHHo/GnHjoxoMy8vVxjFwGJae+t2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283619; c=relaxed/simple;
	bh=XC3ldNKcOxfWyWKwdYSv0rAcJKiaqXOK7eFpNxRJTXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bFmgXOYQr36jFYld/BxZ/RSJtktREaboIdASz8NnLdxTVdEM8e0FH84sXJXyD6wfvye7E09NAExUwJ+TMYVgQl8IpRnzSdS31sV3b0r4jK+qzDhn5/Z/TCe8IyLhzxf5Kf5lKzm7ODLmvHr5S70a08eDpdE/tn9E0t7MG6KupyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLURDsYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLURDsYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219EAC4CEE3;
	Mon, 30 Jun 2025 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283619;
	bh=XC3ldNKcOxfWyWKwdYSv0rAcJKiaqXOK7eFpNxRJTXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MLURDsYPuayGmKsWgBOiqy8j7cq5N8wbT/Xq/WOTXXBh59NBadYVIdgR7xQNVEhO5
	 j1XxYYqy4iXz02Dy4wNGVMgP7xO2e98SoZv2CPI2TksiNYrRqvxfSyHpC0pzIYCuQB
	 8uqb09elQ8bnhMOSIhxlV7+Z8VVNxY+Np5hDlgR9Ex+8kVR2nHA4LIjIOggv/6WCZS
	 56NxnikIrBcZmyVyW06/wtvdQiJxQnUi9pNVOciSY/aN0ZmGuWe0nTgefjGu9SHLSA
	 ss/tHSTDyGI34cUYekHsM27S7HJ7oPV2Qci/Wuw9CNIS35La/dk1rxW0A3TXAXQkte
	 0Hhnz/A29ECkA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250626064420.450334-1-yung-chuan.liao@linux.intel.com>
References: <20250626064420.450334-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: SND_SOC_INTEL_SOF_BOARD_HELPERS select
 SND_SOC_ACPI_INTEL_MATCH
Message-Id: <175128361787.28563.3411011118074157634.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 26 Jun 2025 14:44:20 +0800, Bard Liao wrote:
> The helpers that are provided by SND_SOC_ACPI_INTEL_MATCH
> (soc-acpi-intel-ssp-common) are used in SND_SOC_INTEL_SOF_BOARD_HELPERS
> (sof_board_helpers).
> SND_SOC_ACPI_INTEL_MATCH is selected by machine drivers. When
> skl_hda_dsp_generic uses the board helpers, it select
> SND_SOC_INTEL_SOF_BOARD_HELPERS only but not SND_SOC_ACPI_INTEL_MATCH
> which initroduce the undefined symbol errors. However, it makes more
> sense that SND_SOC_INTEL_SOF_BOARD_HELPERS select
> SND_SOC_ACPI_INTEL_MATCH itself.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: SND_SOC_INTEL_SOF_BOARD_HELPERS select SND_SOC_ACPI_INTEL_MATCH
      commit: 960aed31eedbaeb2e47b1bc485b462fd38a53311

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

