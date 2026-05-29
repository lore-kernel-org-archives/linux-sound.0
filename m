Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12E3E3158
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402102; cv=none; b=M4Ix+iGFRoFgKFjSpgK4qPpo/wNhZysbo6jse8v6gV4tzYcdM96jAEaDp9Iin0kC5SGMav7LMZkzH4WJmyPujBq900JYW3Ucvu2rr+NjWqNdXSCnR4Yzt2OZsqWxQrXqpf3u+CP/U/Z7HNS8z3giHuEr29P4SlN+01yninyAaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402102; c=relaxed/simple;
	bh=U+vC/LV7AIfextMr9iQ0evBGpa29N/QzrrVfRLjGcs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sjFIrp3n4yPkX3GqFRMoWm5J4B+A4FrfH+dNoz7vYD0GNpXo1GmKxPQlPf0qV3IvG7S1DTyHSu/G2dTgM9QZE+cp1vSRQSxj1dzfhpW0GQuNHv8PKyipQ0OD/ME6Zt+WWphToyXTQJd5E2JjEWcocw/7ThaPJ9X8a2ZHdQMrvX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4uU3AyS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4uU3AyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174E81F00893;
	Tue,  2 Jun 2026 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402101;
	bh=CZQr8SkE0J8JRt9iJr/HtFCeiswU/nCoN1QA8bDw6Dc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W4uU3AySd5f6RzEk5arxQ6u8CH/3iC+SnjrjAz2i09Gxtk5z3Vcj0r97XoNJuEpvZ
	 rIOnCXhRGw7dQZhA4ITSR4MV7cbM1OnX+h4cucc39V2HJIaJlaJ92K7SzZX+kXIGm8
	 KJOqApGG5xqZTBdkY7jo/Qe3vhiWWeAx5+L3fnqrtoLLQa0Nq144uMpmIXFb5ZOTM1
	 fck+pjcElXiIaUAooO5TvjFZ7d1SkLsZzqgyYMSfjn5w7JA58zqAv5PtC85IWYR8pU
	 dP6s7N2LR9HSLtFmSRFtFI3BZiU8+6Mw/KeytuSiFc5Oy5jDAMKlz7y/JHnRv9YtrO
	 ZVBIbT/54YAIA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260529014259.2528048-1-yung-chuan.liao@linux.intel.com>
References: <20260529014259.2528048-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: return -EPROBE_DEFER if components
 are not registered yet
Message-Id: <178006575363.111357.16469653838193455619.b4-ty@b4>
Date: Fri, 29 May 2026 15:42:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=U+vC/LV7AIfextMr9iQ0evBGpa29N/QzrrVfRLjGcs0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHsezTKR7+eF2jU1015I5pNAewzn7xSfey2cF3
 aFdIazzGdmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HswAKCRAk1otyXVSH
 0JUZB/wIwX7RnR3LAU2+YGJMjbTieMMq/2VKZMXljw8oZ4Bc1XpNU5PEjtoirB8DNZji3zg+H6Z
 8oJJoP53HJo8KFbEwFV0zFQ80DDiA1DotxK919T8gZ1lbRZFvYVsJ5gZBKImI4Fuhn4eHGXJGjM
 zKif8PiJOiWKWSkvIssRgG9Br/3BPiP3Y34gOMZyt/aN+oA6yPQVNeSICa6xPyuxgsfK976M37p
 Xtt+4A2PjqKNNOhEaEXF4Bw/QveeS/aSk9TMleAt4zEo8yrb7PMN7weo89ainErYmKE8bMT/UlH
 /3Gr9+dEFHntdU0dZB6Oaa2fHjafZLDn7CELFlrM9lhmdf83
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 29 May 2026 09:42:59 +0800, Bard Liao wrote:
> ASoC: sdw_utils: return -EPROBE_DEFER if components are not registered yet

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sdw_utils: return -EPROBE_DEFER if components are not registered yet
      https://git.kernel.org/broonie/sound/c/98d08b2e0e92

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

