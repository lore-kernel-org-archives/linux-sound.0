Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B892248BD
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763518195; cv=none; b=gSh327y63y1zJQyrnErKwxfRBBWcbBbBmQ0kIckwhufh8E7IyNb0sjRe+pebX0tDNm6anjp3098UPtdzZDNYAGPI9mOoDVI3eCfrngiGm3e0ceqxhY8TXLEM5bIXSOV5dJNpp4oqtqQN/GCmczpUafkZnlGyQMbVUQ0TUJ1aSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763518195; c=relaxed/simple;
	bh=+0AdS315U3QshXu4IWVyxq1ixz1Wx7VrEs2dQOvYWoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gko/DKJIKtI52LUyMoLuJGRW6FJwL5MJSvZr7TLwKO+EDXPNztY+9GqcR0nNtQu+CG8TSRUovaJ9BEX7ByRX7FX7l2Yv8E46h3GMOuiQ/G/rB+eF3ZjzZ0Z4kXtcDD7e9g1qid8qR3cQ2XguawzFq5g3c2psLpOepnuBn5U+wWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejowxovX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejowxovX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AA5C16AAE;
	Wed, 19 Nov 2025 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518195;
	bh=+0AdS315U3QshXu4IWVyxq1ixz1Wx7VrEs2dQOvYWoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ejowxovX50gNtKfyVtg+DccD6COzXt2ubG17EPjcwWq/L24jW6SRTInpNUVvS/vKQ
	 5SrEifzE6+lAjX5KdBQy+Q4kwKKV+oQPb8YpwdlsRjEXITcu45E8OX32THFcaDtuZb
	 B78IabKOwENA1meD9OKT2tV+r9FdfEecOEgYv/Goppf+FBWdL/+BWvT4tMYGykLMH5
	 RArY8xw0Uw1xU5aa6tZwwg7A4RU3GpAS3FJrozsp57fUb3R3PcdNhXRO01kKt3BbeI
	 FDl8H12cwTTIJ3IqYs0aKbjLiu2idG/5pvRqafSONKJVREbjGOdS1DpIVo8xGtjnds
	 FbcIMC96VK2GA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20251111140617.2997454-1-ckeepax@opensource.cirrus.com>
References: <20251111140617.2997454-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Add companion amp Function
Message-Id: <176351819317.1795122.6084783429966597993.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 02:09:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 11 Nov 2025 14:06:17 +0000, Charles Keepax wrote:
> Add companion amp into the list of allowed SDCA Functions. More work
> will be required to fully support companion amp, but this will let parts
> including companion amp functions boot and it is a good first step to
> proper support.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Add companion amp Function
      commit: f5cb3ee251b4f9db2761aced191f10579bd7e64e

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

