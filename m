Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7F13B58F
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540590; cv=none; b=N4psUg62qjvxCkAgu/6gerU2V6sx8naFXCrCF5FE75FhVo1+AP/yeToZ4p3OFTJe5GHqc0+MB6xqWSsih854B72I5E5rwFte2jSsRun1tMRGs6N3oyNy8TOZtyt8l/N4h9PwufNEnRRRwwsvsoghCNEmqFgl9pxv6UMsK8wRWlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540590; c=relaxed/simple;
	bh=/Q7R7kis2jZ4t8zc9cp8nNCrjbHuhPMdPgXJTAQJiQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oxyVhVUOmVmFHuXXkeusplNZYiNAbvkvQpCHvUBU/sNuMmfLQW2x4o+AxDkxGBdH3fg79FvXIhFXrEAnpn9v7ovJhQ/6qVzsp9KDGQVsIKDUBRqYLopaJdFC+dSqYiJg2cwrM936joeeqpzmiCOjSNJ+VCtss7il9yEQOE75JwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1cAfGOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1cAfGOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA88AC4CECD;
	Wed, 18 Dec 2024 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540589;
	bh=/Q7R7kis2jZ4t8zc9cp8nNCrjbHuhPMdPgXJTAQJiQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i1cAfGOuGcLRH6rAcvoI2+Ur6s4R5flHvbF9NmkcSSDcP+wVryuunQS4CiVbTeY7a
	 1m/jQQrbxjSZfBlL1ifxuGYDJPcOcpUMrDi1RLnV6B6A4gQ5hS9aZ5hgnbf93Nd9ru
	 U+Xc4aWO/t2kL2qdoNV9MqltvZdNSoObTmEzfknBcwNS46GdSBlne1rYyZW+cl+bKZ
	 Uv/Fy2EKFT3uLUneXIIf18YVPSpKxLukH+ipT90NNPwEh1quTitnBXUnHXw7sISTc0
	 1publjp7eo35DTbJkWmhWKY4IiWY4jZk2e7/nduKgPbbomgB41+3tk+nT3WksMWpsC
	 ohrJtb1+1dZPA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20241218091307.96656-1-shumingf@realtek.com>
References: <20241218091307.96656-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: add delay time to wait for the
 calibration procedure
Message-Id: <173454058759.141733.11434927150947461480.b4-ty@kernel.org>
Date: Wed, 18 Dec 2024 16:49:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 18 Dec 2024 17:13:07 +0800, shumingf@realtek.com wrote:
> The calibration procedure needs some time to finish.
> This patch adds the delay time to ensure the calibration procedure is completed correctly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722: add delay time to wait for the calibration procedure
      commit: c9e3ebdc52ebe028f238c9df5162ae92483bedd5

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

