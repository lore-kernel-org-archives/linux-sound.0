Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802456;
	b=T2uSumjRELZoBamU7rOm0GaljPiuky6RKX1bbvLOhN48bGZpyZtr8n9Q/zkuUqidNeLP
	 Ukuc4xt3RF23KblXxpUSFQQqCWRGmAJ86LaKpaaKhk+3VaACmCL9HHDC+hSolpyxW0Y0+
	 bKrXtJM1axQOSE0jV0dlbpOcHWLIXJ7+RtErV2+HYdbghFbYSMKjNWAOAkIzs6wpAS3pQ
	 t9nLkBQTD8GhZkmvdX+bN/Xt5QQf98HQYfpyJ23BcXH1STQO4ifyrdq7f3Pdrnt9NnHTe
	 vnfK3eRlQQ1TQelvraxP15JRGw7/m6/e4OsqytkfmT4bYGyxr0JS32Yp91klFJ7ELbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802456;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0LlGjstB+2ad5IwCtTQnged+IDJaQNnL05vB9kghvd8=;
	b=GoKuSpINpVZdqkQyrTjRO94gwJi5rPJ+4TgYVrSOJg8MiJNEZf+Rjb8AseacCbOtn/UN
	 n4eVyrx70G/aHnvCKfV+lRtYTWxmkaRzNBlHpLZFrgLOAFXxXjrydQHnyaHL1lpU11vMO
	 NLBi9rNulbi/AJM3iXdl4kUHiwPm2o8CQZHTszfqgD4Aq76Lu93cQ5CaG+u0YaWNJ6GjP
	 CymjUBepGcN+HB78WVHgxBKPawkBzQeOI9Cd1l2G7IQdKjOQcXFwCYfwaBJ6nD3p3x7L1
	 FYvMn73VeVKNvkTzvKyPsr33qjv5L9O/lRh4yZ+8fJuxAALjnrolDm/rbrelNx95xNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7C606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mw5q6vjaafcppkx4ilqk7zbk4a.protonmail2; t=1794802452;
	x=1795061652; bh=0LlGjstB+2ad5IwCtTQnged+IDJaQNnL05vB9kghvd8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vmizbLrkBgZ23MxxDAjB04IIqPWqhuRA3v6uuomjx5cPe8Q6SFEXdMegym9ZByDJo
	 JpLheFz6EZLIUH+1bGVHGEa7jplEMC+krzpeN2FIeKekMfqbpen6DMsuysSw7tOmnJ
	 iiHWjxIOIo7DU870GLM5PypcNkodgGhyrPqDK0eAC27qfmwXgcf2u9fBd3JceIEG9T
	 pdGOQaHCEkTfWXqzSxSvs44O0JDOhqnA57syR16M8ppWl7wfZznMyKgZHLTbRkmPSV
	 yA633BFCRx3yMdq1PpzLoIWtE2nAuXuH5lcYXW2BDoTLvohcnJTiYNaKnie5ZR3fhz
	 VCjQ0KVlZJyCA==
Date: Mon, 16 Nov 2026 04:14:09 +0000
To: sashiko-reviews@lists.linux.dev
From: Nordschamane <nordschamane1@proton.me>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v3] ALSA: pci: add analog support for ESI MAYA44e
Message-ID: <oJOrXMsjC6A5HCyFvdJu4ZSW7NU1wSd7DMn2BX-yg_dDQ2gMG82wIGy2s-eiuxM62rX1ZMdymM-4leQcQDHFwvg5Gz-D06D5ShiwsU9MkUY=@proton.me>
In-Reply-To: <sashiko-outbox-209306@kernel.org>
References: <20261111-codex-alsa-maya44e-v3-1-7977fb5a1b91@proton.me> <sashiko-outbox-209306@kernel.org>
Feedback-ID: 234176850:user:proton
X-Pm-Message-ID: 9afdbc537186f3d49379b094c80ce1cd592b9679
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> Does the Signed-off-by trailer identify a known individual contributor as
> required by Documentation/process/submitting-patches.rst for Developer
> Certificate of Origin certification?

Nordschamane is the public identity I use for this project. The email
in the sign-off is where I can be reached. The kernel submission guide
calls for a known identity. RFC v4 uses Nordschamane in MODULE_AUTHOR
as well.

> Does maya_rearm() treat an all-ones MMIO read (~0U) from an inaccessible
> PCIe device as a completed DMA reset?

Fixed in v4. Playback and capture both use maya_reset_dma(), which
checks the MMIO read before testing the completion bit. An all-ones
read returns -ENODEV and enters the fault path. A responsive engine
that never sets the completion bit still returns -ETIMEDOUT.

> Should maya_capture_ops set .reset =3D snd_pcm_lib_reset?

Fixed in v4. Both directions use maya_pcm_reset(), which calls
snd_pcm_lib_reset() and lets the ALSA core finish rebasing the pointers
under the stream lock. The driver also excludes ALSA buffer copies
on linked peers during prepare and reset, returning -EBUSY if a copy
is already active.

RFC v4
https://lore.kernel.org/r/20261116-codex-alsa-maya44e-v4-1-381358afc43a@pro=
ton.me

Nordschamane
