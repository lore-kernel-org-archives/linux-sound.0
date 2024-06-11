Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A411720
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122367; cv=none; b=MSR2YvhDSUcQTQvueIWfelrLrZlOy/Zd+CWdcos40KOKajx798WkFEyikIKjiwtrjkBFGLjvViQ0TmWZlt67WhEZiHLgXrrcRkkw7Vq2LrRz+j1Z//IQg8PZkkliX4sYaNjh07DcwWQKXA4PSsk14QIVOXnyE7bABnZ1AO9WvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122367; c=relaxed/simple;
	bh=lVBMd7pm9KnAnJVO5KwX7pdV0VQZjI/8zsuxqHZxuZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eygd6XCaXSDU4q+nzwQNsU0y4mY+iM6eTT2yklxLfXoF4ErZrRhNAaQYn/5a7SjEjoWkPs/hYaZA6XKSy4xavat9Z4LcxUDM/hu9NN0TYLhFv4BmrIex2hU/nVIyMLL2wIuDGcPFIm0dJGtEIi5TN5vduuIFhrrEZewVLTEwflo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9GqljWc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9GqljWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C61AC2BD10;
	Tue, 11 Jun 2024 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122366;
	bh=lVBMd7pm9KnAnJVO5KwX7pdV0VQZjI/8zsuxqHZxuZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c9GqljWcvRQt3/EKlJttpU1QC1HOVjeOWs6uRGNz23eqhtMpvApL3cKvpnh1z4J2A
	 8A7quZLUGinBRsPmjn/XBH8XuBMjWQp/oyhgXFwztx/hn+sK0B/M/7qqrQXchpkm3+
	 PJ/YknSmL6mv1/z2T03VkMNKHWP0ESjYYPBoAGve501O22U0HiJvCTN0VYUKKL3/+G
	 Lzb7V8npJrQMAbmRLv2oIN2UMmVP29QHLS/svL4E88wQyWH9LhqMvr2bNRUH8Prs5i
	 QnVu43UYPJ31ItOgKjRv1SOOv75MHwVE+23vlqpfSHlHOgZ+XpBTvmLFBTOmanZyQ2
	 Qlb5UrbXwKXqQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 Jason Montleon <jmontleo@redhat.com>
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: topology: Fix route memory corruption
Message-Id: <171812236450.201359.3019210915105428447.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 17:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-4c370

On Mon, 03 Jun 2024 12:28:14 +0200, Amadeusz Sławiński wrote:
> Originally reported here:
> https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
> There is various level of failure there, first of all when topology
> loads routes, it points directly into FW file, but it may be freed after
> topology load. After fixing the above, when avs driver parses topology
> it should allocate its own memory, as target strings can be shorter than
> needed. Also clean up soc_tplg_dapm_graph_elems_load() a bit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: topology: Fix references to freed memory
      commit: 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
[2/4] ASoC: Intel: avs: Fix route override
      commit: fd660b1bd015e5aa9a558ee04088f2431010548d
[3/4] ASoC: topology: Do not assign fields that are already set
      commit: daf0b99d4720c9f05bdb81c73b2efdb43fa9def3
[4/4] ASoC: topology: Clean up route loading
      commit: e0e7bc2cbee93778c4ad7d9a792d425ffb5af6f7

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

