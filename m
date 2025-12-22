Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42686348
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426574; cv=none; b=WgSpJVVz7AmKw0W0whZNbTJwUIRfE+ud+l7Ilc1av9OrxExZo3o7tBUYu2bnndLEA7HKrHShvGboAlG13rQjGeSc62rMTbHxhXLN2zBDy/IJmr7J+5Cj6xYdvwKblw88xqjJRvIO3Vfzygy4u4h52TkRrVxt4b9xOvxf9Zqxliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426574; c=relaxed/simple;
	bh=yIo6r9Mx1xOtJn34ff1BnQBemyFD5IRH/uo71uBkVNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C9mzbTrePGJfZGgtFfemHaWxx/QuyBpKlPW/7PRRT/wM8oprYDXCFKWOOoBEg3ydsn90ngMAw8z+W3AqirBZtZ+DQ8a+qjvxgpG3UV8l2RXaa/MqgbUv+WkZQaLK/Oa1qrgnkncuTQyRJeQhtra2tv3yz6mt2yQ9q/9m1PhGhPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoT8MHCA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoT8MHCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C7BC116D0;
	Mon, 22 Dec 2025 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766426573;
	bh=yIo6r9Mx1xOtJn34ff1BnQBemyFD5IRH/uo71uBkVNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VoT8MHCAIaCDXMmj6TCdlCuVIHYQOgjeOkdcuo8ZVkIcNJVD1JeeRJlGRKLb1YoxG
	 mjfzKByG/LbvGksSOrXzOSC9XhPq9AqoItjnTNf/X+03SDpEJ+UWiZZr6BsUYFTUK1
	 Ea5LxX6nJK/yJT+RunXOhJ0M+X/mHFkEC8090vP91Xk3eeaogEE8PT0XzTWAqCx9+w
	 kw3gOHrcE4R1nsCA5bbFZ+i9eOa5V4AltJ+gSzK9AvUY/yX1hKLu7r+z7qqWdHVSYW
	 w3UOCsHneBV0dY8Lc6HKdxflkb8m7lBdb6eIUSBLJPG6ghuVwpYNRejDHCGLaELdd9
	 VSbeCrXd9FtjA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20251219034937.3630569-1-yung-chuan.liao@linux.intel.com>
References: <20251219034937.3630569-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: add -bt tplg suffix if BT is present
Message-Id: <176642657215.929385.5693383029337352149.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 18:02:52 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 19 Dec 2025 11:49:37 +0800, Bard Liao wrote:
> We need to distinguish the topologies with and without BT PCM.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: add -bt tplg suffix if BT is present
      commit: a0c8ee09f94ba5a29ee5f7557eb2bc100d5e739a

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

