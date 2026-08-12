Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA933559F2;
	Wed, 12 Aug 2026 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552194; cv=none; b=SNUuKJHHGyo5MRIfWJdqBFkKWO7RrSxLHaj3gBi9/j9zcojYpIz7Bc71JW4mCz7Zzc4+EAAKmiftA8MdYNwupXEgQePeco4U/LBwvXZWkA/Z1rD7gwBTK5Ymt+u4D9oRVh+Dk89KuzOG3dUYeJMkwMKWrXzi8w6e35PctLPOLj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552194; c=relaxed/simple;
	bh=MT18v+ha+HkzIJC/NekGYwRqEGwucKF7dVPPoYtWp2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vGeV+fGQB4oS3MOp80Glf4D2Q8g/lssGCsgdI8rxx61HwFwKREUbrxxMf6g4+h5ZZHlVKwXs/wysgJE9DLFvbw8dcpjyHZmcz8kxIJs5ZmysTtrNkosaPlI2Y8RLRWNf1AhauqSAiLwPr0EWicc0PjNrFraNwzLkOwiu1yeCdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gl2Bi6uq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gl2Bi6uq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38701F00A3A;
	Wed, 12 Aug 2026 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552193;
	bh=ZCmtgrPC/f0hYkTP7TdiXskrcM1SzWnvzy+FRHz8lAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gl2Bi6uqPqSh3ErW8FhDarMIWxj4IWminQd2NrfVA1fR0+TqBbw1VscEVGR7p2Xnu
	 FfNTysra9ZoybrrtYlKc+vOF4jVOHQnH2v7oy5Y96lsj8waF0Oqrx829pKjsnmbxC+
	 vwzz1Snp+iPrNk80TIh/5bTPqKPtTNMqoejaivgUJC4utVu9asyfzLrolOOM02CBid
	 72WJvk4vDDU4MCz4pusOmNDO233NkY3mUJDT9Ry9YA1d+XOuRMlG8lVuQJwG7ZBSI8
	 /SSEmzXooBzw3DLEP76cohm4vcGq6PtHqeCxcrRAKVkeoyEJrf4KxfXJEv35Kf3cXL
	 Hjy2SKq3DNwSg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
References: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
Subject: Re: [PATCH v2 0/2] ASoC: es8316: Add regulator support
Message-Id: <178653178735.8393.6600060408725965146.b4-ty@b4>
Date: Wed, 12 Aug 2026 11:49:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MT18v+ha+HkzIJC/NekGYwRqEGwucKF7dVPPoYtWp2A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfJ98M9yKrT5g2V3cqTnWYG/N2tHExJlWQerP9
 zLR1TSI5c+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanyffAAKCRAk1otyXVSH
 0EHXB/9b23Y1AG0sGE1GAm8VN0GnWsLAS1eieGIItJLkJo9nMleYkab5Nsgn6cdVOff7N7zLwld
 iKF9AZcgigswT96Qf2bY1kX73ci1/TBQxbzSQXrBu0OAVBlNCCJyUezVhsB8Yg4VQSENih8eCr6
 SaUUnxZKq1gEWd4XSPw+3tTO6mrXTxIdzskYOPFoxAFJ0m3fAs6Jq3va8f5zTlRT9iBy6RSodar
 3GmGJYHBf0udxTYnIJAC5Xwg3F9MRIXkXoG/h4nx864MB80gvmxh/FA9VTjEsa+xBRyoZnI6dAp
 HtA8D1QYZS8jXxbNUuLfineAIqjmr3mUrXbTkSswc2Uky7Qs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 12 Aug 2026 17:35:42 +0800, Hongyang Zhao wrote:
> ASoC: es8316: Add regulator support
> 
> Add regulator support for the four ES8316 power domains so board
> descriptions can model and control the codec supplies.
> 
> The binding patch documents AVDD, CPVDD, DVDD and PVDD as optional
> supplies for ES8316, preserving compatibility with existing device-tree
> descriptions. The driver patch enables the supplies before initializing
> the regmap and keeps them enabled for the lifetime of the I2C device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: dt-bindings: es8316: Add regulator supplies
      https://git.kernel.org/broonie/sound/c/e9966d450b46
[2/2] ASoC: codecs: es8316: Add regulator support
      https://git.kernel.org/broonie/sound/c/c60279912ef0

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

