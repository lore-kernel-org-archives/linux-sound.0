Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70282890
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405680; cv=none; b=Q70WUZ9qzVBs6vTiDkv8xi45DC3s1Vhx5eB1sP96nrcKA6gzTWbffl3ap8W/5ZnfyqcSmP8MvxWkYpH9vkL0NECtCf+iIGJNnqex2A4zZo+hkRdJ4MYsecrX2BSwSBbWEz9Ne/A4skMNNCYcIFmVX6ZNCDeuBhuKq5KJaO5kKhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405680; c=relaxed/simple;
	bh=H+POJyy+ObWvCNf590vWO7r/nOCcFahQMpcInccgWFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=apOG07ieYQU8kNIVT/Be6MI4vvqc/OhUwg9WKTbmg2M/kSfYNCLbHsEvOq9kx1Hd4xmBsZauQO5JWBWoQm/rfdyjOvNWp3YXUnGkrh+9mKQeb4HNN6fjT/BWYt27EZ2WzkMBNAuJyxlWbkQQW+M+gXuCxodsg5PvRMOaOqBEjeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3KtJcwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3KtJcwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681EDC43394;
	Mon, 25 Mar 2024 22:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711405679;
	bh=H+POJyy+ObWvCNf590vWO7r/nOCcFahQMpcInccgWFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u3KtJcweXglFJH47EVoUNbMzD8WESHS7FYUxzUeyILOS/PcNcykT/dIV9cziUSTMY
	 PldEJpEH523FwT4MJbGMqcA1EM5SIqlpqZzC7yErMGlGXcNuLTbN+bAbFSXp07++2V
	 AstYNYBV9Gxn+H0xATrCW0MmwuZJLvb7+8+ue9zAira8HSXCagnPLtiNA4+JE2ao9j
	 TdS+UTr6UPRuZGVL3b58V2+Ac8Uc3mEyppTk+m4VBpSVX2Ay8ul+nvdv6oKeLiKAh/
	 +F0glc6dXBgMuVeaMx7Zmu/tq8nEGB8cH3hk81f1nnGBqpctrThqYHCGZvWmDgWHGT
	 /m8AxmqwFqu7w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 rander.wang@intel.com
In-Reply-To: <20240322112703.4549-1-peter.ujfalusi@linux.intel.com>
References: <20240322112703.4549-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [RESEND] ASoC: SOF: mtrace: rework mtrace timestamp setting
Message-Id: <171140567816.375229.4056454141951704814.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 22:27:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 22 Mar 2024 13:27:03 +0200, Peter Ujfalusi wrote:
> The original timestamp is built base on windows epoch time which is not
> fit for Linux system and difficult to be used for kernel debugging. This
> patch adopts syslog timestamp so that we can simply use dmesg to check
> the timestamp between fw and kernel.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mtrace: rework mtrace timestamp setting
      commit: 708181c50b7763c689ecaba5db8075c2d03719c4

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

