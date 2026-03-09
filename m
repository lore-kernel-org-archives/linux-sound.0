Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56A3D75BB;
	Mon,  9 Mar 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069154; cv=none; b=oXEHfwdyKoA3OPIKZ4Dea2G+nr/INNIga9hhz/WKfT5scN6bVSGJuveGJWb8gzbkD4ZeTqYNDAMzLoW/5OogHXvd9Ddy2E/UaS0ptrXIrspCpPx1ZZaTt/YAoDUo7B2LG+UCpXk3Fq2U2txNtWov4gTigyrQkBFEotPZ5eJf32w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069154; c=relaxed/simple;
	bh=VCXNCtxt5ce08pKBgKDtDL5kDo9M8q9LlD7M4Elnip8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BDnpuWBR0yGdf2/V7XefqoYfGUX+UmJe2rl+5xxM7li2oH00br/9RPAH26zR2FvaJxMFN/dsc++9isAvTU3KvRqWRnigPzEZmNKEXC0BNFlLzG/bF9jahzZdBkyZPgjgr2VEJBx3WIquBO1WI9tcVQDduQJHpHrZSaZh//CEckY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYGoPDZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYGoPDZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C064C2BC9E;
	Mon,  9 Mar 2026 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069153;
	bh=VCXNCtxt5ce08pKBgKDtDL5kDo9M8q9LlD7M4Elnip8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gYGoPDZcVwRXyIpwqGPC3mdsxkDn/BhW7Fc/ue6Li2yr1TMNaXCUXu+AI2neHMbj0
	 SYFjDqfZW0+cotQQJJbW8o1OzPiM/hitlWg5PKnQINvu3bTmODDG37+XFc3ZiV7htW
	 2TCvBet5LokoM+WJCkVA56Gct8sEiJ9GT1KCtqmnEADgQ0Y4Y6BBbv+JJJ3hhthElr
	 xxKC4wBi1nhEJtg++85qGmHH8KWbSw4UEmeoYESWKy9OgZisWd2U8dt9MUYnEPhQYM
	 c2QE28b2jL55YkCMyIzr+YbyDbK4pJ+Apblslnx/VuQ2TFzjNjL/lMwVQBaTA3+BRI
	 8b16sEnvKzxfQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260304141250.1578597-1-rf@opensource.cirrus.com>
References: <20260304141250.1578597-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Fix fragmentation regression in
 firmware download
Message-Id: <177306915284.149479.6685022264746582379.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 15:12:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Wed, 04 Mar 2026 14:12:50 +0000, Richard Fitzgerald wrote:
> Use vmalloc() instead of kmalloc(..., GFP_DMA) to alloc the temporary
> buffer for firmware download blobs. This avoids the problem that a
> heavily fragmented system cannot allocate enough physically-contiguous
> memory for a large blob.
> 
> The redundant alloc buffer mechanism was removed in commit 900baa6e7bb0
> ("firmware: cs_dsp: Remove redundant download buffer allocator").
> While doing that I was overly focused on the possibility of the
> underlying bus requiring DMA-safe memory. So I used GFP_DMA kmalloc()s.
> I failed to notice that the code I was removing used vmalloc().
> This creates a regression.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Fix fragmentation regression in firmware download
      commit: facfdef64d11c08e6f1e69d02a0b87cb74cee0f5

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

