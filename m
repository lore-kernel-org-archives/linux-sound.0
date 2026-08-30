Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93334EE861
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183643; cv=none; b=mMcESjujl1TWVfv1yM2AhlBR8fH0cyAzT/J7TbRcazC7SCFEP6aVn01lhh6Epc3Rz0O7AxW/hzTpgLER9bozMzFffQuYTZCsPsz19vDFUzqjxiyiqCmTtqF2nzlVTf1+YVOpqLIk9voyxU1CQ+wyzOECTsDHXS30ne60vpocjoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183643; c=relaxed/simple;
	bh=HOdfR2864QBXGrpWZnCuwSD7qf37UtPNY4jt/2SLcMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PaIoCPEnIxBqtGOlFYTgL7k5BBvHFOj9X/7knsRn4s6MGW149ImNj2eqDsxWCIk0I9t9R+HWkSpbwC+lQqCIA2JYtFnO9pPHYSkkO+KDXdmq0xCHRQFECARVng57iJ/clXpQq9vBgz8HLReWbHsVeCFTo+SoB27q4z5V01MsPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZB1PhsxC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZB1PhsxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8BF1F00ACA;
	Mon, 31 Aug 2026 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183641;
	bh=e8DcPB8ibrHR8aT+ZRxWMIzwZRPiD5SDZz+4WIV4x9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZB1PhsxCJTw47qVaR9ASkMXGonPrOfoO+k75YSSTV8yUXxBb91XpnSn7F7um5OE1l
	 tYLim1vgSYHANNKaee6R8rX/XvbKFr8uU4uFT9UBGtACrMe3gDbQtxE0qR5Rl3/Usc
	 9noupHJEs66AbLgs4H33eiER9JR7hojA3q1wzOUr2+O+TFS0A1nb1C88v2CrNBgqVl
	 kgWYl5nL/hresPckOv8Uwl3JLMZQ6Fxvf1EA1URur4wtXRqIpuJCfHncFTxrCwz/9t
	 hhcumqHGvtyVLNlPiQ+SQuUttAX+B6bG/80gHStAt/CWPsfh4TLb8bGR32jOoV9d+S
	 nKat5QJXj7GWQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260815025510.1815-1-shenghao-ding@ti.com>
References: <20260815025510.1815-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: add support for TAS2573 DSP
 functionality
Message-Id: <178812721913.13461.3656701800877937053.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HOdfR2864QBXGrpWZnCuwSD7qf37UtPNY4jt/2SLcMI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlYRV9JYCxFFL9KNt3beepiOkjxG3+XSvRASft
 DoOuCOAy1eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapWEVQAKCRAk1otyXVSH
 0FZCCACD4/X2g7GY2+OS79UFtaH8ZeiPIhMYpSjTOLgRtjKRSHGmEIZ8YL6C0k8WFjtxD8VEml0
 hdifI1omOq9e+qZNS/Oo3Dzbo2Ba6SzNXkZQ2pocACN/YryM+RN1MuU81/IfMtAM0C+WzI51yw9
 fnvnGsOwABe0PB7/TqV7iu8hE9EN7Xy9gWsOP3ybnTOcbs29OezhFiU/GtSDdgpsIUozvFAnyo8
 lqEq+a1xxJBRpLmLlNjWK40W0JQc3ulO3G8KJMLnbhtV3sSZoj4NFXVmyUs46BtgtRzAnuZbkBy
 njn9QMVSjJIY4O0gNfETJN+Yq+IkOhI5lCmKFcOkTxZiKgrN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 15 Aug 2026 10:55:10 +0800, Shenghao Ding wrote:
> ASoC: tas2781: add support for TAS2573 DSP functionality

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: add support for TAS2573 DSP functionality
      https://git.kernel.org/broonie/sound/c/420e2f8c69d1

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

