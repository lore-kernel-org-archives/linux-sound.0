Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5A2D0267
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695163; cv=none; b=R4q3p8U/u0qzWdF5Zj7eAuqgZo6BxxewEVoZNbRS+42IQ1hOJwv7V7Myfmz1mEFfwp5e24ji4yq4oHwSp6dU1MozvR9BStATi1J+Ge7VlNoSzFRRe+05wPRAIw5GI4mFSnkWNkGmwQz2WkabvhpsmRMUi3+LSDAWXa+er9uF8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695163; c=relaxed/simple;
	bh=36IAByr6RBgj8o3eqK0U6LrIzDicCyLZCGNPx5hI0rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nyhaGAfwT/OeivGZ3W/FzERnSFRGzP4NZsuq7p7Q5yIauhn7liePak4A2OlC8IXiYTarw8aqgcmgSZGZj6l2whJH5E6gAPbE9lx9iLtTG0FA0GjPZQ+ZyiqPBMNI0tlvceP5F/V5ZpVZhegSEsli4rlszdpC+kP5DDQdPvXdLBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IczoP+JE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IczoP+JE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617DAC4CEEA;
	Mon, 23 Jun 2025 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750695162;
	bh=36IAByr6RBgj8o3eqK0U6LrIzDicCyLZCGNPx5hI0rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IczoP+JE9wN7eU0HlygTa7ivdg5iBi0utYVnnCLhyItySvSGRFMNsMZQuSV4bOQZ8
	 nBfLcRohmStdDXvVv828FRKBGCEWYLnZhp9q5aGsnuCsmdwWH8N+IEbjZV6Cc/P973
	 uFOlPUUeZVCNo9tDLtgiajQax6eS4T4r2M0PrwWF/xRAzUCvEBkDqMLo4OFlRT3bEv
	 FzOlD/R68fVASfSulQyhdqYttUgxS+f4XJNUf9LuT9Qkuq0j80HhSrCkbFvl3LAaFY
	 VBSTTfxnBfXw5ktgb9lEMh2Zw2ih43W62+Z/ccl8ryFdRz96t3LZoMCDhJn6LDAMkM
	 rjQIQK4R29BzQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, jikos@kernel.org, bentiss@kernel.org, 
 shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com, bard.liao@intel.com
In-Reply-To: <20250616114929.855496-1-shumingf@realtek.com>
References: <20250616114929.855496-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: add a HID device for HIDE entity
Message-Id: <175069515912.146175.14647482741367051122.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 19:49:29 +0800, shumingf@realtek.com wrote:
> This patch supports to add a HID device for SDCA HIDE entity.
> The codec driver could call 'hid_input_report' to report events.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: SDCA: add a HID device for HIDE entity
      commit: ac558015dfd803626622bd0ba9645d58a3ed16b1

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

