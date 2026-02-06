Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF30BEAC7;
	Fri,  6 Feb 2026 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337739; cv=none; b=fTriF/fu71ZO9vJKslfM2fg6krc1HxckZVKSo6kliQUdmtBWelae9zkd+D5au/ZsRDUcjV93X+SUb1cuR9C/hUzhl2s98uS16GiZL4NEuf5TGySvidUzO+V32Kck44zUegJCcvI0CXgpl+NHWG+YpOc72gFC5aYTsvR3kyQOzQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337739; c=relaxed/simple;
	bh=7WoeCnRxuZoPzvt50yVCDfGK/uzDuTmGMyv5g/DOEvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tpAXoPB5Kz3QC2rFbDi+Bt6vkPljN5cztWuu1Srf+LEKPUMZSCCQC0NAtvdOehH62guBlmL8yatoIeyHxGAWwsGXhNsTT4FaJ/nUseC0nybYm2kc6L7HqJjZF75pc7lTdJ7yOgkxY38ZwKBQ7DvFHLrzeaVxfncATjC7xXPAeXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMNSlgAP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMNSlgAP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AEDC4CEF7;
	Fri,  6 Feb 2026 00:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770337738;
	bh=7WoeCnRxuZoPzvt50yVCDfGK/uzDuTmGMyv5g/DOEvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fMNSlgAPVjGWpACiUdSZD5XNiijjeVKLU7ekpR8hyaExmm2HncRF0OYif9nPgHUHW
	 aPIP3H2coIr7fCAZgTn0CHhW9uokDLU+5YGcTqia+FoO4H05HJ5XZ8juvZXochvy4n
	 qb/aDdm251mrXBDDHiXoMVwtDwk3FQEs3dtb8lKb7glAmYB5wHzl5W9UKjtztqnw0t
	 rbRk7Z/AEcP3gNs26W1+lHD2vz3ArpzqwWEv9ebKOOa3krWN0VI2Zy/OR3EVhqBKGH
	 HO/sEcsKM8w19ljPfC+xD+Pt/Epp3+PzJEnHTj51DB3L1z/oBuFg00dw2Y3GzcW3Va
	 Tn44SpPZczh7A==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260205164838.1611295-1-rf@opensource.cirrus.com>
References: <20260205164838.1611295-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] ASoC: cs35l56: More support for new Dell laptops
Message-Id: <177033773753.236064.1979704135900983802.b4-ty@kernel.org>
Date: Fri, 06 Feb 2026 00:28:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 05 Feb 2026 16:48:35 +0000, Richard Fitzgerald wrote:
> Some new Dell models use spare pins on the amp as a binary integer
> value to indicate the speaker type. The driver must use this to
> select the correct firmware files for the hardware.
> 
> Patch #1 is the new support.
> The other patches are for KUnit testing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l56: Support for reading speaker ID from on-chip GPIOs
      commit: 4d1e3e2c404dc30e039d81ba7396c8bb82ade991
[2/3] ASoC: cs35l56-shared: KUnit tests for onchip speaker ID gpios
      commit: 9bca0f05cea49ad11b464672ccdf6efd6a814a45
[3/3] ASoC: cs35l56: KUnit tests for parsing and using onchip GPIOs
      commit: 6f220440399afba29165e0597fa2c3aa836191d7

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

