Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FE2E719C
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756835888; cv=none; b=J02h4UhhrYrE9467zVRDOYPsaYQjHceEDk4Klcyh72p8GYyape4CJTK5kFCutWgysjt9CLcZx8V3cWmDy0nNTpjGmr9YJ7l4sF0koCEwjbvyBZRUK43OJJz+s2wwbnpAGbQVrb4hDSpffAQgO9rcoEwAozRQ9DpS8r5xNO4/n0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756835888; c=relaxed/simple;
	bh=G1lFqotkVACtE6+sW5ZU3GR50PauyZ2v/bKjnH+XF/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NR7PzOaICaSnaTJrZiSvNEjQsCFih0cDLCLIaDU6ttt55J1xxfS9R6YZdcP3H23kXwDJf2W/2gC5y3pOlK5cvAni/aVdxWsbGBS+gTxJS/J5jcE8sgJCNVHeZax6kmXGO6XGepI4fYkiAiK6DSGON24mGqFNr7JhPWCeinNUjtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nY624UIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nY624UIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C55C4CEED;
	Tue,  2 Sep 2025 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756835887;
	bh=G1lFqotkVACtE6+sW5ZU3GR50PauyZ2v/bKjnH+XF/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nY624UIp+uSHKMzQNUM4IB9W/3X12Zpc7akgwjhMDHHYimCJ7s1deyLtNMWlJKUAj
	 /AsdyjMj2kYj95uATspMpvjbS0ak9/4TkxTYpGhSeqqZt+7/2hl/P5DgYt0PuDwQjh
	 MqrxunDowAqiPPTqBr5DjuIcsDOMWxbHaDYNw1WCZ3Z14HRTSUhozugXJgZc3UdxXJ
	 N1a6WYcId+juDGVm8Qrlycad6f3MZ1aZe7CWiAwgMV3q+g5X6kZwT4fAECqbLwDpku
	 rsXskcfyw59gsifQ2B91jHZiXoIAgTP/YNtbI5znegPyTcjjKmRIFEmtLs6bdPOiCv
	 adwA+m4AuFN/w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com, 
 ankur.tyagi85@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com>
References: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] Minor bug fixes for some older Wolfson devices
Message-Id: <175683588601.1108057.11765729005710176683.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 18:58:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 21 Aug 2025 09:26:36 +0100, Charles Keepax wrote:
> Minor bug fixes for a couple of older devices reported by some users.
> Mostly this centers around the automatic PLL configuration getting the
> wrong values due to rounding.
> 
> Thanks,
> Charles
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: wm8940: Correct PLL rate rounding
      commit: d05afb53c683ef7ed1228b593c3360f4d3126c58
[2/3] ASoC: wm8940: Correct typo in control name
      commit: b4799520dcd6fe1e14495cecbbe9975d847cd482
[3/3] ASoC: wm8974: Correct PLL rate rounding
      commit: 9b17d3724df55ecc2bc67978822585f2b023be48

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

