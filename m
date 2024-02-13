Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17F10A1F
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849098; cv=none; b=BQrK1RHFY4aji1r7wwvZ6Ab6ln56ETaDIJ70K9fd88Ad95XRNHrIxV9x/N7/qRAL4pxkxq+aDgAubHrNq7LwqTsRHmNZDXcZaranQ/74KiH5B94NwJvSVWc+d81mjIEwhPcp3JHxVi+Ts/93uYD/uuo6d7f1yz2KnxcqjNpSedM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849098; c=relaxed/simple;
	bh=SNfaitrM6HzYt1IYFpVvW+K0GXIVmmTo9GAjT1I8XC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GV4G0pfJ9FNhOr2KmlMqIBamZQdYzGWW4rypi9KQr6StGifu0z2oV3Wu/Y2Fh48sgrh7FAw7uIlBQb69VFQURER0Kp26emLZfaCiUn2BIiZFa+8uTHSWU1pWJrj8kuJbrdJzlsJZlZ1ebeeqLSfVxGGklfOhAUg6H0bC/2UKpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrbV5BMO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrbV5BMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD72C433F1;
	Tue, 13 Feb 2024 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707849097;
	bh=SNfaitrM6HzYt1IYFpVvW+K0GXIVmmTo9GAjT1I8XC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DrbV5BMO+mwyLNfnqdtjE8YJVZ1Xv2/fYkPwM08FA5WaU/hCLYh/VSMWKnRYtQ85r
	 r915oybMfY1rs9grujQ+Jmx8Na4ha62MAid0i6yqCbfNUDkH1+XIqLE8+vDKuoMarl
	 nbJek39aNAwi3t+pQmfKw4STTP73iKCCZ+0FkOIBgvRAJvwW3ld/gSOSfrLl9JXH6U
	 532V8NiMhavE+QrOM4f+pLHF1jFtan4ttIp4dIqdBQg7zd/1HFaLDbUxLppdDTMQoQ
	 TkRp9qbwuOfsuHw3wTOL4+uUs/iBb2GLCe5v9DmhMW1uQ57Jiirucw2OycsC1seDMM
	 F6QdsOpO++W+A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20240213114354.32579-1-peter.ujfalusi@linux.intel.com>
References: <20240213114354.32579-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-mlink: update incorrect comment
Message-Id: <170784909570.647645.2392994538138554813.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 18:31:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 13 Feb 2024 13:43:54 +0200, Peter Ujfalusi wrote:
> Likely a copy-paste error, wrong CONFIG used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-mlink: update incorrect comment
      commit: b85a3dc28185ce1bd46a52106799877ee7b94ffa

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

