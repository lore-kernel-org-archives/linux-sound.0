Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA613F45C
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986074; cv=none; b=MqlwOUPwKqyWCgvz6IAnLdnqf8dXnDM6mBE9i01p7OV+Od7Eqvl8uM+UxFEqzNdhtBYhIFXOylF2lu6IvaHkZuzRilthTHHiBJm5U/dgH7uqDVKIYfdF0Nc8zCL0DMMuZKALMangyO77KgOa2FZ9YRYVn90KPtL+u3kCR9ioU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986074; c=relaxed/simple;
	bh=LscZBrrk5tWprbX4pRMgccv36rp4xOvloWSZpk5k6Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tRoVpOXngR8w0/gfPGZIRxxUFCPX5ohm6OJnimUu2kWbvIEJ3dnp08v42JiF8fm5doTme9h0ViAz2jfw+76zJKCApoj58ztkAghZlGk9lmQlWRVQLYKa3kOPApdIgr1gGfJSSiJgY/hAtsB1NPjnf5P0qkoDfPIXqYUeFBtq9Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9rsZ4+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9rsZ4+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEBAC2BD10;
	Wed, 29 May 2024 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716986074;
	bh=LscZBrrk5tWprbX4pRMgccv36rp4xOvloWSZpk5k6Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S9rsZ4+yqoaDaiVzwph4xGaa4FpPfyFaviyTheIk4M5qU+i48QNV5WhGnqbgNniZF
	 IInl6Pu3QO6ErDCfzGdxrnWCVsn1XTpNxVWiUzOFQTj3wdieXVbl6yt2sMxo932o9b
	 qRsz6RwVJs/kCcvkBEHKCXBeeI14Br2znGA1STgCqAFIbu/VWvdMk/VLhtfgkwlc+b
	 slRHkSW98tGXNm5ZYfGE7+hcMATwZE64n0EifYwrCQRxF3FjWfbn6P5vvAWX8nS5jd
	 IWEUKKRJotwq3f8Kqcf2o0UeOZF0L16zDUmLJAv3cTf0g+Oj8KwjRsH5aKRe14mTA7
	 zJ8CzxUILk41g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 kernel test robot <lkp@intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
References: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof-sdw: fix missing SPI_MASTER
 dependency
Message-Id: <171698607277.66190.15891871680506088286.b4-ty@kernel.org>
Date: Wed, 29 May 2024 13:34:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f

On Mon, 27 May 2024 14:19:40 -0500, Pierre-Louis Bossart wrote:
> The addition of the Cirrus Logic 'sidecar' amps adds a dependency on SPI_MASTER.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
>    Depends on [n]:
>      SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] &&
>      (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
>    Selected by [y]:
>     - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y]
>       && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
>       SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] &&
>       (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) &&
>       (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST
>       [=n]) && SOUNDWIRE [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency
      commit: b062938fd9afec844c50571fddd8d81623a60ee1

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

