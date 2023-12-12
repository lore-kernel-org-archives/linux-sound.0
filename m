Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053117543F
	for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HarOdR+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0E7C433C8;
	Tue, 12 Dec 2023 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702395987;
	bh=5F3Szy7Vru4H5gp6BMOhKGQvhNadpwCGT0QE2NaOr6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HarOdR+h6hS+T5yBSjP/oWADUN4zEVS7R8+npDunEAyKLxNu4hOaMu6qA3J8Mzj0Q
	 /NeBtEVWtJrygfPfJ9MsmJx+W+IudU82wYvnv93zWlnJS1Gn9bx8MUsszr8bxZbMIo
	 S5YKKq4oEmFxVOjvmJQnZF0NgsTua6LzaKMWRIZ1a5Oh54qMRjTg3u+WHVSClyLgFz
	 vmWGDTtG1l/YoBDifGQG/KSOwvRoSHD0QqhAUp3tWFVbaXCIeBhTIvcvmF2pqDMLk8
	 m84QP471OZzQJ7XYS/WB3euFXBeFMrWI3y+kIhsEn3GXUTqkKap9vxMqNkJN1a2mqk
	 IzTkvd6XczRDQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, sfr@canb.auug.org.au, linux-sound@vger.kernel.org, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20231212104149.2388753-1-ckeepax@opensource.cirrus.com>
References: <20231212104149.2388753-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Add missing statics for hp_ilimit
 functions
Message-Id: <170239598597.81213.6525470428849908001.b4-ty@kernel.org>
Date: Tue, 12 Dec 2023 15:46:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Tue, 12 Dec 2023 10:41:49 +0000, Charles Keepax wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Add missing statics for hp_ilimit functions
      commit: 5ed06e489d20dca141047bdb025d885306ea66da

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

