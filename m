Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D6A199B2
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWNYnK7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1FFC433C8;
	Tue, 28 Nov 2023 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701179736;
	bh=19LV0L4o7RrVySDyn2CdYco7nMORkBVfN1GFrixZSK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fWNYnK7eNTRKSkIPdj/vIaOezibTymEioIt87WnPLANPIArV5yxXbSl4aa2PH9SPr
	 rlKCmhMh0kBC9xxithuaJ8TWH8h1+oba4wjWZOSnBNRW8Sf2p2dxyySiIXIWc6Q1N3
	 +SGU3PEd8GJthUzT8H6NLY4gWbE9BkwdN5rONbPvvA8CXphCYi9N8rQkoqXp2GiLYj
	 QGdPfrQ1VX4Vp6zVNcwOBHT0FjFviWBLrm4bUP/OS059xnVVNq7dB/rsTQb56bJA5C
	 lozcHudS2iNUm2dBtaJaG1CQIe4goNd7b4rE+N24agX2LZZfriPvpghRhMeIUAYpi1
	 j4baDWEMWG38w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, cezary.rojewski@intel.com, 
 yung-chuan.liao@linux.intel.com, ckeepax@opensource.cirrus.com, 
 yong.zhi@intel.com, chao.song@linux.intel.com
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Soundwire related board and match
 updates
Message-Id: <170117973370.2717289.14976871167039211150.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 13:55:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 27 Nov 2023 15:34:41 +0200, Peter Ujfalusi wrote:
> A small update for SDW machine support:
> Small fixes for sof_sdw machine driver
> Support for rt722
> New TGL/MTL and LNL match for new configurations
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Intel: sof_sdw: Make use of dev_err_probe()
      commit: 5c0e047ab629bcb5efa94de63fcdc75c9fe69516
[2/7] ASoC: Intel: sof_sdw: remove unused function declaration
      commit: fd8ff49d35f917c65383642c8f8f20656734f3ad
[3/7] ASoC: Intel: sof_sdw: Add rt722 support
      commit: def127feaa8a9d8684ac41139638b079e6e637e2
[4/7] ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config
      commit: 817178e7674bd8ca35344b2212a3105ed75559e5
[5/7] ASoC: Intel: soc-acpi: add Gen4.1 SDCA board support for LNL RVP
      commit: faca26b6ca90b220cba787ff7c6a05e99528731c
[6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and cs56l56 support
      (no commit info)
[7/7] ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support
      commit: ed99878462ccc143395987faebda33c50529b116

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

