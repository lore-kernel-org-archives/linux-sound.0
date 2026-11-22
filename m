Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795342098;
	b=azXV5lNSO6WxikOp6x8HJfUj7b3XeVcqNrYlRpy897xJp7vWgD4s3Km14XDG2mDdKDBg
	 Ty2OKvRy64noDUU0NnPgXj3KoHtPvqZyUwnbh4PRJqPzaGdyMqG0w1uv0Yne8OiKNy58L
	 n2gLFnkKMJdG33zctKbdklpRfuIcD2cEcNB5KZoE3ORMoBnq6VbUnBLI+9FLdtkCRR2M/
	 Ud2+r7pPSORcEfuSLL+HcGF+ug5A82NDN+36gulCTxTeE9CHDtK7BTSCHCYzocinFv7Ih
	 /KC//+zfWG67TqjbcrhQodN9EDMNu6g2+pUQbYOdkzfka5mIy1AlYFPXzGFHe/a/qVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342098;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FdZ6rQI5nliZJsDEu5BYAq3God7Btn9oqAYkY1qyoYQ=;
	b=LabvGJwUQzShYVPHiFw9FxnJcwjfxDCWiP/lYtRkxQlmAjyho/qkQxjVzw86B25hkyty
	 66TA9AT/Am/j7YK5S5Pa4tA83k2dg+tCd0yO6A0bRe2NdWl9r7cbCYoJbIsxtwcHEfB23
	 AXwi1VXUUZTpa4uMCdmkHPj6cCVbu2LZkXy86ZS/WHgizNO8w5AD/YlvVWP3PpgUFNue9
	 MOlFUXpnsea1Y1ynGSmIGYmldeGeJW+EpVrpOKcswzJND7J5X8Ai+YlQqCzY5e352ZAn7
	 jFdhsvAjl4l6tcEq1YFciALIKEtymZuzIouZKkLBSEDnxtykKGvTEJfZ0P7FRwmAqDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZF756+RW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C58606A680;
	Sun, 22 Nov 2026 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZF756+RW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795342098;
	b=HqzW4FL3f8/BCmvhPLCas7gzAuy+N0QBcQ3SGoU30TSxdJYyUMf6Arn2pNUm/YTbL0lT
	 wQNfZXHTNJb7J+wkhMIBlQRUOoR6tOLAmZbF7be1HBPYIZoiYMKC5w2M6oq3ghZ7qgcai
	 QhpksgDgaoDuY98fdQ+AFgjFi0ZokH+wI3RAycIMpXxo5eEyxJp3yM+O+8UG6/2QNOCK2
	 TnJ5i59DWWiqnP1QQguNRq4AmIRlCxqdVXG/LFwWegjgzI+kKIKLD3eEW9QlOXMwDjrKP
	 uLVBPJCM+V9u0l+ZslvapJFrwLoo4GCEpjZxZZN4014HuMn5t5cPlWHF8Qp90AsE2wQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795342098;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FdZ6rQI5nliZJsDEu5BYAq3God7Btn9oqAYkY1qyoYQ=;
	b=V4HYaxbuPudnLQlE1FdcS0WuiLNUloQgahXVEIidIdVSehKCng3vJmFyerdAdAWIejC2
	 dW92O33AzA1J0nSxItDksigdp8uYonTLqfVx9VSy4RPrbB0CU10S0rB8hi4oBm8FygFN5
	 GeFKqAjEANi0WwRPejMU7PzoylpzlaoSMC8CLnV5URUbqKxl8Omh+pio3WSZZqFOuN2vb
	 NbhMTFl350ib3jH0UBYz95ARsUGlu90FFaKvLanw//Z1CNvYtp1QoewKLMkRfzHUTsYdC
	 u5fN/wWxTWHZ26boV8dtI8kLpBaKOK+PMw2nTyr0KbYHr704oTpMx58Vx0CBgpPeZnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E99B1F000C0;
	Sun, 22 Nov 2026 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795342098;
	bh=FdZ6rQI5nliZJsDEu5BYAq3God7Btn9oqAYkY1qyoYQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ZF756+RW67yhhJfZCkIBYQ2RM0ptCHAeuWRb7GyrnlRuTLvd722R2QZD3aOBUpg+m
	 D7wubwwL4DATjZTLgGhnBo+ePt9RX6dVK43pU5eHsYaswNxhu4PAu5vIIqOkI1DWVg
	 opwpUdlQ3NO4a3aa05gp425qKMJ2weZm+i3Y2t6/PwvoLwcfpAPomq0B1BVNHKIQ2O
	 HQXZeJ9czMVg+fbVKstv0gxhWgBgff32H+4oA0y28PciVgE0iye/ij8yAkS/KbpM2j
	 ddGlf7dvI6MzQDQvOI2JOdAW5mKGzUmfq4Mv1ZmuDXuZnkHWI3Ho6+0qNoGGcRceXB
	 edDT7gPSaOB9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E50FD4BFE5;
	Sun, 22 Nov 2026 10:08:16 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 10:08:16 +0000
Subject: [PATCH] ALSA: sis7019: Don't shift the voice IRQ status by 32
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
Message-Id: <20261122-sis7019-voice-irq-v1-1-fa5d0cbecf62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAA+/AmsC/yXMyw5AMBCF4VeRWWuiI0i9ilhQU8bCpYNIxLsrl
 l9Ozn+BkGcSKKMLPB0sPE8BOo7ADs3Uk+IuGDDBXGtEJSxFoo06ZrZh9Ksig5hnrk2NSyH8Fk+
 Oz69Z1b9lb0ey2xuC+34A7CfNPHUAAAA=
X-Change-ID: 20261122-sis7019-voice-irq-e92265fb39f3
To: perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795342095; l=2053;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=huKzTa2eQDkgURxI5UqFkDNM3LidKvXVuHpanoNFwvI=;
 b=OLwzOqLLF7VtxbmUbAt4oriLbFnkIetFuSf13BKww5X9N0/3KAgYPO8/hew7/wv3lfG/+rvQ2
 E9cR7P7CvTZDSBQWQGwH5xeOF5gprTMqZAbxdu7VvgP/pVEYRHOe2r1
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

sis_voice_irq() walks the set bits of a PISR_A or PISR_B status word:

	bit = __ffs(status);
	status >>= bit + 1;

When voice 31 or 63 interrupts, bit is 31 and status is shifted by 32,
which is undefined for a u32. On x86 the shift count is masked to 0, so
status does not change, the loop never ends, and voice keeps moving 32
entries forward on every pass, past the end of sis->voices[], with
sis_update_voice() called on whatever is there. All of this runs in the
hard IRQ handler. Voices are handed out from 0 up, so voice 31 is in use
once enough playback streams are open.

Walk the bits with for_each_set_bit() and index the voice by bit number
instead. The voices are still updated in the same order.

Found with a static analysis tool and checked by hand.

Fixes: 175859bf1602 ("[ALSA] sis7019: support the SiS 7019 Audio Accelerator")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested (i386, W=1). I don't have a SiS 7019, so I ran the old
and new loop in userspace on the same status words: with 0x80000000 the
old loop trips UBSan's shift check, and without it ASan reports a read
past the 64-entry voice array; the new loop updates voice 31 (or 63)
and stops.
---
 sound/pci/sis7019.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index fe5bda5af6a5..f31e62068ee3 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -278,15 +278,11 @@ static void sis_update_voice(struct voice *voice)
 
 static void sis_voice_irq(u32 status, struct voice *voice)
 {
+	unsigned long bits = status;
 	int bit;
 
-	while (status) {
-		bit = __ffs(status);
-		status >>= bit + 1;
-		voice += bit;
-		sis_update_voice(voice);
-		voice++;
-	}
+	for_each_set_bit(bit, &bits, 32)
+		sis_update_voice(&voice[bit]);
 }
 
 static irqreturn_t sis_interrupt(int irq, void *dev)




