Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A622F39D4
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806609; cv=none; b=IpcLClNPSYqFaG+ObLC47Oslt5zIHbjacKFTMC7WmqncxFP+LeyqA+B5q60nvto2Zcyq4Bpo5Veobp1JYh8PDw8rDlpqdGg9zISgtscSaZV0kDoFTAP0SVGyBeteuzQr+B+wISZRxlZGFv+vFGvYEAZIGaSFpuFRoUja8PCRI4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806609; c=relaxed/simple;
	bh=GYwmPEzH7jYAgwsy+4F3z7uFn8PRt6AP8l+c6tTp+e0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gJ2uJjewzcx8/lF8AXR278HfJd0az0nlWRc3lUcpvRpRNQDOGUZFjzEaeRJFPvMzYHIQnWTsa5dj8+g5tifdOFxwRqD+hCMYRdMSYIB5YSh5kK35ptaDBvY6pbRK8vnu67aRRkDohBvv0L+5y5UktL+/j11+nx7QIACY7EG7hLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFdrIVLR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFdrIVLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F155C4CEF5;
	Tue,  2 Sep 2025 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806609;
	bh=GYwmPEzH7jYAgwsy+4F3z7uFn8PRt6AP8l+c6tTp+e0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VFdrIVLRhPIqfHa7HjpDXs/WB70jI0kkWLQetShYx+ZgOH6dY8ZSawQP1o+rQQDlT
	 BCOBIIgpEDC4i9hBtrjGcZzzzJOVxZ7GEv870Qg9Ba31bH0QdX0KqHRmN0smTtxD/t
	 O6ZmRF+0MPSP5ANb6cxSEttRDy4Uxgd0aBAr8W/eA5spC9a5T5M+sLVJmdiL0ce7oo
	 nw1Gzfw362YsxmA3M65OXaflujZat7eBI+oFzRWuD8hUBD245SGk+MOmePm4WKh2mD
	 oG4HNsORMP2owrFTXBkMw/4kecwjlHXN1AsnmppmVv0mdFzlZzeGky3ugT2YtMnulj
	 zh38JCw7c7y8w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250901085757.1287945-1-shumingf@realtek.com>
References: <20250901085757.1287945-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt712: avoid skipping the blind write
Message-Id: <175680660785.13556.4934024369365511755.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 10:50:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 01 Sep 2025 16:57:57 +0800, shumingf@realtek.com wrote:
> Some devices might not use the DMIC function of the RT712VB.
> Therefore, this patch avoids skipping the blind write with RT712VB.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712: avoid skipping the blind write
      commit: f54d87dad7619c8026e95b848d6ef677b9f2b55f

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

