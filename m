Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C611F666B
	for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792782; cv=none; b=ZSMfnES2oAeLphz6eXyfNCELFh3AonIguOKEHEeEtSofRY/p6ZyC9WPUYu6qyNgrY8AtY9jrFL9dgGGubJhbHF4XTK/uPx4CK5q6nokc0v6oQeN++L4xoGPWYlNQ04Gp1CRcAsZXzGo8H6Cx2jgUz84iNAjaxCXdLyk3TtQ5NzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792782; c=relaxed/simple;
	bh=td6cV36EouqVa6vuVFszfpbbgNJL8lay4PDU16/r7+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GwPN28e/NIAd7H1NmHdDi6+9WH/rzGCZ+VQyfFgKamXnUSFW5xgnCuGZa83NytdHSckV6ZM28eT5KQxvpTXRsRW3BfQkkqXL+cxRAGSeB+5KYc2VZxFBG2V2I8IW+vH7O4q4kq6swFhkBppnMt1qq5EV1WMbR+42JBg0fSsm/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHXOrdgX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHXOrdgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3270CC4CEE3;
	Thu, 24 Oct 2024 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729792782;
	bh=td6cV36EouqVa6vuVFszfpbbgNJL8lay4PDU16/r7+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rHXOrdgXFK2oT7gYhjWHS15AsClIbrgIsKJq3F6b68whvJTCyOz6SE1Pv+6b8jW3K
	 udV/AJ+Pbo6NCgnmaVPrrRlOWdlBNtcjjketFVMvDLS3YVPTNfgb/wZLoRFm0fFe3m
	 g/Cawgh7MhgQAw1EOJh30AH3I3IrNzpzAokGY0sYc6Kd1p5bj9TxGNaPHoHXj+Q2cL
	 MaWedkDU1wCwbetshuFje5AerohnQdfYcISDZXY7XkWyUGl8ctfJ/NyAOmBVnv/kNg
	 yPrDIdB7x23aWtC//H+F6c8ebL9TW5i2CF/gyj7dXcD9CW5TXFOEyS1Q2WWFo7lqH6
	 rNYcu17gTD5ug==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241024060205.20201-1-yung-chuan.liao@linux.intel.com>
References: <20241024060205.20201-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt-sdw-common: fix rt_sdca_index_update_bits
 function parameter description
Message-Id: <172979278093.523613.7385507740538649386.b4-ty@kernel.org>
Date: Thu, 24 Oct 2024 18:59:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 24 Oct 2024 14:02:05 +0800, Bard Liao wrote:
> Fix the mismatch between function parameter and description.
> Below warning are reported with W=1.
> warning: Function parameter or struct member 'val' not described in
> 'rt_sdca_index_update_bits'
> warning: Excess function parameter 'value' description in
> 'rt_sdca_index_update_bits'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt-sdw-common: fix rt_sdca_index_update_bits function parameter description
      commit: 4d9661e28be13f90db43b889fd15f4aad53de7d1

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

