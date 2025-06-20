Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F9199947
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414986; cv=none; b=eYklzIRsAHOo7KEyJBzUm2VWxKBULEyix0jxFfC4i/lpDVoKxL0FoP+PWyZc21gDKl6CY+kjsA7u1qAmUBWwlEh7w2FZkLHrwRy5dCFi2LguQrbpo7bF/lax0FAXh/ssNTY250trGwJIPaVeunlUzNbZk/5JFYjp9fHuaOxmmcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414986; c=relaxed/simple;
	bh=lZ0OtROA5485C7bbUBSwmaZjb423+DpmWvgXBWEon7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UjI6y3ryh9CDXEnagZSARTDXKIMH65F/njE/BkG5Umr3FubcY12Oue+wbkfsGHWTcPj9brEK5QjDhq/XliaVmMveNlmW2CKmbU9B4HBPPYhy+ory1WPpIsVn3oms1yPnrIjE+AEyV1Yz+Y1zYxihvNWpD8o2kkkZ2pFwCrQRcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTnbjByy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTnbjByy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F27C4CEE3;
	Fri, 20 Jun 2025 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414985;
	bh=lZ0OtROA5485C7bbUBSwmaZjb423+DpmWvgXBWEon7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MTnbjByyaBj9d8Ng32v648qb7TI2lsVjrMaGQ2oo1ZH2KiFZc4pQ2tTyXbH1QZdZT
	 IOKlSjcNPpzukG9WEP9rj44UNBvDZ2txpX99H6RXt7deA2pSi3snVtUu57EaqGYZME
	 CfKwElqNWsp1j+wDIjDDtCcxG4Bby5DYZZ4lN00Ds5OtkOO1aXJ0yQAPeGshBeO8JU
	 IC3+F+ubZPPsOD0Npn1SL+QiTxtJSLzuQHchBlCqgFe49Wg823zayXDp6NvbxymeKO
	 Tv42jG3ufqDkUpTu0HzCd0m3kpTKdJACRBWKN9fOvbEFd5RsidSYa2IdsT9EuI/O5P
	 zjMvojIF55ULg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, guennadi.liakhovetski@linux.intel.com
In-Reply-To: <20250619102548.11928-1-peter.ujfalusi@linux.intel.com>
References: <20250619102548.11928-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Do not probe Soundwire in
 nocodec mode
Message-Id: <175041498354.23264.16974958550852071171.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:25:48 +0300, Peter Ujfalusi wrote:
> Soundwire is not needed for nocodec mode, skip probing it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Do not probe Soundwire in nocodec mode
      commit: ce4b269c26ac3216da44ef7699ee61791e6fcbc7

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

