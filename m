Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210573812EC;
	Tue,  9 Jun 2026 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994453; cv=none; b=dcZeaoi46miIkds8P+S3xGsBANEonhOJyqnyb0uOLb5tphLmcP2hXsTR2Ns6IQiz/71JK2VW3TNK6o+W9HwnEMAFeCXBBKxEzCNVZ3/xdxhf3DXppDOpLWx5t58B8OFn8ec7owv7h/weSyDL/uwRgwka/gxuXLlxdCAI5FBQKQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994453; c=relaxed/simple;
	bh=5sIMoOQ5exkRPKpLp1koTXlALDHKdwD9XnlN4S2FEjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kwBTTQLUhntCxH/KJuU6nNjgpDkmVKszkUD55HYcptWwdieEmUjB3domTQSLSyqAeHa3i1UQokY31ke/PsHhYKnl1uaHCfQpGKMG5kax5ql2KUD8yh9iKXm6tAKchUOg5EIMSL7N/SiFTNFXrPQm8AHLKSIKi7hrGoX7e/VyfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yn2MQW41; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yn2MQW41"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9039D1F00898;
	Tue,  9 Jun 2026 08:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994451;
	bh=rbEpT462owpDzBUAagRIUBMtU795xtzBSaGb/bW0GsU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Yn2MQW41cObcapq+pyfV24kESZur9kdhufO74l1qWTnyM1SWLIjMguRzLSdmnt1Ri
	 X6bksC2kUUgjL7X3ORsA3aOLqTxuIqf1/d7nYbAjuBlPnNyh0kcERptgXGRXB1mIxr
	 ZRG8cqg0dXb20rEUP9nbmPcsuAxJ5iuLCPZ13TWGEQNdPO6r05slv4/jtC8wOsMDp2
	 D47V7ddLHjHyoET6xwhKBadGVzLVNUb6LXvqLeLxEXw4spDb0xL36iEGv0o7Bhau5X
	 hnJoUcFdCEWqq/+ZpPcWPSIzooQzxi5MfjGPUyLDudMZE88htUzGO06E4nTw9xq33g
	 sdWJ3+i9Nu77g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Ma <aaron.ma@canonical.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Hasun Park <hasunpark@gmail.com>, 
 Kees Cook <kees@kernel.org>, Li Qiang <liqiang01@kylinos.cn>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20260528082110.915549-1-aaron.ma@canonical.com>
References: <20260528082110.915549-1-aaron.ma@canonical.com>
Subject: Re: [PATCH 1/2] ASoC: amd: acp-sdw-legacy: Bound DAI link
 iteration
Message-Id: <178094245906.26834.308028408805438644.b4-ty@b4>
Date: Mon, 08 Jun 2026 19:14:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5sIMoOQ5exkRPKpLp1koTXlALDHKdwD9XnlN4S2FEjE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9GOYXA+6TIWMKNITVnLaeHwBf5CJL57lDLFD
 XVNJyYP+wSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRjgAKCRAk1otyXVSH
 0AmlB/0c/HzehIDjxTJ2vQHuzZdgFOwVyHGVVpKsIX3cZjbgnlGHg3VHeBvQkWT7+PfDHytDqti
 Z9bhntqufs0qxdCprz17AFXPzGjXYw3j8h3W7U/Qd41NueubfeyF5CCYRr21LywR7zQL8OKlb7c
 IQzFIZXb7mEjXyZ9xKcVpvl8V82EFtJABOQyeAdEAcq1StIhPpHoMBYqvl21cilsekJvxYgqBhK
 JBI+bQUgFImQwFiuAX/x0Q7ml7uqUPkavnzCOJ6XTLU7EGtmlEIyp39doHm/Si7oWjx83rT+lZ1
 7usg4j5BFXLvzUjK1grvOD3DvzvRyeF3dO2obiPhLGr54AYQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 16:21:09 +0800, Aaron Ma wrote:
> ASoC: amd: acp-sdw-legacy: Bound DAI link iteration

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: amd: acp-sdw-legacy: Bound DAI link iteration
      https://git.kernel.org/broonie/sound/c/d49ecdf327cc
[2/2] ASoC: amd: acp-sdw-sof: Bound DAI link iteration
      https://git.kernel.org/broonie/sound/c/4d992e63f52d

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

