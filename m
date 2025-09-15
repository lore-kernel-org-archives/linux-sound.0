Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED762FA0F5
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937084; cv=none; b=IwujiivgfrMt5WFO+5ZaZJWekz/twV/yMDao3vaWGBXTniriDcaqk9jynfys85HrKkPEhMg+OyNO6/r3dLfRRiMyu4WnPqRXv+/6ZufIHxMGuUD1bBu7Qw//r+vj53E/Ub6i1dVMXriU4coLkat28c9zMyPskqWd1orxe7Jqo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937084; c=relaxed/simple;
	bh=Wx2LDwABUKMWNjegwdnFHiwXrUxrsAe7CnFdWUaO9gA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c/6sygcOp3haAquPSSqkT56BZkQ9eQjweN5F/wophJ0d7gp+wu4AyQ0kjkANTxRUfxKvJxjhccPtMtngI0e7Hv/2UmF7yvpr2gkFmkdUAwoJPRFG0HG0RCeofX+QUs4P10F/QkuwFFnxqGJX34sZq8UBWf4P168PH7kBhN6OqG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlJJiZlQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlJJiZlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE78C4CEF5;
	Mon, 15 Sep 2025 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757937084;
	bh=Wx2LDwABUKMWNjegwdnFHiwXrUxrsAe7CnFdWUaO9gA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QlJJiZlQ5XuUFpO28kOcAdxBxkIrXzM+CqHdz4KjSeRzuPNBYMYH9DDhAXBXUxeaU
	 kctNMJ+D05WW6mbwktQ0mpdmydrKlgjGpRCvd6nxq+Zuk0r6MzsYb3scrq7sCyoTZG
	 K5E/AuV5hfeqAdqEz7ynw4kxwlBC+bQdxA6WfHh2y8D36EBhyr0b/bWK57M4OKY4n5
	 5bp5S+pnY8YQZ7nTj9fYVRcy53P+kg+tW5jftSfzYNdHHTMwUSrmiMNorS8oPxUILl
	 dGlH6P19EQttQ0XgcZzaYU0YdRCPYRAubX2U6OBXdnSB9x3oFN9O45RTehe7i7Wa/U
	 gNjh1vOe2DKKA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20250909092829.375953-1-amadeuszx.slawinski@linux.intel.com>
References: <20250909092829.375953-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: catpt: Expose correct bit depth to
 userspace
Message-Id: <175793708272.33380.7152017156373590072.b4-ty@kernel.org>
Date: Mon, 15 Sep 2025 12:51:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-56183

On Tue, 09 Sep 2025 11:28:29 +0200, Amadeusz Sławiński wrote:
> Currently wrong bit depth is exposed in hw params, causing clipped
> volume during playback. Expose correct parameters.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: Expose correct bit depth to userspace
      commit: 690aa09b1845c0d5c3c29dabd50a9d0488c97c48

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

