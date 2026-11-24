Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490051;
	b=R0lIaBHGkeSiTy+2V6HGJTkvnY9TD7cp0rNSMQwEYUxgZKHuAPRq0yxXRHuOZu/di/mT
	 GoDA3vouN2MVKLW8UWGFmfBp1gYOBCUqhVMeixApxmzADXOqxvYPnXhpfGJhuS6WC83Ut
	 imynmA0DHJoVmeUwuZm0B4uF1nWRAlE+rbQKq45XBRkyFP4Rzs/sbhNCbYFTQPsohogpn
	 o2AOGkOScPAKwyCrrLpczhCwVMjMdnczfCR5mmbKjKnSJeU5isE9GFNC0iGiPlfSPuQ3k
	 KTZX5643HwYpsNxG1Hz+96GB3UtD1Rs6Jg7WuG4XlWDBvyXtA1n6QFu3U9O9MwZivrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490051;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ibMpIrPnigfGzweyR7ejE8UlIjMqG8gMo5Z9sIVzVnY=;
	b=0qkviTab1/tqGItJ8cMCAtYAv37SbvkMjMQ3ne4CYggNdfG7dw4LxQt0KovhddX2rZtR
	 5zZzNBUG5+rnlrk15FYqCHkcAxfML8nfOPrtZErebsp2ocOkbAKoIehDBoq/MWJ8nrF+K
	 MirTid3K6ujS62QtpNI+stLnT1sDjj/m2T66c22FholLoN1sPCAzcU13di1A9IJKJkEM2
	 hTAWzZ37lLX42NKvrGORxm8cWgGwUK60MLt4i2uAlryoONnZOmB0TKpvomCh5GN6JjySl
	 LzqiXi7CvJEyNP+IFVukSNehthN5OlZTqfpmsWazOpq9MznLaufi422fSiTC796fwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q28sgpl7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41337606A31E;
	Tue, 24 Nov 2026 03:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q28sgpl7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C711F000C4;
	Tue, 24 Nov 2026 03:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795490050;
	bh=ibMpIrPnigfGzweyR7ejE8UlIjMqG8gMo5Z9sIVzVnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q28sgpl7GkuyoQMkKqUfj1Or86CeqRkzxKFaJfCiFXbqD8+ERxmxTUCh/GkqYPJYP
	 syCiQ37CH58P+S4m23bEVPZehWbBy6uE3xfbd8NKO6GotfuXXb0PXRDHS8ITQdWzGY
	 M9Utu3yvNGA1Db++Ult+c92AK1It2V0tUxEBbyoHG/mdgp1RBcRap+9SHb8lI3eZOX
	 w7j5pstPEpPftklW4KpO9PUk7t45Np74DmGI8C3BW5FFbLa3AvljdKPV0eRv6Q1mkN
	 KLMjKeiQDnzNq1QxiWyW9n+9UuQRdVNb0RqLBaKkMBiwjvB1/O/2YDUwJUnS0/yP90
	 Rjf44kAIJxRrA==
Message-ID: <sashiko-outbox-230445@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] media: i2c: tc358743: also report the standard
 audio controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-3-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-3-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:14:09 +0000
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
- [High] media: i2c: tc358743: missing Signed-off-by trailer in commit
  message
--

commit 2fcb6f1ab2ea0f1607fb0f6011772556e8ede268
Author: Hermes Wu <Hermes.wu@ite.com.tw>

> media: i2c: tc358743: also report the standard audio controls
>
> The driver reports the HDMI audio sampling rate and whether audio is
> present through its custom controls TC358743_CID_AUDIO_SAMPLING_RATE and
> TC358743_CID_AUDIO_PRESENT. There are now standard controls for both:
> V4L2_CID_DV_RX_AUDIO_SAMPLING_RATE and V4L2_CID_DV_RX_AUDIO_PRESENT.
>
> Add the standard controls and set them together with the custom ones,
> from the same values. The custom controls are kept, since userspace may
> already use them.

[Severity: High]
This commit is missing a Signed-off-by: trailer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D3
