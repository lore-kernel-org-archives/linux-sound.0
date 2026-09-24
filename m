Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5D226D05;
	Thu, 24 Sep 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258640; cv=none; b=iUhZzbdBfgmT3FcWj92o3JMbb/dzUgfMay3bRU8VfvaXyIFhm6Y5g6rcELJbDbX4x7xW/IJfEQL8z75+jrVAJ9hsM55UVmoND+asRpAEJa+E15Zri9QBN3rYiLwAEgZDXCUlfFGfKVbTFKxMuKpbU8TiAO531gBcpbdyui0Wy5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258640; c=relaxed/simple;
	bh=IucfPCO1brhXLrFgjkZ/q2A15kB1HQXFjQ2ysYFlW68=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f8lBsCi0d8wr9xy9WpIzez5CPQ7oTEaD0wsXORUu09LqjH13yRZJUm7RFND9DesAeAyffURPuuo1nxGIZxCVgDO3o3JPrWiBajPK3YtqCai0i426QffjWwfszm45WvoRyyQBThFXq6PBc22Xra3JoO4BXuy4VlsE/R4weNJ1b0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgbKv9op; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgbKv9op"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5C11F000FF;
	Thu, 24 Sep 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790258639;
	bh=JwxmNJOSYW4H7e1P03DTryLvPsv2ht5Z1NUaDpNeL28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cgbKv9opMrrafMt3WgV1B6D4HUAQ8yd8KAsvWnrH+hPzrQAwhFbLagyJ7HibfS3CB
	 fCzZWIk58kSag3HcYQjdiywoZvfgTd0H3qGP6VDnwszZ/y8bJuqjeXQOHFiswm7VEQ
	 KBRfl0FRL88Ux7CUSU6vEzAncY+l+4jUKLJCABLQgM7qJVPd9fb6ueLX3DUAgfV3gV
	 OTpZJYMxBl1ObquhYhe12Pmfa45DM9FZARHirktTFKn3ikwjDAS5O3jv4nlefeN+M4
	 a2QTDRQ/W4Nzg/XBNA0OkTBYKTWNywehoyOJ6YAKNx0Pmvt2+bWDPgkJUMrsVmHGGY
	 sEHOTy5HnM+IQ==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev
In-Reply-To: <20260923-ux500-simple-sound-v3-1-56a771c3ea28@kernel.org>
References: <20260923-ux500-simple-sound-v3-1-56a771c3ea28@kernel.org>
Subject: Re: (subset) [PATCH v3] mfd: dt-bindings: ab8500: Describe codec
 graph and microphone wiring
Message-Id: <179025863713.613643.13680822984387702213.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:03:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 23 Sep 2026 19:46:55 +0200, Linus Walleij wrote:
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

[1/1] mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
      commit: 43be6abd6775820fdac3729962f7e7b841104fda

--
Lee Jones [李琼斯]

