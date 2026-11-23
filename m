Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421297;
	b=1gpqvvrJnN3FC9CbfCLhrgFqvEqRJizUmcf7uMLlkj705suug7w8luoquH6ZxBUNJLNS
	 +HlfM8XZTBH7jaW/K8UD/Z2clgeznhOX0ZvUTVo1NSI2uPYZ4VlANVY/7s/c/ljg1Krw7
	 aMnFggbuMKUQ81y91S3DkvzoRVitbARS4K6GWiFNG8gS3xh9+qRfcfM5OxbPewRRPTkSf
	 m2A4nSDRZ3GaH31DSMhR56TrMBiI3c3NSXap85Xr36+ZNncb0a8kE2miys85BiNhPAh6q
	 vxUPVmuIRUL6ucEXO6W2d5csfqt09q4RIOZ3AZyFAU5SNMRXdlCshN8ja/xbt1zzr8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421297;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B/m0Sdela5dSyHl3CTX7Qy79axNDiLPcOz6Wf0aI5Do=;
	b=uuGbBaSPNvwgamgrKMnPRI73LkOWfKSa5WPHlZob0YEnH2XDfnmj+Z3CHPaEntZZWBS0
	 kFxtwFif5hsidA3ARSufpbci5PA/DA9CBYDW4JsPEKkS2lil3YM+uo+eNv7YtZLdopHBO
	 Uiioe/H3z9xpLB8aM2MMUI4vY7iqOx4skz+qKkUTqHFqps4m9spo1g+hfFm8aya+d4Z5q
	 7UyEKsAmKkobbWSzMB7EH+VpAHCPiBHXe0wGv4lMllxMYEqXIwQHJKXQLvpL3aJ04U8N7
	 jFmB/5T1E5adqUuZZUuFreWF2MvfywRMxJ+UDL5PsKP1cPLRibySiU9kcCT3X4hwx4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCnEX5mQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC0F606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCnEX5mQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D641F000CF;
	Mon, 23 Nov 2026 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421296;
	bh=B/m0Sdela5dSyHl3CTX7Qy79axNDiLPcOz6Wf0aI5Do=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=NCnEX5mQGkYRgLf9DVFyI31F4RzAfWkrRQsbQbQAxle4Oas8Xa6y78bBzcMrkV5HT
	 21bTs4HO3G1Oz3+jairUQBI9Ak3jQs/5tmap4IfVJvNIJe+ANJuNPLoTt6OiJMnyz6
	 bKQD/lSafWVDzoS/wDsclou5QwOgBYLdQTA1CI0+eO1ZYtDC3b7q/aS6InMiavlExQ
	 E3fcMP1PKBaQwOYioHQD6eGQX6DYnGOVwrDtcDjtI6hIXMKMJGhwhvu0PgZrSlidhX
	 4gH+ew8oLR1Vpp/qDTpTnGoCOZq9weX95soo7bmPoOK+UIzsYO5yKsZj6bm5nAFr+t
	 ts0MESzSlZ5PQ==
Message-ID: <sashiko-outbox-228878@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/10] soundwire: qcom: Prevent stale broadcast IRQ
 from completing subsequent command
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261123075522.405347-11-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
 <20261123075522.405347-11-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 08:08:16 +0000
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
- [Low] soundwire: qcom: missing Fixes trailer for broadcast completion
  race fix
--

commit b1a8584af89ce0fed71e3e8a0b001c11e72abe78
Author: Lee Jones <lee@kernel.org>

> soundwire: qcom: Prevent stale broadcast IRQ from completing subsequent c=
ommand
>
> When wait_for_completion_timeout() expires for a broadcast command in
> qcom_swrm_cmd_fifo_wr_cmd(), any late
> SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED interrupt from the
> timed-out command can fire concurrently with a subsequent broadcast
> command after reinit_completion(&ctrl->broadcast), prematurely
> completing the new command.
>
> Clear any pending special command completion interrupt and reinitialise
> ctrl->broadcast before issuing a broadcast command under
> ctrl->intr_lock, clear the interrupt on timeout, and verify that the
> interrupt status bit is still asserted under ctrl->intr_lock before
> signalling ctrl->broadcast.
>
> Closes: https://sashiko.dev/#/bug/linux-fa1aa3a1-f9c7-4e8a-bdfc-49a559353=
546
> Signed-off-by: Lee Jones <lee@kernel.org>

[Severity: Low]
This fixes the broadcast completion race introduced when ctrl->broadcast
replaced the spinlock-protected on-stack completion pointer.  Should this
include:

  Fixes: ddea6cf7b619 ("soundwire: qcom: update register read/write routine=
")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123075522.4053=
47-1-lee@kernel.org?part=3D10
