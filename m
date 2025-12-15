Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82954315D27;
	Mon, 15 Dec 2025 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807121; cv=none; b=LLmfjrQUlZUzJ0SkdNFUqisfxbN/VpmPDZxjIJL4UDc+YF33BZnC/VJmumLbsAKBnN780FIy38pSvraVjd25icIum796eMH8CBZ7Uyp2LcC7LAvl6hsUXSUpQC3AbF1fJoJ6PYdbSwn5O7XAeIB2Wv58KlW3TRhigslJzztZv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807121; c=relaxed/simple;
	bh=mDoQSoV4Trw3E7JIctccbj4Bpep4NAS6BAnFbDtlDEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E/lC3wHx2FBPekq/GrX4WKNG/ERt8teoerogMnQmXuYOevHA1ixoCI67pYCJBt21W/cV7IC/7sS37p2kPu7Hs37S9iKbPCJ+g1xkEbjSluKhVvGz26MueRAHdkhwP0WmUc+to6oYAeBz0Vv3pkhUO5+jI48AVvT03X6BxLizIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pq7N7c1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pq7N7c1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A81C19422;
	Mon, 15 Dec 2025 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807121;
	bh=mDoQSoV4Trw3E7JIctccbj4Bpep4NAS6BAnFbDtlDEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pq7N7c1ChXJ8wNF3kHbfdJJVREOHU0sYQAWy9PnBhF3lDG614Uuv9MRc06dNl/7jD
	 mvyYJkg5qQYB07e6nbHjJShTAjZvoIpkJRXZ4GFBQqVTXgttE301XJAb6r7bjIyWMp
	 9s13+e9fWKRgwCOums/9YUR5bC5bgnosOA7IzjL+8/iDcQi/EuW/MODMQoxdri6q9o
	 q1ZVYZX8IVMSBSMos4XDQQYkft3bTdQhbzry0AH3ApVGANSVPFKJQvGDeBs/sdSNW4
	 6y9FhKtRZmoC67L8NdWYiF00pCgha4nAD4ubfhBQ9mRNvrUIeIAAzWO3M+JlW9/d+7
	 KGlqTxy49p8GQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251209151853.432518-1-thorsten.blum@linux.dev>
References: <20251209151853.432518-1-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: codecs: wm0010: Replace cpu_to_be64 +
 le64_to_cpu with swab64
Message-Id: <176580711909.161056.3094183851804630244.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:39 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 09 Dec 2025 16:18:50 +0100, Thorsten Blum wrote:
> Replace cpu_to_be64(le64_to_cpu()) with swab64() to simplify
> byte_swap_64().  No functional changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wm0010: Replace cpu_to_be64 + le64_to_cpu with swab64
      commit: a49e098be20063c91b673a674b8f0f92135448da

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

