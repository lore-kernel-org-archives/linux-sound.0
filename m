Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420999;
	b=u+f8oA1RgqCJuFNFnY2R0FyTK3WazvZ7XPF+gJPTD5FekZPJuZ2t2Io4sEsxL324zsXA
	 mvgwe5lioseCqQ5Fp+0OVcCEtKSfNLJgeNKCN6GwskLi+krjajqAugnI9A2fbRJqNzyfx
	 sMRe8ofS/8XiAY5qD69lVrA292iLyR63Z0qbzEzCSkgncUQoHJlkYMt9hiMm7tWNUZTiQ
	 tLBKmYnLteRHHBjYTks87BDGXW8PnjD35J7EGnbAYA/xuVsJcyVrl8yQgPPEzzFDzTak6
	 EppoXOqhZGZTFwm/Dxs7qz0014X1Y+gKUJIsWrUf2DbisPBKLVT4dbbBYo8hhENomYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GQ0zN0iGsDl4GHBfpwtGAMNkL5bzTe5hoJj0yFoUBQI=;
	b=uapIjdMWcRBhTUCATv3L87QJXQyOEWy2TnsazUt3UUrCtgn6Ynqe1HUpHOXOB5Pfkfx4
	 RUxh7OmlR5jNt4pMy84XcsLqeDEXwFfh17z1BoNZXnqOK0EX4wm3Ts53g9lJVzmnR0mJ7
	 9z8U2sF9tEwSiQROGO7ILgjDCU+1NetNf9udf2mHIzOZbqv6bl0pTdXoFmD58si1o+kW2
	 TQmTlrrdLGgfsM7OQv6QHEjBs8oxrm7kcCSjeFoMAcElcWVdg5TW+Ozw4BQ2EaQYZ4+DJ
	 2MmIsmMJ1J1Ivp4EZ6W4LBqWGebj8spLKeklfuryhfvq6rDNPWYa3ZZZ//8g4ujFhRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOPl7SNP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45B606A692
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOPl7SNP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1E21F000C4;
	Mon, 23 Nov 2026 08:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420999;
	bh=GQ0zN0iGsDl4GHBfpwtGAMNkL5bzTe5hoJj0yFoUBQI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=OOPl7SNPR/Rk4lVtpFVhg3HLvbkoNpJtI/6H8gyncCTL9AXovOwvJqJMOtFOFgsg/
	 nrpwR7Fs9CGmXKvrN7u+kj4BioP7tfVoILkgYS32UvBE7LvFBvfAthM6QDolSYPdil
	 WE2vRJIDFPcnmu9pd7UGSr+iwa2j91cBJQR4wOVugi1rZnS/vYvi6M2Ol3/cnqBviw
	 dfl/fA+fqy0ji2cGaHByqhrIdqecSoaSnPsUv1BORJybIOywm0Hum810v0Wn+NT+NQ
	 yEatvwhd1htegaDHIAkU5QntJiFpzy4grHMqMjTWmfqndLhBV7rv6tgP0WcxyBEYh5
	 4myhGgHBT/+uQ==
Message-ID: <sashiko-outbox-228872@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] soundwire: intel_ace2x: Protect bus.bpt_stream
 with bus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261123075522.405347-6-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
 <20261123075522.405347-6-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 08:03:18 +0000
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
- [Low] soundwire: intel_ace2x: missing Fixes: trailer on BPT stream
  bug-fix commit
--

commit 0dc6f03b2af6044fb8e8766f54486447a618f19a
Author: Lee Jones <lee@kernel.org>

> soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
>
> intel_ace2x_bpt_open_stream() checks and assigns cdns->bus.bpt_stream
> without holding cdns->bus.bus_lock.  Concurrent BPT open requests can
> both observe a NULL cdns->bus.bpt_stream pointer, allocate separate
> streams, and overwrite cdns->bus.bpt_stream, leaking the first stream.
> In addition, failures after sdw_slave_bpt_stream_add() jump past
> sdw_stream_remove_master(), leaving the master runtime allocated by
> sdw_stream_add_slave() on the bus list.
>
> Hold cdns->bus.bus_lock when checking, assigning, and clearing
> cdns->bus.bpt_stream, and remove both slave and master stream runtimes
> on open failure.
>
> Closes: https://sashiko.dev/#/bug/linux-88535ed9-b7e9-4ede-93c7-59950c524=
c0b
> Signed-off-by: Lee Jones <lee@kernel.org>

[Severity: Low]
This fixes the unlocked cdns->bus.bpt_stream handling and error-path
master runtime leak in intel_ace2x_bpt_open_stream() and
intel_ace2x_bpt_close_stream().  Should this include a Fixes: tag:

  Fixes: 4c1ce9f37d8a ("soundwire: intel_ace2x: add BPT send_async/wait cal=
lbacks")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123075522.4053=
47-1-lee@kernel.org?part=3D5
