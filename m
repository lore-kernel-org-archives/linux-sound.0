Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513137;
	b=DZyjpCXnwITArequPvXCueTsQdsN2bD5i44eUn9oC6mnnmcAzyeUm9d71aYWmqlQPZkS
	 fL+uTCY+SDbR2YHylfxyAGdZ3m9r8jATNxEhzsHcodaOCNbZnkm9iU8Dpy8Jt1MjJdQdR
	 /WLqRnwmWdVCBKlaZDm5KdRO55k8i1f3quEr037pp5CyzWo9MN2gHl4bwPzXzCy1PAJ4R
	 f6eQ/CdGPXWMfG9igm3lRYksD6VhUs4OP5tGWkirPfiJ3BY5cthhhxp69dalRcJPfhVeY
	 r63YR0851qpvgmUPZM5LSOXFWZraB1JNIAG386us9wcN7jHZ9uPu25hDFAvlkj3Fgeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cpvl8gg1p/CJJftHDLUPlhNERY+zBUwRYypw6ZeDWr0=;
	b=auvg4+uDwYeV6Wchy+pZR2ZAMpduFxyYhoH948kDoyZgFv7j5ylPeKjBcsUIFzl6uKLt
	 sngV+ZYunB1sxVAHR+HdzVSfwPCeMOVl+BzTEbpaezqMMfYCOmmZ8V1euwjUsmHzLlorQ
	 Wc77Kf/rEgFlXvk4zzFne6lZhJJjjnvKgb/9tCSHQWsgqt86ymUWEQmjF071c1jZ09QMP
	 BUwOLG44teszbOXgIyhpHrD3lhZyh7gsz6ucOLhudwmIUtXM3hwlRn2ijpYGhFWBSiF61
	 tODvx8M2Bkk4sELmE/m7w0Jk1uJpuPUvwfw14a1BcxboG//NrWmX1B04w44aWQx76HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bk/bccc5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA04606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bk/bccc5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBCB1F000C6;
	Tue, 24 Nov 2026 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513137;
	bh=cpvl8gg1p/CJJftHDLUPlhNERY+zBUwRYypw6ZeDWr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bk/bccc5ZfZj/OX9wNOKb7fkCdoJLnpeh7qRV5LBeWFqZc1kAP2upryzy+rwaZB7Z
	 Q456XmYv9py2BtKMNKtlon+hx7TzdFtqu5iHsbcJTsknE9N2MXb/PprD36i0vq4JZp
	 iZg8CrMsigu+EhTrf95CU9HS4GaDsyVIOkCeRMabX9fsw2MY5L3DBHceY9UZtDDNPB
	 22t+IQUJYfRjhIATndt+tq9H85vZZ63NsMWCSPp5I8TKLKbZwew0/bUSaFjs0eCZ83
	 5DjViaLW6xFKSf98wkZY5zy/feW20vfyeeJAHXgE26zPrbAXhZ9SkD9lGpKkuDUbZa
	 IjCGqJeoOjnsQ==
Message-ID: <sashiko-outbox-230848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mic mute LED on Acer Predator
 PHN16-71
Reply-To: sashiko-reviews@lists.linux.dev
To: "SungHwan Jung" <onenowy@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124093506.32807-1-onenowy@gmail.com>
References: <20261124093506.32807-1-onenowy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:38:57 +0000
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
- [Low] ALSA: hda/realtek: missing Fixes trailer for commit d54c3cc224da
--

commit 69b4d1cf4b652bdd1549e2f7ff7f3544732ccaea
Author: SungHwan Jung <onenowy@gmail.com>

> ALSA: hda/realtek: Fix mic mute LED on Acer Predator PHN16-71
>
> The mic mute LED on the Acer Predator PHN16-71 does not work and
> remains off regardless of the microphone mute state.
>
> Switch the existing quirk to ALC245_FIXUP_ACER_MICMUTE_LED, which
> includes the existing headset mic fixup and also fixes the mic mute
> LED.
>
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>

[Severity: Low]
Since this updates the Acer Predator PHN16-71 quirk added in
d54c3cc224da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71")
to also enable the mic mute LED, should this include:

  Fixes: d54c3cc224da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN1=
6-71")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124093506.3280=
7-1-onenowy@gmail.com?part=3D1
