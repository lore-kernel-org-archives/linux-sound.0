Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6471D432D;
	Wed,  1 Apr 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063966; cv=none; b=H/RU27C/aB2KGuIRFcXRzOz1hnKI/xXdUvok6mAowvP+Q0G84Aq/V/m7iFb2DWzJzhD+evnLpuPSt/b9BRxG4OHr86Ww96MvnR8A8V4WGoEETlJXPCrEB+FaGwQJKsDbhuxf/mljPxdE0F0xmN8tLjUGJczuiN9cmfdXPbAbzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063966; c=relaxed/simple;
	bh=VbhVS//m3a2dA3Cgq60pVxrHhagocJ13s7jBI25uvxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EMhB7+vjVQs+VXT+7QMEajKW2D+2PpUzjw9DjweHbb7DlaoJJUq3TCx7uAx8gD4JZG4d3l5xFvjIz1vMPdM0l8z1AShiem73WgVb72p6D/IEie/28X4OQ1foTsEvsWqy9z6Y6e9kog9pvonwBO8PB6mWb/nFqdN5yR8/41QOQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJWEp+LL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJWEp+LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50783C4CEF7;
	Wed,  1 Apr 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063966;
	bh=VbhVS//m3a2dA3Cgq60pVxrHhagocJ13s7jBI25uvxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CJWEp+LL378XTHe/hI7uOCi97JorNoc4eL0ZjD3/n0c4Cv+efGXeNveOev/MoxEOV
	 fv4c36kAxCT/8mMjc5eUwGH5T1+jAh4Ecqg+7EzA+2Rnj7vNAk9NSBqQ3mJDVrlL/Z
	 iVO9X7EC7cY806Klp8lPWPzzpm8SRsjbH5/m3jfdelnWT9mhKr84dM/uFm/QnT5rMy
	 1iPZvm2IsSWgWXll7OVqGutRG1Nwdq42eKwL8bWxyCIoID9AjjBphz+uTl5lGL4ST+
	 xGddFLSlbsqeM2dl44aNlWsZUtqV003IEAiXsR3mUPO8Z+CqBnEkwoWiOGR6qZdPBA
	 xLHFvp2PztCUQ==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com
In-Reply-To: <20260331131916.145546-1-simont@opensource.cirrus.com>
References: <20260331131916.145546-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: amd: ps: Fix missing leading zeros in
 subsystem_device SSID log
Message-Id: <177504535404.145704.16589614427086965093.b4-ty@b4>
Date: Wed, 01 Apr 2026 13:09:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VbhVS//m3a2dA3Cgq60pVxrHhagocJ13s7jBI25uvxI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOcxO8yBvkXi8hmfCEyB+O1YNrxt/7/7bgaa
 hNycoF+bf6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1TnAAKCRAk1otyXVSH
 0M4uB/9UJQVPvhGrRqC172ABs8puB4un3jH6J9NXn6Uhvo8AhgnBtR9hzVAG4FGplJKai0h+pYB
 mI+o27TBTslYEbGIXOHERn8JXh7niKXNeCT7jjAk3T1dtWdB7Yow0S7KFTIxmB6PF+KvmrTKkRZ
 dPZu+fmjVe75rJ/GumyxnuJ8JKi5bmisGm8ZJ8zmKggmtCUewrM3DmfomQSMhHsr1qglFedcbmc
 cJwJuiaMxbw+GagZoK4Tuyw1AZxZ9PCncEvY0DSL+yj73c745GqdspIM5C4NVTphvhwYGVh7Gjz
 Ksx3UyOBCe/uR87GF9ttS3cguqXeNFJJuMuJFeNH368uErLB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 31 Mar 2026 13:19:16 +0000, Simon Trimmer wrote:
> ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log
      https://git.kernel.org/broonie/sound/c/e74c38ef6f17

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

