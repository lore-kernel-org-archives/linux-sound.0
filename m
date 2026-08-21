Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A283F822B;
	Mon, 24 Aug 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567631; cv=none; b=asnKRqeCXHifr8kgpMZt9WIcFIeYYPQ1ErKXO8FtX/ksXTJ5mtewbMGsbKPTU+Sv6z5qQ8sdv3WIuoGe/fauz7HYYV1AoB+PiNeYHJ2vetramtwc9aYP2rNXYADsfsdP90iQLcvW126y9gCgOK+s3U3LvXgzn9AE1TCHLcM+VUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567631; c=relaxed/simple;
	bh=RWItFD+xMPkyhKcdU1W/q/G24PtA33ZfMfA8sLCFzhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kj4l2K67bG0w+rj4meotmbH8bCOfDZ3zYkTqVgD/FsIO+MBY0iyXsn42IN3BFP+1/XzUTcF/TsL/+/ATKwhJyI5s5GCjsEMFv1eyZcK95hzkaHJmZZ63+enUiQVKGUma1/gKgMX3nml1rvdDbwDpY9fqFEg45TnQvbb9Aa1hLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2Trqy0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2Trqy0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2CC1F000E9;
	Mon, 24 Aug 2026 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787567629;
	bh=HL1vq6LGseK5oHmbSJuvoie5coOOHPD8Uy40KAodNDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J2Trqy0SHMl/6ng7893KTDv1vWBNUdfhtcV+fYyHbXt5Bo0YhbCWETs0TtNcxkoqN
	 E77+wZMJr74iZjC6GlkNIlB0My72yPXqNMEvlIq76rMnrKd1mZKy7jQJ6dasf4kBbU
	 /R1xwLir5BSKnHJZCg4ijnjVQ5GpxLoRMlWdhzzpysmHXofXYeTwDsMYlFVJH+qRdn
	 h7dnK6Ac7Z11WgzsRCA+O8dwr2hTL/DNYCOfusFzdt5fzkJNjO5FvwbWj6XxvEW43E
	 4LN/35WdnxMpFXvZbyWydjwllUaOyYmo3/zP6tjl7MMmT12fsHO6MjrbpH2CKezE90
	 ALENDoJct3Dzg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com, 
 sandeepk@ti.com, v-hampiholi@ti.com
In-Reply-To: <20260820115114.1203-1-niranjan.hy@ti.com>
References: <20260820115114.1203-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2 1/3] ASoC: sdw_utils: Set component_name for tac5xx2
 codec family
Message-Id: <178734853532.89326.16193090451804199019.b4-ty@b4>
Date: Fri, 21 Aug 2026 22:42:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Thu, 20 Aug 2026 17:21:12 +0530, Niranjan H Y wrote:
> ASoC: sdw_utils: Set component_name for tac5xx2 codec family

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: sdw_utils: Set component_name for tac5xx2 codec family
      https://git.kernel.org/broonie/sound/c/9d4843ac81d1
[2/3] ASoC: tac5xx2-sdw: Rename gain and volume macros
      https://git.kernel.org/broonie/sound/c/04145998fa20
[3/3] ASoC: tac5xx2-sdw: update default regmap registers
      https://git.kernel.org/broonie/sound/c/cf82dd2183cb

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

