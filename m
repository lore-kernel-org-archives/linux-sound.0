Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857781;
	b=pirPAqdyMDPe2zfMaQoO9JLRq8HBhfXhvm+TyiUVrNTrDoTfKJ+WwBlfOziDtMVaR8JM
	 WsajM+xLPs4Abw9hFqs3R82Q8LKtcBjQ/SFDy4+6qQhryP9w2AEIH8kHD8BsmZjT46Wxp
	 drkbqFG8CP/QT7+Znhob4x4HZkU4C4+51bGLRTck1Jf8Z1qrtuEIEPX69r3PXff4Ua66E
	 7+pSWJbXuNUO2baTas9fNU37yWqBvJt7PuASiMr4x0YbJbgjjl24/tDZiJXIws6J2L1Yi
	 fNeOluMSNWw1va0kYmgMxNuLrGfpvuGAdZcVOBfL3yYGfPX+wuJvKBlj1Tdb5y6CGqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857781;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4Eob5Wzzgp2cYVU048AUoy3HUUiGkKnv0Ji+wO6sX0=;
	b=ZxyxwoUstH389Y6y1IZNymmUiY/rejaAxRc1zbMtz8BOg5zh1DvIA0j3DfTpxt3Q+O+2
	 X7jsTyiIjJ7lGnZVJ0F4XSlRHib7iBOtKOFdS19Zw0Tok3Nh1k1KCPJQP/iNPgXNR+zz8
	 fhi36/Tayj5s/ZgxO+HA42eQJmKHhsITLsynciVMagqVnIbNNRwZ/2Npmg+/GEuFYYmB7
	 F6QCiMhBXWsaMQX847LTyqgfG4mUcL0cztidfLlKXz5+A1cQDHzM68dFtpQewcQetDu8b
	 sJpuzobckEWN2k0Gjnl30OtUqVgGHxmIKXXQ5wYl58OZmSSzizxJ6bkw7t7y3daLs3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=JxJWW7Jx;
	arc=none smtp.remote-ip=198.252.153.129
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBFB606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 09:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBFB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=JxJWW7Jx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795857775; bh=e4Eob5Wzzgp2cYVU048AUoy3HUUiGkKnv0Ji+wO6sX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JxJWW7Jx3y0ijKFvhAPzTQfv8pkG2r3oIDxMX4KBdShvYG4XzLjopGEK0WtBprOKQ
	 oozzDiumQGlqgZ3yoUt0N1KOm9O0IFXqz/ZGT98SzhazC5tf0+aAISjMmX0eB8WTWx
	 MPdrYLsLxTgfqsvvyYJV1zhQgUlp7KMhzMZFO4sc=
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4jc4ZQ6N0MzDr6t;
	Sat, 28 Nov 2026 09:22:54 +0000 (UTC)
X-Riseup-User-ID: 02E249D0512FE77C041677565E6F3099A81A48A6F912E391F578F57AD63A7801
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4jc4ZN6xh6z5vdG;
	Sat, 28 Nov 2026 09:22:52 +0000 (UTC)
From: Rafael Diniz <rafael@riseup.net>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wm8731: power the converters together, activate the interface last
Date: Sat, 28 Nov 2026 09:22:45 +0000
Message-ID: <20261128092246.1566101-1-rafael@riseup.net>
In-Reply-To: <179519258391.6016.15133087600189015778.b4-review@b4>
References: <20261120080825.2078162-1-rafael@riseup.net> <179519258391.6016.15133087600189015778.b4-review@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 04:36:23PM +0000, Mark Brown wrote:
> This will run after we power up the output mixer, the datasheet
> recommends setting ACTIVE before updating WM8731_PWR.OUTPD.  See
> datasheet page 61:

Right, thanks.  In v3 ACTIVE is set from the POST_PMU event of the
supply that powers the converters.  DAPM runs supplies before mixers
when powering up and after them when powering down, so the sequence
becomes the datasheet's: converters up, ACTIVE set, OUTPD cleared; and
going down, OUTPD set, ACTIVE cleared, converters down.  The
regmap trace on the hardware shows that order, also when the HiFi
playback switch is turned on under a running stream.

Thanks,
Rafael
