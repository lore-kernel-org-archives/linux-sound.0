Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897F1E9B04
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834649; cv=none; b=Xh4tvgGQt8/QRoZyMEMRwJZ7G8ofhaqxhSUsEeadBYnW96ZP+gY3fLtO7UcEdBoApaphpSYE5MKYN0RHZASMs4hWyNVx0ePx/b6MYGUJzo9d3R8eMO2rFRQItpdYn1nLNNit6LWLcyIR4t3PAlH1Rr5SPdx/npKixVtZ+jb1ptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834649; c=relaxed/simple;
	bh=qZaqogELR0D6D7BSbonLT5AI9TYHOlFsdej40n91lFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hEd24jVowdff3q6vg9/v3EPzXC/GyvnrCtj7K32+rFoZ3D5gAKFJtYz3NeL0ADGZRmQ8uKxJJ4MOrFzrl3AcZJmBY008Aj80wGQvn0leh+nImnxbgify+m/gV0zQWHryoLNyL37jj9/ggY04GVJoG8ydVQPbvzEm2PzvQzOkNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ty4vL/7f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ty4vL/7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF88C4CEE2;
	Wed, 16 Apr 2025 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834649;
	bh=qZaqogELR0D6D7BSbonLT5AI9TYHOlFsdej40n91lFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ty4vL/7fUYTlIdRBnd8cvCNwGzqsmSuD/fjn4GZOekkeQ3E7N+mL+4BWTjveYsE1z
	 Cslyrdlao02ctu+G1FoHlGfkE0g/jiXYYotf3nMxxmAVGwJ+jSXg81ZMNyiejF9yx/
	 k7MRmndw9eHj0qwpU3R8c379Q98P2dkel/jqz1AtrT9eQC3i2n4CKxOxq+5Qk+ZjO2
	 UdAhKt9R8tBtwoseGWB5iRSy7XVGNO0wwX17LY7RZYnezYXra/FyDPnVtTwtOfOmDY
	 3/u5mMwyJGT4Vgdkt1iiWcqHVbqu/EGnTgOj8IFaGLNIJxE4bHQ2/Kq98hpuRzBZT0
	 fZ6Aqjbms1CLg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250416092547.737879-1-shumingf@realtek.com>
References: <20250416092547.737879-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: rt722: fix pop noise at the beginning of
 DMIC recording
Message-Id: <174483464726.868862.4560022686175490403.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 21:17:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 17:25:47 +0800, shumingf@realtek.com wrote:
> This patch added the PDE status check which makes sure the PDE transition is done.
> It will decrease the pop noise at the beginning of DMIC recording.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: rt722: fix pop noise at the beginning of DMIC recording
      commit: 9b62b7a6574ea25e1da15b883de74284fb45197c

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

