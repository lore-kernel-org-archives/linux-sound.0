Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489884;
	b=HYjlduD+SjSVky2UOdIQOCw1XRbXI6cJ1wO/G8jauDicKqjoGnbHlr82hgaeoaLQh8U9
	 KsEpzc3TdcAeTPd7aGxHuKYJ5E5en0X0qlW37TiMnmLffpzkHBWzGq+X5KTl4OjEc6Q3z
	 UpHz/Hq3drMly9fC0qvY6Gg/gsf/SEhMZd5FUEfu5gC9NIwVQ+cZ1bQQX63DTBa6CPp7+
	 r2p2/KKyqyJdZpYRfHcemA0Uv0nYb6sFw55ErI3rClzJebrjiU9ExB1VyLoLTk24Jfj7y
	 zK7c6N/Vw0xdJ6LbcUM7NL9ImQSmk5n974z9bV6Fz71OIwGtd+sFXl3YDKhUt56qLag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489884;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JEjKGqo2kHYjKBPZhK19cyYE83iYUEe12E3nWeFv9H8=;
	b=T1V3bswbmjDFEDb0+otIZ2a6lTbZEGGIryKAMXQD+6ijB+uskshymPWlpeRjdX1Q/mU+
	 btvcfUrM0A/2v2rGiddqtivDxEE4X0okpQ2Ro1LGXF9+vD7DP+JAASfchadoCrEBhombe
	 crhDx8SKX4W3OZVTy0j5jJaJpRwoaBmsCBZYaatOqD5s9g+nOKylACFEVMGBFcotFlUaG
	 r0E4Z2aO+HHM4TOkG2z0HVleNnZpDVurZ/gifnMGNA6CYgcoBFwLaK6C57SeaAji7czcK
	 kyhYRNYZ16nHyoL1lXPD8Dzhfphthbg2s+zJv3c+8jaRgcq5DMZg8WSxylSvqHBrfGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+nZKgwZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD4606A31E;
	Tue, 24 Nov 2026 03:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+nZKgwZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51E11F000E1;
	Tue, 24 Nov 2026 03:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489884;
	bh=JEjKGqo2kHYjKBPZhK19cyYE83iYUEe12E3nWeFv9H8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N+nZKgwZ8UDxsKZHlAoRYPwBvjmOyEYG4uY+EYCpSuSi52gmFyqVxZzZZWInJiTgr
	 Sk7Iss+HLpHK2juG10VbaqUz7k7q8XeJgYbCAnokPiDuYGmJZiyhwUF/iVnvlvtCtL
	 Yo8vjMDldnAYYSiNCQa70Y0R8zazCPDe0snXL3R4kLdGt+uWYDpAfDsBZq5i6w6jI2
	 GeAt+Q1jB18nHVpwfAY9IBqMjgvawWAsU1Hk++yUut8gQDNkdNXZWUEKxjpUM0NSrg
	 FTsyxfvjjYwckSKoqVa8G6o+1dX8rTufS3WKkhQD72/1FgTls21pzCL8tTp42gn/3J
	 rfmd1KTogTN7A==
Message-ID: <sashiko-outbox-230444@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 9/9] media: uapi: it6625: remove the driver-specific
 audio controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-9-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-9-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:11:23 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: uapi: it6625: missing Signed-off-by trailer in commit
  message
--

commit bffb6bb92c0f2a8d28eb18c2023b0a2bf9862359
Author: Hermes Wu <Hermes.wu@ite.com.tw>

> media: uapi: it6625: remove the driver-specific audio controls
>
> V4L2_CID_IT6625_AUDIO_SAMPLING_RATE and V4L2_CID_IT6625_AUDIO_PRESENT
> have been replaced by the standard V4L2_CID_DV_RX_AUDIO_SAMPLING_RATE
> and V4L2_CID_DV_RX_AUDIO_PRESENT controls, and the driver no longer uses
> them. They were added together with the driver and are not part of any
> released kernel yet.
>
> Remove the uAPI header and the V4L2_CID_USER_IT6625_BASE reservation.

[Severity: High]
The commit message is missing a Signed-off-by trailer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D9
