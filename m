Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21451BA3F;
	Wed,  7 Jan 2026 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767812583; cv=none; b=Hyap+9i8qWXhoekR60RZGGoHLTo3C+jM3HmeM1o1EgPaeqal6tPd08a/2b6UvUFjINpR/IuZFrWTcq/7rClzVGs0MgJoyXRqmkPx7XuVIJ3SE80gmPE3WNYtfEeNSaxTr2ZDYaLy5EmSV8op1yW4SC2C0YG10oOWBJDHvpYWAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767812583; c=relaxed/simple;
	bh=fYx5B0yukc8Q2NJiE4ts/RndtVX6ltIjc7V2ZU4gyl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YE/vF+bnt6WRtBJRccGNd+MRPYo5oTR4F5msq6DaVvrWtp2/+fqpS8VDiHP77m9PcNzRI58zSBu8gbuYk9U3cF/z8DKG4bpXcLrWANkdND/jaFzoyQkNn8EJ9M21U2Vs2uPGlJmLP/YrZU/HCn0Hiklqb/dEGn3RoyvT+9k6AuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4Cpk/Tg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4Cpk/Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC1EC4CEF1;
	Wed,  7 Jan 2026 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767812580;
	bh=fYx5B0yukc8Q2NJiE4ts/RndtVX6ltIjc7V2ZU4gyl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G4Cpk/TgBMjsmYgbEb+0NUXkDGUGgJe2HYohNFDbxKdPffyJOpfpiGRkxgE6mBLx0
	 yMkllZ81/3wdm5D78gCeXDvGNonfJuYbTDUlhC/r2C41/XvUuQn5TS529m1iyCifx0
	 o9Be7ONSgBo01+xA6jZQOFVmtPh3FURNcCYsuizYIAdD56s9Z2EsKmLUMg7VrefrGU
	 EyNOH6migGZ8VWLSgZLfbYEVsEcvlZ4/68+x3QvFl1NB65c9giyN2hjPxjfL4JS5To
	 ORXc7NK7yHEEEI2cSb2kgPTq/p120AQKDdzRe/+fNGsqRNrjuBL8MBM2Bx4FHqHBLm
	 KVr2BcBJMqD1w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260106225846.83580-1-ben.dooks@codethink.co.uk>
References: <20260106225846.83580-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] ASoC: ops: fix pointer types to be big-endian
Message-Id: <176781257959.127389.8591799726303745547.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 19:02:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 06 Jan 2026 22:58:46 +0000, Ben Dooks wrote:
> If manipulating big-endian data, make the pointers be big-endian
> instead of host-endian. This should stop the following sparse
> warnigns about endian-conversion:
> 
> sound/soc/soc-ops.c:547:33: warning: invalid assignment: &=
> sound/soc/soc-ops.c:547:33:    left side has type unsigned short
> sound/soc/soc-ops.c:547:33:    right side has type restricted __be16
> sound/soc/soc-ops.c:551:33: warning: invalid assignment: &=
> sound/soc/soc-ops.c:551:33:    left side has type unsigned int
> sound/soc/soc-ops.c:551:33:    right side has type restricted __be32
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: fix pointer types to be big-endian
      commit: 2fa0eaf78c4bb24c2b05a4db3e0d86a7dcd8fd9f

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

