Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F70272805;
	Wed, 19 Nov 2025 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763518203; cv=none; b=DOWtIoeCVEaplmQNGQj3wrhXsnpwgjdc7CPsHueSQCkjkA7wj8HVq2b8O5PM//BgRpYfugcXMykgcm92PsrxhOKMCnjz6ABBtXBnGaJYbln5h7qp//mwOKSZUYkO0dNjQ3OD6YkM61m3hU9uDqflcyidamiXDMs323zvlOUTWTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763518203; c=relaxed/simple;
	bh=I3op0deEypZy5NolH62qpnhMYuUbc1+xMDqK8H2T8SQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CjKwZSMtTIp4sIWdffI+3cW3XIlCPfjycv1SBofH2i0E/K6LiOk+9Bva3O63Lfkloc+YFNarzvh6IW44DKdnK1TJ1w+KnQ8+b05AAcsvgTyXUmyLlIAj96U1YAchU8ffm/NsFmeTY0+fp/wdt7OEu7gVXCJtA3WvuWDJhe6VVF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQJBy21W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQJBy21W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EACC2BCB0;
	Wed, 19 Nov 2025 02:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518202;
	bh=I3op0deEypZy5NolH62qpnhMYuUbc1+xMDqK8H2T8SQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NQJBy21Wm3gmpaj2QRYDhHmRc4iaZSiK9aoSwTZpsUUnq+7Ye5GhNSkA61dgZfEqO
	 1iAZED9k/hRgMofvUZP+/Yn0q+g1zGUOfxrMdIyUmQieTW9Pr5x+rbhhktF20LMwF1
	 v8FtlytbL0J07iP6x9pfXv7ZsjuXVi9Yzfjox2UJSxrOe+MPv0g6133PfyYRfrNKFw
	 fWjtQ3OD0JwEUQ5cacpHj4ToBk23SIa1TzYWl+4u1kv5GVacAdayvq/sTo8Cy3p2b1
	 IptLpAt4kCSIK5ll8MDQMMtMO2Mtwb70aXBZzrBu8xFcBv1g1b8d0XfOriYwI5ElMB
	 AAA8Yjcbi01/Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251111052920.56459-2-hariconscious@gmail.com>
References: <20251111052920.56459-2-hariconscious@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: sof-client-probes: Replace snprintf() with
 scnprintf()
Message-Id: <176351819869.1795122.12783269736204184749.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 02:09:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 11 Nov 2025 10:59:21 +0530, hariconscious@gmail.com wrote:
> As per the C99 standard snprintf() returns the length of the data
> that *would have been* written if there were enough space for it.
> It's generally considered safer to use the scnprintf() variant.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-client-probes: Replace snprintf() with scnprintf()
      commit: e45979641a9a9dbb48fc77c5b36a5091a92e7227

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

