Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765527482
	for <linux-sound@vger.kernel.org>; Sat, 24 May 2025 22:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748126083; cv=none; b=eFJIO9GvFi+sxw9mLX4uDcydWK1j9oDDpfl6lQb09T1ohduMWAS2Q++Q1ppNLuuxQTO53ldooLuBbBbAtK+0dDOci5lFwH/CHNIboLrs3PFhlxSNMc6HiVhZ/wik+xVT811iEcBDzJ7MSLUet9o9wGhQ5bHdmDfukZQNsYeLDO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748126083; c=relaxed/simple;
	bh=hTcFEegb2qiUjAMTfEa/uPeVJKtlF81ctDhTSt/5JF0=;
	h=Message-ID:From:To:Cc:Subject:Date; b=b9y0x3HCr5towx3DUC4+qH+YsllHPbjbLmajJiy8TSvPJSlX2oSZV/6Shm180l8YL/ZQN7QpWOpnoBXJcnOwJ67RT6GN3EuldQkcBkdRlS6srs6Zfb3PHxrJv/3KjsKh7t88V6YjG3tUAj5Y1mAFPUiNob0LMN11wv1uCazNGO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nc9E3IfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nc9E3IfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFB6C4CEE4;
	Sat, 24 May 2025 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748126082;
	bh=hTcFEegb2qiUjAMTfEa/uPeVJKtlF81ctDhTSt/5JF0=;
	h=From:To:Cc:Subject:Date:From;
	b=Nc9E3IfJ1fY17e/9hTUpkhEFhyuwh0vInbLIS4lWXZ3UbMcFFQjxGIaZx8WhJeiTw
	 XxnMvFDXtXLAeoAPNVvcU70PjNgdzNphnhaM2IC2ejJFMdXc9NR48YvWqV4kcBcm3s
	 oPIPnOsgA2Wep1epagwqubKueTVwUyl6oA6BPZ4ZZEkSlRrj1xXsydizD2DDHiwdpm
	 o+FCpuvERoUieQ2f4gronETVsSpe9nwkk4HfEqv8QogR80YR0nICZPZ6noNc7lc8Sr
	 cvpdrjEQ7u/DlpZ5N8TMyDAd1JIqudydYn9ESUt0LQTpLkHl58Jzy9AxXCv7k19XEw
	 +9T8Cr/zGlt4A==
Message-ID: <c5f1dacf2885ff4eb1c04fa0faadd0b9.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc7
Date: Sat, 24 May 2025 23:34:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:

  ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc7

for you to fetch changes up to 688abe2860fd9c644705b9e11cb9649eb891b879:

  ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params() (2025-05-20 10:24:59 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A couple more small fixes for v6.15, both of which could also easily
wait until the merge window.

----------------------------------------------------------------
Martin Povišer (1):
      ASoC: apple: mca: Constrain channels according to TDM mask

Wentao Liang (1):
      ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()

 sound/soc/apple/mca.c   | 23 +++++++++++++++++++++++
 sound/soc/qcom/sdm845.c |  4 ++++
 2 files changed, 27 insertions(+)
