Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01231EA65;
	Wed, 22 Apr 2026 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776891590; cv=none; b=qG/M895ENbjZoKbjoT9wO0m9ZV+/rkIhR321BlAQzFIF1J1jb5gQGfAbG7M5VRS0SW47QyDBsX0sdRDXgcRe5BVyeVGPhHOrwksGKTprBMJQU/CynyC/9enPd9GBQu6Y1GsLGhYUc8IJX+Uz1xjVy6ZXEhmLZwHqX85ZoSDff3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776891590; c=relaxed/simple;
	bh=M5RsCE0TEqbxoMSQ1p9Ml6g36oMexHF5KHWHyQAkR3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UJXJK3W9kl8asIcRP42p1qAvLTWWLMjg9itDJyU6l2pzSbh7CkMOZewrsYoOCPa6ViLt3zzePp9wz8M7H5dHSbwwqfDUiMjWotgk8irb8mO8IGcw5T11haqBakcVqZBgksS5h8Enjzo6LSR4nSdc9yMn8qEaj5pbhLJjibfyJcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfY67YR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfY67YR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3B3C19425;
	Wed, 22 Apr 2026 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776891590;
	bh=M5RsCE0TEqbxoMSQ1p9Ml6g36oMexHF5KHWHyQAkR3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FfY67YR5us/+wOBlJz+MTMSd7DGLxtlQF14kKB2cDMQJevscVJ5I5PvNDYKC5ZPRw
	 M998FrR7No3SgPFuHaJm9EvoDSVJHtD3l9+Ze/HPLw88OmDh0n7SDltmOFtcGKf+b+
	 ukib9I0MnzV3HWEpB98s5czNGRzFRHnbOqlbVNNwha+KLduFhKB4npQZxN5O5+gG7V
	 ffW/jI3T+fu9IMj84NHjkkfoIIiuSo56Ifpd17eUPB3DYbMnDJfYxc9O/s1FdMSU7A
	 cenmF4arot6RRl5KKZIXzz+je6vGqOxWHih5XHyrFBM2Sc2EuCqsstS/0yXL1DmgGD
	 pHSYFnTukByfA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Baojun Xu <baojun.xu@ti.com>
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, will-wang@ti.com, 
 jim.shil@goertek.com, toastcheng@google.com, chinkaiting@google.com
In-Reply-To: <20260414015441.2439-1-baojun.xu@ti.com>
References: <20260414015441.2439-1-baojun.xu@ti.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS5832
 support
Message-Id: <177688897222.36226.274253868203239470.b4-ty@b4>
Date: Wed, 22 Apr 2026 21:16:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M5RsCE0TEqbxoMSQ1p9Ml6g36oMexHF5KHWHyQAkR3k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6TbCYQbceaFGcfpPamgGKidcFgtztfK2UYdeu
 sRT5dtLBqKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaek2wgAKCRAk1otyXVSH
 0JRIB/9Ouhp9BP2sm72lyUe7xSDx18QBlrILWouiJo89yb6GZ0QzaMaKwh/msx0fpEVa04Zmfof
 6Ut0X9eyltMaug3CA9wa17tL3YdZZzhumhReSEe4nY/UImkrUKRJoDtsJXmO+Tq6nags4RGdI2w
 H/KPcsZQtb14rm0J+0GjSHOmfgauMrwLZ8YsrCtnQFn+7Cz+hCXFTVeppk9aG1N+v58rrm+6Sd0
 K6M4N9LZg2tgUcckZd0/nxxwEvdZ8XXsw3XrKnp1OAQCuxntS705Acwk5adIq4wsEmMgBLsKcCp
 PN/sdTm5Ppqi1rbEjqEupFSTPHZWoSztTQpYmPxlE9VOwnPx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 14 Apr 2026 09:54:40 +0800, Baojun Xu wrote:
> ASoC: dt-bindings: ti,tas2781: Add TAS5832 support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: dt-bindings: ti,tas2781: Add TAS5832 support
      https://git.kernel.org/broonie/sound/c/6d619f739703
[2/2] ASoC: tas2781: Add tas5832 support
      https://git.kernel.org/broonie/sound/c/1f95fdef685e

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

