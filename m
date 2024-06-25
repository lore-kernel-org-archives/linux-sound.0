Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1818637
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346242; cv=none; b=M5FvYUUIx7To5RVjc4rEhDAzTt7wyB89C92/crHeWa0+FnEau9c8lFVHKwZ2rChvZB93kGT4WgZ6x5nONmWYb+6DN5SR0kkolc7ReTODDHSrj+8RNCsuResK7bUiu37sm+fge3XA4i3GLpAvq4ogy9qd9rrqPLo8ZeK8ld3b2YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346242; c=relaxed/simple;
	bh=hehQMfhDSVpPe8xfeiMReoGVwQ4U1XORyJzl9MKnq2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MPkDPcC5O2izBH9tZpAhHi53ulM1qqPWI6/ir06W66evuYrHVKVHDrj8P0cFAdhjoAz9Na1Wh7fnokuDleebrLGGuc0JfQNUPLK/aqmry8Ary/8yGexTGiLeeG9Dxpd/ccpjEcLF5qnwq+KfD0An0PHAj+aiN70uggfZAdH4ahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXuttKDZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXuttKDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434C6C32781;
	Tue, 25 Jun 2024 20:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719346242;
	bh=hehQMfhDSVpPe8xfeiMReoGVwQ4U1XORyJzl9MKnq2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jXuttKDZGVXfiaBafDkmObb8wlYtmhJgsdRkJWuAukMXZhMZy+oj+FXC7guNSoPo5
	 8n1yg9KtxgWJOcSwjEHhbqZVH6EjRe/2qPoc6SaYCTNVHSofU51RtyMDJdvInMi+q2
	 Z9djHiW5n+1qSmxSBx3gE1oiFYgHyTxxYpoOFn4VhvYYUayHvwTDfFYVi4DXN0JTsB
	 iF54kECiPNZg9xV0G4igImkgk/3E1s7/wt02/U1JmVOjn2AnTwZq5Q1qEyJ9vlaN/L
	 z/QE6NdCGThr7O6fKDfvZ2acWk1LMrns3rNTTv2kNDD6VHR7/Sznl35oXpor7YKx6O
	 ehldrqGuM1aXA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 pierre-louis.bossart@intel.com, bard.liao@intel.com
In-Reply-To: <20240625084303.2273911-1-shumingf@realtek.com>
References: <20240625084303.2273911-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt711-sdca: add GE selected mode control
Message-Id: <171934623998.1243504.14982693257736865413.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 21:10:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 25 Jun 2024 16:43:03 +0800, shumingf@realtek.com wrote:
> The SDCA spec defines a 'selected_mode' control which can override
> the 'detected_mode' reported by hardware.
> This is useful for platform integration as well as in cases
> where the hardware(e.g. 3.5mm jack cable) is not able to accurately detect the jack type.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: add GE selected mode control
      commit: 50b8affb5665efa028998ad2c116b1106623409e

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

