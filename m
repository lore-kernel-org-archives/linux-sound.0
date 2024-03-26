Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6A495FD
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711457469; cv=none; b=PXKA1gRIRWQanG0sHfAnVrP/Wlcp6o4BZYPYrA+bkxea3jn3cqc2+U0Ng841zG5EBDNOvQ9TxNs0ny/83CLQd+lFQ7OXD8edLClBdak03W/JPWBF33m6m/BHPvMdeTX+5+gKu+hAGTTpU6ufiblDeQeo8TjL/Gwj7Wa6/XbwAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711457469; c=relaxed/simple;
	bh=EZ6pFz2V/DRj+qMyZoOeq2lbUpexXlez3RxaoFi+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h6yo2KWetjyvZYOUaap+KXAZ/Y1UmFUkL3vSiq9ZOhc1zfeQk/QNIoFxucmzhNi11u73yOGaxfUiy0J06pdATSZIC6WlBvMG1af4/NXxBS/FqGlr9msWiZSAwpZ4QkZR2y6Qjth+j8gcEdaHlYxcsHjJNwRgoRyct8i0zvPUP5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hi4UuAkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hi4UuAkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A915FC433C7;
	Tue, 26 Mar 2024 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711457469;
	bh=EZ6pFz2V/DRj+qMyZoOeq2lbUpexXlez3RxaoFi+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hi4UuAkf7sRJXkUAI0utHWP1JtUexhos3i4hWj3DGSXskzhSxaXKD0qB03KV1OkI7
	 L/ChM9Z1h4adf2dIg6wUaCzjJ3eLfBDkBylZXq0b7yGDBrZpbReMXj1f9aMQmd1Kwo
	 DzDr2QlaMScm3Ihw3LLvRkbZY+Y27M23r/M/VOLby+GIC+MeV58VsLBtr+rL8s6Fqf
	 Mlle6khD750cq7FDEM0aL3/bjQGXa1lVwfwGBLpXJ8CJ/KVsyz8TZO2KoR8sAfMGRS
	 z3P5HIKkDXT52iWRF+MzvyXROBqGH7VasspTtEPfHnDbdVVoZebYQNXQqXjc8aXbOK
	 eSVJmfSdtXj6A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: improve error logs
Message-Id: <171145746742.70451.13798013977820982009.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 12:51:07 +0000
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

