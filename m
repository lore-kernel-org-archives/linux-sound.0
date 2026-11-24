Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495632;
	b=1FBVMzJysaN02ijVPz+eOx8Ax/UIskBg5zHC/6dnNqZiff9p0PBr9QBgip2Dg8UCH/mR
	 rxYNgOSvpyvEqcOSPeGarzeFgsIxhCYy+aXTgL2JTJ7GMkos9WWyNDQK0x7EHpYSBz3a1
	 C3jM+qvZkCyLZtpfbBcZ8dpteQLRNwAxSxQ18DebkHPFBszUHmnvjFa0jvLtzSXvUZ/iK
	 udiYM5m5cLL86k2vp2O0fmNlOI2Y+vwc4jazrcaeGTynY2PeQDHgk44ASwkv6rznFfXZ5
	 hYPQVjKZ+A8po0Hf6BLYrfKnNC5aooXexItcSvgcFI0/rXK0O+u3anDs4ORQywW8G9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495632;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=1Q9Idu/BDrRLsyvIqbFJ0rTBe43Ed9KRtwgCLPenha8=;
	b=gm2xv4ijvKsumRqArsGklOePybMA6IDwnKKnUKZnIeTqDa76w9g/BGTRLB8YdWYJAE4L
	 wf1Q5zSiELZtVkJXWeO1y7RzQTGXHV2g6QRMZLHN2c228yxZkpPSJajd59WsIvVORKxe0
	 RxNPnVI5RDHa2fjBa90JnbMa8KjolYIQc9pBg9WL7SN+/xDHK1tadO4s0wYOWQ/IXzbhQ
	 DMgB4j4qAx+i1O7/mlUhbcHNMstP7F+AOPW67JfgZ+4NEVQmxFqQSRfPkf/2yRtDknjmZ
	 8I1XgQ/fl5G319/WspMII54tQB/8fergyAIX6ABL4UCPq+97HrwcHNkhPzSch/BZ30w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh+Oi7CZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45632606A31E;
	Tue, 24 Nov 2026 04:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh+Oi7CZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495632;
	b=ZJ3tGrpePXgpEd1q0UGwUOF961+OGVn2SLLGfHkrO032O/l61CeQ6zn3Cgskkbpp7Rwp
	 iXT4K+bObp0aJYYdTGSSZRwWtgq5EensJVQBFKeUMX6b/khPKJgZMtj+SwXvUXjbYhDfk
	 BcR5PhohpepMAIqjX420YbevwbzZLCfDr2LuLa3b9ztFwL2bfUhVpFqkodWeb1aAqgTKU
	 VpPh6gRB5Q82/PYIUa5sAVen+OzNDLopT6o8WL5Ldb15xr+VUJM+dELxhILJA9PiPjC29
	 rJDCbj3gim2GU2FUyN710QE6cUGysgtyDzHFka3VuRlxuZgPxkwRovm41l18z54zvPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495632;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=1Q9Idu/BDrRLsyvIqbFJ0rTBe43Ed9KRtwgCLPenha8=;
	b=pfciPBv4JbhFTJJjTI5Lm0PEsXmSCN7xTAY0ecS1VLpLyWWZ4iBz+niduwPbab7IQOFU
	 SO+/abRQc100cY9eoQb5nP85BGDKpSgv/Pk1VsFnLSG6sqcIGwYZ0lgRvNsLKJliQPUt6
	 cqnHuHIkBLjALa14BVcKwHRC5OCmDpPRoB33BN5cYWOX4/s5eo4roNE85HsyBUVaEG74t
	 yKvdWh3tNVg+R9xt4S5FRINbe3t5NQqph9HgH2Cm8TChti7SXQq2Iv0pVqf2jtDXY2T+6
	 3OYpwWEerKgO5pv8mmdpg5m+2OCBeSEW7p3y64lkrTUYfNLMFf/55szP6nthgzsz6dA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B09241F000C0;
	Tue, 24 Nov 2026 04:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495632;
	bh=1Q9Idu/BDrRLsyvIqbFJ0rTBe43Ed9KRtwgCLPenha8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Rh+Oi7CZ5Sl0gly4Hr0bfUqNsokxEBt3ui97bpJSIWywmBfVzmXg+6xsGhWHqO5Vv
	 1b4v3bxtRInZwdSTTMPrQI/TDQF79UtEasYBvL4QDtWUHGOSyceZ3O7bFexvh9ldOD
	 GrhPuDv/qoJjlxxRnjiXVJCGghOFDPvROdmAuO+HVXOr/2ABHUit2cmsHI3Siice90
	 FDLlHcekcDgF61lHfvi+NumHD0diQzfOZduaUXu1SCfMbSPaCDhFtTT/Uahr2tb1UU
	 L0ucgoj3DH9A5dhr1Rj+IOjE9K/8nCXfp6LOIiz4WnFqO91NIjNzInZYbvbemS+DMp
	 DR4OQlF+PVUDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 158044C88A;
	Tue, 24 Nov 2026 04:47:08 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 04:47:07 +0000
Subject: [PATCH] ALSA: mixart: Don't touch the mailbox when the BAR mapping
 failed
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
Message-Id: <20261124-mixart-free-v1-1-13765d8d445b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMoWBWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3dzMisSiEt20otRUXQuTNEvz1GTDJDMLEyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBdPnQNbwAAAA==
X-Change-ID: 20261124-mixart-free-84f97ec1b684
To: tiwai@suse.com, perex@perex.cz
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495627; l=1657;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=KroNMBNLmqXWTwC1spkNnjxXDnIiXoTFsmYu+3KeonU=;
 b=GAspBgd8YPw6ltv7qrF8nA9eRiO3UmTQ86OaVDcOYWUL9OEtz7qm3/FnRkjgzwyP1GrQWhvdI
 CQD7uD8ekRuDKHyPBA5WVmjASfUJe4xJ9jw1zXLq/4Q8f4QbCulLwug
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

snd_mixart_probe() calls snd_mixart_free() when pci_ioremap_bar() fails
for either BAR. snd_mixart_free() then unconditionally calls

	snd_mixart_exit_mailbox(mgr);

which masks the outbound mailbox interrupts by writing to
MIXART_REG(mgr, MIXART_PCI_OMIMR_OFFSET), i.e. through mgr->mem[1].virt.
mem[1].virt is still NULL if either BAR mapping fails, so the error
path oopses on a write near address 0 instead of returning -EBUSY.

Only call snd_mixart_exit_mailbox() when the register BAR is mapped. The
rest of snd_mixart_free() already copes with a partly set up manager:
iounmap() accepts NULL, and the IRQ and DMA buffers are checked before
release.

Found with a static analysis tool and checked by hand.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on x86_64 (W=1, no new warnings). I don't have a miXart board.
---
 sound/pci/mixart/mixart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index f451554cff5f..0266467734ca 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -1066,8 +1066,9 @@ static int snd_mixart_free(struct mixart_mgr *mgr)
 			snd_card_free(mgr->chip[i]->card);
 	}
 
-	/* stop mailbox */
-	snd_mixart_exit_mailbox(mgr);
+	/* stop mailbox, unless the register BAR was never mapped */
+	if (mgr->mem[1].virt)
+		snd_mixart_exit_mailbox(mgr);
 
 	/* release irq  */
 	if (mgr->irq >= 0)




