Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480613B0AE7;
	Tue, 11 Aug 2026 22:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486822; cv=none; b=DWXpHMCU3fpxFxVmcFThbPxIq/w21A/3GR+I+gIR4fw4YBK2H1JXIRWFalvB9ZvgxM21tskA70kjOPCoQxsiV6F4hUokSAMaCbUwEcjH3RvCS0u5+fxmke3y1Z4Fy7rGhR1/LoW6Jp7AacCYLv8yijP4Vp7r+MFzvWBOOztx1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486822; c=relaxed/simple;
	bh=rGzMYl8k8YFPBqs1xAPBOcPcRdC/awV46Xpycd9gg3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uOQl4lMEkcq5TnDFMM138VNDcExvUV7u//bZcou4TcX4r70si6E5ykgyPFp3bj5UPyLdf0Nmjo/jV3l3QfcJVAM3gHvHiy13cy1al77rJTpXUeD9XbJYAuZkB/NdVyGVCNb3KTciSLzjrtzbwhkkthWPceCJgzei8WZ/GkToWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVwq5eBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVwq5eBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8349F1F000E9;
	Tue, 11 Aug 2026 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786486819;
	bh=bgruTceOhBSt6ExD5rb9r1mmzE/uAzzfIg/kARi5H4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aVwq5eBmgS0q8i3fcVBkoeIffemayJOditKOlU0eF2SYaQ89Z3bwxDTk/L6Du+nus
	 xmHN5WASIu0Iy+qW+7ElSveYK53Brr8Vy5lpuLTz/PH7s4a42diUXbxBwT3NhsnRym
	 QYJaB7C2p1NpLovshNr1t6wMa46LfN6hbuPZIDRO7z6PnNwNKFCWJJYoFpPjwp0d5s
	 qdl2Uui3ap2/aSQqju9SEZlQLS6LZR1xcq0gkakwgTDPKpQYtjCfQASn21GxC9loTZ
	 DbWBVNOP2G6w9ezAZpKJ7kD8KKBnu0IqlLZLaXqUHxn4KR8el4oRBlbGd02A07306c
	 jCH45/WWlTzVg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: Mark Brown <broonie@linaro.org>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Wig Cheng <onlywig@gmail.com>
In-Reply-To: <20260805-fsl-asoc-defer-cpu-dai-v1-1-43f7f538e384@gmail.com>
References: <20260805-fsl-asoc-defer-cpu-dai-v1-1-43f7f538e384@gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: defer probe when the CPU DAI
 device is not ready
Message-Id: <178648253837.119683.3220582369920670222.b4-ty@b4>
Date: Tue, 11 Aug 2026 22:08:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rGzMYl8k8YFPBqs1xAPBOcPcRdC/awV46Xpycd9gg3o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe6AgT9j0MeDOeEtLSitTY9e2bQsFrJYbuEaKE
 vEPNuskkFWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanugIAAKCRAk1otyXVSH
 0PUuB/9IwWDS7rJYhTs0Xg/SnYB1CFKANuW6Du7FdO4P/RMiV/8qMf8nFnk2tfwJAEXBZhVqFEa
 ZdOZ9l2E8DN/9s/FbiJLcvrbA9l0ptxpmVKof7aUPFFBqfbX+FXfu68HzaAezloLfhWi+V32cPm
 eEZKxhNMZ0CGfrnD/ld2o4O+/xVFC61FXJZrkkIYk28ITpJF8gxeROA3DuEprnopWDULdImvatN
 6+3v/R0WL0x1eG8hwkqCLODhWelE9pO3IXw5cMnQQDpOADCtBVjN7ho//cz1NlkTGfrQ1+C0Ouf
 sEuKGKmPbh4zTy1dfnEloQDfqggqGSElzcG5Yw0ryvEnj8SH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 15:55:43 +0800, LiangCheng Wang wrote:
> ASoC: fsl-asoc-card: defer probe when the CPU DAI device is not ready

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fsl-asoc-card: defer probe when the CPU DAI device is not ready
      https://git.kernel.org/broonie/sound/c/0286324da660

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

