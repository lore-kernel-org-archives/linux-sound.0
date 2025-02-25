Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868A26B95B
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497005; cv=none; b=XqOUH50mtYz+I89p0S0cxUehlP7ly+wT2kPQ4UjycFM5xrcGpOZFbkxcI+5uTYWGS+LaoqPCGZLyaTHeto9OIJZ5IFu9GWwgVfzX+RVaqf2A/rLt4BpwP6XQwGYl/1Ainau6L4R6Lr3L8W5XhktVcL3JFNq/FFz/8UvZDtSHjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497005; c=relaxed/simple;
	bh=DzinkhMq9tEto2bu4YKf1yw1Jm1TmHftP+0783Tmkuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nb7gVWKkiGuOovKDqVJ0fd7zt1w+W6wLjNaI64o1VqeiY0WLyEUQRZNUucyncXgaG/nEKBkTN7QmvMCFVl4vYTO2IlPDHt6dWLxnNQCbCcZy5eWhHr40bv/SYmaPV19o2ODSbRaXf5yQgUYj9eeMNLkOUkKMBP1tHVzapmVHlnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YC1Qm1oc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YC1Qm1oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A26FC4CEE6;
	Tue, 25 Feb 2025 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740497005;
	bh=DzinkhMq9tEto2bu4YKf1yw1Jm1TmHftP+0783Tmkuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YC1Qm1oconbpDtYbGthSBJuYF1yJwrzeksl1lj9jiUoN8HVcRF/lNaxZN156P3etO
	 KLOxS0HNgVUzLmog9qQLBzN6uwS+Wa/ng1qYP2UOq8vzZv2By3MvlD58eARVjqflV9
	 K15W33wDMgtr5yA2TVL0XQBkUODVD7jZU4RW10cCY3LMWuJug/1KG78UBtfTUq3/mC
	 9tGZqO8gZaRnuirdqc7lz9lAuW1OGcFbKh4jmCQKVqYFmlDDyzc4WVmExUM9Yr+9Of
	 oYEqYL7NqodN4U/zNWuBxyOFtji0a1tUnhtHsxsfObXYDVYisae6mBnRDn3qeMnzWX
	 lGW7kTuRN7dug==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87eczuvih7.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
 <87eczuvih7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC] ASoC: kirkwood: use inclusive language for
 SND_SOC_DAIFMT_CBx_CFx
Message-Id: <174049700435.77394.6894287996062741110.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 15:23:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 19 Feb 2025 01:19:48 +0000, Kuninori Morimoto wrote:
> In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: kirkwood: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
      commit: 1c4749873bd0f769a47372636a428484e7035f59

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

