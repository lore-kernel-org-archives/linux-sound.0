Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634303EF0BC
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536797; cv=none; b=f/D7Ntnr7/Jutc5TltDq/Tm7tHLulZ5p2ttOxBalWZ/VWgjlHyHixxqd14Y1vQsQ91I/i+/mb3QeNW+SFQN0vd1YL7Dt2jBmlHmdDL0e6trbwG8JJ6NQWboaRArvlA8Z+JEcJwq9QDPqZxx79IqICZ2S2fIXTZsLGysI5hZS8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536797; c=relaxed/simple;
	bh=/kACRna6JYnt3ie2F4wkhAM5L3g9aD+C9nnqetsO+E0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XW/rc1u7jl6OgueEJTEZDXrd6gvaSKgMtWu5ysjGepBTIhbTYvPiMYYLTjjy7ggvu2qGSRx8aYJzHYEUsDg41uuBZDO+z1GfvDdytoAjySPKpqg6cjj3FkMAtGcDTpoYCIqFXaRVPJnxedYkgowJADE3fnTGm+7v1ceRD4jfJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7i4mvG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7i4mvG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDB8C2BC9E;
	Tue,  3 Mar 2026 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536797;
	bh=/kACRna6JYnt3ie2F4wkhAM5L3g9aD+C9nnqetsO+E0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B7i4mvG8DRR2yOc4LIuEMYtLrTXnUEIC7BfQ7VFFaRAefzfDngv5thPuZ0Xxym7pu
	 c8fZ5iqBGe/pOVbjjjMy2Lu997YWGN85Bq/qOhZsJdgAQAY5acoC26Po3O7XF7y/tO
	 E2mU59VsEK/7v/g6cqOjxTrr0R5k1gH1iwJh6CQYtL4sS6ZWbqbl8dfrMgYuac3fVP
	 w6lsEQt5NGgTVvhEbCx00PTaDWodrYYl1KdfDpnXc1fkMf41vds/RPKANT5G7xh+1R
	 DBOQpcein1U0dadsX1pWYWaO6CeiwxsvLPStfQom5ytmLva5OTzLzS9yJaJ8Bz/M9h
	 W9GG1JHucz8TA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Oliver Freyermuth <o.freyermuth@googlemail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260224190224.30630-1-o.freyermuth@googlemail.com>
References: <20260224190224.30630-1-o.freyermuth@googlemail.com>
Subject: Re: [PATCH v4] ASoC: Intel: sof_sdw: Add quirk for Alienware Area
 51 (2025) 0CCD SKU
Message-Id: <177253679601.22767.17512689738936398843.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:19:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Tue, 24 Feb 2026 20:02:24 +0100, Oliver Freyermuth wrote:
> This adds the necessary quirk for the Alienware 18 Area 51 (2025).
> Complements commit 1b03391d073d ("ASoC: Intel: sof_sdw: Add quirk
> for Alienware Area 51 (2025) 0CCC SKU").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU
      commit: 70eddf6a0a3fc6d3ab6f77251676da97cc7f12ae

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

