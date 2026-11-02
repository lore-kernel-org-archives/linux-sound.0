Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706824;
	b=3aI/1ZSAjXNPNiz9Pq8RULmmKQXwDo8TUgTWpkS6VVxXRNVmMoAbNfLhXx0yPhMWZ0hV
	 CCxFOdYuvxMWHfYni0vQg4fbzwULS7NAmQJ5yvsLIzE6nKK7VSw1Ojy4XLh7A3FhcFLCM
	 1pS35XA/2TdarrhnFYtGhB2V/f7rRg0QjLeP3EBFSbvkXL5h5bM6U9hfrtxTFsv2ODvrM
	 szYHNBOHyPO2PxDryLlac3dPHWAKwpP8rq/0SwrCTqpxOxbL3vUB03JPcjyvRR0vtpdGl
	 SGhi3ckLGopT6SVu8rQsE9+21Cf52DO1bh0mxG4AkneU4hNobp9I5VU1OxTnd93W+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706824;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4ZsPZKQ616wlffNR+k8ZxVsC3ZJsQNe9aB/LGmaM27I=;
	b=atnjZ1SVQPRUPzfKFnUI8h41KuztVj2TmzSilTTyzYEM+gekNmmOIAF+/RfLtDMtgQVH
	 TCgaye5nzhgI0CYLO16gb2hKHl9itnv/FLGaNUZZecst8IQeD0FpFkaLplDaXQE+norID
	 L/Aty2F8elPqkEuEnQElBdSpzRNK3nTqAV+1wyXsMXD7tgJoOytR/bpCsIFtW4mpsX5w1
	 2dIjWZTKUKj7jMdrahkOAU+mjLS41005WOCRkZftWZNcmux3rL9Z+KbMyKf8zMbuC6QHM
	 CvRAvPUR5pGd4PWye3xsn5x6VAHHET8xQdWMv9UFYpY4xqXivm17bejPkIn7YK9cOAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0sY6fyt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA6606A32C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0sY6fyt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22391F00A16;
	Tue,  3 Nov 2026 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706824;
	bh=4ZsPZKQ616wlffNR+k8ZxVsC3ZJsQNe9aB/LGmaM27I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=K0sY6fytY1nQia1Htc1NnKqZTTbQH6WDgKtIZD3u2eOMmhjIh9vcbNC9zx8e0a9jf
	 B+mKHo4vBA0kwgFi9S0oULVxH2DieQLeXBlw3gC3Q02A19sngHG45k8hXY2H3/vaGE
	 lnMgCzQu37CSQQaJJjZ344yEbSu4IVQT4PummlxiozmAOMAoH50Qd+uk27f5KGZBUC
	 oSIIT/m5zwMcFg9ojJxkbDSFEmG18lJPKp73jIx3hCc0CAxhPnPoB7Z+YIxZ6/TSxV
	 YcXrHjIqifM0IZixtiYuh2LTHo4m8ueo7Jahspyqf8VRTQb0aXXd+RpSIFnkYZttjg
	 uzd+Q5cLe+8nw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9D05F253A60C;
	Tue, 03 Nov 2026 11:53:41 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261101110056.423353-5-thnkslprpt@gmail.com>
References: <20261101110056.423353-5-thnkslprpt@gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: rt721-sdca: handle HID button read errors
Message-Id: <179365889024.2186205.11499122571487905373.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:34:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l4hk4H1DZKrJXo1QM3nEMGqWq1dJ37B343vikR7yJPw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJennZd4RY+65rOvzLVU96PlhVx/NWxr66un8zYcXn5V
 ubuebyqHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIpyUjw8JXb6dOWWM1r0fq
 cfIfsQfXbxbZmvvrHF/otWC/4fPJojqMDM92mK9euTNs44+D3otPZq2/uePdpqUnV9UcnlXhH5h
 0L4kHAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 01 Nov 2026 13:00:57 +0200, Avi Weiss wrote:
> ASoC: rt721-sdca: handle HID button read errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: rt721-sdca: handle HID button read errors
      https://git.kernel.org/broonie/sound/c/fbfcb71025b8
[2/4] ASoC: rt711-sdca: handle HID button read errors
      https://git.kernel.org/broonie/sound/c/92017b92d9dd
[3/4] ASoC: rt712-sdca: handle HID button read errors
      https://git.kernel.org/broonie/sound/c/fc9d50bb07fe
[4/4] ASoC: rt722-sdca: handle HID button read errors
      https://git.kernel.org/broonie/sound/c/5928cfa8474f

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

