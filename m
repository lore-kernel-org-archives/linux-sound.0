Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247D3EF0BC
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536796; cv=none; b=HrBIHgZxK3KvpXqaLB2EjZDTw41Pe111/2j1UqPCHXcC2ZPhklwGNEwSJQGMIVRoG3JVzCsaFcNU4jUDP+zq/kI4pcJOKIw9JgE5C0neaON0h70jkwDhKZLLV72L+QdXQC+w/BFZtu4xzKl/dQ3ulKbxUyn6Uq17n0Mycnsu8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536796; c=relaxed/simple;
	bh=AiAWTpmyjJQUdnV+x6KoVAen0CUQq68mTDBrhl71mjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KLEecDcpPgD2lOq2jZmu4PduwFXJuyQDtbTpYi1s3TMqEcM3JqTuCA1xylNH7aeVR4XDBkPhaENuiBFngXc1y9IIzw5gId0xl2e83Mk9v+2FjAxAVg0fY9wgDJk+f1MRd0bjIt3ikucNHvQdE3YrHMgpkDVGaukDn6RxdGGFMVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl7oxS34; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl7oxS34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22089C19422;
	Tue,  3 Mar 2026 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536795;
	bh=AiAWTpmyjJQUdnV+x6KoVAen0CUQq68mTDBrhl71mjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cl7oxS34mERrqOZF4CKQswjApVbqzesDyXMYquE8+uYUWETM8nlNrVNcgzCsRiRQq
	 eVsYMMGgshfGDAfNbNGuPsbsZQgORVALRnNIZPnNootFF/qsbch9pqdbOhEqrFlHvi
	 XzgB8EJBrbaw9pKfkS4Y7C04D4dxrF/apodcCm79DzoJWqP0mBuDC5dytJBw7dUuPy
	 IGqnptGddPrQbhQq7U2hrDuZxOgGSC8R1chI8ETtoBh5//zgBRUwEnfQrkB54pZ4dL
	 4uNij7Ykt+cVfa+fe/8MKHoYWjEeLS+32lvuWKO+jkUpBMHyDtkxbl8iPL1pHzNPK/
	 UwvjRAHsjqBJA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260225091210.3648905-1-shumingf@realtek.com>
References: <20260225091210.3648905-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1321: fix DMIC ch2/3 mask issue
Message-Id: <177253679384.22767.7937483118431715538.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:19:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Wed, 25 Feb 2026 17:12:10 +0800, shumingf@realtek.com wrote:
> This patch fixed the DMIC ch2/3 mask missing problem.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1321: fix DMIC ch2/3 mask issue
      commit: 986841dcad257615a6e3f89231bb38e1f3506b77

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

