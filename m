Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795355197;
	b=ijFFG5A/M8v5AVa2nqm3EwHf5nnRsP+QarowEAeCLZS3r/kiEYE1hli4ARDXj4MzmkQB
	 FCAZ+EAYqKtOcSGkdtxgFhmIfEpeNsrBP4WsOZI7YTUNnSRRKf+eoyiGk8aBzGdouJp+r
	 HKT662jkQ+D2WDNXOfQa+xLXCbLrmpYZ5zydJnocMGLrOzAhV7bk2G9BlwcKdSkM1rEax
	 cbc7W2QcFsqYRxsaQubA97K/oCzPJr99Q1lsMWikocfsPpEkyW6LAStg7Sx77t7uP8u0v
	 0EJ0L7r/JL0mIeBN5wZSqPck/+I1eZKxw1YwYz3Mv6w5X3WHvhtNLWMI2MyQDJMkwqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355197;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=S+8KroqdhNGT/MuTubuyucLr9MW91xx6UHxZHlPor9U=;
	b=5rPPGyVqz26OhLHS66IryO0lTs2OrC6KtPlMaCBe44lqHlJJE5yN2L8QSP+KPjoVAS//
	 funPv2pFex/ksiFGy9FpAPGQ3cQ3XkoRm8GzK84kaV2iEqzcRXYTa55wb/hA8ewa33oRn
	 sReeKld9Xrl7pV9zqskDEwtLTN35BAVQ6cEej4Mu5rX7bH8/uH5LHjeFHrrvO/GI/uNlG
	 7Wd23vSHIrkRxKmDEHhtbJYyqPxFN5MYEQMohF8JgIHB7eSnLgeQDMw+jVnezaHwvKX8x
	 FY5OwQvtNcM6s4n+dNcH3B4Hggh7YQo+binDuFWyUZdV7s/E1YJij7exHNVOtwLcIIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3uPD54u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3709606A338;
	Sun, 22 Nov 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3uPD54u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795355197;
	b=KyaA3PCDZFFrnH+FcSxJU4p4wOXPbvuMdCsV7f2I17PAOEgnOwMjYFMP8O814BVuVU43
	 W4dxUJA7S1alW9m2iPB+7W1qvMZlUjE1MhkdEZEvp5rmjVvxnNDESPGRZuWYtOgRgwmjL
	 60rzl/g20X2tZdhxQe/T3plFs6EM90WZgdZUoW77MT2Ok6vNMzTmSpcsuW2PCZC6tYa8p
	 mReeJTN4xr+psHNNtPMFshfVhD7vdQsXX4i3fY6SfLyv6Zzis/CxdQyUZxU7X4b8EGc0q
	 QsJv9d4YGH4tjFAyhErE0X/X8aOPBd9t8Hqy2h5vTa9dlrC0yOtMEPlewdRaYHR6sdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795355197;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=S+8KroqdhNGT/MuTubuyucLr9MW91xx6UHxZHlPor9U=;
	b=nwCpivz2ufOlOSV5hUEdXe7vMuX26RgA83GnJiaEsyKLulfjcQcX2Cw/JFuMfKQLhdpl
	 VFLheL4DXE/4p/UMaOZ8vG24kLTAuVMONevvxKYm8IO4kdbVeHzuFdziow+J8545vS4Gv
	 6sAFBr7F70dbLzyBVHUo3dZqbgDWfthpcwW9fx3wdgRrtjt2lFUNGv31eg7YwKX8Ylh4d
	 Boq9wAVeU+9u2ZO4LNE5Ny+jGcZ7zETMHe1OUgCQrn4kXzfUbcxDkWI7YlVyIOFoD2s5T
	 tWgo2czj+Lp+rfWu3AW7x1ZIJjr2FblIJPNXJJ3qpVy6hUNyW5qpL6eCbomk7K6cxbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EC651F000C0;
	Sun, 22 Nov 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795355197;
	bh=S+8KroqdhNGT/MuTubuyucLr9MW91xx6UHxZHlPor9U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=c3uPD54uB8fcCX7qb4P/4wzjRYPGl76vPIZ+iIjWbWaac5kiHWafeLhNOc89xkWfb
	 qltUArcQ9Wr7Nignau9ziEXQmSfLPklNeZ+uEClB1kqhxK7g/peSQKD73K4MeGS4zL
	 YVjhPTRe5ofVnnrROEqehA9PIKnFKDqQpWPrmNMQZOt1q44AfVgGMkLCE/N0XD69A3
	 TluUEztLhsYkzvbf0T43FuXJIPwiL+MS45TImcFM4dP7FK9inFvcOj78b77qSE36VM
	 /KR9rHHIV0UDUFGr0Hcojgp3Viki/RgAaorjkmCfAWwOQ0E4vcFXmDEQgyhuG/FLsC
	 1DtQqlEzOMXZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 98D614C087;
	Sun, 22 Nov 2026 13:46:29 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] ALSA: firewire: Abort transactions on a bus reset
Date: Sun, 22 Nov 2026 13:46:28 +0000
Message-Id: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTyAmsC/yXMOw6DQAyE4asg16wUTB6IqyAKFmYTU5DIZhMkx
 N2zQDHFV8y/kkEFRnW2kuIrJu8pgfOM+lc3PeFkSCa+8L0omF0QxS/N+WgKw+weZRmq23ANnpn
 S76MIshzNpj1t0Y/o5z1E2/YHbag963UAAAA=
X-Change-ID: 20261122-firewire-busreset-733f85d4fb22
To: o-takashi@sakamocchi.jp, clemens@ladisch.de, tiwai@suse.com
Cc: stefanr@s5r6.in-berlin.de, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795355188; l=1200;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=gufGP1tFKoniF5n8WhFO5Du7+ThxLlL18YVM0EKtypY=;
 b=7SmKUf8vP0uv2Lau8K38m2KZhlQQBdMO64jgUAhyfIEz0oDg9RPZZ/f3qUvjQWBGac8BO6dXu
 ELQgDZr6fz/A9VSrPJOjTIL3SWNrBBB3NCat5dDiEx/FMnk9BnzkUtp
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

fcp_avc_transaction() and snd_efw_transaction_run() resend their
command after a bus reset but never move the transaction back to
STATE_PENDING, so both loops keep resending without a retry limit
until sending fails.

As Takashi suggested, v2 no longer resends: on a bus reset the
transaction is ended and -EAGAIN is returned, following the AV/C
general specification, which says that a target discards any
transaction in progress on a bus reset.

Found with a static analysis tool and checked by hand. Compile tested
only (x86_64, W=1); I don't have FireWire audio hardware.

Changes in v2:
- Abort the transaction and return -EAGAIN on a bus reset instead of
  rearming it and resending (Takashi).
- Drop ERROR_DELAY_MS (and <linux/delay.h> in fcp.c), now unused.

v1: https://lore.kernel.org/all/20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com/
---
Suyuan Wang (2):
      ALSA: firewire-lib: Abort the FCP transaction on a bus reset
      ALSA: fireworks: Abort the transaction on a bus reset

 sound/firewire/fcp.c                             | 5 ++---
 sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)


