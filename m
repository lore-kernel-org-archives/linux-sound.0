Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730691CB324
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571787; cv=none; b=thwUL1WQU74I0th7J+Cz3dKAXdBt7jjTb4rX21qF7NW69kAFgPXI0UJXs6X0I8YzTrwWVUWWRlVkajCkzhjX4XtgzRVfYcxLsdKIbis9/eBeO1rOC0pHGacj/V5blPTN0eQQoKJX+qO8FXg0QPbeFStFfKbDAJpSK4ZviF1H80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571787; c=relaxed/simple;
	bh=YaP69K5VUDqXMUI1D0LBEvWWBLBp3LSEaVEwJ5/+Pd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RoYOg7WRQFUgZKPqyMSgu7dJFDXvHU/1YBl7Tmm4eoii2a1OjCiiwVXGU+9Onyp1ODpekpevplZc8DTjJzGNemYbZo5tBfXU5aCGbRiBWLRQiZ97iYiSa39/9bFucGtn42bDqc9ds8xk/7e5mhMlAageU/hdYSFpFt/BJgMXda8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvDrjQXj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvDrjQXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CF7C4CECC;
	Thu, 10 Oct 2024 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728571786;
	bh=YaP69K5VUDqXMUI1D0LBEvWWBLBp3LSEaVEwJ5/+Pd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QvDrjQXjaTi6w9gUwezii6TZ/O0UZNHPNNZ3Obp9ipGEZnDGhgwcqgpS6ySRpaSY2
	 UVAXWMjppQG0gRBp24pgThZxgJTE5donvAmnNnQmsmLXC86cnTFChxfVdguRTfvUEZ
	 N4OFT4A45ZIIobCF3n+75kSy2+tZ7tOX9CqdDGQ681YHOZH+pJdnUR4P9OVjV6oqBN
	 Igg0w4UuhFdaJYYXRnCgnJpwENTqdaskmgmsMqst4JvQja7Cc4WbOnEqY44M5vyEJ5
	 GbBcD/KQmLElZgocKgT0t8If/7o3u3CLC1RgBJ9GpDvtQdvBnMRhpM8Wf7si0D1xEK
	 D3Imh3eqVi/Bw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241009083419.319038-1-amadeuszx.slawinski@linux.intel.com>
References: <20241009083419.319038-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Remove unused code
Message-Id: <172857178549.3727572.8117433915032880049.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 15:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 09 Oct 2024 10:34:19 +0200, Amadeusz Sławiński wrote:
> After removal of Skylake driver there is no users left for sst-dsp and
> sst-ipc interfaces. Remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Remove unused code
      commit: 970d299b0a0a29b7fa1a36a05f561cd932ee4149

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

