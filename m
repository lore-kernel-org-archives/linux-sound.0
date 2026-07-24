Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC768376A0C;
	Fri, 24 Jul 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886793; cv=none; b=nUqVW92n436gGq2l3WZ6CE5TepZc5sJ+oxJvq8FdPC7g8NuYA6hMfK28vIn+Db7qww3pzENZ8NADArWINev42Qc8F4/ZHhQ3YcQqBIN2/p+44RIetpnJqritcwiMp1W1c84BXoHK4s9EvzeWWQ00qrZnkolMLUtwJMFcvjcK+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886793; c=relaxed/simple;
	bh=4kBQ0HqAytNnq1xiBl5+eshVPaIpbEGM9hS6K7Rdy14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfsHb5FOz0Ry8WZbPvyJmKl+bbzrJUwKIYusEMjIs1KDdGESZo6dQ+ctMC1eTyQ8bL8ZrVPAhcutSeCZAXJkVJX4K+lCgIPfI0NH23hGmg0p2A3NFSZxhgTnGF15VeseIjLEzvcBKQ1x/n6Z4eaLPaRyIiG+T2Sx6RcWYGsis7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO6XqTYe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO6XqTYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481591F000E9;
	Fri, 24 Jul 2026 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886792;
	bh=4kBQ0HqAytNnq1xiBl5+eshVPaIpbEGM9hS6K7Rdy14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MO6XqTYe2/eJQn0aNNhD8q17lWZYJh/dgp4Y1kaIxv+I02UjTQM5bZp15lO924KJ6
	 U1ayaqhKZbVzaKJykyqGPsM6uiSBpWDVAlajZNQqKaOboE58B9IIlCSUtec6K5UiAK
	 NawJS9ijABaJDjIS4h9Xq3T29/SReF9ihlvXrzoVDIOyODXLuHsFZZF9UhxS5JAkM0
	 Iag9RzdTTQWLWFXAQ1SZN4M6rmL1KEg3AJ3wFtwFQZ48UwrUVrxik2aczaYcnNJkeN
	 yRTBe24jikdtXEPXIksE6C33d/U/YqlmAB/8yFlce5rH5IGitO2TS34VcSfy60sRPe
	 EKWwyQvTF7VlA==
Date: Fri, 24 Jul 2026 11:53:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Message-ID: <20260724-pastel-brainy-cat-eede15@quoll>
References: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
 <20260723-es8316-regulator-next-20260722-v1-1-721f757879a0@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-es8316-regulator-next-20260722-v1-1-721f757879a0@thundersoft.com>

On Thu, Jul 23, 2026 at 03:54:29PM +0800, Hongyang Zhao wrote:
> The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs

But you also add them to ES8311 and ES8323, without any explanation
here.

Best regards,
Krzysztof

