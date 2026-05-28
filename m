Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A73E5A1E
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968680; cv=none; b=OlBDmzdeYM8bjuVlusCUPh7V5kbhLSiNp8CeHs7wY7Jl8jIF878kwFezL2eE3nfrBRX5JIlEv1wH0ewO0fqLUk76oKerGY/40AUqOTmBXdtk1DDFxJ5Ypdy+yvCSVq4WqrUR2SvJ0+htGLTeQEIH780QDPbhopWn9MrpXQAVyHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968680; c=relaxed/simple;
	bh=Zqk8DEywL3HMHo7G0zQdMowldPhjHbHWpahwbPi0nHI=;
	h=Message-ID:From:To:Cc:Subject:Date; b=gigfht7ObMNrDNn33/z3pE7vfxreLLftUIbhk++JoQ/PbTkE5bLFN+Ljc/VdJ7vLV2am0NRvcl2bFK7i8mH59JmUXHkF8feQzGm5Hy7Ftla4H19UxL52mykN5r9VNupdHOLWrYalh78tcP1+dOULqCLd83VgSKVhKkkJRKP+73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3T6BNiq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3T6BNiq"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 862231F00A3A;
	Thu, 28 May 2026 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779968675;
	bh=IIhEmWp+l0voi1piL7DpHRW5/30yIJ0X7XVFzUtMa1g=;
	h=From:To:Cc:Subject:Date;
	b=C3T6BNiqklmDe4SwBrv2IdH2OUJbkHaVKNUu5mHqFbHx+07X6Q9mqJlCnIdLPn4vt
	 eM0iyLq6BzlQopMCTEPbJKTwaJ2l6PTw3tD557PmHRmOgEXzYWOcWtrPmriXSdSNGy
	 fxOQNP1yDC6l6HDDNgzMtOm7qyCXHVUqaz/ne3WR9k1nOEgPYPS+kVqz7BbbKoCk7O
	 /FvBsEL8kaxpZgx1roqi2wjNyG36eEPoxXY1QQxV5OG/HfRvVnJIXbustq2EgjPr2a
	 Kz1CrwSNQM/qWQl/v2nBsRczthbKGJGeTrBahYDjoxOBJWOdZLYU/7J9AkxkuVC7I6
	 //Nab4R6Lb2eQ==
Message-ID: <69088c924b372c57eeb1e4e49a2c09ba@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.1-rc5
Date: Thu, 28 May 2026 12:44:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc5

for you to fetch changes up to f63ad68e18d774a5d15cd7e405ead63f6b322679:

  ASoC: codecs: simple-mux: Fix enum control bounds check (2026-05-27 13:43:20 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.1

This round of fixes is mostly Sirini's Qualcomm cleanups that have been
in review for a while, we also have a couple of small fixes from Cássio.

----------------------------------------------------------------
Cássio Gabriel (2):
      ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors
      ASoC: codecs: simple-mux: Fix enum control bounds check

Mark Brown (1):
      ASoC: qcom: q6asm-dai: fix error handling

Srinivas Kandagatla (5):
      ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
      ASoC: qcom: q6asm-dai: close stream only when running
      ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
      ASoC: qcom: q6asm-dai: remove unnecessary braces
      ASoC: qcom: q6asm-dai: use pointer type with kzalloc_obj()

 sound/soc/codecs/simple-mux.c          |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c | 29 ++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6asm-dai.c       | 48 ++++++++++++++++++----------------
 3 files changed, 53 insertions(+), 26 deletions(-)
