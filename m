Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59378F2E
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967563; cv=none; b=oCW9rlTYU/dcpLkOsE6yxBtUWOWSEfuSiY5a7B83ewqqRzEE/CIXRPHHYsw21e+GK/2GDHpRZ4e2k13VeBG3LMtFOUBC1hpfU8lG5lU7yaKviuzLhD2NmaYR3ngDxPoQShTlhOAv6fPoASLIqYC3aHNAVEi+/u9RyOq55wAionU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967563; c=relaxed/simple;
	bh=osloLhjIdjAWpNlMbxM956p0QysDGkLV5m8d+OjF2JM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MgChwrO6Echs2DenPsVn2nB175O9MHRDfphkjdP2RRAo66Vi0xQMS0ucD/ma6n+fnM6JwkmYEsxkrOu7UrH2vzZMhOrCc7ObcN7GNtNg19kIMSZ2BwwQU17M2HhyVVLGpryI9CT/zw+t2evLQ56JuEQbMgO1jEkkf6lwzS3P+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdV/wdiG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdV/wdiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DAAC4CEEB;
	Fri, 14 Mar 2025 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967563;
	bh=osloLhjIdjAWpNlMbxM956p0QysDGkLV5m8d+OjF2JM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MdV/wdiGbiqGmKu5F7lCEf9YQvEI1Y3OzgvPR2UC9yR0FYYe5lH3tMX0ywJcXGAwm
	 TvxKws9uFBRSF08I3zjjQzSD+G7YNe81ouq2I0U2noEUfTUM7kXS8hbfqMHpL4E3Mb
	 QGllUta4MMGMcpv2RZDgcCfslAMxYlCRLjUkyeY7IsEmH7EyO8zB6HkxnBmkGeUplX
	 YG/nDS+W8/BFKHdSlMCQTb5X5Cf/d2QZ8PAnx9iOKHAKqFxKaQvmcV0WW914F3eji4
	 ABuWVLUuL+I7xfZOhAOxtjW9dnhvMnL4m5IFS9pbwWpKi+OAN2Be2oeW7jr6XklGtq
	 5DXc7eW0RU0iw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
References: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH v3 0/2] ASoC: simple-card-utils fixups
Message-Id: <174196756248.19728.14519477670245438603.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 15:52:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 28 Feb 2025 00:28:55 +0000, Kuninori Morimoto wrote:
> linus/master includes my patch (419d1918105e) which uses __free() in
> simple-card-utils. But because of it, it has of_node_put() count underrun
> issue. This patch will solve it.
> 
> [1/2] is for asoc/for-6.14.
> 
> My previous v2 patch had extra cleanup patch, but I will post it again
> to avoid confusion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
      commit: de74ec718e0788e1998eb7289ad07970e27cae27

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

