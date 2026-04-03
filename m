Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2162DEA9B;
	Fri,  3 Apr 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235193; cv=none; b=J0ikz5lk38pQ49Jp2xDmTwA36BfMTOIsYYMKsLP+Dha4e2RXIau+441is/jv70LHdbBhfLdcqvlNuaguNatgZEibaLlbrn0G0iVp4bjMgez8FIsqmBn1yY976f1R1SZrXxD5V3qevlmt+plueOG1ZFBt+4fjIvfkcPd7aO99SqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235193; c=relaxed/simple;
	bh=Nwyx3GijPgytUxJt+9j7Sganw/uexqcOHOvle/y+Pzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RwWVj+DciDapCUUDygaK6siCKJcvMMTZwHJAQwFjs9o7crz1XFpxhh/AgxPiYgIfioDXLQFtZ7jCWuwIU9o07+4K9LkJPJwrGnypppMcro1ksGKN/ii1B4vmyMFVtnzC2bldC249Kx6nuBHH+AhZzw/8yH1dY8tgcCIHGZGlN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSG462A0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSG462A0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10279C4CEF7;
	Fri,  3 Apr 2026 16:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235193;
	bh=Nwyx3GijPgytUxJt+9j7Sganw/uexqcOHOvle/y+Pzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DSG462A0CzBwfL0pZwW2h8woXYXOfKdTZfL0HRACE6iLNiUE5BHXET4H9yvz4Zh7F
	 gQoKKo9wWmuV7AUKKDPOTMwbF4NWNB62quERloJtEGy9z4Y1XTzFJ/A97MRqbKwiCT
	 FKllgGcCcuZyLt8vWwbTCS9vUSzN23X//0eAuCv0oCxVgzvgkuMfIG3TUG9foWp2km
	 n2iG/YqXHz2GW8AycATqcunO2z6mqJg+9gGQpkAR+6D7kCQ7TtJV+Y9ewxKaA2U+sz
	 IVJuwukrTQiqOJtRQWX54QX+Pna2TZPn9nMqgPu5QXewPdZMu8uUBnwWvrCE5oGNQ/
	 VOwa7AUTe14Tw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260403082335.40798-1-mstrozek@opensource.cirrus.com>
References: <20260403082335.40798-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: intel: sof_sdw: Prepare for configuration
 without a jack
Message-Id: <177521817104.52946.17333532562750611369.b4-ty@b4>
Date: Fri, 03 Apr 2026 13:09:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Nwyx3GijPgytUxJt+9j7Sganw/uexqcOHOvle/y+Pzk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/B31oeyQLCEK7dlXdLJ84f+DdhWLmzQIvM/b
 zlqW+MdYFKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wdwAKCRAk1otyXVSH
 0GbzB/4vUdGLI7BgDPrEXfx1pPpC2x5Cww1G3ssDkib6fd9HCpIwPhi3j/YML2SG/ihpQRyGxPB
 mr/CpxgxLkPS3jArktyjX24WByt9HOF8wrMbdynxw/WNbgqBqVYUOVE08/SfvUyDLC0eOAoQ88Q
 rB68kP43VLhWisxDIa+k3rzfkQhsolnBY+XAyeNfKtgzX/ciVy493HVJlk8rKk3paXuw+3Wuxg4
 Cug/Ruj4DcUb/uCb92Kf6FG5x5RdHeER5uxqARkEOcOSRnDysGLitS/96a4FjUgA20w9ZLM6VEv
 6mn2QT1EjTig/C5NAlJS5q9SODdit/tDB86p1JR1uWPC3Xrf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 03 Apr 2026 09:23:35 +0100, Maciej Strozek wrote:
> ASoC: intel: sof_sdw: Prepare for configuration without a jack

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: intel: sof_sdw: Prepare for configuration without a jack
      https://git.kernel.org/broonie/sound/c/d733fb463834

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

