Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80E358B3
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTeXfdU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8C1C433C7;
	Mon, 27 Nov 2023 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106386;
	bh=AUzvmO3oorsrFGT0LG/F8jk2nWSZYA0zZ/HJNmpOg+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eTeXfdU0YnbY3c+GAPMWOLR631M1d/YwU/ImBtoqQIBcYg0L/J85sh6qRyfvwqTdy
	 LFnRNsZxKPhNlXdI8D/gCt584KacWoPpUy323s6kWkttXxpP8929ZwybvK4aTwJxGR
	 NLJbdBSij46oLWljW1Tdyc3qYdS0Mx/Cx0SBJ+rdhak1WVKJEkZvplaiz5xAAYEG2I
	 wxyn/xIZB025CrNjHiRKJ5eO8TfSKLTXG3IjL1Hvwc1lK8UcH3Ob7iM05Gbkt1A742
	 3KXkClZorQ57pb434QXcgdiDqH6ch40LK94tLLgDAvqPjk+fgaiT/nuqBQMQ1iRuXL
	 DG1l63YvCfM8A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231127104313.16661-1-peter.ujfalusi@linux.intel.com>
References: <20231127104313.16661-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Use existing helpers to change
 GPROCEN and PIE bits
Message-Id: <170110638256.2700573.9538150782140632834.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 17:33:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 27 Nov 2023 12:43:13 +0200, Peter Ujfalusi wrote:
> Instead of directly changing the GPROCEN/PIE bits in PPCTL we should use
> the existing helper hda_dsp_ctrl_ppcap_enable() and
> hda_dsp_ctrl_ppcap_int_enable() helpers for clarity.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Use existing helpers to change GPROCEN and PIE bits
      commit: 9b3cd8ebb19edd92300932b68fd6941eaf1852d0

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

