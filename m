Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1538410D29;
	Mon,  9 Mar 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085557; cv=none; b=UtpBgZijeuerjhe8bZImIUpYnRh/gAoOxqMMcRoTVxwCCFBQoc1hrxhQd1iRkbFNEAuyVtCway+AlwvxmKH2QaJvMSQijSdKDltn5tSOmC7n4Hwdg0mwns8plNPoaKa4bsJ3AmG5vfWwCTCHI7E4GLEtTrpB2P+6Vd+6ZE1xJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085557; c=relaxed/simple;
	bh=apVj9iq5RFJN9uFDQAXxD/YYPfKT+EgvKhv47ZHeNcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e/3r0Io/YuF8PJKgYne2i+2IB0FBwYuOwOndIG+DNVPSzYKZGVCQJH8dxEezsV7pQjeo29Sk3JBL3cKbExt7UZp4jO18SQHg7BazO1z3TBi9kNa8xvB73O2xfZLX2yUxuFGto8LBF/oJLRMe0uU5h2ndHS4hZuu5+BtTDtuLHOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESFnLju4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESFnLju4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BDDC2BC87;
	Mon,  9 Mar 2026 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085557;
	bh=apVj9iq5RFJN9uFDQAXxD/YYPfKT+EgvKhv47ZHeNcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ESFnLju4YqNeJUVPNRxFr46JKnMAkTnBs2KFXGX3U/IPpHnu6XLS6xoW8sJsYGkFs
	 s17NtWo4acMnfGk5WqMpLAwbdMhmNQOT6pZ/b9whNL4l9W3yvpZsz072i9fAYZCrTb
	 qrIlaFGBhw8v6Ta9owyO6Ue+o+8DzheiX1YO4CvNqbLqHwtyIT+zRGD+TiHREEzNw6
	 1gTYaG4DLhVgjrdTDrUMJsN168NHTc+D7sOEoeYGmsBSIe/ydFXdWLXZgZDuC/42P3
	 lhEyydOxjv+8wrUuIZWnmIwOOhIczmxJdsTp3tbV5Xm3s8W/T93tVZ0xxxA+FCoEBQ
	 1oaHTNBEbfIEA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260309115651.1090368-1-rf@opensource.cirrus.com>
References: <20260309115651.1090368-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56-test: Remove pointless duplicate loop
 counters
Message-Id: <177308555665.265787.3452338794084665166.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 19:45:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Mon, 09 Mar 2026 11:56:51 +0000, Richard Fitzgerald wrote:
> In cs35l56_test_parse_xu_onchip_spkid() the first two loops used
> local i to index an array and num_gpios/num_pulls to count how
> many entries it had seen. But both i and num_* started at 0 and
> incremented on each loop so were identical. Remove i from these
> loops.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56-test: Remove pointless duplicate loop counters
      commit: 66f71ec3539e0e724f5099e6d4bbc81db4d9954a

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

