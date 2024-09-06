Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324641CEEBE
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627969; cv=none; b=X1fueHkj+sxE51td77utQOhj8EFzoV0oQROpA4GYeVjrmtWG89kCn8SipAui7LmS1/4cvUBD9v4AFuobCFcBQfmlV0OY4oU6okXDhxZPs/MLsTI5FbdW7sGbL9CAKG7iU5A+UJmZdyGD82XOuNJtKLleWAct2WL+TTwrE0rHObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627969; c=relaxed/simple;
	bh=VpAQRPwEr6BulAVHkGys03WB2SCuXzp9eOg4uixv024=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mW1k5nWSLcTFXYWOUl5C9ttUKzalp4VSEd7RqybKzu2yLlt3mlVNC0GlWwYOm79QX/ULtO98F//rBHZzF49DnDJtrn8OKwACMpShBWCCaj+F++TfOyr5h0HpabNwTvzs2AJRDDANRm42nhjw9cuPXdlQM3GsgdjqHl01XsQbMjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVn69mj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVn69mj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C4BC4CEC9;
	Fri,  6 Sep 2024 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725627968;
	bh=VpAQRPwEr6BulAVHkGys03WB2SCuXzp9eOg4uixv024=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LVn69mj9MgZX1ocODDsPGGaTgVNnkYC4RlBiAr5yGx+FbF/vQ92grPCzuYN+K6d7v
	 X/86iyhE0g866jedIEpA4sAV9sEYZtws33vzkozZysW3/iGHbzmXgxFazBugnhTPHg
	 Nq+XtPeXVz+zVLaIk/x+aXGoygUkvwFaNYyKYRBqn6/pfivtErUl/rLmFTuxYYJg9Q
	 b+JcJ+h2x7npnKXk4me98WBhwoJax4HtnUaCaZMe+odgaIBgpI6BXYmG1sRgHFxTIg
	 iqq0DLeB+sgyC+POZTk3TmVDvUNzYpkpsZLulh2Usv+4Y9KMJC2ZeEp3Dc0fPDjlMj
	 ui+v7o2Lti5mQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, Zhang Zekun <zhangzekun11@huawei.com>
In-Reply-To: <20240827070650.11424-1-zhangzekun11@huawei.com>
References: <20240827070650.11424-1-zhangzekun11@huawei.com>
Subject: Re: [PATCH v2 0/2] Some clean up with helper fucntion
Message-Id: <172562796362.927452.6426026023067764138.b4-ty@kernel.org>
Date: Fri, 06 Sep 2024 14:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 27 Aug 2024 15:06:48 +0800, Zhang Zekun wrote:
> There are some helper functions which can be used to simplify the code.
> So, let's use these functions to make code more simple.
> 
> v2: Fix a code logic broken problem and add the comment back.
> 
> Zhang Zekun (2):
>   ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to
>     simplify code
>   ASoC: audio-graph-card2: Use helper function of_get_child_count()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to simplify code
      commit: de849243404e8ce02320a7178d4448e4d0191377
[2/2] ASoC: audio-graph-card2: Use helper function of_get_child_count()
      commit: 815f1fcf2403454904cbbc5cf370df6bc300f392

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

