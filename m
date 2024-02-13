Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453EEBE76
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849101; cv=none; b=e4xZkGc9+OFO3kcwBDtRSEaAssGU6CiurlaftvE5OajwmCukaqnh9kYqE+fda8Uz3TWRP6k/jdb1bJktKZBvVqn9GdcQvOXk4d24shStfX3o/2hwJgUSSsuAMiO21cmeIgqwwTjFM5lboXNGxsFye5S7S3DLqmQ5qxxBNE14dxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849101; c=relaxed/simple;
	bh=Wt8DchYvY1C9NOvqjvzgp6DIO+lZ35HJSUT2mPaoqGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EhzRBXYR2ja/8uX6sZuXCci7VFdeloZ1SJZVGyY/YDkWXCqTUFqJ9y+YIizXk6luV6tbGrPQS2Z92w/sSO1k35ZrpeZCAbZnzml9deLR+YfHST1zBN/J/NfWT/hYEBKWyNxZlnzA0IpxROfpzedRoWsxgii2ZIAQYrefhN4365I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6zauee6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6zauee6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4C3C43390;
	Tue, 13 Feb 2024 18:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707849101;
	bh=Wt8DchYvY1C9NOvqjvzgp6DIO+lZ35HJSUT2mPaoqGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S6zauee6ZTK5wniiMZ3T/nPNE7/J3Z2b9/QEHmwm4TLCA6lTXIGdn12QPPITKLU5z
	 1kdckNHFRqO6Et4NmTaZ4KPQauwF6x/NzFw9Ze7eGe2ijkPg323uFgxhhT/wMGhq9y
	 BJvvB0irovWM5iG66aDRC2wgK4bZvc75DmMNFlRWSVgMy3P/TY8KaAlKIsWL2GPlJa
	 h/uMUNEKZvWq9n2/AVQ/32GY3Csm6RJB+ABuGEUHf9IQWyLvsYRMswQV6dk1NiDx0M
	 3tMSXpkCemQZ5tfrJCA26Dn/n30aRUfLBh9/x0TpVxrGn7m7dGcoX4y01Mq6oC8oJ6
	 NHr2o2Yq/Ptmg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240213123007.29956-1-peter.ujfalusi@linux.intel.com>
References: <20240213123007.29956-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: set config_length based on
 device_count
Message-Id: <170784909950.647645.16375450834176377252.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 18:31:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 13 Feb 2024 14:30:07 +0200, Peter Ujfalusi wrote:
> Set ipc4_copier->data.gtw_cfg.config_length dynamically based on
> blob->alh_cfg.device_count to align with the other OS.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: set config_length based on device_count
      commit: e49676a5fc83e5d396f45ce4b90ca9c44736c69a

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

