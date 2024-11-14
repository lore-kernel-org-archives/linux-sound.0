Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526231F9414
	for <linux-sound@vger.kernel.org>; Thu, 14 Nov 2024 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731583157; cv=none; b=e6mmHA4XmvPT1KWHlGxtMgpKFjGNgRHe73MGmy42wWsEyVBdNB92f5vBDZy32HimH35xl6TO3SWBfQpierdqtgpPX4ZBCJgHYnD23EXHfza7viTVDT3GPp91ZMIbFaJDnKYs5tVowRYosrDEYNhS9XAH1Neh4DpiCYkqMt8581s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731583157; c=relaxed/simple;
	bh=itomjc/1zaOSQCcyg4wnbkLgu0Cei8iPrQHwT6i7vmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dSGSfrd9p7sW09zsMiUsZ+Nc2aFeeorj7i/er6XIGijGrPmHgon8wINzn2yNPYEHSYdHD4x5ela9wE6y8qBX9Z5eWfHv5qh9npq5ifNY5LJyrEmnENOplatbms7TO1nsknOmBm6tEuanBzvVlJBdrVYVboHOe+5yvRJZSp9iM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVPLv6eb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVPLv6eb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961AFC4CED6;
	Thu, 14 Nov 2024 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731583156;
	bh=itomjc/1zaOSQCcyg4wnbkLgu0Cei8iPrQHwT6i7vmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dVPLv6ebBViv4RRsEfdmPqEXJ6PG9jQhbUAnAN89VxjbVDOhG5iRKP6aRIhO6BMei
	 k8dkpmqFZha/XiDDkdpDPtipPIzi0IhRvgMAkuV+LyWyA1tBRbWc14kQtwcMHbqSS7
	 i+EEFj/i2UsXdMAqKGQ9PSqQVuWdKtkni4gOCtGp+GNEN9lhb5xnLdWopPzc5VYp9i
	 ONoFp+F0LXtcvxk8GQ5Yk3IJyT75BJrSI1XH153EhDEm5tUspe46Uxsig/jPRWiRB4
	 axuinfGuY+9tqvouiPTbcmbBOmCKb1Qz0spea+Phu3cE7qNydidp9z5XZaldBt4/0O
	 BZGgnfInKNosw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241113064133.162501-1-yung-chuan.liao@linux.intel.com>
References: <20241113064133.162501-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdca: test adev before calling
 acpi_dev_for_each_child
Message-Id: <173158315442.477396.6408060765327878408.b4-ty@kernel.org>
Date: Thu, 14 Nov 2024 11:19:14 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Wed, 13 Nov 2024 14:41:33 +0800, Bard Liao wrote:
> sdca_lookup_functions may be called by a Peripheral that is not listed
> in the ACPI table. Testing adev is required to avoid kernel NULL pointer
> dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdca: test adev before calling acpi_dev_for_each_child
      commit: de35b06bf15cb56c96c7a69474e305852cc170e3

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

