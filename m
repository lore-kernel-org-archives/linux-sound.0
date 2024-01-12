Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E47762B
	for <linux-sound@vger.kernel.org>; Fri, 12 Jan 2024 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncXXAYjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE3EC43390;
	Fri, 12 Jan 2024 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705078362;
	bh=xRo+4ACngJ8eJmQnuQpFB5LWdChd3MyH3BEY6GG4uog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ncXXAYjpCG4pWUQiTNp0M1HqWuYZ2fZgyxunGwRfzeB45VBlkmvXVAknRXEMy2iYD
	 6TUimQBtLpyinUgm/N0gWBemGWgs6pd6MXOd3SQBpWv4JLQGjDOm/E1qAqemSduFkA
	 1Ps3MXnPo3dW71P1n/2/Iy8QI8UTQaPg0uxXAxN3k8Sq92v/My9n2QT+Bfj53hpEJo
	 u6YbxKOas2H8/ML13Qn7K78FPPzFC6HQc8A+arGVdRzdKaNrSdIsS+7jeBC+Men2Kt
	 EpQQ2hkbSHqscdaBTv0nld5URG/ImL9FMQqbPlbqP05a67meOdDMFrK5RDW+hDvOhs
	 fX0M+0NUNh+Ag==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, kamil.duljas@gmail.com, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
In-Reply-To: <20240112132749.28970-1-peter.ujfalusi@linux.intel.com>
References: <20240112132749.28970-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: icp3-dtrace: Revert "Fix wrong kfree()
 usage"
Message-Id: <170507836050.29906.18129260050058430214.b4-ty@kernel.org>
Date: Fri, 12 Jan 2024 16:52:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Fri, 12 Jan 2024 15:27:49 +0200, Peter Ujfalusi wrote:
> The offending patch introduces memory leak when there is no error, the
> memory allocated for the temporary storage is not freed up.
> 
> As I have commented, the original code was correct and cleaner to
> follow but it was not obvious from the patch that it will introduce
> regression.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: icp3-dtrace: Revert "Fix wrong kfree() usage"
      commit: 813c2f2925ee9c10dc4acd5aa7410cd3357e8da8

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

