Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E422BEC20
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756505965; cv=none; b=RBHevwST/DyqnQtNZKJ82OFCAQyKwa4uYlmdfDl5iyURIE1+gP2bYiTxPj8TJm6nl7cbztLvVvXJoUIeWwfht2MX9+t/u+tuWov+7rffPNs3chIIzNYiZBLa5siNDmonPjdo34VXmY2lXlTpKl1CV7jYTo7Sc0WA1KKYLDCABhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756505965; c=relaxed/simple;
	bh=AHhfJ0jWS/rnUCwx9k+Jv3qVStTVMgqk/MET3BMQnW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i6HuPlNeXloDt7PutMF3BQksnJDLzr8ehsTaBBTyQ+cidGtKvSNu7dyQRY+bai3JLfGdXEl37VhXxYOUOiZpAyJW1coZpstEdkd0ZWyqlNL95d5ZmqKhd23Tuzz6vUg6tvHDTnMqC931F5wQbsM5y4NBY3q/YrgesQS87lL2Bjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfTMl9LK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfTMl9LK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA106C4CEF6;
	Fri, 29 Aug 2025 22:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756505964;
	bh=AHhfJ0jWS/rnUCwx9k+Jv3qVStTVMgqk/MET3BMQnW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HfTMl9LKNAtUCxyKUh17yrQeinNDI8CdZv1eYGSYlXNHOzQftbg3yXOjw3w6mV2Rq
	 Ya02K7TtRjzjg5UyGFoC+d/oMd/ZPYmRpuzKhuaUe7NbPcVa0w36ZenfyW55tI8frw
	 +4+mxcjW3NGVWppiAOJi8GSHyCboCuwxvUtpMJjJKv+kVFYhShoJO4yKjctO9nV2/X
	 eXBdLldO8GjGdAQhyJMtepPT3xIO/ld7ueZ3r7FVaE7Or3/ZjVlNKliRHLjBDPkV6D
	 MykU8KDg0mjjK2p2KjfqXS+xYAEXKd+gH/iN/B52FlKpsa3pdgbiPpmEjiI5Cfdsb9
	 XzuFsneCrYi8A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, jyri.sarha@linux.intel.com
In-Reply-To: <20250829151101.27327-1-peter.ujfalusi@linux.intel.com>
References: <20250829151101.27327-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: sof: ipc4-topology: Add support to sched_domain
 attribute
Message-Id: <175650596145.395832.10404747327113318803.b4-ty@kernel.org>
Date: Fri, 29 Aug 2025 23:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 29 Aug 2025 18:11:01 +0300, Peter Ujfalusi wrote:
> Add SOF_TKN_COMP_SCHED_DOMAIN and connect it to struct snd_sof_widget
> comp_domain member, with new get_token_comp_domain() function.
> 
> The logic is such that if the topology attribute is not present in the
> widget node the corresponding IPC4 extension value is taken from the
> module's manifest like before. But if the attribute is found and
> recognized its value overrides what is there in the manifest.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sof: ipc4-topology: Add support to sched_domain attribute
      commit: 3d439e1ec3368fae17db379354bd7a9e568ca0ab

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

