Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489751;
	b=dPPx0Evb8K2hQe65K5iOe60J3CP80Tb9tdTbKQbPUVc/QRgSN2XD8nhoRXI+FMXOV5zb
	 lN9jR0cuU8GZkKs2Kz31dKCdgcZbdxpXe1LbXrgAfL2LgGa6vyF/Rzw1/YRzBW1muD5x9
	 OZ8DPHe7VlQpdeE1dIckNKQPTNCpwNjQec5bXLsIyvsS+OusJdLSa5iwQ+5hIhSgIU4Tc
	 L8oPNFa3B6TkGI/6d1TEDWPziomGI6BKN5dixOcPwQF8HGusUXOuA/f1petDhLm60bwNB
	 8IRkLgvQJ6hBOEztCH1MP5Iqh5RRyRknZFTSVg7CnEpmFfsILisyBfZT5PK2w9RTX+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OSk2aZGL1sEuX5Wzxv9eN4RhSBLVHnoLPuY+W59UmNs=;
	b=IsAkzqj1J6s05QVVhQHEgncio7DlOG8I7RQcBAIzalYmfIpcF35WxVStYTniaBcHiP+T
	 2uu3frZVDzWSGT2PnZLGoRyNoq2swY+NsXmHIy1xYFe7jDSetgQ2q01CGw4LIMtZpBJqT
	 ZTLTV78KGqBl9b6Tuj1EhPM/ijt4RUjxzjX+XgFpS/J8oX7t0EnqCKE1MywlDt1uyc4qb
	 4LnQTE14So+PdYGYNYTZ2wHNRQJABdg6CNuVXvWJ6csyDwi5pyklr7tM1sIYDXN9as8EL
	 ZAaFaiPzrrG+uW+jyAPPAylPq+tIo/0ZAKYzNrBokaC9v9HwFZS01xnZ5tY/5yt5sQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UcEtrH51;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC1606A31E;
	Tue, 24 Nov 2026 03:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UcEtrH51
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6EB1F000C4;
	Tue, 24 Nov 2026 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489751;
	bh=OSk2aZGL1sEuX5Wzxv9eN4RhSBLVHnoLPuY+W59UmNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UcEtrH51rHOaxvr9sXJVC+ZlsWs9cLhrqJ+SL96AO0MGmeHgzZpwFBUO07nPXZ4L1
	 jbWd9Jn0p0SNKK+MH6XW0MbnHXE5C/oEPphmz5H4rdaylU7sfeZvk2/WOVMTFAI6ut
	 4z0vqj1Myy7bjT9kbJVig5RpJLGL3zVhMDY3LD5LVeNDJF0k3bKL2QQuUs4L7PufGK
	 SeUvqeOUL3UlGjWZOt/UECCYJ27pyQJpQiK2R4g4VMlkiR33F3ivyCK6GcxLUHeXpg
	 mdvTNb2fWZsl1ohedq6WNwHrZspMtSMq1CV0V79udPYWnCHzMzlLS8ZH421fX667IW
	 tH2jcHeBXeK7w==
Message-ID: <sashiko-outbox-230442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/9] media: v4l2-ctrls: add DV RX audio sampling rate
 and present controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-1-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-1-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:09:10 +0000
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
- [High] media: v4l2-ctrls: missing Signed-off-by trailer in commit
  message
--

commit 4122cfd3e97b7a24c90f98c01731dc4ca9f4a197
Author: Hermes Wu <Hermes.wu@ite.com.tw>

> media: v4l2-ctrls: add DV RX audio sampling rate and present controls
>
> HDMI and DisplayPort receivers can report whether the source sends audio
> and at which sampling rate. Drivers expose this today through
> driver-specific controls (tc358743 and IT6625 each define their own pair),
> so userspace has to know every driver to find it.
>
> Add two standard read-only controls to the DV control class:
> V4L2_CID_DV_RX_AUDIO_SAMPLING_RATE, the sampling rate in Hz, 0 when no
> audio is received or the rate is not known, and
> V4L2_CID_DV_RX_AUDIO_PRESENT, whether audio is received. Drivers set
> the range of the sampling rate control.

[Severity: High]
The commit message is missing a Signed-off-by: trailer from the patch
author, which is required by the Developer's Certificate of Origin before
the patch can be applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D1
