Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D461F3FED
	for <linux-sound@vger.kernel.org>; Thu, 17 Jul 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755563; cv=none; b=DfRzkn6ZXQAh9+qMuDgWO6YD6SNtEskfX7D8X5kmnNXJmIyaaDCz/lx2zqrjTtyjhvZag3yjWpy5umNyLT2nXlzpqQcMQ+MboU5sTuWtFBCaJ2faej4ytFAKpB9YVZDauiJOHZ1UAIYwZJbI4Od/L5d6dM0NMUA0NykkwD3B3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755563; c=relaxed/simple;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=Message-ID:From:To:Cc:Subject:Date; b=AqRcJEaAyPGVENKCr9oozRwAR4ZgDfHvSV8i7koGzqwfh2s8HTGIh0KPXyPeC6VxPTmfpaRph8CsMk3Ua2JJhHa64/rVFxtHo/Sx/CgLKhi7INMqQ4kAy8my27R/7UYP1fGxEjw8Ymo1ZC/n4iAJaC1SZ5ZcZ4O1/wV+XdQPidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw/DxDhV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cw/DxDhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F18C4CEE3;
	Thu, 17 Jul 2025 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752755562;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=From:To:Cc:Subject:Date:From;
	b=Cw/DxDhV4ajCwPtyxeqOpUiU8UWlKE4YSZG/HD2TFDxyAR7nhTWvJOovloGQWa9LJ
	 LsJBjWDS0ELxdTOtZActzyx88np+lksDFR1lhWDJSIgUYq7kg0L5AVEnPQ0SIC9j+P
	 ehkNdvWn0dXc5jMPQLoYlQf7o/HZh6lC5Ms5uFYr0HAadFIQXQ1IWJ72VVyhGjdtEy
	 fN2FObdKLfYL9tvLTbJXGLHcoeEqC2pj4AwCIj7uKiDHfZPZHwqtU6YtGjxKVR4DQu
	 VthvU2zbQB3PLK1UFFWuTF//yEz7CzpFfhZMPJJF+Np2KfVm7171KvRkXAotfi8ShU
	 bKY/1BqFxXA2Q==
Message-ID: <1814b1eaab5c1e3c09807b0e2862b706.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc5
Date: Thu, 17 Jul 2025 13:32:38 +0100
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
