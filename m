Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D98175D48
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863012; cv=none; b=WGBeDMSr/ghfvEbuzu7kYkH3bSmcPDxPIA5lBg96g/HeUVYcW5NvItn5qve+bxcnncCTp8mt5H3hSLZA0APtR41ifhKSZamPHJVITwvFkIkaEoAbTZE7RIdcPwGn7uuFJkg5a81w5Ri3uPlyKc4gSq6SVaSeTZfBp2/ow2IRrfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863012; c=relaxed/simple;
	bh=nKUQn18I5uOncKf2xShEfS3rL8p027+8KOwFvWv/4jQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bvDsleuohUJrqf3nV7x91fYTRbA+yPQoKcjAvj9CCHZFESsT2JmaiLTzKIZsKEVN2+pO/V+gtr1mfzupNKC54O4Ub+yFYguHYTVrea3QZBO7PWNlOGmncapFw6kILpcgMrzkRGzw1rs1nbHmbHqCACRZtH6qpy48ZGmQ1Qgml1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heil6qLf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heil6qLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC05C4CEE3;
	Thu,  6 Feb 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863011;
	bh=nKUQn18I5uOncKf2xShEfS3rL8p027+8KOwFvWv/4jQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=heil6qLfrP75IlONDIU/APnFBAtdJXuUyCAdyY1BXq+jCKxLDezixPeK1SgIVYABS
	 nPgK78D9tuQpCrgBxeUDWh2nN4iAdr0ICgSMqR+fku5eIDihbs7hP9D5GAvQxCzR38
	 ged/cxOnbw2RTy3fgfZEj2H4+14XeNIfNhf8lkJw7IdME+E2nZyM2S/dzhlv6iM069
	 xpGmtpBUGmJMWROCDgcXl4Qu9fr0OtKwF28E644tzwNMXc55Y8uBi5PYjs6pAcYt10
	 tgOnnrIrpQi5Fd8ggAbbTPRzaIQlH0gXXfARARPPOMXXHt8YEIyHx7U6xLVamORoYU
	 PKfmmNPom3nbA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250204075224.162661-1-yung-chuan.liao@linux.intel.com>
References: <20250204075224.162661-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt722: get lane mapping property
Message-Id: <173886300994.325569.14346341796469580640.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 15:52:24 +0800, Bard Liao wrote:
> Rt722 supports multi-lane and the driver doesn't call sdw_slave_read_prop()
> to get all properties. Add sdw_slave_read_lane_mapping() to get the
> required lane mapping property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722: get lane mapping property
      commit: 185ac20a7b055e025027d303b63dab456b4f5d5e

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

