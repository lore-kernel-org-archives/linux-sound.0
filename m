Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E5D36A03E
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873754; cv=none; b=NIrP6mM7g/p4q5Jic6oSI+dfNkNfLbiduiKysyZ6k2jut1pj3h/5n18iczQ2K/WH4SNJJWYqhmJ5BqnkP2XilcodhQyLdkMqcHHS5szpyXi3SeUA0+7v3RnH3q+Rl/ItDDPehqXMiEYk+eAVQSa5SWyu2QkAETwfLGD/y4sKPyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873754; c=relaxed/simple;
	bh=LeHaocUj8mpS2u8EoZ+cNdQ0LHiCqXddGuYOrovc7aM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dhbglBFeGbK5TdYRpBFaX8Ya2AhPWhMjYhOeGEY+rYws+ZO3FL0rW+khcpq6aeQkTLZL7E5QEgVRrPNwlH86m/NPi+WNa56+hVKuNyOgxL0CqpPGerbWCSUenzF98VT04KO6VCz7asgj6R3bq1oV2WH8OfWgELE/jy+NzLEYgMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEH/6eRW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEH/6eRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE097C116D0;
	Mon, 23 Feb 2026 19:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873753;
	bh=LeHaocUj8mpS2u8EoZ+cNdQ0LHiCqXddGuYOrovc7aM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XEH/6eRWOH73JF82J1rur+hgfo0yZFow2wAux6euFlgQ4hVKYmUj3ycamql0Mv9NO
	 Sehh3UsRHfpw8RpdYi8lbZxC692+Zn9TI1VotRvvy4vAC1wtQ4vToASqB/scwmTxuh
	 Eqg5bcNd9XXm7BwLQYavAUGQ+iGNN46iq4ube3QTDEe/U08Z8iTa+jf/RzFZK3ycKE
	 LaHijhaED2D6gy6aOXZyvA5I3Hha7a+RmwB88d9qMgEFnJErqnR4aWFnCzNKrGb3VE
	 4JM4EDLuxoOkAK1DVJZgnEz777pR5yGtqVvo7wJZjYAj02ij7WX1+qnYGCcT66DWAK
	 gCDX+xIrfV6Cw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Azamat Almazbek uulu <almazbek1608@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20260221114813.5610-1-almazbek1608@gmail.com>
References: <20260221114813.5610-1-almazbek1608@gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to
 quirk table
Message-Id: <177187375264.720764.14102449854497732641.b4-ty@kernel.org>
Date: Mon, 23 Feb 2026 19:09:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 21 Feb 2026 12:48:13 +0100, Azamat Almazbek uulu wrote:
> The ASUS ExpertBook BM1503CDA (Ryzen 5 7535U, Barcelo-R) has an
> internal DMIC connected through the AMD ACP (Audio CoProcessor)
> but is missing from the DMI quirk table, so the acp6x machine
> driver probe returns -ENODEV and no DMIC capture device is created.
> 
> Add the DMI entry so the internal microphone works out of the box.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
      commit: 32fc4168fa56f6301d858c778a3d712774e9657e

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

