Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0661E9919;
	Mon,  9 Mar 2026 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039927; cv=none; b=aoaOAc3ExgnLLDOfaE+wSRw/m8Wxnq36jkGlKyhBsWeTstwpD4ty/JPrRQWp+peiLvSNuKxXnCBiHk9Otmvl9Shm+gjz727P+ZfNyltlq+OI9jC0AU2h11Ofcj049xB7gAaWuAaLVrcV1rtAIrhl70hkrzu1Y/y2S+Je3WNltoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039927; c=relaxed/simple;
	bh=1QAfZmUkkgfEKF4Rw4It0QvLK0KPcR01h+B2NLlEehc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fhdv+NMsXG0qDOQNTGREbED3WTaw63OCVFy3rI3z/bW1NTl+J9SExPSJdUOFP0crVohvydh72JBG+3wqdw8frhbnubx+eAMyWi/aITXQomaVYPLXwBUgu6OngqhuacCCU9x8DM+SDH5Zzkb5fhFPPag/Pa9XveBH+T9oKKBPmlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAG3uGYU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAG3uGYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A46C4CEF7;
	Mon,  9 Mar 2026 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039926;
	bh=1QAfZmUkkgfEKF4Rw4It0QvLK0KPcR01h+B2NLlEehc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nAG3uGYUWiTCpfhoYlKyxhqWurYjUSBKQUxbGBQYZ8zTJSvxL0yjWRD6t1yilTbu3
	 G/64n9Yq3NSPLsZKzZFwDHg5WaqIsOdqvwqVKj9zSQkuFv9OjaPRe61DjMjcK5fR5k
	 Io+ez6FLHQJg5TReotJT3r79AqBH08qVcpuW1CFV2K/dUjndcXgzY768nYS4H0viDm
	 TTmS4WmXx+w+QLZTBrRpGMVmeJlmMUILioDBU9A+RWFAbk1kAGP5z3+9/tkZVAokMR
	 Sw+fVOzRHXU51Ndwd4iJaSuJu2zTfuSQRM2oWLP1P//y5ESn+hgiBcPfeVBhF+arBV
	 ReY/PwNrXQ0vw==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com, 
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
References: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V5 0/2] soundwire: amd: clock related changes
Message-Id: <177303992475.65210.3516669391130037461.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 05 Feb 2026 22:14:18 +0530, Vijendar Mukunda wrote:
> Refactor clock init sequence to support different bus clock frequencies
> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
> 6Mhz with different frame sizes.
> 
> Vijendar Mukunda (2):
>   soundwire: amd: add clock init control function
>   soundwire: amd: refactor bandwidth calculation logic
> 
> [...]

Applied, thanks!

[1/2] soundwire: amd: add clock init control function
      commit: 2a267a8410841ba1c71daa41d1fb2cc21ff23e6b
[2/2] soundwire: amd: refactor bandwidth calculation logic
      commit: 27ab4f1e4909a674dfd03058fb9802cae2343a36

Best regards,
-- 
~Vinod


