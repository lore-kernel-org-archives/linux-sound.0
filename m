Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F1216E11;
	Thu,  9 Jan 2025 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428681; cv=none; b=VUFNOStiVUwHRDxOzntn/UTxThAUwfMfngedYKyqXy4ADRWghqAMy5n6p/EZB5AbC/Nnp1VXnZpH5fOUrAWLlshYJinMYQKLk5zHOv2VbikU0Se3uNk+oQvQkt9iYyIkIrBQnUEXFHA2Y8NcOQooeoNX92mJBVOVNqQypw+AGQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428681; c=relaxed/simple;
	bh=1yisfXYkGythBjYRZ0LD80elAq0rnDHyUhEwvlf3Vrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l6WW8LCdza/M1TpvU3XLdtIZXzZ/2pXdz40kV0hBjsAsw3sq6tlaFaMjMF9vBvZAP+2kEi0BU+L03p2MLGQFpVvIKNlc1k8hu4EEAG0P28SVI++gtLq19HteF6Iu9rUmCKiM3iLN/eXZO23/vdSEdRiBmovnHCKwXrbBWjT8T5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pij6oO4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pij6oO4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753BBC4CEE2;
	Thu,  9 Jan 2025 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736428680;
	bh=1yisfXYkGythBjYRZ0LD80elAq0rnDHyUhEwvlf3Vrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pij6oO4IrHAchf0Ay2n3GL6E8lQfspvIXrY7VPwzDXHLZKaxm4pt/Y+sbfsjrVuIO
	 HpkqP/CAwTkdQ5r1ecmesU+3n5TPZ3sUwWqp+SXxuLvuh3FmHgFYAWjEvQDGtWnLMM
	 Utbq/tQcbkw4j6q0dUZ9TcB6YOmODnXWrp8sNxzBDPZGWlbojefw2jxHv81T/mjMUs
	 DR26yGYjyulPi2IrZm3ehh43DdkEW9AVD29kNhUWPBGa3hOC6Ao6tuIwg1UVHtDSDF
	 7mZsq8hc8U0EsDJf8sXhxQkQSpLck2lnyICCKec8xH0dwOZqgiaD+M5Fd1aPizVjZD
	 mtkeDUDLKgoow==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, patches@opensource.cirrus.com, 
 sfr@canb.auug.org.au
In-Reply-To: <20250109105657.96860-1-rf@opensource.cirrus.com>
References: <20250109105657.96860-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: doc: Add codecs/index.rst to top-level index
Message-Id: <173642867919.47141.136150160074685619.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 13:17:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 10:56:57 +0000, Richard Fitzgerald wrote:
> commit 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about
> Cirrus Logic CS35L54/56/57") added a new subdirectory with an index
> file, so this file must be added to the top-level index.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ALSA: doc: Add codecs/index.rst to top-level index
      commit: 080505f3c6c3fa5560f3b84249875fd26229124c

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

