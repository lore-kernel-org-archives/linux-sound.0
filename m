Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66979156F4A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137593; cv=none; b=Q+mbEfV32FytmN6blQzhO5xD4RlQuhK93wCq805WHN1AjMji68JZ/IwietRkMIM/n10x58oXOzDjfPPrR0J/+4izIJsllcULONQUCHCOOFfIHX6/wiHazeKU8KLkbsRe91lsNIxD7jidy9G8O1umkVijwWX8xDfKM5QGqM+ajx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137593; c=relaxed/simple;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=Message-ID:From:To:Cc:Subject:Date; b=mKIFfv481kqeAQ5QL2zF2h/bzRPDkh7uYHoo0aRGvVQkX9KOpAIIVRD+fz7P8jxhNaj5Z9QikveYJ1WHvKAzXU+6ezrBo+saZ4vgZfYVmPxvc3eJzGMZNJdv8ZxLp/yQaruK+8UQD6pYNHhtUgsm8FCPnSEjEdGCRB4yPCPcVvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8xVEPup; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8xVEPup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EFCC4CEE3;
	Thu, 10 Jul 2025 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752137593;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8xVEPupMMnVo84wFHlQX92i+oNXrfLOr0pYQobPI+g1Epx98aCN/FnyoMuI7EAs4
	 Usik2iu1R19Ff7uuVSVxTuQgVmiWGHvrNTfzjCFv9wtgS6LGjpU7p4xNMo1ulEe27Z
	 2XiOBARUIOIKDE3qz48U6tl45sjf3WHys1cem1vEAJD3QvEhZVULfRtydpB8oBcjrr
	 hXhKng1grdTUvcRJbw/ceLrN8CRhEsAi7QaGBRJ/0wHUgH4Jy/cAfPyHUOZDgLG8JD
	 VPDzEX1YBfX3e/Jtb+6GPklU3K5+wzJBFxlFq0dNRQXSkD2t+o9cHp7sb/tQGaIdw4
	 SMkXS8JhvOBMA==
Message-ID: <cb13b10edfb1dac2bb7bee3d2f50f44c.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc5
Date: Thu, 10 Jul 2025 09:53:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:

  ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc5

for you to fetch changes up to a609bd74b8680dba62c44f7e6d00d381ddb2d3c0:

  ASoC: Intel: avs: Fix NULL ptr deref on rmmod (2025-07-08 14:54:40 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

Two patches here, one quirk for an AMD system and a fix for an issue on
remove of the AVS driver.

----------------------------------------------------------------
Alexandru Andries (1):
      ASoC: amd: yc: add DMI quirk for ASUS M6501RM

Amadeusz Sławiński (1):
      ASoC: Intel: avs: Fix NULL ptr deref on rmmod

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 sound/soc/intel/avs/pcm.c     | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)
