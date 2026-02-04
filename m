Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C3325738
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206449; cv=none; b=RtHqLfHoOPC7gmqAZ5vVdD8ID+3PJ2CYP3juOlwNhALcaD7W3as52UhjTfjwftWMsn3gQWpnoslFd3n7PuZoUcfWDBngSY/NUEk0LtC6WGmtcytNaZ2olGCzcusUiHTwgb8S9xibPv7n7v/8nYrKi8dr0ZvjsbgBwkYZtlTPbTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206449; c=relaxed/simple;
	bh=kVQKncvMof98n6C/pypNv1iwt0yrecY/zMIajz1DiDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F9nAu5MZdtPkCABH0YUKFHrpzehwuq6jMscl1ZIGOneFA8dmJzxQdDUo4ngvR9xkPio9yMpJ978IhczIITEtaGHJz9Vp7TakL1EzfI/RPrhififFlB2ZEZxy1AqdBde2wiC05tTTEXdUa6mJDsjhwGQQPjgMFVQorF6zD2tKWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tmo0Mj5T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tmo0Mj5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C31C4CEF7;
	Wed,  4 Feb 2026 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206448;
	bh=kVQKncvMof98n6C/pypNv1iwt0yrecY/zMIajz1DiDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tmo0Mj5TzDKrhonNz/2vgI3fkRcqc6PBAbnYya42UbZsFojleIdWLWFVN3drwTX3d
	 Eoyf3VrljnJm7jt1g5VTfSxKMFVO4WwhCGs/ZH1X5W4WH6T+XdRUc50TsR/6CVfHK+
	 7JtPTamk+QNYyaSy1IT5ETMyBHrQOVw/Zcqn5tktcfP/m9Nb6Hdx2Mya33QaukgwLh
	 THlqymP/mmZj0nKYLRVlLf8t+ph/vXeeQEviwUBdt+SdtwfvEXjmaUCzA8iCiZClWM
	 P6q1z2L0DHvVg7VJZotPk7v5F+Di9WB1ov5m/XZO+RRSjXL3NdyP6ajMgdei8QYYJ8
	 qIoP/Xt9cDBbw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260203084827.768238-1-shumingf@realtek.com>
References: <20260203084827.768238-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix intermittent no-sound issue
Message-Id: <177020644714.60772.8173206642823384965.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 12:00:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 16:48:26 +0800, shumingf@realtek.com wrote:
> This patch adds a setting to resolve the intermittent no-sound issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix intermittent no-sound issue
      commit: 6e1e735181e0c18e1f4ecb0118be4b1e2ee439d1

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

