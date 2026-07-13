Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACA33C182;
	Mon, 13 Jul 2026 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965004; cv=none; b=FFs0nRnchpxYbfrDC6Jcapg2ZdreE2x5QqCc7w8wJ9IP+G4kxagL5d2amxhYN4lYb4z7yigtC2oLYUm0DKUEpbKIQAvTXR7r5h0kmxtz71IMQ56b8RCRQQ/sroWHy9GiFK/WCD9Wty5uia12/1AxV7Uayyxh+QI62okBx4/HbBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965004; c=relaxed/simple;
	bh=WtYPtV4MJog93ZrJwWt4xWHTXtBb2ZPTGPHT9LdEwVo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jk+hoMnMaXco53HiwiVkZ53+sFOIqgAAAssZShBKU/ToOchyDJ3sQVeBS9pRGSy148VgiUAr9Z37R6pmUDpZknSL9AN8lweYdIsnw2LCJiF7E6ExmshzO8ss2puknN3R852lxNramcnSMGe7t2UBKi7luBChC5SdOJK/OIvEEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKgx89sE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKgx89sE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD8F1F000E9;
	Mon, 13 Jul 2026 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783965003;
	bh=oTqpNPCaWrQxOsBv2avmtmBMYaMvgyoucn1YWrXaago=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=XKgx89sEZ/fdakH+d1jsihzM+Hf1QrNEJmCO6B+ZxC4EvVwq/RqbtVp5gsleEvsXe
	 Sjcm3pxdeLZbvdQuU1VehdGGY39NusKqkyM07/JMobVlGYaosw7VvZ2j2xlGejgKda
	 yXVoP0uFJS4esAzIQENF7YXHTy46UF0T5GolMgsS2Td/7lpqbkEh0A8nqj33A6M0iE
	 G+l6s4AtFu9UyE/f5ctBrNL6OXPJRDuDQEBSJlhfgiDE6BQ27QotEABBJYMTNxgIoH
	 BZngLeZpYglHNB4YdNgyXcwLFOCaKS852SVVW0ElaSksKH7ufEnXpd0XyNgtxUwEnl
	 GBbclhO5Qf6yA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <20260710070835.3749817-1-chancel.liu@oss.nxp.com>
References: <20260710070835.3749817-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Fix spurious BCLK on resume by
 clearing BYP
Message-Id: <178394658034.7914.749887010931841655.b4-ty@b4>
Date: Mon, 13 Jul 2026 13:43:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WtYPtV4MJog93ZrJwWt4xWHTXtBb2ZPTGPHT9LdEwVo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVSVI9NfilzGwGrSIbV2rLiUxrG76zo2fxrROo
 Egxs2c1VECJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalUlSAAKCRAk1otyXVSH
 0JnAB/4rmEQnGy06Oxp63y64WqHpuVgj2i/+Q2l0NCUNs6XjWAPuN5VesKQc+BMOOZd26HIHiFp
 pS+4ipcRwKkhAtPNuU5rmp72gqK2rUkAurZOM6H4wEmsyiZ2vj3hZUXarmBvUnFaFBuJn50DD61
 JefN0tFt3F7IQf1JxEhp2PndCUROzTs3bRFoYensPBEhOp+17OVHRBnYOSwDGSarlEU4WlrWwVH
 TDL6mOnMg/Wh3cJnM1ZIMcZJMmBfnKufWqAUhIsEDHvi8SvOsq7XTOqXsAMeC3Zd3ERqG0nsQpa
 vDzPl3UvG7jGuFvVMJjwq3Q/Ah9saLYf0rmOeH8z4chmkekj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Jul 2026 16:08:35 +0900, Chancel Liu wrote:
> ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
      https://git.kernel.org/broonie/sound/c/d091132889c1

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

