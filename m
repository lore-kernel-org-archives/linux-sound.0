Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237433537F8
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235174; cv=none; b=T8Sj1ZDdukP7/T96BvznwrFJN4175UcPpnB8wt3a+pZfBd26QJuHxxygXWQzQCriocfZZcFXP9UAEDqNrp+bfcYwxipiiod7GTobMSsc/b1+pknKvAIwisa58pvdfgSSpv/ZgkcDDMhW3F+eypGwg+TjlRwWdicCRhSybjhG04Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235174; c=relaxed/simple;
	bh=b8kPu8wbAGq+BifQT2NfaPvIOO95kw4fTwL+1HBweAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gext+hRPWHEdTnOmhDYuGQvbcTdHd+akfj4RWBz08lfFhut2nu8UVwMh5H+pLJUC8F83X/AIBgwQKgV4771DY0jbcQqFP4SNJqeQutNYdJJanW4Pv/8cs4HteoJv92GrSp8dlz93AHGafKyh0xKD8Y325o/d0idd+g5UA8SX7Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELYrWXEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELYrWXEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE68FC4CEF7;
	Fri,  3 Apr 2026 16:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235173;
	bh=b8kPu8wbAGq+BifQT2NfaPvIOO95kw4fTwL+1HBweAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ELYrWXEZMc+gL1TPG6xUMyTo7Kj3Xnx14mG0ryiEjGeNHDcdkguFIXjIgKGT4vf2W
	 Pg1MijLj5NKMdqArDYlK3arjc9kY8eGMue9UEAv21F7R35TulChZVU8jQikI/RvBUw
	 gGpxO38barTW2IWLkTD3kWM/LQzzUI50ikRUMteTP2gt+uhked8ahBFS711g3c/hGN
	 gK/179/KwUjo5i0CZ4XwXc9HiBPWkqc8/fI6TZ3k9jSNEkCj+nmFpDPzFvWMAfNvSa
	 mMxdryqiG5ZRJDp7ME1oDW18WTBl0wn0GM2k2GxjVQnPazk8o3910jxd7FemlqLGyU
	 /Cxs8ABmg2s+g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260327162732.877257-1-ckeepax@opensource.cirrus.com>
References: <20260327162732.877257-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Add RJ support to class driver
Message-Id: <177522547472.52946.13858878431367961061.b4-ty@b4>
Date: Fri, 03 Apr 2026 15:11:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b8kPu8wbAGq+BifQT2NfaPvIOO95kw4fTwL+1HBweAw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/Bjqe+dTyYVBfAs1AACT7o23JBw4f080cmxz
 HZpJxhnLq6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wYwAKCRAk1otyXVSH
 0PmuB/9zIKZTkegTFxoTS3vaWr7c7gxsHQlrsG9U32+dim2/5MVZ2SD7kb1ZR6N/8tdwiMhfxmd
 lzvnW7LuRhOejxK8Vfl986LWezu/Uaxk6Gqb3FCiuHaGN9Yij9I+bvpHoD0BDJsPqgzWfS5JyWw
 vJREIdH9w9hOP40/nVXIIzqsyjHX8pTT4AA9qk5hENAwFRlGnqgAaO3ozQ5ijCeN8pHKjEqliNh
 sa28wVLfp8VqptY2T7gzFOv9gIDgkzbYBp4mz2iX9FKcAMwoGXsj/1qE4SabQkCWPuMFgQ1PlLm
 IzpmH0x8EajImINjDzljAgGfIAD+7y5VygVDyrfcYmEnmi2G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 16:27:32 +0000, Charles Keepax wrote:
> ASoC: SDCA: Add RJ support to class driver

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SDCA: Add RJ support to class driver
      https://git.kernel.org/broonie/sound/c/9557ec3f9c9f

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

