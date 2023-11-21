Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60229C12E;
	Tue, 21 Nov 2023 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCGGh0aD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E70BC433D9;
	Tue, 21 Nov 2023 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700592356;
	bh=9WC8aqJ6oZ32SlXJ7faib65Qf55EOmQoT+BGw8wVCVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kCGGh0aDTr4yCXL3F6PhpNEEg8N3gvA9MiPxP+X+ZS97UEM3YOKUZIiIdbWr/kMKC
	 pBjJcTPjI3C+mWnPCTvko9Sc525p1YixKgGHn6wqqkCJ6fH6SmVhfWRqmrBLV459Pr
	 7cqiZXGEbwZXD9Vw1Uzusklfdq261Nhhd7LxYwW3Lr4eWgmhYWO9zXPjGIHR/awWMf
	 ZDumBxi+JUHERekmp4R+etCrSCoBxiIGDidHCjI2smA9UueC70vq+ZJobMWcOaG6vL
	 4aoYv5i2RVccARukINsuNDhig3mu1CygEovgHNcBnjGxicaP3BO6ViFCWRA0nUcKZV
	 E3RHJxW9Tku3w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231121120751.77355-1-cristian.ciocaltea@collabora.com>
References: <20231121120751.77355-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
Message-Id: <170059235481.1901021.9703531954255937779.b4-ty@kernel.org>
Date: Tue, 21 Nov 2023 18:45:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Tue, 21 Nov 2023 14:07:51 +0200, Cristian Ciocaltea wrote:
> The virtual widget example makes use of an undefined SND_SOC_DAPM_NOPM
> argument passed to SND_SOC_DAPM_MIXER().  Replace with the correct
> SND_SOC_NOPM definition.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
      commit: 67c7666fe808c3a7af3cc6f9d0a3dd3acfd26115

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

