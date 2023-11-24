Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624CE2E640
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcmDfJU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5389C433C8;
	Fri, 24 Nov 2023 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700838810;
	bh=RrK05VPdbcEwjcNqpX/em+leW78xzLeDnWA0JVf9tjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qcmDfJU2JBKrjkB0oEVGhW8xMgziK3ZQpCdiS7lkpC8pJ4EuIMRiSvz29gweSEW7d
	 Jk2t0GrZTnuQ6Xsn0LwPH31Grv4+hS6AuZ+vlzyZMJdk6/EJ8cMZfOE7gtaNju29Kr
	 3mnHuUHYIyiVAp0Iv8IkmcF94zBYY/lLNM5mzpCh1iA+xLfZk2V49DIXLKgktvWJ9W
	 lnYjSWh8DgLc9WAE3gtsy6hBuk1ffwwZaavtktBHmBkSZ/qMYa7hzhugNW1rWjeoUI
	 mVMs75QoK6nBFGF6zGXPUyxWhceJ8LsFI4JJPIt7uTKQlCxgq+/n7bvuFlVBlRhUCI
	 rqCepTPpaa1GQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com, 
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231124124015.15878-1-peter.ujfalusi@linux.intel.com>
References: <20231124124015.15878-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes
 when HDMI is not available
Message-Id: <170083880747.2597788.470442567674025665.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 15:13:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 24 Nov 2023 14:40:15 +0200, Peter Ujfalusi wrote:
> When the HDMI is not present due to disabled display support
> we will use dummy codec and the HDMI routes will refer to non existent
> DAPM widgets.
> 
> Trim the route list from the HDMI routes to be able to probe the card even
> if the HDMI dais are not registered.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available
      commit: 3d1dc8b1030df8ca0fdfd4905c88ee10db943bf8

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

