Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3141C1F05
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759060398; cv=none; b=XV2+EYShbRphkzvn45a44i+U+P6hEd3g3K8ZoKRq329RzkXF7Zijl9t/thOrN7op2UesEsm4Cpt7VuNheyJqTEmboozmxs/GvBWTz0mGR6lIFCgt/v7F1BPNMFqeQdOI1A5bTXaKBWNiK6AaCzJHVwp9uG0J0/O3IX1JNJrkJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759060398; c=relaxed/simple;
	bh=NFCjAJAj87YIkaOWqo28dNdEUgXJC7xFb/unHJYNEAU=;
	h=Message-ID:From:To:Cc:Subject:Date; b=GSpyUmj/HVkI7cLjVAmv0X3cmdHPsS7hnXKZk/Lna/ia4Sx50/DmKoXnIT63yDVlEp8nKL1fg9cBhAfqaYC0MNblXFiyBboHctYcsKhqNF03Nc/Rc59ip6M8ZpqdhZWbTakgSIMVDfd/OPrqtW0orTuc3QfN0C+mSIJmOvn9PSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsliCqJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsliCqJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642ADC4CEF0;
	Sun, 28 Sep 2025 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759060398;
	bh=NFCjAJAj87YIkaOWqo28dNdEUgXJC7xFb/unHJYNEAU=;
	h=From:To:Cc:Subject:Date:From;
	b=dsliCqJzZ8aaGurwNMinDh4e3QAXnSOdEPYd7HAA9jkKnMz6fNP9HkGw+fbffrst9
	 JyOxmg1PtV1jRMLEv+D0/AfJRLE7LGGsBl5fMhTW46I1q6xxM9eSAfurNSvgMDdeKK
	 Q6FGheEq+HyWe4UkpmbmDsr/pm4PDx950yXwPaTTtIBAPkpuLvP8QESQLX1WCSSmLK
	 RPRZsg1HcutTEQSQJmKZIyzNh6f27nxfHb/lawzj+LYk+L+l0MUdj73PuKaacI0/jD
	 IFdNmpsHJNsgDtN3wvBBrUfV+JFR5ZRfm6D2nypiTNvgZcjC1GF6qKnxal4FGw7Lnk
	 N+5CEqbhhwdnw==
Message-ID: <6826572610aa0445785bd57dff718c3b@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc7
Date: Sun, 28 Sep 2025 13:53:02 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 1dd28fd86c3fa4e395031dd6f2ba920242107010:

  ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue (2025-09-17 12:38:59 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc7

for you to fetch changes up to 733a763dd8b3ac2858dd238a91bb3a2fdff4739e:

  ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007 (2025-09-26 01:34:43 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A few final driver specific fixes for v6.17, none super urgent so
waiting for v6.18 and backporting is probably fine for htem.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ASoC: qcom: sc8280xp: use sa8775p/ subdir for QCS9100 / QCS9075

Ma Ke (1):
      ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()

Primoz Fiser (1):
      ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007

Richard Fitzgerald (2):
      ASoC: SOF: ipc4-pcm: Fix incorrect comparison with number of tdm_slots
      ASoC: Intel: sof_sdw: Prevent jump to NULL add_sidecar callback

 sound/soc/codecs/tlv320aic3x.c   | 32 ++++++++++++++------------------
 sound/soc/codecs/wcd934x.c       | 17 +++++++++++++++--
 sound/soc/intel/boards/sof_sdw.c |  2 +-
 sound/soc/qcom/sc8280xp.c        |  4 ++--
 sound/soc/sof/ipc4-pcm.c         |  4 ++--
 5 files changed, 34 insertions(+), 25 deletions(-)
