Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7E2DEA60
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117137; cv=none; b=CDsJd8RrOAnrJni53NhOnNL7N/2UXmgH5ZLmo7Af+TVQvjw7JoduwjkI2IePLFu6glpw95De9PYPEAcMx+qmoZKA/aTMwgZzAiWaM20AeHYq+bteX0XVgfmp5uv8mfYpCuLZmhCnBZ0oDmdUhv3SCvTcSt2TPeGOvEU8lKvMsTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117137; c=relaxed/simple;
	bh=4nUABdbw2kcauhQ7fUR+z82ekQHqj93PJ7WZA35IIOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zo2KMRq4uWG2CXJn/nz2Xniq7FXAU4ANhtZ1dLYC6qflQXUioUUb3fRfb4LIK64WjrbbnMqSYSxjsXmZi4BASBq0DS0liDIdT+k0l7zQEQm9em+Byn+WqpFiI+hUgKn0UL4FJv+DwNJoqw8ULDjcdZKMMcAgssQvozDb1AM59g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0uza/iM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0uza/iM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD07FC4CEED;
	Mon, 21 Jul 2025 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753117136;
	bh=4nUABdbw2kcauhQ7fUR+z82ekQHqj93PJ7WZA35IIOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j0uza/iMFKQWv9b9DfqXFUYol3vRyGEY4mpyJaPt3sx/4j8XN4g+o5eW7fjhEW1m3
	 XEhVu3zyr9PZcOQOzlWB6A/tY0qvQwtX3P4H72w6tYEakxlBx+FYY9So7l/ff95cTz
	 eJ3KwPx0ehCXCGSUTTTRYcnLtKw4/2+JtScLEtvfBHb6skZ2DiWUCzxcnSCxS56F62
	 fBZTsJEEhxHXckbYbegLUuAST81l2YCgG4J8uTKTiAWJN5Ao3wbGY4x5W9zy3WItBR
	 mBuUJtAe2LHRyRwUSjEqpGs77Zy9Uyl3V5/HTXGmIH3CUlYkd1V9dz0c0UE4Hylx0B
	 0ciO1oKEMJydg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20250721112334.388506-1-shumingf@realtek.com>
References: <20250721112334.388506-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: SDCA: correct the calculation of the maximum
 init table size
Message-Id: <175311713449.510318.15269958886518723103.b4-ty@kernel.org>
Date: Mon, 21 Jul 2025 17:58:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 21 Jul 2025 19:23:34 +0800, shumingf@realtek.com wrote:
> One initial setting is 5 bytes, so num_init_writes should divide by 5.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SDCA: correct the calculation of the maximum init table size
      commit: 9e55f1192648a5b327f03c60e411126b3d19c5c5

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

