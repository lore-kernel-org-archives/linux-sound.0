Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752F2FFF99;
	Mon, 15 Dec 2025 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807122; cv=none; b=QUMeGYrP9JqoSpfCNqPgZe4zytBl9BTloaq+YpMwJFNR68Sx/XjXme707ZI3QO7GBrgljbtfo2r34w1Px7VMni9oCuuPjtUEhL8cbtRgQeDqbwNwmAU4BoPm+snZ0poTTGYVFNI/1+Yb8fJBFDICfbLPKPF2SMN5bw4CFh1VBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807122; c=relaxed/simple;
	bh=ovPUCVblW/h3OT9xKZ4TnUGxFzza2+qTksmjbs/1YYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uC6bJKk1cXM8G8LpDj4wbKF/HmvxGVXpcpReJ5Rk7KFQ+ecONePl1juJRoPJuihh/4hc/AviwRPu+IbTleO3BFPOaB3zdTW/NtGMRNDHGHx8JTTyTHTf3PWAldPVujoC9xAI12ElxEZWXjBTkpnYpx/akycFk4/GsPBDmnDrTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLkZ5N3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLkZ5N3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781BBC19425;
	Mon, 15 Dec 2025 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807122;
	bh=ovPUCVblW/h3OT9xKZ4TnUGxFzza2+qTksmjbs/1YYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TLkZ5N3ZKCg+UHcEpGZg0CvrjudVNFNNwqfrDfqvvTP6vvPqMTZhwFWzSxu8wfpfG
	 2JQMDXWadq81U/e3H0mJ33wjzRow+p848h/cgXFl2tqOr4gNOxUsZRCgECGZmkO+8W
	 VGrOm+7F0VhnQj+4O29HYn8OBsiY3Suvcwr4Z07VlZfVCvsYsByWo2bc4u0m2v+AoS
	 McohdJp9zUqNJDClw8sDzyysZUCF6K/awkNHoZxZMXvv2AidROagys8n4pgEEfAbf9
	 /YnCQzaEPoH26zqivR1PIXbocr+wxbpUjjldpJq/nF28M3y/KyGUzyyBf/kIYOVzAV
	 4eSn/GxZQSoEw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Bluecross <elantsew.andrew@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251210203800.142822-1-elantsew.andrew@gmail.com>
References: <20251210203800.142822-1-elantsew.andrew@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
Message-Id: <176580712091.161056.16634106161315474445.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:40 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 10 Dec 2025 23:38:00 +0300, Bluecross wrote:
> Add a DMI quirk for the Honor MagicBook X16 2025 laptop
> fixing the issue where the internal microphone was
> not detected.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
      commit: e2cb8ef0372665854fca6fa7b30b20dd35acffeb

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

