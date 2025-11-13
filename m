Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5F283CB1
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763063965; cv=none; b=TU2AAuE1njqNMJl+Y5sHQhJZj82V2sPTGxCz7UF/5C/+fkN/+w8Rj5XtwzjqirofDE8zoAAKQ0Yb5ooUmFup3aaExptciEod9i/Q7kQZLttwF3wMvxL+/5e7lxkPAlx3imdfvtm9CIs2V6jSyywexXl/0cH+ku4ZGjfAvgVZL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763063965; c=relaxed/simple;
	bh=DgxwAHRpzhGKnOM66CN/pWdJ+seG7F0kvnk02SRFFEs=;
	h=Message-ID:From:To:Cc:Subject:Date; b=dWCeiIJi0jBAKqKTd0A/3vROhNFcKr87xby4kGWkdXz9LsQzo4wa3X2jQPb8GjTv70zuX88ccMgWPhDMV8Wl3pVBQWTuxymclT4s66tB3sbIoY9KwFwp+LY7JtWnwnfBr4G9mTIX70qtJcO5mARbWvPeVtjfNedYHrfLhTPuuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSIEKYTV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSIEKYTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E49BC4CEFB;
	Thu, 13 Nov 2025 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763063964;
	bh=DgxwAHRpzhGKnOM66CN/pWdJ+seG7F0kvnk02SRFFEs=;
	h=From:To:Cc:Subject:Date:From;
	b=fSIEKYTVm2uY8XdWgVNLyUcl3hp6zcN8jm8B/BZokC28RCWq/4/mR90f+Vv8dSIWl
	 UHoKSbKS1eqQgd/Q90e1DsjlF2U12ddYyhTQA/gn7qbpVEf5kyNRADeQyBxDLFcs16
	 w4Y60hUqJ9Y2l+CcCaYFBlqu5JOl6m/wL6KbnNofNx/z+DgNCz4GN7eqQpDdiQyrbU
	 ItnaA+r5cEKRIx1Elfzwy7hKaQ328EHr+u86yMJI0y2e0vtrPpSoPlDr4WXs8Q/OFS
	 +xzOjo+813NyRVIsrbQ7qk2+gKiEsc63o3Ze7Lp8kOcat6EwP7SoiqmTgNlMdgXgaE
	 i9UhO1AiBp1JA==
Message-ID: <979d5936ff7b727be317ba6d8c3a5e36@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc5
Date: Thu, 13 Nov 2025 19:59:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc5

for you to fetch changes up to 360b3730f8eab6c4467c6cca4cb0e30902174a63:

  ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe() (2025-11-13 00:36:01 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A small collection of fixes, all driver specific and none especially
remarkable unless you have the hardware (many not even then).

----------------------------------------------------------------
Claudiu Beznea (1):
      ASoC: da7213: Use component driver suspend/resume

Haotian Zhang (3):
      ASoC: cs4271: Fix regulator leak on probe failure
      ASoC: codecs: va-macro: fix resource leak in probe error path
      ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()

Miaoqian Lin (1):
      ASoC: sdw_utils: fix device reference leak in is_sdca_endpoint_present()

Niranjan H Y (2):
      ASoC: tas2783A: Fix issues in firmware parsing
      ASoC: SDCA: bug fix while parsing mipi-sdca-control-cn-list

Richard Fitzgerald (1):
      ASoC: doc: cs35l56: Update firmware filename description for B0 silicon

Shenghao Ding (1):
      ASoC: tas2781: fix getting the wrong device number

 Documentation/sound/codecs/cs35l56.rst |  9 ++---
 sound/soc/codecs/cs4271.c              | 10 +++--
 sound/soc/codecs/da7213.c              | 69 ++++++++++++++++++++++------------
 sound/soc/codecs/da7213.h              |  1 +
 sound/soc/codecs/lpass-va-macro.c      |  2 +-
 sound/soc/codecs/tas2781-i2c.c         |  9 ++++-
 sound/soc/codecs/tas2783-sdw.c         | 20 +++++++++-
 sound/soc/renesas/rcar/ssiu.c          |  3 +-
 sound/soc/sdca/sdca_functions.c        |  3 +-
 sound/soc/sdw_utils/soc_sdw_utils.c    | 20 +++++++---
 10 files changed, 99 insertions(+), 47 deletions(-)
