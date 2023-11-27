Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40D358B3
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHgbMkfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B96C433C7;
	Mon, 27 Nov 2023 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106390;
	bh=FUMVW8TD4/57DaIIlpdt+EDG4bH/7jKa8MeoYWK2tgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PHgbMkfe9VzHcDF/EJfM21uLYf8DEfe/3JpF81xg6Y0+JxTaGaRfgXDPN2Bu+4Z5x
	 pkLsiK1BO5+Be5qxw9smLXSGyYz8rCH9Nf6yWO0l32O+8kiNluihpeL9ki5e3HeM2D
	 vW0mLHfnBlefoKbxyt/7+UugXXvXVhVY0OorhM1aUYTTMOsw/tDM+EokP7Xhe3mxvp
	 YUOZcepNdNE1z+0XrZVNqA7gtibVI7+q2/olexz/JrDJJ/CYhpVpopL4hY8Lnh7Asx
	 ZOagCtQaSsd1M5EuQcPVCfWQWVg1arBQ4Lp+MHnRemzQIr38kl631ULQ3lgW7jTLEH
	 BiuK5Ad5Yr8Wg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yong.zhi@intel.com
In-Reply-To: <20231127105235.30071-1-peter.ujfalusi@linux.intel.com>
References: <20231127105235.30071-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: mtl: call dsp dump when boot retry
 fails
Message-Id: <170110638668.2700573.11679513380788892417.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 17:33:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 27 Nov 2023 12:52:35 +0200, Peter Ujfalusi wrote:
> Call snd_sof_dsp_dbg_dump() with the same flags/dump_msg
> as used in function hda_loader.c/cl_dsp_init().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: mtl: call dsp dump when boot retry fails
      commit: d5070d0c10326e09276c34568b9a19fb9a727b6e

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

