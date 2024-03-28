Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102C13A3E6
	for <linux-sound@vger.kernel.org>; Thu, 28 Mar 2024 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711658076; cv=none; b=jdEA8SNp9+4gObsrHaw3AqRA69QqMuQ4/fpeMDWCQbf/KT91Eh8SKb1466WPm9iwmH7LCR/h2k/eXluk6vxk7Kb+hb/GxxTQ+PYKgoTO6/ScxDtWI2dY6GUtnO3PslMz3FttZ1+cZAMgBT1duvl/ogFB92UCnlvPm9VkfzGmNjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711658076; c=relaxed/simple;
	bh=EZ6pFz2V/DRj+qMyZoOeq2lbUpexXlez3RxaoFi+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oyxUgznwQcUbh9k/HEigsJ+Lqw9NlVMX/lkX6JyyjBlGlCzJ40hzbaMDJWu5qL5IvXBRA1Hc1Gd+Gq9lPJKzH0Yy3TpdllAFW7mIXxz8E+BZU4diERrra5Gp6CftfHDpk2iQTDkDWAh3rgfEQ5KV46RsOZyq168yHiS45gYXkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etFj1VwD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etFj1VwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1C1C433C7;
	Thu, 28 Mar 2024 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711658076;
	bh=EZ6pFz2V/DRj+qMyZoOeq2lbUpexXlez3RxaoFi+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=etFj1VwDblqPoOCViaQ76mHoMshtJet5OHHeqs1+JnJqJSoJTnOaHUypSj3Z7zw4R
	 Fajuz2PnfN9e7KjDtb/ciBRZemG3Bte/q/ycV69W0DaPtVWpX+FhGEgVqMhIy4o1DB
	 GhIJe3/dKi19gGbZpgqPgQB10EhE+aYV114+Hgll+dj7MK9PGOPlMblVK8L3Coa6jP
	 CdGut4kL4Y+AudZg/iEskRAEvZ2VAHkWpMU2dGAeDdka3lma+DiMl83g/12/hUP1e8
	 VJ7dbFok91h8pZ5alHKK4ciUCfFWoWWUPokNPFo5Ry97tn/fJV9kyWqRoh6OeGxAFa
	 tCnIi+3GJu9wQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: improve error logs
Message-Id: <171165807451.133067.5238673797323353251.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 20:34:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Mon, 25 Mar 2024 17:19:25 -0500, Pierre-Louis Bossart wrote:
> We have a couple of duplicate logs and missing information, add
> __func__ consistently and make sure useful error codes are logged.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: improve error logs
      commit: ea5fee227ff3dae209062ac9544906debe1e9ac1

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

