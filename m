Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22931D392
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438627; cv=none; b=I+bG3uPsQmQ6pegZV/qOeaV0uqJPiJPXkEtMKbO+tbCD4JbGso40q3d7C9kZBZ44Uresm+zQbQSI+4IiaORqQnA2W2gkB3HzsuVwnWWehxlLs71fnnrdtt4ELYYkWKRgrNP9lmu0vgmHSa6le+bA4IrqBhkWCjF0qQnkPgsAilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438627; c=relaxed/simple;
	bh=IXktR38FRKVVGS1JlhywZetRZtTTWel3jptPryHejUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G3HaVqG91osnsvS/V+MoSc/yBdAhwt8W6OogBFX8mRWebaDt68GwDxcNS9EBAUE3fqOhbKNFl5y0NoQb0x5zrEn8kfc7X8StFQOnYhbukHESCvPpBZ4ZaQ/TsKUwfzKV8kp+eLgm5fitj8gVegWl3k5K32wKKVTowS0Ba2yDZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Idm0fhPW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Idm0fhPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4A0C4CEF4;
	Tue,  9 Sep 2025 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757438626;
	bh=IXktR38FRKVVGS1JlhywZetRZtTTWel3jptPryHejUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Idm0fhPW5IK1Z9Q6pppm9ktS68llK+qMa0oxO4cepvQHVAqW8ak89Y+qBiH5/ijYj
	 vnW6+JnIEUVXI4MRyWysSZ8zI0BZqsk93jQOcIzDMsBd/at3MJAibsBb4hbudlcVJT
	 LgLXFtHGwznbK71kiHQ4gNnbDC0OnAAQJ2DN96dtApVM8UjK1koR7+hd5lzQo67LAb
	 iqKpA/8oG45mWdQRzWAR9114G6Ncg3w8UTbCTJaq5hsBwKrss6J9r+WyeOPCgQk+3A
	 Hu59X1Vz7BedVujLNOSANVy24aPgOtvcy6k1O4t1YCp86+WSFupRrHDDpx1KmVR+u5
	 75ree3Yi86FDg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: renesas: Use guard() for spin locks
Message-Id: <175743862585.300420.16715431733353356077.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 18:23:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-94e36

On Mon, 08 Sep 2025 02:08:41 +0000, Kuninori Morimoto wrote:
> This patch-set follows Iwai-san's guard() update on Renesas drivers.
> 
> Kuninori Morimoto (4):
>   ASoC: renesas: msiof: Use guard() for spin locks
>   ASoC: renesas: rsnd: Use guard() for spin locks
>   ASoC: renesas: fsi: Use guard() for spin locks
>   ASoC: renesas: rz-ssi: Use guard() for spin locks
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: renesas: msiof: Use guard() for spin locks
      commit: 16d4b44cf063e90a5495dba26ac9010bb1a77273
[2/4] ASoC: renesas: rsnd: Use guard() for spin locks
      commit: 075a730b85e96d3d6f052f04f45c4f8b77fb8d56
[3/4] ASoC: renesas: fsi: Use guard() for spin locks
      commit: 15583c4dbbf1f3ef44bc5eb8e9936f7069bc61e9
[4/4] ASoC: renesas: rz-ssi: Use guard() for spin locks
      commit: 7d083666123a425ba9f81dff1a52955b1f226540

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

