Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC9E42F6E8
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380478; cv=none; b=AGyU6p72RjOwjlglbec1IqOSOlvCbkHXtaNfrXXi5FWY2KchLZX7h/yAUmN3gym+cz7PNkWcOeciIl/4riY+M8mbT4SiMpx+gKQh9GKW5y63fufYh8i/SRrraJmCx+/DNxhJQlbbaVHVqIDqmPF/ZmYCDD24n4r2k++O7xpLIrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380478; c=relaxed/simple;
	bh=StZPyVzidhmfkYZ5y50qOxvlqN0diDRtdTA0M1WLsew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iCgQfbUgC5Ae232FizSUKWhlt5woJ+JOLy7rQc25kIU8svV0qDyIND7LpS14sVSHJBnM8b5S28KMrCBRcg3AWp7Zu8F7tfq4ND3KF+y1QuLc9BjiTusq9nvwoHSwpAd7lwrmY02bKxJ0WL139yFLe11pTL3yi2B6ARRT/f4dQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmiRnhK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmiRnhK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272B81F000E9;
	Mon, 10 Aug 2026 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380476;
	bh=hwkAqTJVbWQGI5qTb8CYQH6rxqvcSSwdUabDAZCjrlQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nmiRnhK9CvaO74Cw7xwmPpsmBY0KH70rIYz0E753ddsa0pOU+wziCV6jgc/n6j5rZ
	 cbvSQJWvVVc7FEZc7UTCCb8C3L3y2t0o+nJTHmsSy48wEmG5i3vX+TlL7Rb3PoVm1D
	 Ff+ulOL7NTf5ek+nkk9KsEgRIPzmDZXNf6uqYxAM6PofP9tq47ZT7gelXyJsn67ToV
	 b/9A75gFK/pa5L0lXcSn1vZqS+c/6NDwCMNELY1RdRpDZdqrA07dGoqtzhtZA5LC91
	 OcPqqkmRccbZo9smqT1M8depNgU29vul+g1f1qDVPcs8Y4WnSEVfQOn6WC768nwwrR
	 j6WiGF9fuDYPQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260806105742.2676322-1-yung-chuan.liao@linux.intel.com>
References: <20260806105742.2676322-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: Add HDMI-In capture match table for
 NVL
Message-Id: <178636522048.155010.11512823001212846427.b4-ty@b4>
Date: Mon, 10 Aug 2026 13:33:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=broonie@kernel.org;
 h=from:subject:message-id; bh=StZPyVzidhmfkYZ5y50qOxvlqN0diDRtdTA0M1WLsew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqegC67k+ogz/T/O20NCuMYWgeakAcMW1gynz+h
 xI1cKSJDMGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanoAugAKCRAk1otyXVSH
 0EeuB/4wNMMVCxE1HSA/et4mkP3/0asfz2PrRhbwafQw++3McKpU3dp3+jUSQCJJiQY3iQdBdW6
 NljqXHXmcx2s+5uSrtLJmhUETfGz2e20/WbScxdKGjunQ5HT2CqQmidLFYuh810oLHYfPUYtO89
 XGgfrhfr/j9TcuFX6z+khnLJUqQt4l1QppYvqXDL6DqqUNSsAqX7DZhy9JLNKwQ3AXc3KQNqnDA
 4yAPcxQ544VQolXa31lYvChGUyd958PooYyYTe/2sjW+CW36fVsq9huvuutAOSMchpmCiUPgLED
 ccjjCQyh8PFI/Z8/hnOYGiBeXpRX4iEl0dzLh0Bi3H7fKUFN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 18:57:40 +0800, Bard Liao wrote:
> ASoC: Intel: Add HDMI-In capture match table for NVL
> 
> Add I2S HDMI-In capture with rt5682 I2S codec on NVL platform.
> 
> Balamurugan C (2):
>   ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in NVL
>     match table
>   ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
>     NVL.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in NVL match table
      https://git.kernel.org/broonie/misc/c/8560d458509f
[2/2] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for NVL.
      https://git.kernel.org/broonie/misc/c/d10549c4bcaa

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

