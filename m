Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E1DD295
	for <linux-sound@vger.kernel.org>; Sat, 25 Nov 2023 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkNh+1u7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A971C433C7;
	Sat, 25 Nov 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912233;
	bh=TvuNzbl35e3MpCZIoEfJstVJW2MqliElrJtb5bQ8+gU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LkNh+1u72KZk43ZzWQa2D6JaXR2js2tPJ03b9hRxmVM5NMtZMB6SMMWMtqzR4g2wP
	 j9G8txWuNDNLJSQ7LCOktTSsK82oJrQRbGZSdaLOVLYaDpmynNyHACr6oq50h8UV52
	 GEPjWdxs6ckT2T+Rn+3afGOpYNVbiBAPI6GzeSWXuihr+i01l2wJMwOrRbClgm6LVE
	 r4UgpA21n3IKkuKf8MdsKB2VQFfTt8wfgPWiXedwkAIWmUQ7BM+tBymnJ1W2GXycqY
	 67Z2nElL9TkuKs8VDr4asN2+ksSCaSaMBe/eInmuCJdRFuNDj9RxYSoHRdo+ZAcL2l
	 0nTsOgK9ALpBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
References: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Extend the enabled DSP core handling
Message-Id: <170091223102.2632109.354496751608471459.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 24 Nov 2023 15:57:41 +0200, Peter Ujfalusi wrote:
> In the current code, we enable a widget core when it is set up and
> disable it when it is freed. This is problematic with IPC4 because
> widget free is essentially a NOP and all widgets are freed in the
> firmware when the pipeline is deleted. This results in a crash during
> pipeline deletion when one of it's widgets is scheduled to run on a
> secondary core and is powered off when widget is freed. So, change the
> logic to enable all cores needed by all the modules in a pipeline when
> the pipeline widget is set up and disable them after the pipeline
> widget is freed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
      commit: 0376b995bb7a65fb0c056f3adc5e9695ad0c1805
[2/2] ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology cores
      commit: 31ed8da1c8e5e504710bb36863700e3389f8fc81

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

