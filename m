Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA6584CA
	for <linux-sound@vger.kernel.org>; Tue,  5 Dec 2023 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkvoYi7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AB5C433C7;
	Tue,  5 Dec 2023 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701781916;
	bh=Z6h5KHVxXcZwqHJ9jYxohUKf3Szok2IEy9KLPl804z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AkvoYi7rwPmXQztcDTJXAx9e+WnZuqjVic1N58LVCOgq96vWWcFKbYSadK7vToQq8
	 cBk6dhtxSu8cU/bWwkzY/pW6NMtENaVWUvIRBHexZdGt10E9PgrADtv6gg0GDP2GzJ
	 k1IwJoamsVLpzQXcbg62lD8UPOKjO1sK/qBRF4sbEyvvFd1vfcSk+AKp6i02rFiSMO
	 2BCuhrreNOL10weBA99XVKa8TD8YWPd9Bs2+CgD2V3WdZrSgj2eJWjolhqJa6MyQwL
	 LSDPMCZ8NqLVfSp9UlxLdJB0M4y7+EywCapfe0KRzN5TQW0QlqUxd0+Adzt5m65XDD
	 vV8W/sdXPywOg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com, 
 ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20231204135614.2169624-1-rf@opensource.cirrus.com>
References: <20231204135614.2169624-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v3] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs35l56 support
Message-Id: <170178191427.32878.1882562725490078312.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 13:11:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 13:56:14 +0000, Richard Fitzgerald wrote:
> This is a test configuration for UpExtreme with Cirrus Logic
> CS35L56-EIGHT-C board.
> 
> The codec layout is configured as:
>     - Link3: CS42L43 Jack
>     - Link0: 2x CS35L56 Speaker (amps 1 and 2)
>     - Link1: 2x CS35L56 Speaker (amps 7 and 8)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and cs35l56 support
      commit: e17999750649c4bd4ba945419b406d1d1a3e92e2

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

