Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C541D54D6
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730145727; cv=none; b=oA9CwixO5dqdeqpszBTGMcTmFAkxmSCBUqqkJRE93ajN5/h54dPrAuCR1A4M9/RCz9OXJDBJGy41VBxmuM539v35Dl/jTCjH2tXuNyp8REm73kZCoJOXoEJXgRYlO7Guyh2A0cHKgua0JdQAjgEccdR6kAq2sUzSsBE+ENyEOJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730145727; c=relaxed/simple;
	bh=fgyBIzxRr0VGaeeZ4hlLzBXrc0XQQNKgDnP+gdfo2Os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IlWc8Yc+LPrUoQZOyPenO7/dvWkbA5K6zPpNIfF2dvzSsI4DM+ousoYDkwkF5ft0pylKb9BpaPCOfp+rTsrincOmpN8Ie9STRllX9Nx8cafO6zzK4vCSyYeyzie8RdxJqn8NoMDXE94vTZUsuXOha8eve1fp9cUxvR2YgGQzC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuDTVJFH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuDTVJFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDDCC4CEC3;
	Mon, 28 Oct 2024 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730145725;
	bh=fgyBIzxRr0VGaeeZ4hlLzBXrc0XQQNKgDnP+gdfo2Os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TuDTVJFHRSw2LXCJFuxh7TrGavidCzTCuk/OJSOZcHl25a3EoXit1G2i5+GJmrdj4
	 eQFnvZpVCbJZ8hU3a1zuZ3ANzsXws+KhQyRlSaJxXsT3uBACgv8H+kDwD8pikuVEvV
	 v3Yo5Fnoiyrr3FuSIxCMT59aa5DDjEQECKd5SICA/jTQL1W5evTIZvjQkvuryZqUTg
	 NFl1WRaydDgQ1734WDxiPDmDChHnnrxwV5fB2Ma/9NcSRoduFEZOjhfjy/JwBUfjex
	 dPTyEx2ox9aYS31UgwQvyBPBXlUm9zD0MPEPfurTA4BNouX4TLtgpid7RUJl6I+oAN
	 N307hI8ljs6uQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20241026143615.171821-1-hdegoede@redhat.com>
References: <20241026143615.171821-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: sst: Fix used of uninitialized ctx to log
 an error
Message-Id: <173014572357.195625.15528159152527316940.b4-ty@kernel.org>
Date: Mon, 28 Oct 2024 20:02:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Sat, 26 Oct 2024 16:36:15 +0200, Hans de Goede wrote:
> Fix the new "LPE0F28" code path using the uninitialized ctx variable
> to log an error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sst: Fix used of uninitialized ctx to log an error
      commit: c1895ba181e560144601fafe46aeedbafdf4dbc4

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

