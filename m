Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295CD295
	for <linux-sound@vger.kernel.org>; Sat, 25 Nov 2023 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9CyEmT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACBCC433C8;
	Sat, 25 Nov 2023 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912224;
	bh=GwUm1z7JNGmx9AHHEHp+yhIxEyZUQY11WglFg95CV0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W9CyEmT+nhx3j47D4G/aMS5ia8csPuTNw7uriGVZIc7jVTARW7T/r0/3s4NgVlg/k
	 AqtD8DRgrIFAQQYmhj9V19qwLjEql8MmYEM040Sf0yQu8p3idp8aWPcXJDN9sWJbfp
	 5uRfXeRoHP6rILn2XLGZLk+9A2F+1FV6yjReGcXuJJT4AqKA2KKaB4LtyVgcYyCo+/
	 Qn2ZJ3Z/gdPEkwKRS/xjhrSAizw5q4NP6zUClWDt662LBHjjgRZRGHRH2Ja1Ddo/q9
	 0N+CaHgKJnQ6y9reAiSj7dQ58eN2ffs0GtJNf4xqALCBTorTqD0fBrioSeA1KFH0nm
	 ODxvbe09qYAqA==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
References: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
Subject: Re: [RESEND] ASoC: cs43130: Allow configuration of bit clock and
 frame inversion
Message-Id: <170091222238.2632109.3145285136716343850.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 24 Nov 2023 09:50:30 +0000, Maciej Strozek wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Allow configuration of bit clock and frame inversion
      commit: 52be2c4926831f7858c25701950afe9c1879f71f

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

