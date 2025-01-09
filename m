Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4266218E87;
	Thu,  9 Jan 2025 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428683; cv=none; b=Im03olF9j0WT6l/lDDEcjl/egPXASPnQKeu3vz7bBGkR/y7w6xUzArHpD1ixcTwxeg/0EsoFzsoNBJyY/dEeHXb8y7qmO5GaOkxFa5pWEUUVHVTLKZQvotiqpmBRvz3hgg2JeN/F5ucdLbiEXdHvuw6SMEFp5U6WIW8RX7iYPtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428683; c=relaxed/simple;
	bh=kI+Ml9JRjydLnLpdZYni/l2NrgLZb4i84QA/MtCrBYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BHKdHbFsxNC1rLY3ytcdgIa051IxPQ7qijwTxNBTEYIXWoGGKR14g4OlAkNrwKS5AC8KU3WWoc/Zj1oVWBXZvBo6Vxc9MQHwQto/oEy/CBCy5Lj5VTBXl8B3wGLQvFXSRWAjguMk/afUAmiSa1M0BRBVbGSSXOvf5ONKS+bR988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgdbAs0E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgdbAs0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FAC4CED2;
	Thu,  9 Jan 2025 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736428682;
	bh=kI+Ml9JRjydLnLpdZYni/l2NrgLZb4i84QA/MtCrBYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dgdbAs0ETRBhmzlF+XkKZSxo7i2r9Fa73rKUIIgLBKhZI1Im30jP7ESTBj2AR0+lN
	 JvNmyuGFq5azU18JUkl3zYlaE3Dd0nv9XOc1tU5haZP0QWkydq3EdPTXu0oEUC2orw
	 bd/qdo532xuQ5DptdPJ59fqEYu8N29JnhhVjaDv4dWMNc1QuIdDzXJfop8xu98JXzA
	 OzrXTY3hSQFKs+nyPHvHSi/8ZsaYuc0EsaD0fyHHzHF4ekaf5FwEAFxxpfHG3uFedv
	 XEW/i7bnT2qX6b0/uGKCOOXjyEZkfNnj2YutSojoz/F0f98xGId74x5yabkDWtzvRC
	 fHRAsxYnwo0OQ==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250109093822.5745-1-mstrozek@opensource.cirrus.com>
References: <20250109093822.5745-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Add codec force suspend/resume ops
Message-Id: <173642868111.47141.14542770411266275326.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 13:18:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 09:38:22 +0000, Maciej Strozek wrote:
> This ensures codec will resume after suspending during playback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Add codec force suspend/resume ops
      commit: 8f0defd2e52d22eb994d7e770b1261caa24917d8

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

