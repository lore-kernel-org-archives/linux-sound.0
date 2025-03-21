Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C80A1A256B
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567928; cv=none; b=CrN8laJW6GWuvEVluYLldfO1uBZfz408WzLX2QEociEMccJhjmHB0PsAZaOu6gk3Iwu2A9t9f704PXiarrA8Xjxhk8jsi8sUCY0Ulyv+bVHf09uAbDVBL48PE/qtm4zb2FgkPZp1SEZeJP9pXLhYkE7Zj/193ZqQXNFEWYLyExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567928; c=relaxed/simple;
	bh=hSqtL0RwN1bx8d5gieXRycRtrnD9GRk3EOBATz5fZ4Y=;
	h=Message-ID:From:To:Cc:Subject:Date; b=um/+g3gWiFyc7Yhf1Xr0t6X3K+mHz4+khQMaILrXRYArtLlncINbx+pSnpC/zhkOeioIBStyt6qtlYcH0SdWDHv2jNuQR7Z9WYrJNhuBRRgbrrAotru6PDyuow1Ifksmb8m3rYtBwTjtA4btPBaPfWzec8+UwvOwcXV7/qAmLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+4dbu4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+4dbu4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C06AC4CEE3;
	Fri, 21 Mar 2025 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742567927;
	bh=hSqtL0RwN1bx8d5gieXRycRtrnD9GRk3EOBATz5fZ4Y=;
	h=From:To:Cc:Subject:Date:From;
	b=L+4dbu4Q9oFRwJS/HCPYMxghZnmdJFOXTOuBhnDt7dCSkKyaxUbMS5FZJrMQN9Jed
	 tgcUb+lnw5vkBio5UN1qS4QD8uWKqBBQeA2qKJbQhS9qWG6rMA4e71ETZ0OJWNSN0q
	 yCCvsAV7/QfD3fF66COMk4nY7Lq630Sl4VrPRh40+qZYFhrzrIiwhlNnn7uNbV+H59
	 KaXBqZOdAOl1yp2I9A8iOwb2HICDzRDLR4GLBzBlePforg9QEi6eWa+yolvYt+2kY9
	 61imeNCdTYOen+EBELRqMwatfKL/bCH25Hftct3IYjGUIEYYf9LX40uIqsAqt573Tg
	 3Z33bdM0jVzZg==
Message-ID: <2e7905783f8f3541e854a13742ff1c22.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc7
Date: Fri, 21 Mar 2025 14:38:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 658fb7fe8e7f4014ea17a4da0e0c1d9bc319fa35:

  ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS (2025-03-12 16:12:24 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc7

for you to fetch changes up to 45ff65e30deb919604e68faed156ad96ce7474d9:

  ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible (2025-03-18 12:27:34 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

A couple of small fixes, plus some new device IDs - nothing super urgent
here.

----------------------------------------------------------------
Frank Li (1):
      ASoC: dt-bindings: fsl,sai: Add i.MX94 support

Jayesh Choudhary (1):
      ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible

Kuninori Morimoto (1):
      ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()

keenplify (1):
      ASoC: amd: Add DMI quirk for ACP6X mic support

 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 4 ++++
 sound/soc/amd/yc/acp6x-mach.c                        | 7 +++++++
 sound/soc/generic/simple-card-utils.c                | 7 +++++--
 sound/soc/ti/j721e-evm.c                             | 2 ++
 4 files changed, 18 insertions(+), 2 deletions(-)
