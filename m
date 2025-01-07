Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3191F76DA;
	Tue,  7 Jan 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263927; cv=none; b=LYLdf5Ll5nG9hl51S9xs2+xq+o2w02JTVpCON10BzI/ZJ0Z7LpO5QAS/m0/b4p34orzgyj3njDkab2Q6a3X/GKqd9UUL8j61qMUVYu9cZG/7qF7r+iuYM5O5AMvq8FZwrzpsK2Q7k0QjEyDdtmGz/tUXmCHUe7nhQoWw/tTcsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263927; c=relaxed/simple;
	bh=gtcdriZA9fz4KRQ0gm8/p0D7tDOA4136dQ5EfZB97Qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DPs93IBCT5CMGaZxaZmHMcxE8sY9yYjWnBr5at1vymwINL2F1JLX00LHEuZkYLOIcRBHuzekqdSkp4G4gIKUKM7Pkvk53l84r2T78PfkkioNzGvuS+JKKUrIrySSkffu8dQqqAN72mT/o5V/VlhIr3/t2ZW5o5AQT1fyTng69yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNUuigJ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNUuigJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBA5C4CEDD;
	Tue,  7 Jan 2025 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263927;
	bh=gtcdriZA9fz4KRQ0gm8/p0D7tDOA4136dQ5EfZB97Qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hNUuigJ8nVo9WGnxT0kUmD/W0M/7x4gkDENy/wg1sikjvF1RNpw8tlcTcpyxpwh8x
	 McuFJHrwGYEEiV6PwofrJBMvaLFgVtXbQ29IArSZilZZUoYKvt5ZTNBxxuPNINsPl2
	 LTjlOJnarN9OeBFa03BeQV+tcmTCPfwqiUv+Ju8V110ksB8O6LkOK6h83P48+1L8IT
	 2ERQoIDPvwiNxalM7JzonxvwajhkY9uuc09JmGwKHGNhDxXhayKCjar27aF1qHQ2Bf
	 8ZIRJQLIglt3ikbZITaxsORVE4AmUI+yt7ZcCmsEnX9gFExtfNH2ObDllXv2dpRg/U
	 9qIL96eKjlAVQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, s.nawrocki@samsung.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250107104134.12147-1-ckeepax@opensource.cirrus.com>
References: <20250107104134.12147-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: samsung: Add missing selects for MFD_WM8994
Message-Id: <173626392579.92253.3245885722455011017.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 15:32:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 07 Jan 2025 10:41:34 +0000, Charles Keepax wrote:
> Anything selecting SND_SOC_WM8994 should also select MFD_WM8994, as
> SND_SOC_WM8994 does not automatically do so. Add the missing selects.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Add missing selects for MFD_WM8994
      commit: fd55c6065bec5268740e944a1800e6fad00974d9

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

