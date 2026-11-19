Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113136;
	b=2ShTGw4Ey+JAaUJB5r76U3RjZx9JsV4NpR4vT3WowTupXubqORmeBhreGIHy21frhiRh
	 fQw0W2ZU/dEyNy22BuWYeLR708JBBBR/LCzsR0vcfLLwncDig768lht7YcY2j025ioUFa
	 WvqZ4DjsxsumPTUSEUZp4yjTjN/Ov91DOESmWtG4JBdN9TS0N47yfKpQAGVtn45Hi+O49
	 SV1NvB/kVYtiW6ses6sjBAsXfmpDISHxdQmWhQEjv7mfsV83RmQtdfqml5aR9jnHvItFn
	 orVrWI7PrwV3LApTSHlEN7vj8+b4Te1EG1Aj6LNlc8L3VOXc9jYpbffXbiT2h/2r4wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113136;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nipKs9262eBvG32JnGTpMVA/4l3aCvA/z8Tcif1DkJo=;
	b=kBDTxVyTVDsi13zbTWYOUs3PeeeeqD6Yt8EkB5LAaaFSISwhlSYfLz0drZmQNn6N4HP0
	 Q4IXG0mvsWPtpInh+fgixdMx7y5QQaoavo4Jq+fVuWFdalpdOq0mQvoXHlAxBMiQhwmMM
	 +fSsphu2zoY+atZsxewC6Fbgbt4+dUyWJTyNAbpu7XxGcG6fW6xR+XIPkpGlIkaG+ZeOj
	 sZn5OyUlGf0ZjxRWjEfvAi9B2XN7j1XmVRzxJSrxqO6kUXf9VQjMbZxOz/xBbK0T186BS
	 Pt4k0NlBi+kuGKgzALreYfCf2xQVmCShXLiP7zBCK8s5z8ivM2YQZygrOg4Jukjt2XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSZoY4YF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D553606A337;
	Thu, 19 Nov 2026 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSZoY4YF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC391F000C4;
	Thu, 19 Nov 2026 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113136;
	bh=nipKs9262eBvG32JnGTpMVA/4l3aCvA/z8Tcif1DkJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HSZoY4YFIuCsD2jdmflXQCq7bRcjBHTvlunBUrddKB7lLQd23EAXl0EgNNwn+k/H3
	 UiU0eRZISfV+puwehu1aZslzbU+TduTaUa1r7RVQYCo2BF1uHQyaYrYgY/1pkvOflx
	 ZReFdIxTLMT9acw2+FoPtli6l8Soqys0uzkdhegcEuN+o3SsJa1tEFk0JBxvBqgT5e
	 skYVFPv/cChV6wBwc0ywt00Zc4lY8hduwNdmjp+YT9/V7Wagx/UhBvRtBvUCuu2Sm4
	 Oe2D2A+ESOcd4THn1STChrn0xOq5xDmgezmWEkYKhKALolruLVMiTlELJUvpoTQqlv
	 HYXdU5vG/kgxA==
Date: Thu, 19 Nov 2026 18:32:11 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, patches@opensource.cirrus.com
Subject: Re: (subset) [PATCH v2 1/2] mfd: cs42l43: Add load detection
 register needed for cs42l43b
Message-ID: <20261119183211.GA70182@joneslee-macbookpro.roam.internal>
References: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
 <179510674408.77674.4732953853855712916.b4-ty@b4>
 <22f5f813-79b1-41f0-849c-263224c651c9@sirena.org.uk>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f5f813-79b1-41f0-849c-263224c651c9@sirena.org.uk>

On Thu, 19 Nov 2026, Mark Brown wrote:

> On Thu, Nov 19, 2026 at 04:45:44PM +0000, Lee Jones wrote:
> > On Thu, 12 Nov 2026 14:16:49 +0000, Charles Keepax wrote:
> > > The headphone load detection procedure on cs42l43b is slightly different
> > > and require a register that wasn't used on previous versions of the
> > > chip. Add that register into the driver.
> > 
> > Applied, thanks!
> > 
> > [1/2] mfd: cs42l43: Add load detection register needed for cs42l43b
> >       commit: cc29c6e45db7b4306efc7a76e7a64d549229d4ac
> 
> Can I get a tag for this please, I need the register definitions it adds
> to build patch 2?

Sure.  Building now.

Note to self: ib-mfd-asoc-7.5

-- 
Lee Jones
