Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3713CC303;
	Mon,  3 Aug 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758762; cv=none; b=dKzk+60RHQp2dCtPVY6iBlxEGULGK2jVNSqFHky2BTNLw+QUk+vuNHWCWQ0AMLx82UpebXdFLejOPwQvtlgx1w1iMZNfWAjrhXvr1dVB7xYCur7SzY3RFv7woePQvi7TrsgyIhV1gVDk68ZqLsBrZ1RIpy7FynFPGeuhTuZ0d0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758762; c=relaxed/simple;
	bh=NOkfcwhah5Tc5nl/puwyxLPKON9/6gv429dToMq54l0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MJi7pUi01Ht6ozM55iziFQ465pdFVoN+7hLkyFFgYmaLq1e45Ibg7QBO68yEKDMAVWVUKb70Vz53inJsuvX1mqlQiYHXr9GdAkUD5/Hgv8IyaqYsyK+7jgSw8tmrvzp6ss4/ZCY0wn2CkTJCLib3nwWO/szO8D+VaQe40MgxDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I65pIwPv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I65pIwPv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3011F00A3A;
	Mon,  3 Aug 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785758760;
	bh=lVNNmNCK9bOZXlldcs8wej7MUpa3YkHOc63Al30zsZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I65pIwPvMM3hQ/brfaRqeyLsSnVl0YQE1VAVc339frn1ekQ2rtqi7+JcwrlRjTNty
	 iyHmW2lvrZTdErIqEtzGh/VT+HJKF8VBGe59k4e+LBrmgEMQUw7YBrQRQL/278f7Ua
	 FPAL62zBTB85z3CvcLCvzXcD2IMuXKbja4XEw18LoOl1HQGibsenTf87Co254j7mRL
	 HU3jGbQYncB6hHrdzSmsfh8JITrGThFvGWIo/izyb5k4Bgot2aScpqRUNNdC/H50um
	 Lc8GPftShIgdm2H9Ee/jRvU0saQSc+liYe74l8fHGYAi9/3uLc+D21piNyv4tgnqco
	 wwsAszOkyvgnA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260715115220.3093799-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260715115220.3093799-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add support for the Qualcomm WSA885X Stereo
 smart speaker amplifier
Message-Id: <178554011146.353541.6801919941766825573.b4-ty@b4>
Date: Sat, 01 Aug 2026 00:21:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NOkfcwhah5Tc5nl/puwyxLPKON9/6gv429dToMq54l0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcIQksiDUuCOj4XMT9LHCe07qxOTJ4X3upVRT4
 pKOaj2dvyqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanCEJAAKCRAk1otyXVSH
 0GjlB/4n92jd1sg4H1kwjZE97NSriHFSj+7KhQKJG1sStlNglwxpV+7jy3Qt+as1zgJlWwYe/pj
 r1sJ0lU5OW1I2BLE1xfG6OXAB46NYu3SkAJmLl6ghEEI8G9MZoCuL6bvV7/FJA1x4Dna7/OLO2e
 MYknAVsgBZw9mPzcEL4nihSitloJ7hWVp6RBTYsC49zAukA4GsKGbimNxN92XV1wcGz2nMYvBPw
 kFHhU/maH3XV9WCKl59qitlObelcyKdWb7MApBR8v/OO5KP1lfcd5KdsdKzSrrjC9qVlu0KkrFw
 aMFOs1JOkwzPcu+c8jtvNtgwB8WSSsFk3wAnsmwXHW5CoErv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 17:22:18 +0530, Prasad Kumpatla wrote:
> Add support for the Qualcomm WSA885X Stereo smart speaker amplifier
> 
> The series first documents the WSA885X devicetree binding,
> including supplies, GPIOs, Interrupt and battery configuration.
> 
> It then adds the ASoC codec driver with register programming, serial
> interface setup, clock handling, mute and gain control, reset handling,
> interrupt support, runtime TDM slot-count configuration, and stream-time
> power-state sequencing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: dt-bindings: qcom,wsa8855: add Qualcomm WSA8855 speaker amplifier
      https://git.kernel.org/broonie/sound/c/9151afc31402
[2/2] ASoC: codecs: add Qualcomm WSA885X codec driver
      https://git.kernel.org/broonie/sound/c/1d0368c9873c

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

