Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07E3A8727
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169844; cv=none; b=lneV06F16pZty9aY8uwAeQXesfsFchz22MIGOVQPJVoqUoqQeIEDskwuB3tfByoYjlWyLvB9MnkoFiR9iVpv8SrWrbzPCOIrbKe/LH29iN8gxk3PrQUdQCeYH2TXu/R1Bjw29chyr/Ez2qBJZbIeFiO51hMJutUEdx1nJQtQOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169844; c=relaxed/simple;
	bh=vDDVGYPlYBTtZ4ZjVT/GRYGmqI1njQLYBqao7dJo0Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hADPpRYUU/vwon1o1mslbWoXFI2HG4POlaoUcn2BdezhL6y7Z4dfrOBUCaQcfpMDhdTAXdj8owvGXlUcVPEFTWIGyclUVa/tg+PZ2a0VrK+UiO6pZiMS+Q2fna6yRIc2pE6BkwFvr5fkM8tyfAc4y6OGa6epaMoNJI+wvs1uRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuVU0sHO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuVU0sHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE261F00893;
	Thu, 11 Jun 2026 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169843;
	bh=vcLySHusb4ocPse0Dqi7jZSUtLRa8WIlWs1CH6uBqag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QuVU0sHOqSQndxyzUuNxbGeKkhBgpUd4S2goAUMFIYLuMGUE5Jw0awGChb4vfRFp7
	 3peXGNx+vQb9vehd95CNpfAP89iKvfBJ+g9kxehnm24zGW2Rss/gaFduWuU4Y8CVRZ
	 ru6xZ19RPpgUGMxCz0RfsEQ7ZGXllLpDflI1JW7K89+ueQAwzXx+2K80d374nCapKk
	 1+LDew6Ai4XPplg13XoZacpVlxqlGOabfv0Zd85+jN2s8mSdjLk6RNhVTKqF50fK7M
	 YFoRIJOfUItyFyQL0zkN6TqtYXd130bUVY9pH6nvFHi9rWjPVlwOBR7drmkIRuH7bH
	 DjE01tr+BMpsg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
References: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Use codec_info_list.is_amp directly in
 find_acpi_adr_device()
Message-Id: <178108957486.232889.12487619934177934840.b4-ty@b4>
Date: Wed, 10 Jun 2026 12:06:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vDDVGYPlYBTtZ4ZjVT/GRYGmqI1njQLYBqao7dJo0Kk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn6xATL3mBd4GVHIywdNgIBK+CN06fL9FCjU5
 qh9FpEJg62JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+sQAKCRAk1otyXVSH
 0ONMB/9pRPoBdkEqh83u/brJ/ELZwWfDVOGIVJmKrmFY+xjlgssmokVnc0mUUioR1OewW4qYvpr
 kl6dEVdq6vdP9E8Uk9RRfaTf5Etm4yaDWoaRSqYUkb/ZZ7KPvkYX6ziZlHPwUtz4anWqIFd8l96
 X+/ceNyR/8os7L0xdG3QO65/omhZe7zEepS01XKHrZnKzGUhsGxK+V0jKtYDliEUmfvL6xySCGC
 Hp6sADRkgYDp2/bOnhnn7/lJ1vftSKcJXGtTtnq7x+O/5U3WCoBmfEbHXu3S76T5/lCD9hr607l
 4o/oNWgPg/IxU+FSkvAL28x3dciS2yxEoFBe+D/TW31W2rSm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 05 Jun 2026 18:18:03 +0800, Bard Liao wrote:
> ASoC: Use codec_info_list.is_amp directly in find_acpi_adr_device()
> 
> This series sets is_amp to all amp type codecs in codec_info_list[].
> So that we can use the flag directly instead of using a local flag to
> check if the codec is an AMP type. The flag will be used to set
> different name_prefix for amp and non-amp codecs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: soc_sdw_utils: add is_amp flag to all amps
      https://git.kernel.org/broonie/sound/c/db06e7b35c1c
[2/2] ASoC: SOF: Intel: Use codec_info_list.is_amp directly
      https://git.kernel.org/broonie/sound/c/0305c084acf2

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

