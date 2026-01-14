Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09F2C08D0
	for <linux-sound@vger.kernel.org>; Wed, 14 Jan 2026 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419509; cv=none; b=iS5eohIjlxGCXQ6bKuxbcPZR8nnT/HIWiK0XyE9ekl0mcG9o4JM91cVwj2XAYYhF4heH3R4J30LkzJfePJH1aggAIst7PmKScJyVFcepDsu1R223sjtq1liyP+uiJPq8MIlwUCpu4Fl4YgsIv0lAAjlIP4xuPIBbotT5w8D4wEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419509; c=relaxed/simple;
	bh=G7JQ/uUIPosDcrq9mUpF7W6BxTN3xWqBxvuYEsZNYrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DRjbV00JEyWU6JNpAqWL0fBdyGGP0Zh657v/6dTQpYk2M+Nf+dNIGuDZK5+ZfKziDYUNkmEnXqgLDZMcJqTSO6xPjas8zW8D2nNxV0y3AKu/+WO2TR/LMcpfC40sCnrmLtUWSGGLgkVvTmMd8O/MDSzJ/9XY8DvNE9Fzx+OPe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixasulgF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixasulgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492D7C4CEF7;
	Wed, 14 Jan 2026 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768419509;
	bh=G7JQ/uUIPosDcrq9mUpF7W6BxTN3xWqBxvuYEsZNYrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ixasulgF0ifZ3FshitheJlx95VpBY4WEE6R5iGtoJDn/nUyFAPs0BJBIJPFLkq+ST
	 N7FIFSxgYwcDS/oKM13xmMyu+23MKOzwxO9QX/eHq7VX9SkZvrZvfTVqcWOHjDfdzj
	 fXKosZRaCWDbdCrKPZPD54egTGii39UHZztjXISMu4SOhdZPpSwTBdu+wUunnQa0V7
	 OSJgambK4homvs8Qew9/mDGWU7XcB/tGPThZld2AohA9cx5CbLWCp6Y0NB1K/7fWli
	 iKaz6+8SeCQkFcQPWpK8NutSFEw+NuF/hhKmyBLz5/252MPEydbAW8BN25QipZ4Uzw
	 pnNGdpTAIlGLw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Cole Leavitt <cole@unwrap.rs>
Cc: ckeepax@opensource.cirrus.com, sbinding@opensource.cirrus.com, 
 patches@opensource.cirrus.com
In-Reply-To: <20260113084402.10427-1-cole@unwrap.rs>
References: <20260113084402.10427-1-cole@unwrap.rs>
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: Enable Headphone pin for
 LINEOUT jack type
Message-Id: <176841950804.209803.8168444895088223970.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:38:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 13 Jan 2026 01:44:02 -0700, Cole Leavitt wrote:
> The CS42L43 codec's load detection can return different impedance values
> that map to either HEADPHONE or LINEOUT jack types. However, the
> soc_jack_pins array only maps SND_JACK_HEADPHONE to the "Headphone" DAPM
> pin, not SND_JACK_LINEOUT.
> 
> When headphones are detected with an impedance that maps to LINEOUT
> (such as impedance value 0x2), the driver reports SND_JACK_LINEOUT.
> Since this doesn't match the jack pin mask, the "Headphone" DAPM pin
> is not activated, and no audio is routed to the headphone outputs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type
      commit: 390caeed0897fcac75f3c414dbdd85d593183d9c

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

