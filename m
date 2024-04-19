Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233F7E57C
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713521024; cv=none; b=ZKr+yc2UECvBTLB5kPhx2Qg2ForfTcn5fpVegxCXYaIaXlsK/tP+Su5vtOH7E1spEAZrV+FAmHcTJ4jcMYMrhb6XBSBANmO4wTVLOeAUKizTwRYnfFQRxQHtw5XeDQcxowv3JEPFdlp28ie6mch78ZvlM81ot+ejag9JgYnrL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713521024; c=relaxed/simple;
	bh=opOptlTc+JNUZOC86t82zv2K0lTqfWPtmMftG1KitTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=phQkfiRPe2LK78cndydon06GdsJRBJDXUfQpM7baT73QO16La2RWRbUePS0C734Q0RPPN3tdDzrY3jCRr9QBJIXxoCB19Iy05kUlup1NLeZXB7AMbQd1wdmvOHAJ8GDjqfLXqNb1dcibeXIz417PVq0FeoFp28hYIZoO4ij9uPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnntWuWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnntWuWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38191C2BD10;
	Fri, 19 Apr 2024 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521024;
	bh=opOptlTc+JNUZOC86t82zv2K0lTqfWPtmMftG1KitTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mnntWuWiKpkthjO8mhy7jHyC/nqdE3jLJSPwbOXa/f1JbTirdFuswQ5ljgXoDe8c6
	 B/DMqotTFXcaO5UPDGRpkLdJ8BGzfNy/4SoYduB4RZNcXSiCtdW1IDtUh4iNt+8Qpl
	 BxV51VygvIye+ojT/cJFcFygbN1XiG9eSGPPjZLqSOqe+sKT7h2GhdM2IKdWffgHjk
	 EBjC9/bsk/pxrahEU37ARkkVj3iUErordTHfZHeNL34Vf/+u8a7G4bTU8qa39lVJ0O
	 Mb9KRalKtp6I7oSjP7zSNr9eA0Vr02LP2zo6ZywUHdnAW0NIgzWexia/F98aD5Z/Xe
	 l6XH3LI2O9jTg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20240418142621.2487478-1-amadeuszx.slawinski@linux.intel.com>
References: <20240418142621.2487478-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Set name of control as in topology
Message-Id: <171352102287.1723702.4973456420823933085.b4-ty@kernel.org>
Date: Fri, 19 Apr 2024 19:03:42 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev

On Thu, 18 Apr 2024 16:26:21 +0200, Amadeusz Sławiński wrote:
> When creating controls attached to widgets, there are a lot of rules if
> they get their name prefixed with widget name or not. Due to that
> controls ended up with weirdly looking names like "ssp0_fe DSP Volume",
> while topology set it to "DSP Volume".
> 
> Fix this by setting no_wname_in_kcontrol_name to true in avs topology
> widgets which disables unwanted behaviour.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Set name of control as in topology
      commit: 4cbb5050bffc49c716381ea2ecb07306dd46f83a

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

