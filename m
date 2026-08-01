Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F139C017;
	Sat,  1 Aug 2026 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785547067; cv=none; b=KxNoLfQCIDsB+tVT60xTnXvVHHpDnXcbXkqCs/mmGQBHIEk5WmxxB8PriXpdjA2Fo06+xdw2WWmNXSzw3hkQ0mj/Ft6Im1qf2084NwFUR1D8Qn02R4BwStYFdbTzCrU+wO+esbOSo8K4IJHADBf8f3bMCijxFCNBlQb2/2HzmNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785547067; c=relaxed/simple;
	bh=sX+Lu+eFqThlXQcb8/SGT4rhZL/awvYU2M0h9nSwr80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PmUyaAszEdqBqqXYPVvtLDlp60O8gPHDMIrMRE03buZHzW9MqLsmKPo8ZczH9EEfYM2tDTbV7RMRINL0nJXaBYoQAa+jgyQSXCwY/4p/9s4S+5tHXrqeiIASo1jusVUCdFjPVgpQOiHr7CA+stSp0JstLpcxpKq6iajcpN9VcVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4KuWX4U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4KuWX4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8571F00AC4;
	Sat,  1 Aug 2026 01:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785547065;
	bh=bISqOXV8tv0ApUMqeldyZsD4/d7vDt3DfSf0g3+Uqbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O4KuWX4U4VZonH27aQyRWYTo1MdGCtar7Ewp0jsSRkQsOqvktLrUUneYyF6hwLYwP
	 R0cKVVfLU9/+zg9df3wxFaHa5upJPttyVcivNn+q4nAwBzpHUE5NUJPcWo6Sg+VqEP
	 pWiUO/ZzkrUgg1cn34Jhfo4xl5F2JVp1v+VBT57cXz5958SLPu2G4FCVku3Bb0Ak+w
	 UVy57MHkbpguuR4Cse7fcv4JjkydVNJ8whFBR2vN9ImC+TaeYo3a5vxumsbI+jchn1
	 kTfbOArhZ73yKT6aPhIk2RXnZpludl6DxMYWpwO2W0rtIV0YGj/n4/T1n/ODRBokhQ
	 FlFbDdyzIrOCQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260720001054.1439409-1-rosenp@gmail.com>
References: <20260720001054.1439409-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Use pcim_iomap_region() in acp-pci
Message-Id: <178554613924.353541.17673616503217424387.b4-ty@b4>
Date: Sat, 01 Aug 2026 02:02:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Sun, 19 Jul 2026 17:10:54 -0700, Rosen Penev wrote:
> ASoC: amd: acp: Use pcim_iomap_region() in acp-pci

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: Use pcim_iomap_region() in acp-pci
      https://git.kernel.org/broonie/sound/c/596f78db1952

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

