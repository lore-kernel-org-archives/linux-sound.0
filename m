Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842EC1FBC80
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709600; cv=none; b=BWeB5uol3WwCo/PCQow8G5XAGqU892I7nG8fCdkK5vCu3pEvwMnde9P8Xd4ZXMKNe0pHQXouKz38z3tPQH+kVUWrtK3G2QJlsGH/+C7fNbzvDm/ux58bxf6m8uj+/DW7vpDpTmYzdh0b9nS9yDKcAoBRKXyrqpTx8qdxtPwE0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709600; c=relaxed/simple;
	bh=ytlMl9cet4vRj8COBYRwl/1k5hKKm4aZmD6cmBmkmHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A1r08dj5zsHZ/a0H28r+HDnIJNSYeWPLwA12fWZBYTQXOoeaAhItIkX4MIbpgAtyV4HD9YXWiDBiTx/NKL71GXCnxfqhYs+dQNFstNKx/H3hCpI60Ga4w9C6XnpNcV/WsKWMrtzaMZ5/40xJsG2Z4a0tOGRc+fNeFl8i+BJI0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbyaPgG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbyaPgG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EF4C4CECC;
	Wed, 27 Nov 2024 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732709600;
	bh=ytlMl9cet4vRj8COBYRwl/1k5hKKm4aZmD6cmBmkmHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MbyaPgG8IxwTET0G31NLJDll5A5dyoWG31X3VVyEEPDSG5ZVxdCrUsncB0etrXc4u
	 i56DcpCFxaApvc0wAr7GxjLTBsuNVqOJVJEOwzLA20iP3v0l7Vzphk2k3F1J/Yroqf
	 eGlyA0WKaj8YM1j2egghn+gP/ovPNW8c0uV+BbPPHrAOwE3b0Y2mUvjA0Gk7GiolA3
	 NYpSuGqnqJREl4i9vzPcyEbKoG+4RpPRROY4CZGz2wQtqBEGUmhMu5Kgzl77qWXlYF
	 Nyl3o+Hg2t5g8VqK5bUj10E0NpC+DQUjRYThwN4eUQLQjYr2Qul5vDvXmCmVpCdlMC
	 vAH/RDWi3IOIQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, deep.harsora@dell.com
In-Reply-To: <20241127092955.20026-1-yung-chuan.liao@linux.intel.com>
References: <20241127092955.20026-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-topology: Convert the topology pin
 index to ALH dai index
Message-Id: <173270959866.162310.6805121429381666785.b4-ty@kernel.org>
Date: Wed, 27 Nov 2024 12:13:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 27 Nov 2024 17:29:54 +0800, Bard Liao wrote:
> Intel SoundWire machine driver always uses Pin number 2 and above.
> Currently, the pin number is used as the FW DAI index directly. As a
> result, FW DAI 0 and 1 are never used. That worked fine because we use
> up to 2 DAIs in a SDW link. Convert the topology pin index to ALH dai
> index, the mapping is using 2-off indexing, iow, pin #2 is ALH dai #0.
> 
> The issue exists since beginning. And the Fixes tag is the first commit
> that this commit can be applied.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Convert the topology pin index to ALH dai index
      commit: e9db1b551774037ebe39dde4a658d89ba95e260b

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

