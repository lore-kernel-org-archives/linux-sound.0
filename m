Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1C47082D;
	Sun, 12 Apr 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019051; cv=none; b=gYrcQkrs0yHdiyh9vqPqG4gmpY8xbN2bk5V2lAv4DK0Jb2ItVXnVbcxGyCL8ZZ+MACRDZrdKLDHCUU4o2HZirahfdEiQvo7SkOC+IRdOolodswH3UbeUj6xcXPgRSc2IXS5uTdgH0mnMgReOQ2gUicqHix9kg4Dh29wiqLifGII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019051; c=relaxed/simple;
	bh=PijWu97k4FMC/JNTJB1uwPX/IYoDgzxrqr5gykmeuRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cebUxDYHPCmUokQH2quzfpKmrBK0N8Se1dyj3taUEv9XV+mM+em3SYCvslpa/2W7EiQO4BuLQQQARTePtebhthytRiA7mjHQmpDy3faHc6qeIxSB409NsVlViJ26Pvv16pqxV8IaK0MMiCn3gNlfNuioWiUOpN/KdhFwUWNzVfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwOTT/Md; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwOTT/Md"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B15C19424;
	Sun, 12 Apr 2026 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776019051;
	bh=PijWu97k4FMC/JNTJB1uwPX/IYoDgzxrqr5gykmeuRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HwOTT/MdaGfSu+lMQ15reO4of2vDxHPOhy60wmT07ZTYlFrDnmz8INj9fBtd4caew
	 4ZW2fqlV130b6Z+hApmwdjnf5GI7QJ1lkWeKMcByVPD4pl/MM8dwmBH2n4XT/zKSbQ
	 QARPweAiFbTHS6oeSQ23qBLUkj6rr2Pe+xYDsxJySlDKR6xuGPzwo5pliOqgwvmzBp
	 2ogHKHjqXjypMBtmdq6o5meV2IexDa2cyK+hoaYpFsxj0LJJh5kMD9mw/+73uw1ukI
	 /wam1h2nO/e9hikCt9OUe25qUbTz29N1ebg7wJWBVvN3qNbkYX3gz6U0h7c/4kBtq1
	 E8ZivocZctjZg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Anushka Badhe <anushkabadhe@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260410055532.60868-1-anushkabadhe@gmail.com>
References: <20260410055532.60868-1-anushkabadhe@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: rockchip: convert
 rk3399-gru-sound to DT Schema
Message-Id: <177601109152.15951.7045747169563150515.b4-ty@b4>
Date: Sun, 12 Apr 2026 17:24:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PijWu97k4FMC/JNTJB1uwPX/IYoDgzxrqr5gykmeuRg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2+ZozNSjOGljh51Zr9GW6/olODr+U0bCjFa7X
 5XkH5n3dleJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadvmaAAKCRAk1otyXVSH
 0Ag+B/4nyiSibB/tBisuOvNzVo5Gh7bWuT2pSAqxItMWJeEeUjqvdKRLFLS6GQ/F8aW6MK8zBTs
 QorTnmTl1R4/ZsdhXRcoOVGIwI1SFpSRk3UpTo8NKjYR9Sqt8OBTrM//GrdI4iHQ5LWqv2tHNYL
 1qTndO450NNIt3qhRjWhLafyIdPSKVs+tCEHdE2qr+xDNUaUa8HP+59iXyPpH+IE3afytQ0OQAX
 yeS68p8Y9t+1X5ULY5z6pFVM3n/rJ8kzOKjMzJMjKGRHzAmt024aBk4wCvK6a9dkYVg167VEnuZ
 SjzhRomJGhNCIWp+ei542H0iiHu6Pzg324qyEo8ZbSjhYAS7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Apr 2026 11:25:32 +0530, Anushka Badhe wrote:
> ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema
      https://git.kernel.org/broonie/sound/c/115e7d764dad

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

