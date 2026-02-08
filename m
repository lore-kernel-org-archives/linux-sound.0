Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0F349B1D;
	Sun,  8 Feb 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585695; cv=none; b=eXk8rAh3sbSUS6P+ndm0zNyx/fHTx8M0pAqcB4kldm88VRDZ4iCa6FQBGsNUrbzXiGmGxoy7ZeGHZjbONukiwLOsbj/53/R/dd0x/57UFxJ1Vd/UJvzFSuV52Vjly7jK/5h5A1FZO6ea2H7eCM5XAC84OInXDqEOCnRHfajehcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585695; c=relaxed/simple;
	bh=wG2Czxba3jBUtDYEP03z3BSVfH9BgzaCkKXFXxUgMJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FxWjW1ZiZA6ycvscM5JGsfU9AIXi78QS2cw8tFfi8Cis8BQNMn4PZf6OJR01VZFMErbAsN9RAZCn3IQ3GJkLJ2Ienw7O5LtvlpyMsRpIISTFfnHSdYaF3KGjGPEMDTJtkM1OSAuyNVWwPziYv4ch827Tu67I4zlerOXE8QBn48w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1CcVF7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1CcVF7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CDDC116C6;
	Sun,  8 Feb 2026 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585695;
	bh=wG2Czxba3jBUtDYEP03z3BSVfH9BgzaCkKXFXxUgMJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R1CcVF7glaSQlsj4cJPcbz2Pfi307Gbd5Uop6i5Leauixn7BNQWSmBeffXulMzbqA
	 0hh9xJNPNas6af2dS7acY93EqSpqExY4S4glYAWfNIWHGJmBo0t8vj9/3PdIK5PQAW
	 Qza4KAxB5F6x5XhDm9eCL1qgIw5Bdv+f+jmsh5gh7ju1WaNccOsrLyGZKJts7QJIdj
	 QdUM4IgktDX0xTW/9HFYqjcxEme/D+QZcwiWG/k3NkKwmv/IgJZvrqqEWUy8NNzxaJ
	 aoXVXvYSf0fV+SjBydukAWMKl3Fpb1DAkfk+JbEDebF2goDqPDEmB3UUPVPEl1vV+R
	 CtUnhVRxMED5w==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, mario.limonciello@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260207062433.1465232-1-Vijendar.Mukunda@amd.com>
References: <20260207062433.1465232-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: maintainer information
Message-Id: <177058569295.654564.1440552951713342235.b4-ty@kernel.org>
Date: Sun, 08 Feb 2026 21:21:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 07 Feb 2026 11:53:51 +0530, Vijendar Mukunda wrote:
> Update MAINTAINERS file for AMD ASoC drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: maintainer information
      commit: 77d31948a88368f1e8516cb74614ab2e0340e840

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

