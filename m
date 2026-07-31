Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251473C8C55
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539920; cv=none; b=CXJAKEXiOfeFDxhLjY2D40iEyUYEnD0TAZOSz4/H2VlKqpuWS5z/7syuHbSWawztP/i04gDPk95nYi524WNsPjmgnmuNweR6jBMcZg9+GU3IyWnbk17Q2snIz0vCJ8vUvbvdVU/Kf4ZZFRmSJLO03rykKE2IqmPPMd0HW26m/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539920; c=relaxed/simple;
	bh=uhYcsUThrcI/Z67ZT0sIsNAkAG6i55wTH/oyO9YHTnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xw3jUPjJMI75Ae2TVn3oYMEQZO5dNARQdaRyyfoW2SJDvWfHKM/85bIJyRJW6ffJjo6wbD+LsnMuvsL8MdvMGlVXG2BbyFeCQ8aaJq+Yb2WmfvOL4N345WPtV8aLpW0PunU/fJsg69vaSyJez783s25X4VmTh25C2lTgOOl6UwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cV6Nqc58; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cV6Nqc58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842221F00AC4;
	Fri, 31 Jul 2026 23:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539918;
	bh=InrF+jK1CLNZG29mZWn3VZDeFJ8Kod5bb9Px1VMv+Qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cV6Nqc58cxWEtPk6PWiNEihd8nGCcm1Goc/gd/80n90U2WSRuQCToXeSOGDoQq0b4
	 ei46Kd0PvHAxRrOolrapR8cr2/ylglogn+9zNg3UL7X7SdRRXh/WKXNFuMedSEDS2u
	 B6viQf7MCMTkLrbwx9mNmPOZbwM21an+QTGBGzEFkoFJybYhMhIxF9NYOVEEpUiqKp
	 rLY2qGdXyjfb5O+6gv7sBqS/17YEUo/zkEBfQKcc2eIDQuf6AFjKGfIwLveBBBdloa
	 cW9TrFNGm1XEPWSLiKtcvzzIpyyZM0ckJYytMsfY06M5izyKPOIEHyJ9m94DhUjsVA
	 pvWp73zVjOuPw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20260730122241.30541-1-peter.ujfalusi@linux.intel.com>
References: <20260730122241.30541-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: clear hstream->running
 flag in hw_params
Message-Id: <178551277514.353541.4440952303055643933.b4-ty@b4>
Date: Fri, 31 Jul 2026 16:46:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uhYcsUThrcI/Z67ZT0sIsNAkAG6i55wTH/oyO9YHTnQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbS1Mwr31Bc2MhtVFO4pIvQ7lT/X+D8V/bFxTt
 rWy39rI2kaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0tTAAKCRAk1otyXVSH
 0PKgB/9KY2/qsj3AgPKlMfBxmh+aRp4TXW/YX5VC7udSZw3JXUD3pni6ImdLGChiyYIV9nAOG/1
 EmPBH3YYeA79jtB+lZ7Yw9cPTpBksI4tgLh+Ys/bwo7zp0j2/W2fOKgXTqeAElSMnuzPB00A9n/
 H4PAmxyh5pXU3CAKKtcrqTECVuHpXWlJVi7Wtdud6tPS0DkdvriLsJO5TMVdgLcPb4EIetSvPe3
 cet+KO/yq17TMAvG452iZe6Pmqaw5agM4KAIULcAqomuCwripO0Y4IA08qXDxr4oAYIQTs0hn5Q
 RVKWCwk8udA5P0Zx9OU6Q6K46BaRJEaHQt2MuOxrue94tPDC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 15:22:41 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Intel: hda-stream: clear hstream->running flag in hw_params

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: Intel: hda-stream: clear hstream->running flag in hw_params
      https://git.kernel.org/broonie/sound/c/dc15652b92a8

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

