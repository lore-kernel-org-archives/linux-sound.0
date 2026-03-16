Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A1236075D
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773697962; cv=none; b=Dhgd7OkrVrRVNpd4pTsTNNLJbMUqGNmh50GRyW74ndq833MsrvZcBVRN9VeO3j66IWbUMSRUwigAOPePbpKJElj0SV305dCIv3EHYe+9C8grnfIK9rqFwrSfv5rHi9AdT2DScAtPE2nzbGoHtmqw+XjttnyRMSZ8I7dZ/szL8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773697962; c=relaxed/simple;
	bh=S3q1Da3sOysjQ4kUqsqskDJyK4x4V3tJsLzWru+BtFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GOEBnV4d6+Xqh5g9PltbGWHC+FhdxVxDSXoAYHA4S0xduT9I23s8UEjlUnZ6uEOGQ0gs4Cm6UHHrIkKe1rcquO2KeoR8Q+8hLY6fPvHI66FjtF/MMuqwD1MlFJmNZujUUTzkkWThybqr3WS3fNRRAeEHrKL/Ar/OO7PRuPUS8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDt8hXm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDt8hXm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0624AC19421;
	Mon, 16 Mar 2026 21:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773697962;
	bh=S3q1Da3sOysjQ4kUqsqskDJyK4x4V3tJsLzWru+BtFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PDt8hXm+RAwaQ4Ee6RbysX8bTd9JmWfLHI7lAriOWS08KUjHwdqRQfgZzVOjXLHJ3
	 D/yXxNZ3tLVIvmIehr9FweTk1CAZ0/KnfTwDmvrR2YssqRQOutD5GSWwWVBwDsvJ64
	 PRZltpHjHcAXhglTYklGvZyJRdgZDzXAgOb/vtmozJJG2dGJum+f4dtQaFledELkw7
	 tH2f7S+T5f05wflrvUBUgrMD0eBndYErFY0acUWRgu3ok8zZFFzm6VeP3YDpoFci98
	 BjF8/xfN4Q/xwg71YmZqlBUihmDG86KEi6ehbNCnqrQyvqK099FtbxhUyy/k72noGk
	 80GZRFOh4bYWQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
References: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] Handle edge case on SDCA jack control naming
Message-Id: <177369796074.303411.12865038960790486605.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 21:52:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f420f

On Tue, 03 Mar 2026 15:53:06 +0000, Charles Keepax wrote:
> Normally the SDCA jack detection controls will be named after the GE
> widget that represents the grouping of everything in the topology
> controlled by the jack selection. However, in the case that the jack
> selection only controls a single widget the control will be named after
> the SU widget that implements that. It is rather confusing to have the
> jack detection controls change naming scheme between devices. Add a new
> widget type, similar to mixer widgets, to force use of the control name
> rather than falling back to the widget names.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dapm: Add a named controls variant of a mux widget
      https://git.kernel.org/broonie/misc/c/e29d097ead33
[2/2] ASoC: SDCA: Use named control mux for GE/SU controls
      https://git.kernel.org/broonie/misc/c/b6a6cd3f6b5b

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

