Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE33845B3
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644064; cv=none; b=NWbO1srUFx4jJSvd8DnC7JZrfBIOAjDQ1SkpmQopCN37JlledN8nQDn0zXsf/0NtuwNBbVlAzFggaJjno4A02cVxHOKSmzxmXj+xOGWokQX+6F5ntdKz7BYdCi1VpHhKRzLzmkk49/405C0bzbLSSXjl2cKfoxPtIHHRYjcZwS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644064; c=relaxed/simple;
	bh=4S/rKSyjExH9qAWXmm2WPKCeP4g/tgy0SLMIr7hMzCE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EHOdwJsqUQlXgd8QVpymnTihXp6kVSRg6/iJ0Lcs7un5BKfqUO/0o/SwMllIbaS92TqhrG8v4VqkOplQeaPh+TFJAREX7qUQ/8Xwqsw7EfY92R9OjmrABUZgsadEjdMFa99Ij9ofqiJSqySD742yCc/rzEUdNJaoiOlyH9f+9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V05cqxXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V05cqxXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A151C19423;
	Fri, 27 Mar 2026 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644064;
	bh=4S/rKSyjExH9qAWXmm2WPKCeP4g/tgy0SLMIr7hMzCE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V05cqxXMjMrr3iMUnw6X8RhLrYprqexHbcd565PNnLkDEjO+IXNYrIVvME4xhLO+6
	 Nu6FAGLGjekRI/vHJTmT8VID50Y7LKmkhY9Q47LyeZ9cwQSldOgR0gEHMpqWzqmYIe
	 jx1JxcaIuEq/8OttMX8A2b1Hmcuyf8EvEh0ZrBFQzoCaWczh0Z2ouRn90l/+AoEFfo
	 Q27aFzUDI+gp7DFhe5UEWmrCF7fKAZNPWaTl7ZDjV2UwzPAlUdCRU7AsxPHWtbGZD8
	 Tcgc04vHM9TZAWLuVp5m9TauoTu0ATLnkCAAJ8ZRJLCGt8LWdiN0tfrXPNaCyHgi3Q
	 /nsCofbpk0IRg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20260327082331.2277498-1-shumingf@realtek.com>
References: <20260327082331.2277498-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: SDCA: fix the register to ctl value conversion
 for Q7.8 format
Message-Id: <177463875922.777262.1610705287407115824.b4-ty@b4>
Date: Fri, 27 Mar 2026 19:12:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4S/rKSyjExH9qAWXmm2WPKCeP4g/tgy0SLMIr7hMzCE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxutdUdUY7fl50kXL0OofqI3Pvia4xFCmNzpXC
 QhettkmEDOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacbrXQAKCRAk1otyXVSH
 0MsdB/0ZOCP/+Cukg4qH4cqGTJjT9YayAsu3valanfcUzgd+MgzPl5xpJvHweVsZmJcs+mplqm+
 FMHCsGon0Ou4dexzbVJ6TLdip9zr6a00JQglqsAzGrywwHRWUMx17n8rkTM+p1GaMRooeMfzLDV
 85RqOcxhpovg0ZJqeu5tZj2DqoccV+AIjtmHAmUXABakCqLib3yAL4Ohr9iUkqvBV8jgul34X99
 ho/BonB/VJym6XoQEzBkz6NVDKpy+EpUBCQ9+UEWIjqEhO6PExYP3Ab1IuyC1fvpH1cJBPHIs+O
 n9RBxFq8Ox9CS3H+ehoSOqyRFu704cvjxQQZutI8Er6G8SKQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 16:23:31 +0800, shumingf@realtek.com wrote:
> ASoC: SDCA: fix the register to ctl value conversion for Q7.8 format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SDCA: fix the register to ctl value conversion for Q7.8 format
      https://git.kernel.org/broonie/sound/c/ae00200acb87

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

