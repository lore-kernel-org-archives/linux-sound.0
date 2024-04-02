Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C882115B97D
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712086205; cv=none; b=KGe4vKNzwofMhXNNHIjx3b/6ioxtJkc3hlHEnPMGxB+IhAbR6fqRCxfvJBT4U3Inoo5sF5tGsfYgCCVCc9IwTNF5ZW7zvDpS+X/LGIo3dUTJPboFUa5SpHGoFDXqS2SHrS84/VcoTXDTTGzBro+tbn6d7kftBofg7L9i0lOqTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712086205; c=relaxed/simple;
	bh=irLkQWFufDbVi6k1LpDXZz/gHAQUlWWBaSIRfGXRKQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e6UY48+hU5dxXR1u4/xUrWKzQbwRMm+j9JiWdjwNzGZ8UME9j6NUDfQSusBFSUEUykj2vZuLshfJP02x5m9IduWinnN0Q1P6JEM4K7i+cOKcAsTm/Unlact3dBRGWuX/5iGGYwIj05x/50qnateVWaXyTRQLNMOSOxymmYHuSAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHdbJpQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHdbJpQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A220C43390;
	Tue,  2 Apr 2024 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712086205;
	bh=irLkQWFufDbVi6k1LpDXZz/gHAQUlWWBaSIRfGXRKQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aHdbJpQjlDhpNp7jtWLG8WFj8tIVE95YAbQ2u6oUY52J8w9m3PCWgOqRRwqac4e4R
	 VuEGJjPPfFP9psTw3psm7XJpKXfKSOwMI/9K0lp1Lw0jjih3e+drk0OG8zqWrg/7+m
	 AJxO8ye/RPdA9mz3d+V9qeplLqVV8htW4LPIOiIV4umC3HVRZ+yFIL01sFUBj7KS1n
	 6BqYd+CvyFhdc55ksHXcWlhbpRgguCA+AeQakbIbsSg9dKTB/u+ZyosPxIT6xqfjMN
	 1aB+i9CuPLTt9NnR2ClKrjvkDujkafMRmtgBT/xYiwEFrZw5YbacCzvPyu07w0nfQB
	 kMbGulrGImJ8g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240402130640.3310999-1-amadeuszx.slawinski@linux.intel.com>
References: <20240402130640.3310999-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: boards: Add modules description
Message-Id: <171208620375.89523.10607476689901938291.b4-ty@kernel.org>
Date: Tue, 02 Apr 2024 20:30:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev

On Tue, 02 Apr 2024 15:06:40 +0200, Amadeusz Sławiński wrote:
> Modpost warns about missing module description, add it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: boards: Add modules description
      commit: d619b0b70dc4f160f2b95d95ccfed2631ab7ac3a

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

