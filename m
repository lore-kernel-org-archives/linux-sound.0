Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AD15531A
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719315241; cv=none; b=BBf8WAS43L39vos+XKyjWTRqnluvygilbisD5KpZ0NlDTRDDty8K+r1ZlovGGKT4xWu4YFKUW9516ALIH8u4XDyVAH8aZOdEMs4fjhbrQ31uiKMTwVdt4OocGnHcEDZ3t7LpnGoZv7+JZoXEYBRMuF7cbcyAxFjEZi+nyjAL/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719315241; c=relaxed/simple;
	bh=0J08+6yd5i9j/VGiGzoX+5NKF+XEowmODy49szGTeJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gGnaWFDXTHbTWxC9QyqzKAJMvqHnnCKi6KMBu9g7Fzgl5G5lhu79m9ITLWSVYOyeVpnT4z395iSHqlx01/9xJPuCX1015B4ItgkA/eBdwvkPdWkG0xaqwevyXYAhcC+OqYDCEtX2NmsFPYS7OiVTKSZRTm+Omf0BSV5eucAjgOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rky4jUuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rky4jUuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E663BC32789;
	Tue, 25 Jun 2024 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315240;
	bh=0J08+6yd5i9j/VGiGzoX+5NKF+XEowmODy49szGTeJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rky4jUuJRX5vH7kvUdQb+4uSY6SUyeC96rpl7ANLX+Ja+ZAsh6c+CFDNaWD44C4pj
	 oLLZnb1EqzqdhotKogr2+a+EWQG2qUDk9RItHVDlnFUR4NzDaNX/xBWi4U1jAqiwTF
	 XYZ7D+OCk0J2wmj3R3BzBpYZDsNzm1aG961HmoWmG3YH/maIBXrEQgkMYS9E6ixuqz
	 O/mT909aVkibI1Xgo0/MFtVWVlNdhFw9G+0suG7IH8p+B4dzedvrmrfWkhYAMiLIka
	 owqrldX03vZTTkQiiXzGcw1WPbuJWqz/gQryHk2nCjj+AP9KuNduNVsOIjY3/3N9Nt
	 q5IAHYFNROagA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: SOF: topology/intel improvements
Message-Id: <171931523966.64144.7398167268117575892.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 12:33:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 24 Jun 2024 14:15:16 +0200, Pierre-Louis Bossart wrote:
> Two updates for corner cases seen with new topologies, and one
> correction for the number of periods reported by Chrome stress tests.
> 
> Peter Ujfalusi (3):
>   ASoC: SOF: ipc4-topology: Use single token list for the copiers
>   ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input
>     pin format
>   ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by
>     MAX_BDL_ENTRIES
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input pin format
      commit: fe836c78ef1ff16da32912c22348091a0d67bda1

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

