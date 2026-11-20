Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153087;
	b=VpJ0Iv2m0Z+6iZhd4N7idV2rghGR/Ykvr32IjBUo0fC/kjnLxfXYzl3bn+KVA5XTU5PO
	 ZLa79HMgaehLucUtyVkl+MubEpbH6hDN0U65WUEDqxNDoDranKCoF1EsfD1c0zGP1hn2B
	 nwBEEa3hLAPGwjTDXpWXXddeKsz/iPnTkeNOLpJ71wRQsqIhIQjNNDL6K9XVjkWjVvE8J
	 fEs17s3hR05DY32Ck9/WzAgUBt3tD7h8WvljehIPoqk3liU/+zXx6T2GEy022oERES5nL
	 36iG5uMZXKFy0a8strJ5xRi9SxLPZr+lYbrnscLhOMS4kz8ifk5F6UtkqaLYqPsUCGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153087;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=q66B+0Oh8Ienwaxd7dcFDn5dZKhuNLiVtGT1faS1aqg=;
	b=hxSUVBaRVyFpP4wrVg6rVUF+INunF/GJLhYKzdAHDQT56UgnJgznD+xzu/C48sOO5Hkn
	 EuabWNF+4WvYHl+nKWj1BbwiywsrhVgzFcdKALt1cDYbGJImzsVAEgxq3Jto7U5WYfUM1
	 VQJTv4tA52TPsXRbUtaLHQwZVZ1EZP9Gs2/H+KwAuA5MAprLK3KBj+SMBMh0LLw5WcyaQ
	 158f4hs0yu3u8yqCl3QNHgld/iJpcla2gZjl/fJn4eIIG3IDqEeSY2tXPckleHmvHshcf
	 idjEW4o0uskaWYm2yFrhlFf7knlHgsRbkTWgJ4Mn+JlQ49z8cIYhxl8rBKHUuLIczvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLhenT+R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF15606A32C;
	Fri, 20 Nov 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLhenT+R
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795153087;
	b=ASrxm23yDmiR/5XxQgECwLSVgJfIvRUep8rzWNUvmXK3gvLe5+peWYUV7A7lHtclSlTi
	 wuV/H38tdrI6uESCXdm8JMVbqKb3A3+mvGdlJmwdzSzbIOehg3hD9qy+tq4JbDCCbhZ7J
	 +5yID2xO+zA3YofUVxZ6MC6Iqb4K6ig0ITYRKPrzypBtdhC3qfU3MGBH9v3i2N/OMciyq
	 THDrvfFpxi0mCSsODHOlANVhpgdDG0rvEJ3EXqywL4zuFTasVsV7BKuDrc+sjqsKkn71Y
	 UfzjYsobFTkhcBhRHLnw4Zl4utav1ONFwzQgdGvzSm4xxV3EvnBSHwzGDHGtzknZnNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795153087;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=q66B+0Oh8Ienwaxd7dcFDn5dZKhuNLiVtGT1faS1aqg=;
	b=pbrDW7MBZkqUPtZPxHVNtdj0Y5SifCkmGw1aWoFxQZ+KA4p97m9A3am9HizChh78aYN5
	 tu+SLMI3k9lEdBqmRPuCgKz/nZ7TXm1Nodqgmn58jeVUlsoSiSWAmjuWzs/+FjwwqTTV2
	 myELI7VkIH4yMZpnJAVbYWUkepjSyYUisHS4GJyayTK1b4dJhmg/xmGkANQSCzJGGz792
	 tLWD7iL/hYV5O+VnIEig3pBOQGzRGLAotTtpjyuiOYKbT4vT7k1I+LrTj16fCBhhn/Odh
	 PBQZB/CaUDx5xjLQszZ0Iw7ZFs4yUAvH/lWOPhZD4/2stTNQwSqFzpCUfQ5t9mDJK2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE4C21F000C4;
	Fri, 20 Nov 2026 05:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795153087;
	bh=q66B+0Oh8Ienwaxd7dcFDn5dZKhuNLiVtGT1faS1aqg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=MLhenT+RtWOMBri4IcDL2reiYDrppJsQGsJS3fypZNwXVq6Jlshe7ZGYafKYP9u5a
	 zocE5yureHWsISPaV+t6k2maJvyNTqQi0nTDj6cUOVMjujb9DuWqYNExhw6X3NPrNH
	 XMFzG3+suIyxTzrGN4cTWm8b2SBm01rQ9kZGQIsuJVKHkN5osb2HvAOvaNH0ljuvUr
	 gkIjxyJXX/noLM1AgL5fBeLSXCi4q9auexiwPMJgzzhrBUeprc2ylvqNppaXDujHUX
	 SNZVRRh/YsEKVN2Bgf8idA+v8ECw6Tky2lm1q01AWkcTbcA23Q3CmfV06Y4/RgE62w
	 HiOulKGgBbPxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6995F496DF;
	Fri, 20 Nov 2026 05:38:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH 0/2] ALSA: firewire: Don't loop forever after a bus reset
Date: Fri, 20 Nov 2026 05:38:04 +0000
Message-Id: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAL3c/2oC/yXMwQ6CMBCE4Vche6YJrSCBVyEe2jLoegCzW9SE8
 O5WOMzhO8y/kUIYSn2xkeDNysucYcuC4sPPdxges8lV7mqtq8zEgk+eCasKFMn4gC62Pl7qpqX
 8ewkm/h7N4XZa1/BETP8Q7fsP5EADmXUAAAA=
X-Change-ID: 20261120-firewire-busreset-abe9c7ac3457
To: clemens@ladisch.de, o-takashi@sakamocchi.jp, tiwai@suse.com
Cc: stefanr@s5r6.in-berlin.de, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795153085; l=868;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=kqdcAldR5ptexRkJpjKE62fPaO7t4IL0FVM36AEWNY8=;
 b=0XCSaYs+uCfOdVTIuNBd/1AOewM+siiNqG9KH3o/azct6PqpT7GNP5qfzbRKpk3fp155A+ZHW
 AMA0fZzRGoLBIZszI6zTgvwrXfkxZa8PsAXJSBhl8CWvh3VOVbog60k
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

fcp_avc_transaction() and snd_efw_transaction_run() resend their
command after a bus reset but never move the transaction back to
STATE_PENDING. The response to the resent command is then ignored and
the wait returns immediately, so both loops keep resending the command
after each ERROR_DELAY_MS pause, without a retry limit, until sending
fails.

Each patch sets the state back to STATE_PENDING before resending.

Found with a static analysis tool and checked by hand. Compile tested
only (x86_64, W=1); I don't have FireWire audio hardware.

---
Suyuan Wang (2):
      ALSA: firewire-lib: Rearm the FCP transaction after a bus reset
      ALSA: fireworks: Rearm the transaction after a bus reset

 sound/firewire/fcp.c                             | 2 ++
 sound/firewire/fireworks/fireworks_transaction.c | 2 ++
 2 files changed, 4 insertions(+)


