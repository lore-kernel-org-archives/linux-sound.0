Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D366F369220
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698124; cv=none; b=cskwkxQ1Saa8d6NTlbjtq3YmgV+z6qnhJ4agpP2HEpEihxTsG+AW9wAc+Uk7anQdCOXw+0Ey+rhnSGvtd76dVyKyRAdbxWKSKRHC/Z9ymtFbPvgLL6abuf5B13w4y7DU+Om4+KKBBmm5DKxml/t5AMijlUGy3x1tJTLgdFlBALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698124; c=relaxed/simple;
	bh=bXzX30xhLq638T0FxegcbXbJlc8bGnj+5gBUbCDi2RI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=awbLgCNP+xhwsdWxJpYlbCnVSQpKbwOBSelMN62ykJFhzxhVnvWySneb2Lcj55QEodQA7LdU4gKxU8H805VOIulP2TQPmZmDlmzGhb4kgfYdn0y6GA2HZdTaY/e2kV7DKHDaYq6o84TCPehA3fxQ5eRHlIQBKAtjjr9V4gqMYSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTQZgm8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTQZgm8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF73C19421;
	Mon, 16 Mar 2026 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773698124;
	bh=bXzX30xhLq638T0FxegcbXbJlc8bGnj+5gBUbCDi2RI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rTQZgm8OaHClZ+NHGPZW2QGC8Kv0gXgPraFn5Kk9033xMZojmp6h8LFj8ZgavtGNW
	 /Weh2g8m3oNtCbpsQapZCfbSobnGErvYsTzV3fDVPr813t0NIHf53JtaFRl4kOgwPK
	 3gE6xQCbO5J0EC1DLfW9iQ/41Ml2f2EAlpM8HaDasvMPZHXMbCMjG0wfjF6VDTqTgJ
	 EqVLnB+uRzEMNOLAQA8IaABv+wUtvB6+jUkKLoxN8DLaoIJ2M463HQLdhMElfezURU
	 Tt9YGblPWO96Y6t8CAYQGVi1ijZQ6ZIG7ZW+JMLm8ac05qcwvdvuxKwGDugGQQKINE
	 pQlogUxmzsOiA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
References: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: soc_sdw_utils: remove snd_soc_sdca codec
 name index
Message-Id: <177368496591.108465.12831766793021698212.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 18:16:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f420f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bXzX30xhLq638T0FxegcbXbJlc8bGnj+5gBUbCDi2RI=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhswdNV7Xus8qFL232vfcfNllnxctUqxKsiHcwcfcfeWaX
 Xs+fePoZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAm0vuF/b9X75/gTUstHd9s
 VAvb8MpHt+lrgfzKrUJllpYcsobvjDof+f3N/X3gxPQ0y7dBsUGivmk5d/4yri/TSzfPSfjmKpm
 oVqTyQ0AqtrTzSq+xFn/aynenp8xb7Gu5sZTt5p1/dnOSlknEKHcrMyhciz0b8aHou+ceFZ4qef
 OjR65bhTi2tPgaNZuE97+bcqG5alPA23NH/B1PyhpxlTm3izoIec2t3RcpyCm+nWd/yuMZpZULe
 L3mbOOd/KmzqzQsQ+MSZ+erkgz9g2bW08XFnyjP/BfaUzjPUPfCKnb+OTeFXtctYD/ROH/htXwB
 x5akF9a7GQRn296MragL8nkmtCdNrXpX3jG3bUezy88AAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Mar 2026 09:03:06 +0800, Bard Liao wrote:
> ASoC: soc_sdw_utils: remove snd_soc_sdca codec name index
> 
> The index could change if any endpoint is not present. Remove the index
> and let the machine driver get the right codec name from the registered
> components.
> 
> Bard Liao (2):
>   ASoC: soc_sdw_utils: remove cs42l45 SmartMic codec name index
>   ASoC: soc_sdw_utils: remove codec name index of snd_soc_sdca codecs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: soc_sdw_utils: remove cs42l45 SmartMic codec name index
      https://git.kernel.org/broonie/sound/c/1029df4de882
[2/2] ASoC: soc_sdw_utils: remove codec name index of snd_soc_sdca codecs
      https://git.kernel.org/broonie/sound/c/ac5f5cfc98b5

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

