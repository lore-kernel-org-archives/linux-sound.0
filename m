Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCF62C1AC;
	Mon, 26 Aug 2024 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724697353; cv=none; b=U6PIRR0TdR/LSHZLnS0KLR02xlp8AOCMKyq16oByt/BfDOGJug3sSjAmkxuosN2tUantEweiBjkKnFTdQWCiBIM24Q9y5FhV3xNoTSV3maBseIxZqCTbbjSBoSn97UygBbplL9YlOBn4Icq30qAIKamI1Btal5y+3yc3HmVU5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724697353; c=relaxed/simple;
	bh=HA/v5zgy4DHi+5uTbfK/HrLL2SNoyCqplIt7+Weobgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XkuhGCVa0invzdR/N38+ColUjLw743Ryt7iKPWiZZntkpFQnyGJocOp6MkrVVC5QJoI1WLJLYTuV6ON8QrsyUq4BeopLH2W/XD3LaBTMGZUIgyJ9DKcweCjWWkIQTSPGjc2VWs5W362Zh67DOwbnOonRdhKs+X5zvJdwMECRfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3IpXf8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3IpXf8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7951C4E699;
	Mon, 26 Aug 2024 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724697353;
	bh=HA/v5zgy4DHi+5uTbfK/HrLL2SNoyCqplIt7+Weobgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X3IpXf8lmxmlz0edzR+ky5uJLwgECZ2LTIbcJ2CZaMOb9M15MU6abVnMqQ961UVmj
	 7Tju9+Iex7fwpEToMsy8ZBmpsdI13wI6p65vRYTqgV9nX76jCzIZZvPEZjMrginhEg
	 s5OYhf6fVqpvnPWIDQwOifRizDZ9YsqHZKOHoXz6WZYTeQLeiwAaL2L5KbSSwYhJ+E
	 EfO/9seJw7mwtBziY7RurYtv3T/dFWH4Q8NskMih6XhJfMISmJPw50dV5kXP1HDmmT
	 jT4kF7fRbGmCIZ/P2ik/aNw3qyVIHZfMK1jhMDbzIw0br9fEc3KOTfHPiSBZpzaaBQ
	 lbdS11mmNrOqA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, perex@perex.cz, 
 tiwai@suse.com, Shen Lichuan <shenlichuan@vivo.com>
Cc: kai.vehmanen@linux.intel.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
In-Reply-To: <20240826054402.58396-1-shenlichuan@vivo.com>
References: <20240826054402.58396-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v1] ASoC: SOF: topology: Use kmemdup_array instead of
 kmemdup for multiple allocation
Message-Id: <172469734855.858128.5123974810098582904.b4-ty@kernel.org>
Date: Mon, 26 Aug 2024 19:35:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Mon, 26 Aug 2024 13:44:02 +0800, Shen Lichuan wrote:
> Let the kmemdup_array() take care about multiplication
> and possible overflows.
> 
> Using kmemdup_array() is more appropriate and makes the code
> easier to audit.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Use kmemdup_array instead of kmemdup for multiple allocation
      commit: 69a8d0edb9d78bb5515133b7c08f399d6eaff37a

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

