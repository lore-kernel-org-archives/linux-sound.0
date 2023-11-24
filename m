Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D92E640
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdFqrZ8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E67C433D9;
	Fri, 24 Nov 2023 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700838815;
	bh=c1Tbhzd/q6lLjvGR7G44hGQX/17WpWR8SqeEb+GEy1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AdFqrZ8ofF7rHyRBdhRItur3FG86R0iTSbuAZDNg1IvBZgCgs+AKrTjwF32sh2TIj
	 Flyzzxr0pZxjQ99nhZ4wowUJeq6rAfYWKyzJpWd1BSwq9bJnh61zlbnY1LSF5gDbeY
	 07zaZhWu7bK6oLPtPP0rUiUjQs4TUHGTBI1QBHkcCjoiLHmXIByTeKqBNBxhdHGRXE
	 2HZTbfyQRLVpq2uDTT+ukmPDPaxdJtH2XVG0wypqguFHZknJW0SqUAaT/MTIufkePd
	 ow/oUOFIRlUKtSp1VEVk2Knr6xC5zC16YuLKPixGAIiFMiURQp1zsgUgHqzFQuiKoz
	 CtL/bQ1eCwUuA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231124124032.15946-1-peter.ujfalusi@linux.intel.com>
References: <20231124124032.15946-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Always register the HDMI dai
 links
Message-Id: <170083881136.2597788.15143097357794274199.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 15:13:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 24 Nov 2023 14:40:32 +0200, Peter Ujfalusi wrote:
> The topology files for SDW devices require HDMI dai links to be present and
> this is granted under normal conditions but in case of special use cases
> the display (i915) driver might not be enabled due to deny-listing,
> booting with nomodeset or just not compiled at all.
> 
> This should not block the non HDMI audio to be usable so register the dai
> links unconditionally. The code has been prepared for this and in case of
> no HDMI audio the link is created with dummy codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Always register the HDMI dai links
      commit: fba293488ccb1902e715da328e71aa868dd561f6

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

