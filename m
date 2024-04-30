Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A9D19DF7C
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714487493; cv=none; b=cGBeVeZN1tZciTsO/tLIXo69gfG1YZqbbiP4650UgcIvZes9tH8A7w/F4UfgQCMxkNNV+7lLyNcvkiCYOefidFIYkMHYPy+ZJ4/JnWtpmR9y4vHnUK20G7z8OoyesxJ2Vzsnsq5efJkOPq+7jhkZriAtvtC29ixHWTvRDTinkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714487493; c=relaxed/simple;
	bh=cLtJvPoRgeDtZpSAoRESSDQfbwZXgGEP7vWUT65npxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S8eguy3R5Pjby2UJ8ovyB6NEPiuzZKP+5vwOiSHHTko5oDIGIaS9NAoia+t/aMz0qy76XPlUp9MfzBQam8kS5iLDq+GNE2kWSJFEJHTahfD19VCl1gAN4bBW8h53BZs78dujApJgB9itYhTDfjxe2RVjxmjArXqLHerH5Pdj6AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7cKHnDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7cKHnDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C23C4AF18;
	Tue, 30 Apr 2024 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714487492;
	bh=cLtJvPoRgeDtZpSAoRESSDQfbwZXgGEP7vWUT65npxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U7cKHnDeCCK/PsdBuYIsiSlRvfEnVj7/Zs7tdw0BpW43ujRp/+cmLA25FAMyszFny
	 W1igVbFGg/xcYuZ33k/4IVYTI6a2av5bjU9lGYk0oXfon9RLWL+l6+4OaQWiVvCDzd
	 x85qMUoyycXZuyzKpb1Ukr3AiXHZXwoIPjjQV4pmMd6ZLJ93cbz8NNJxIcBepXboxy
	 NkqXhW2AOaZxdCii41SWbTkt0YYR7G5IGbVfspXAk1PGw4ITEzDm3BtIqwex4hGO5w
	 ceXJn1Tur39Z94eEuyOYK/OLBR/OM1AwGKfozxWc+oKT9HPdB/f3Jx6BjMswYiFGca
	 bqf1j++UMy4aQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240426152939.38471-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152939.38471-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: cs35l56: fix usages of
 device_get_named_child_node()
Message-Id: <171448749098.1870439.10765372758539415064.b4-ty@kernel.org>
Date: Tue, 30 Apr 2024 23:31:30 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 26 Apr 2024 10:29:39 -0500, Pierre-Louis Bossart wrote:
> The documentation for device_get_named_child_node() mentions this
> important point:
> 
> "
> The caller is responsible for calling fwnode_handle_put() on the
> returned fwnode pointer.
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: fix usages of device_get_named_child_node()
      commit: fbd741f0993203d07b2b6562d68d1e5e4745b59b

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

