Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD48396D19;
	Thu, 24 Sep 2026 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259712; cv=none; b=fSGPG7p5Gd6E83PKc7sFj9MeRMYxcIFdMrROiv10DfRj+YzioWO/R6XAgmBGkkfWZWvTanwGcg/7rZfz7eIPgBqHjQpEDLegom2RNLmwPBYiB23EUwAs1nwJpn/nv12tN16Sc7Lnhd2+ANwtD1CY53OU1uTq6oYL7TgIs7C1/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259712; c=relaxed/simple;
	bh=Oa6sZw21xUOxdZl3n1JeEqYt/PPVu9SnBwajlA1DKfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CU+seYak+OJJheQUDlZ0D+QzLm3jtMbF3BkuSAuOQF1m8M5hrE2bMn7MIczUT3lTXG15l2EZqBEKoigOQjGYHQGgs9I4mvvSe/Kyzzsm/ODw1kDvc9xKc2IQVeGoFCQax4NX/KjOVqHrhS8OpVb8UXcc0hnzh5DG8DjpjLBZh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqEldbt/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqEldbt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BCE1F000FF;
	Thu, 24 Sep 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259704;
	bh=4B2MoTNcpsWGZzkpeU33cn4Us5tm9kZ3IAWT+UVeU9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lqEldbt/DtlBLwItRIFLXH3ugFZ3Ic2LGL/ko4MX/Rwc8+Bnv6pKMwPsNhi+3q0Od
	 n1R1EWYT5g7dPR5LSsnAHsP7fGrY6WIaiy876U3BLaHTgwbZQLbOjrnsfqc+PvVxFh
	 RNN0s+mv39D/ieiEpjke/mWa6vp6DCy035fGA34VWzqAFjfoIyQWDRfPJcX6lwtA+H
	 k64aBuuZCrTbkfc/0qAri/tpgBo3ic4Cybj0Qg0M8v3vWgFeBgC9EWEiXiSsPVx525
	 gjfIDLvDVf7QZBzv3YzmpF+p9xJMTFcjuTCTG/YBAwl+Y1r+xE0z17THgxSMh3pguo
	 T9qWog48xxHAg==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev
In-Reply-To: <20260918-ux500-simple-sound-v2-2-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-2-88d29416e3c3@kernel.org>
Subject: Re: (subset) [PATCH v2 2/9] mfd: dt-bindings: ab8500: Describe
 codec graph and microphone wiring
Message-Id: <179025970227.632975.6865803910242593139.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 18 Sep 2026 00:51:00 +0200, Linus Walleij wrote:
> The AB8500 and AB8505 codec block exposes two digital audio
> interfaces. Define the codec as a one-cell sound DAI provider and allow
> it to expose both interfaces as audio graph ports.
> 
> The codec binding conversion also omitted the analog microphone type
> and bias-routing properties supported by the driver and documented by
> the old text binding. Restore them so boards can describe the codec
> wiring without schema warnings.
> 
> [...]

Applied, thanks!

[2/9] mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
      commit: 43be6abd6775820fdac3729962f7e7b841104fda

--
Lee Jones [李琼斯]

