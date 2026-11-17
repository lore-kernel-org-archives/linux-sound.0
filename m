Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900377;
	b=WYCOG4hm/P0MC5Fwzk6xsIlZe79fDUwVjuSs0jkn/fnJci/tb4nxylButlTDxD9BET91
	 dVsLWF7BfNuzu2vKfdWrxttGSsoy6g7Y86n2gXfysOJ5sWD7GIGktPShkDmQ98RCmMlnl
	 nH41ym3FHxMFxuPgWTxE1VBjvcQb1/2z7S1pOKSHukjQzd+CGZBJoY6kzfrT21q8NkAnK
	 hJfN2Ljy6qwKcgKgWXnkU4+nkITwZcNVVwD652+QYWSo2Dtf6DYCuduzmSB0vyAk6qP0q
	 kFZRYAys9UY57KNco1vWykpcv2CWl7zNhuSI8fWQXWyjryPPa/NgoUnWXK4Ru0TPl6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900377;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/hjymj7sUFFAEQtBK+eaiMYRycmH4o3pIB3MaAqj6OY=;
	b=coLMqJnS0pxmrrLMAdM2twYYL9g+eJodaiWPpqK5Ta7LfDHJ8SmfX5ihEqPBnGnHyc5v
	 VF+6GMFCwXgn7b/VQEMUpO6wMfk7pzNdpiGUoMB1CYNqr0BTHcZyEt11MGdEkuZop7zId
	 CPyU1urt67bR6qYTObZCOpNFPe8G6r7jB8tVgEKS48woNnRQ9540XfbrsfGP+VaFV0aD8
	 9/RnKnQCEcyd2WUXGiSLd0ajVcWkuSrQIknCjPb1AiNwBKcfwTSe0j/Y/qlrwNlT+hIqf
	 +O83lOPTk3TlvLLsIz/ABgpsDnAMXI9HWEt8lRIxsZnWqBXK5mcf+nUV0pyXsP+8+/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFhXC3F3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEACF606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFhXC3F3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9E01F000C4;
	Tue, 17 Nov 2026 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900377;
	bh=/hjymj7sUFFAEQtBK+eaiMYRycmH4o3pIB3MaAqj6OY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFhXC3F3Eh7PzwyZ/P8fOuhcxXZfVH/qUePxyIzMoqQHmg0jniWXLx7ORR7+rOqmo
	 QoDwDphlC/Bcm2IQTz1HXMwQLWj+elLOEyXS1rxJrqO5TM1O3EsXUM1x7BN4iNz81c
	 /zF0ha3f+D0teyXt328GLELeP8U+BYIWQXHcrPHbR7379daytsKVlDV2RNQUWKaTya
	 RuB1+pM9iORQosgkDHNXGOH7tr5apk9ACjlbKHNwRZpi58SkExhxqXh3I2ot8/F1da
	 qZQDMNL5G466b/6+5BEkWkognXhJbGt5nMgEqxHXjZ7v7r7k2KyicKY7HCl5LbyPWx
	 WDTdo/wHYhY4w==
Message-ID: <sashiko-outbox-218337@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/23] soundwire: amd: remove STATUS_8TO11 clear from
 amd_sdw_process_wake_event()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117070906.803139-8-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:26:16 +0000
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
- [Low] soundwire: amd: inaccurate Fixes trailer in
  amd_sdw_process_wake_event() change
--

commit 37e17ac67e68c6f83de067cdc5e343eec8f2c9c9
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event=
()
>
> amd_sdw_irq_thread() falls through after handling a wake event to
> process any coalesced PREQ or peripheral status events, rather than
> returning early. With the fall-through in place, both
> amd_sdw_process_wake_event() and the tail of amd_sdw_irq_thread() write
> 0x00 to ACP_SW_STATE_CHANGE_STATUS_8TO11 in the same invocation.
> Any status bit asserted by hardware between those two writes would be
> lost before the next invocation reads the register.
>
> Remove the writel() from amd_sdw_process_wake_event() so that
> ACP_SW_STATE_CHANGE_STATUS_8TO11 is cleared exactly once per invocation
> by the tail of amd_sdw_irq_thread().
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interr=
upt")

[Severity: Low]
Is the Fixes tag pointing at the right commit?

In 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt"),
amd_sdw_irq_thread() returned early via amd_sdw_process_wake_event(), so
ACP_SW_STATE_CHANGE_STATUS_8TO11 was only cleared once.  The fall-through
that causes the duplicate write was introduced by the preceding patch in
this series, commit "soundwire: amd: fix IRQ thread dropping STATUS_0TO7
on simultaneous wake".

If this patch is backported to a tree with 66c878838f37 ("soundwire: amd:
handle SoundWire wake enable interrupt") without that preceding commit,
amd_sdw_irq_thread() will return early on a wake event without clearing
ACP_SW_STATE_CHANGE_STATUS_8TO11 at all.  Should the Fixes tag be dropped
or this change squashed into the preceding patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070906.8031=
39-1-Vijendar.Mukunda@amd.com?part=3D7
