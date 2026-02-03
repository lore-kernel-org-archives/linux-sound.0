Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48332F764;
	Tue,  3 Feb 2026 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120328; cv=none; b=JGfV+nAdbBPuQyLVonkDOqWl9mQxViOPInyFYxO1zXqrN3yapkEb2Kp3tz9W1P9x0xLZkq9c1PQ5lzgcDr6t6h1OlVZGiGUDauSipKjqAqrEiA/ohxyeNa6Pt5sJGkWekUZFzU0vriq4WrJNIpnHV/Az1O9qGJ2m1w6RkU/0Noo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120328; c=relaxed/simple;
	bh=s7m31JzZ7UocXqlMj5BGSuE2XFthWRk7GT8gRErPb7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DYd47LyiA2ziWWevf3b4Tk80n2Bq+VHaKmLLFagZB/J4E3h+SrKStRcti9fTMqLehLGVUSLYy4VszYS/tHhZdGFed6Z8NwVOV7vGCZ+4eC2lmvv15bsZrxBjAS9SmzIAfB0qZR26/rhMbQE19Asz9/K7jZRLUsZqgnXYb+8DaXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdj/ckzT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdj/ckzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0956CC19425;
	Tue,  3 Feb 2026 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770120328;
	bh=s7m31JzZ7UocXqlMj5BGSuE2XFthWRk7GT8gRErPb7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tdj/ckzTlNM7WmfJMHYO+QfuHZrXO0xswdCaTv7tgJ588XC7zq2wqY4dB737DNwzY
	 VEl3wiTPMvK+pETizOAsVPp3vWZbknZ94aEw5Z/ZVXaKNALC/IFnzATC74vUIXVC3H
	 ZUdIrgEQYC0fTHJAoQUbuHIIC9LTauR+MlL1BP1NXhvrFmzH3ycXr9Ilvc9Ha76s7U
	 hRXw1vq5et70hjjxyagUft4JHxgXfZCncScz0YI8LPZHFgks/gI7DnWpJBG+NvN9pa
	 g/zA6ERgj234zjSqQR7+2v37pHilpPVdTO5k/l7hujLHo8V/SUxn8ghsVL6sZ34AFB
	 7r3e8s+wrvx2g==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com, 
 syed.sabakareem@amd.com
In-Reply-To: <cover.1769534442.git.simont@opensource.cirrus.com>
References: <cover.1769534442.git.simont@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: amd: acp: Add ACP7.0 match entries for
 Cirrus Logic parts
Message-Id: <177012032678.85387.7873071739767595957.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 12:05:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 27 Jan 2026 17:34:45 +0000, Simon Trimmer wrote:
> This patch series adds a number of ACP7.0 match table entries that are
> being used in customer products.
> 
> Some of the configurations are very similar so the series begins with
> renaming and sorting the existing structures so that the end result is
> easier to manage.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: amd: acp: Sort match table into most specific first
      commit: 9ba734901cfd67d1b2101cce803a62d422e81b67
[2/4] ASoC: amd: acp: Rename Cirrus Logic component match entries to include link and uid
      commit: 5eb3fc48d37157fd83315bcbb5693269fc497fb7
[3/4] ASoC: amd: acp: Sort Cirrus Logic match entries
      commit: 3de9cf4782492b19c9d8bdac309462027e18ab43
[4/4] ASoC: amd: acp: Add ACP7.0 match entries for Cirrus Logic parts
      commit: ddd9bf2212ab80bb90fa986cd987c671de53bd44

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

