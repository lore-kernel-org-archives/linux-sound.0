Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47018381C7
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113545; cv=none; b=YfBpDxDFSeHLApiJsBoCnbwhUpJ4nCHGSs+DWWoCA4Sjck13S5lMcKAH9K1IW5oZhbAhrJO9ec0Z4jR/CpbR+JEt3MHcCKAasVsNAdLxjeUKqnSNwmmGjgTxiBMbf73l7TuVv7owj1gMX96wHskxGu2F/aCyb/RgCU/v1w/zw/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113545; c=relaxed/simple;
	bh=7JTGKtyc4Yjij9mrrPoaC0T2Y6WDdP/k82YBD3wdM10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Eg+Lpfp/Rrlspk5cV/gxoUIuALexGm08U1oH+HoMkDUj86qbaXPnartcPb3wg679f61ZWn234nUjp+sloC6rcPhFx+i/+yi1hFOL6HtweDmey0vqxk/P1rxqR6LHx6NXIS4RyTWV1F/jJUNr0h4AlFyTILQqiuFrbVGYEZCxPwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI4r4Z8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI4r4Z8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BBFC4AF0A;
	Thu,  4 Jul 2024 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720113544;
	bh=7JTGKtyc4Yjij9mrrPoaC0T2Y6WDdP/k82YBD3wdM10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mI4r4Z8o4qq9JhFFzM8UxfNyPC3d/TC4JOqZTrTjPeAvDPryZ6TbBhyqOh0ardPLL
	 KHXgQi1ivY9sj2m+uAzIqluV+ob3/by5wBdMbnAIFCHAX+Iv3dr9eWPPa9gLDsH9sB
	 FpFUuNd3DrMsl2Xo8F4aacF951/VYuCL3iDYnXQThkuum7lvt12cxnooa7LvTNfayo
	 FniwOImwup/6ARVvvj3EY/jhRevZoOMx3mkTzQCJvcSEvbGi8GJS2HnMyUI/H9j9LD
	 aMdrPL/f04yjH77CNAtYzXVh8eXLAeVavNvx74aI9WZciPCwuyPyNpyLEKwuXjeK+Y
	 cCe3wMsKiQxpQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20240704092327.652609-1-yung-chuan.liao@linux.intel.com>
References: <20240704092327.652609-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt711-sdw: add missing readable registers
Message-Id: <172011354352.90743.8794293859272767109.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 18:19:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 04 Jul 2024 17:23:27 +0800, Bard Liao wrote:
> Those registers will be used when JD source is RT711_JD2_1P8V_1PORT.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdw: add missing readable registers
      commit: 7441e7f3e682436a30afe50b858eac94295047b7

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

