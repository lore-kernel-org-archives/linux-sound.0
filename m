Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D378287276;
	Mon,  2 Feb 2026 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770075190; cv=none; b=o343PrKBQ7Bhc4X+WtrnLNOQeOmQFBYXzAv8lnrZhdsojyxcWec2n6MvXOrF57frvyLzTxomD82ZT/3tK1/pkeK/L6sV++Ko2IBMaPufwwI8RfwIx5J9RFrMAyPnP6Ki5RoF/9w59C8VrgpQwXKtKrMAySgqLlay6rksvbBAwes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770075190; c=relaxed/simple;
	bh=eh5tVOlTZmiBlgQfny92fb/GJtH8eyR+7MNnbacuOBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IIQZmq2JSFdvd0j5/IFOqFfQhWbeAjyOosI32vUUg0JbaLCREXLqI5jKB7ZzL1spCsn6lxPxV+76xVeWM9cf6lv/Hwqvb4ngPAZ5IIG0nTr8K6XGFra2IT9jXlw1gvTyOhZnv5Lvg1/I1Mm8r6AbiznFkVd0ySEbORa1byVXtpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMtlPAz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMtlPAz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABF2C116C6;
	Mon,  2 Feb 2026 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770075190;
	bh=eh5tVOlTZmiBlgQfny92fb/GJtH8eyR+7MNnbacuOBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QMtlPAz/7Yo7x2Y2pI/Bp5RawUhlHbEfRK2/gv0evW5Se4LBTrPkx8MGsREu2jC8A
	 oK5bo7ZZh6ggEF3lIfXN/MRKpN8d1Cv5l8S1QO7OjEXlE2tijcKNwhrmkQoviSF+v7
	 ia6Lxr/Iqt9qAYVojJGxz52goyNVcvPTgfoSvlYu4bm0N92XF+3+iF4ZnJ166/0jHA
	 g9dRda6LXiakNwX9bVAtbN4yv4OzCcLIAqI4RDA17/Wok6J2k2Zt6lZJrWdF2uN7wv
	 zuNik2IsmrQ+43/cOXd12/wphfD1NWERictjMtvvI58EgBCcYF4WCW2b/kVqqRqbBN
	 gT8elTLP9ZKuA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260131020111.46108-1-enelsonmoore@gmail.com>
References: <20260131020111.46108-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] sound: wcd-mbhc-v2: remove unnecessary
 module_init/exit functions
Message-Id: <177007518848.976577.14331557943658557012.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 23:33:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 30 Jan 2026 18:01:10 -0800, Ethan Nelson-Moore wrote:
> The wcd-mbhc-v2 driver has unnecessary empty module_init and
> module_exit functions. Remove them. Note that if a module_init function
> exists, a module_exit function must also exist; otherwise, the module
> cannot be unloaded.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: wcd-mbhc-v2: remove unnecessary module_init/exit functions
      commit: 090c8844e5d454a898183ec4a7be8a75681ed262

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

