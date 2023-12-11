Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508E1524B3
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I80xyihP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A17C433D9;
	Mon, 11 Dec 2023 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702321428;
	bh=yWThp71BPUxv4/KM7FUZO9Ix5YZfhhJSOKJIqpWflWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I80xyihPgIMqLZmWx2BnpqcTeeXB+Cy4P6BrjX0yfeAXpVK0Hh6je/ke4PGAJP3n5
	 oZdu58WMnhSZ05nbgw/I5vFe5QhjxcRUwVkJokZaw5a9optQmkv/b+fgaUimIGfWPe
	 OvycWmswcZI2+xdAk3w3n4VH4oTTU6OlUkJ6hrqvQsc5rLX18Eew5f1fxdwbSstAEk
	 q9tMNbIOJK5gxVFmYjt/GuRGp0XyTLBFGk26hxCIIQznl7YQH7w0t8NDWGxdB13pOc
	 pQEImgMubtAtBpqBTJFXyRsqB6sYQn60ZMfSLkFS9C5a0q705tFmxj16GTLY//U29u
	 I7k0/aDrWFjyw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com, 
 ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20231205115715.2460386-1-rf@opensource.cirrus.com>
References: <20231205115715.2460386-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-mtl-match: Change CS35L56
 prefixes to AMPn
Message-Id: <170232142629.117554.17625573039640052470.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 19:03:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Tue, 05 Dec 2023 11:57:15 +0000, Richard Fitzgerald wrote:
> Change the ALSA prefix for the CS35L56 to "AMPn".
> 
> This keeps them consistent with the CS35L56 HDA driver. It also
> avoids coding the chip ID into the control name, so that other
> Cirrus amps with the same controls can have the same control
> names.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-mtl-match: Change CS35L56 prefixes to AMPn
      commit: 02a914ed475dd928c7b2b6c9d1da9b0b27fa724d

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

