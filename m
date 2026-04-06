Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D8386C19;
	Mon,  6 Apr 2026 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489001; cv=none; b=EdknXq6b1V4Jheoj31CHiyQ8+J50Cexs+ezrSjRQg7nVr2gIgzD+BNy8fE/pCLNvW59wbB9D5m6ddSp1FCuFfNCKfmadrFcVw7jzMDZNctahi52uANlF+qKzserxa+0ggW2YHa4ucJ1LGBp+jDYYZNhiZLKds9dfLu/FUBJBAy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489001; c=relaxed/simple;
	bh=dq2hULZlfLieWD3GqYFifwnYRw6DEeBCuXTTQRO/3u4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qCuQ4Ks5T/QVHLKgd8cAqGYYY36VGuT/pzUL0eG5gYkZwX6G8sZ69EzTRXl7ijj/hhPbtqgZQSXqToOJ36hG2QHQEk7JOEE6Xx8NgYA23z5FJmv06rKtlzdWMC+X4iwoD0T53355JrSKzdnRIwVaxVadLYJF8+C5mRkTM7HnPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElAt4dkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElAt4dkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632ECC2BCB0;
	Mon,  6 Apr 2026 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489001;
	bh=dq2hULZlfLieWD3GqYFifwnYRw6DEeBCuXTTQRO/3u4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ElAt4dkXOSWNVOLw4s4USz4aU81UYXnFFQ/9ZZRgv2EjOYaaGAifacvtpxg84bqs/
	 ehmwy7WlOhjq6lSpR/ptJWUrvNqJSv+w4QoaYhJXFs55bPLK5xMnaThgrwk9r/B3BQ
	 bcrbKMVZ7v+xzWy7mwIqCjyoY+Ux0FsklvhGymtWHEXabGdL8F2UnuaVTMWV3ZVlpi
	 PT4NzKkB+gHj4vafkbxiql5wwbXi4e6JlDRJ38OSt1jbj/zy10DLCQVlVoovxRJAYf
	 LuKCLSWESsrCj+9dUUJYCSiKQCfCJ7qUg4prhw2ZSlyLsRGIq3PTKX1kAwzdRB27Jm
	 BVrp/xUDmeIBQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260406090547.988966-1-sheetal@nvidia.com>
References: <20260406090547.988966-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: rt5640: Handle 0Hz sysclk during stream shutdown
Message-Id: <177547704873.46304.14839873891274144872.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:04:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dq2hULZlfLieWD3GqYFifwnYRw6DEeBCuXTTQRO/3u4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/mvit7rUI88PMF8tm2PHMv2nr0ezgELUzTi
 Tmn4YdvCfeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPP5gAKCRAk1otyXVSH
 0HxXB/9BKBcQv3yRcDQI8yzc2fVdBoDw6mNl26NGWLFXNp9Lqwb3k/VyerUK44IiXDHhSvj1CBD
 6UYjSNuCx9BkDNMH0vnCpOWqMPsyWMUahp+t18WdATkNfj3G6YEwe0XFIEV9t81FG7ekPr9j7yC
 rgBrx7tHy63Z/EZFLlN3kxvNgWiQr5ImFVYEzHp0jrUWWKNogK3+Ho5cQXSc3K6XOdi5bsfVHfA
 dCrYldTtnGSqZbM/mw+ohJm1YlxB+6gqiRbaIrSo3+qPWBLD7k58yFEQ03gy0EBz4qSWxT9uaTI
 KvzWDz99ZtXpzbRjjMmycC/jPGMya1h6Slcl6UOZQInURAmm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 06 Apr 2026 09:05:47 +0000, Sheetal wrote:
> ASoC: rt5640: Handle 0Hz sysclk during stream shutdown

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: rt5640: Handle 0Hz sysclk during stream shutdown
      https://git.kernel.org/broonie/sound/c/247d1c13992d

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

