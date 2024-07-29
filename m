Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B791891D6
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273455; cv=none; b=pPGxY2t0EwU9RdIs/h+4oBnXImLHUMHCGFs+aE+VxZzdgshPSFVEu0m0sEwy11UBkfPCYYJepkLQNM1PFbjjuuRTAJEXxtAS0P2aljBd4tLblKlC/M7n3ujyzOUO8jrxrOEtpncBjLe8byw5JngQXfMOeWEs61ld5q6Jic8hquk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273455; c=relaxed/simple;
	bh=xgjE5DHD/BdADdWH9bgYChJKZ8IMK2CN1Ou/MzBekzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QIo06QT32RsX1kYsmRG1zv+4uAJptcTQdjrZRGIcKNchwZoQaXtm8kOpl7nObYyAQEs6iDQTjGQnpHBloosvyvVqNop+f65fkf9MgwRDbs3X6W2jfq3j2wrr4lZJicxhwPIfL5tSHYlUw8KcAyy5sLUG+gJQ2XZyeslPNwKXHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7juWwFU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7juWwFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB36C4AF0E;
	Mon, 29 Jul 2024 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273455;
	bh=xgjE5DHD/BdADdWH9bgYChJKZ8IMK2CN1Ou/MzBekzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N7juWwFUydwqC00EZb9RaMawooHmMr+50fZdEI78ekkeZYo+hKD0na+j/9NMkAAqv
	 eNS3yyIgczx7xpRJs/yu4uj8OYV/1rki5KK2UVeOQyG5EeuMHz4iZmiIiX2PV7wL2i
	 WsxpwOoof6XuFg2IXqx29nH+Bu+Wg8Hbtj5Ykaeyannyv7e5trtpS5vce2rLQIPqNT
	 EqAhZRN0U71aNe0RDnJ6KhUX/frDV7QloDPhsqdbvjlXueKGAq/qFemDbtYEVSnO8c
	 YC641ypiPyKE/Kj2wDfqJVTsi/GmI2rEPQHGvUd8CjyoipZ4AGqg4FZaxW2s4iZKPE
	 aVt1kitookG2w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Paul Handrigan <paulha@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com
In-Reply-To: <20240726151111.3247774-1-paulha@opensource.cirrus.com>
References: <20240726151111.3247774-1-paulha@opensource.cirrus.com>
Subject: Re: [PATCH RESEND] ASoC: cs530x: Change IN HPF Select kcontrol
 name
Message-Id: <172227345418.109775.2195797478065280606.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 26 Jul 2024 10:11:11 -0500, Paul Handrigan wrote:
> Change to the IN HPF Select kcontrol to the correct name
> IN DEC Filter Select.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs530x: Change IN HPF Select kcontrol name
      commit: 45d763fe503e6e0f180f873b750aea307e73fdcf

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

