Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795394188;
	b=zYewiNB3kaACWcML7zozvRSWDU4/xMK5T2WDDKPc7kmyCKhdiOv/jVnqpWv7TkW6FHCV
	 pi12gk92UBiQVUBqgkj+tF9+fsk5i9ymlzunneFnhFCsXnvvVM3lrB2MvrksaBs3LB8vF
	 vb2whYDHVA9utm0nkip0qP45D7gP04K5KUyCuWSkwUdVlQhX1WREhSJ2JKJzImqpYLRW3
	 4ROgJxfec7WztGX7renuRqDdRaQ0ApketzzUNsgHeByL3y93vJj0qefbKSZHvcBw9Zmuy
	 VGiI6IPK15fMD4ZDR2hjAYIss0CFJ0tYSJGRmr1JYVbLiPq6+oBfkDx1BR8dsAdrsqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394188;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=rxduBwZbdEUBanbHyxFxiiULSKJYVhxG+nizhPm9sPo=;
	b=mP0wJcHCJQmvAET/y7ABQaS9CEEDbJ4ZG6tllW3yoS/PGP4YOHpTw8wjKcXXm6HEGUC1
	 F7S6tmEYT5p7n7XxdERJJ4YMfWwrpUsSlabrWcyBfRowbtwCYf8IyYigfN6lZkWQxwfS1
	 5lG6W/3J7tzBExyboi2LooSGM5y/ftZjO/y5WZljQzsNH2dYugmAnFaWF3qil3Q/9N0Ac
	 4llsKKLSMNkaw/1eKNO3innUwb7hIXVvvZ3lwPC52fQg6e0c7zqqrl75+DMGZSwHuGahQ
	 aElobNEnkCPxSpwbFM+a/cn03mNJDE40xscabdHnkTkOGWDUIDQ0xQOaJXoShJT4GMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLB7TY3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE7606A31A;
	Mon, 23 Nov 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLB7TY3N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795394188;
	b=2IRmhjSN8Gnc0wS6jkrNoM/v8GaGZpNoiRcUUH2jLixWcK0K6D22rKL6X2Pv1IviSINB
	 SnNN/nrPmqVUZG+eLkHFi9ETA4sbc8A3zXj8yzNj5aTNESoAQU5ut7wrn0Vzra4sFarPj
	 gmUzw2Z0IU/rAmVvue36eig59Mqgyd2x3oVE3jYsp/6laqjf2r/parjqkxDTaJUtAousr
	 o5DDeYy9GLeLmE7/TzxjkDOGdLxP+z7pztZG0DD9F4aYGUMwNuqYH5zV60KFXl58Lgv9R
	 ZRKhPRxrxjXbTvygtSWTNZloEi6bFPhaR2O9jZJpVU3mgmJkhY+8RtxJRRruGcpT86Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795394188;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rxduBwZbdEUBanbHyxFxiiULSKJYVhxG+nizhPm9sPo=;
	b=2sQHXNNd50HtMbSdunR7lsRQXnnWcR3xPC0kB6hKEkBhp5prqfS8xn6+6LoIoT2H+X+i
	 gR3z0i0ZIp3SDIdozsDikC/iEwP+bTcvqYjeYbeuHar7T8lUcNcBNJgeg4H3Xnbe1Cr1G
	 +e4whZOh8nqiN9CnVVfN6UbF5stvPYXhpxy2XVhuvl40+/EUg5Sv8rgMK1WcvegucU/Fv
	 Fi7CVl+HSL9v/wTeV1KzPDT1XB+si7lWuWcbQa0VnkQPIDIhXOEmuHf8adWq2X4z9TfvR
	 OY/Ph790jhzlgD9d22IMrRXdNIQepT7d7WfoKMXs0Or9wwkIZHz3YNhS5KiGC0f203A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5B141F000D2;
	Mon, 23 Nov 2026 00:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394188;
	bh=rxduBwZbdEUBanbHyxFxiiULSKJYVhxG+nizhPm9sPo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=MLB7TY3NrWIrqQNYqyfYaAzSegGPWt5cMqe9IEBhm5Lzf5kUlxbIVddcU8jsd7s7X
	 ojlI6vLgaMZxDBRlHXhQqhcPFlsRtvIft/oXYofiwpKCJqWYVMYKxyL1PGIVfpXJm+
	 7ehmkU2esIObDJfQ/g7ImemHOIDIJzXNUYvFKZyK0Mt6ywbHa11SICGu6k4VoUk4Ej
	 7Czwoeg28kxkyfm9f0eNIXRbQCE/5axshjoeU7Ncn9SmMlLRvyqphvca0B5eOaN/c5
	 xRcH0yiHJRglzdgUWN7P0YDD+Ru6Gld47Rls0w/1z3ZQSEOR5ddiC/zufZNfbNIb3Q
	 tSyATfyPU9Odg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 728B54C243;
	Mon, 23 Nov 2026 00:36:20 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:36:20 +0000
Subject: [PATCH] ALSA: emu10k1: Require CAP_SYS_ADMIN for
 SNDRV_EMU10K1_IOCTL_PCM_POKE
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
Message-Id: <20261123-emu10k1-pcm-poke-v1-1-097b8cb8daaf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIOKA2sC/yXMQQqDMBBG4avIrDvgRLTQq5Qu6vjbTkUNSVME8
 e6muvwW760UEQyRbsVKAT+LNk8ZcilI38/pBbYum1zpGhFXMcYk5SDsdWQ/D+C6AxoVvfaupZz
 5gN6WY3l/nI6p/UC//w9t2w7HkDUwdAAAAA==
X-Change-ID: 20261123-emu10k1-pcm-poke-5dee6c1c7f2b
To: perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795394179; l=1837;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=kB8LDX5IJDExhgvYjrVOmQVYMR24aajUR6/sIJ1pDys=;
 b=RY6fuBqMxDspAZd0dkBGoNrfXztXgy/8jjb4HKtQh8WsFTcB0ZLkHZzbvCl9ZanTUo4IDKO7a
 UB0NnM0JGfpDVJ+KizD+xZ5i+4GCyf649RdN55ACD/DYxONN3NIv0c/
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

snd_emu10k1_fx8010_ioctl() requires CAP_SYS_ADMIN for the commands that
change the FX8010 DSP state: CODE_POKE, TRAM_SETUP, STOP, CONTINUE,
ZERO_TRAM_COUNTER and SINGLE_STEP. PCM_POKE has no such check, although
it changes the card's FX8010 PCM configuration. snd_emu10k1_ipcm_poke()
stores the GPR and TRAM indices given by the caller without checking
them, and the FX8010 PCM code in emupcm.c later uses them as register
offsets:

	snd_emu10k1_ptr_write(emu,
		TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], ...);
	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_trigger, 0, 1);

So a process that can open the hwdep device can change this card-wide
configuration, including which registers the PCM code writes, while the
other DSP configuration commands are limited to CAP_SYS_ADMIN.

Require CAP_SYS_ADMIN for PCM_POKE too, like the other FX8010
configuration commands.

Found with a static analysis tool and checked by hand.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on x86_64 (W=1, no new warnings). I don't have an EMU10K1 card.
---
 sound/pci/emu10k1/emufx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index ddac6cecc8eb..df4661927041 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2506,6 +2506,8 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, un
 		kfree(icode);
 		return res;
 	case SNDRV_EMU10K1_IOCTL_PCM_POKE:
+		if (!capable(CAP_SYS_ADMIN))
+			return -EPERM;
 		ipcm = memdup_user(argp, sizeof(*ipcm));
 		if (IS_ERR(ipcm))
 			return PTR_ERR(ipcm);




