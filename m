Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09AD309EFA
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046078; cv=none; b=uQmsVf7B3NgMAe1Ej19T8E+XZzSbXNoBUrxxt+TpBSnASb3rCmtvRC3eNcftjpOtz3JilP/+ilZm7I7pgRPzDJ3m/OyNveaQEijDp9IfDIUeaT31GEnZ695fUoV0xMI5Cvr3TVDdikT+xwMJvZAHelCOkmJqfAX06I/lnSbdeHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046078; c=relaxed/simple;
	bh=mG8f3x7xfpc3H1tRovpQ5MFhmIi+XXM0df9ltt7QtwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FtECjHDM7MxGSGdNdEBBlNjZ59x40s2oo4MLACcllaxhoB0KRY/d33wuDy7pa2pIqQhhe6wivuYJEqJECAqtz06qcdQxuslnROiPNevx3ae6qQcb7E3JjXx4y0IYcwwpCX0RvRZA9dvqgKHivOoI7PVa2UpMrAFWgurVJhmWfro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fopjhC5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fopjhC5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC15C16AAE;
	Thu, 18 Dec 2025 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046077;
	bh=mG8f3x7xfpc3H1tRovpQ5MFhmIi+XXM0df9ltt7QtwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fopjhC5BediZiQ53UnCRJUPpLnGcRZRPdvYTkJRkslTukZtVPgEWLLw3gcH8JXzUK
	 r2WXFbR9MBq44iVHt7I5iy7jrArlSouREbXra7ulxlEwHUPMjPki/As7LLE6fsTMMf
	 e1Ar6nLyuzSp/wp5gJzOhzpdbiW1l6FC+2OF3Iuvqx+UOdyrlxHwM+2h+8rt93OtUL
	 HGizVgPC7Z5eWhrhF6BMRp5ASuyNQf61rMXamLCV4gZ1fvO9p/Wn1b9N/ao1WCP/MO
	 LAkNLwD2Z2jlVGZyyfNFlTDE+ZpZsQC5+yDHXAdHzd+yqKcRmqLb4JdFVGi9My4Ofb
	 pefPARAW6iUqA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20251216090630.3955323-1-shumingf@realtek.com>
References: <20251216090630.3955323-1-shumingf@realtek.com>
Subject: Re: [PATCH 3/3] ASoC: rt1320: support RAE parameters loading
Message-Id: <176604607544.48417.5662470000979071120.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 17:06:30 +0800, shumingf@realtek.com wrote:
> This patch supports the RAE parameters loading.
> The RAE parameters is related to EQ/DRC parameters for each endpoint.
> The driver could load these parameters from the binary file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: rt1320: support RAE parameters loading
      commit: 22937af75abb3260c2d563739181f4b61ddac2c1

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

