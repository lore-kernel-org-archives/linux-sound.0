Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153088;
	b=ufqL7Adg25PSNapc3tYU6/XIQpyIZNLX2y+b48vYtlX3N/TZwKmpcF8qnZL0p3nl8UkL
	 VRtRf227yTAbflCRIW9ZptaMs1+chnQQSySO03iUQYHVRK7z6CUbW79Mjx0OPWZkZjcCU
	 LSGdnNaB0XXOFw7DuLQrvTYUYZYRgdT6bs/cY3OUN3zpP79vSgE9xutjmQaX8jNNxkF9v
	 HS/dFm5KidOdB2H/UEbzA9YINgbqlv4odZw8ihH2qLtW2TLnKpTHhky4TjyzSqDa/rfR9
	 cN+/NTfzs+U+XOUDQk1qozs2pBqcgGmTLemX/zNYL6Oy63QbYemphzEBtL1SpA+vl5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153088;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FQV27F+25SDT6+Die50FMSITrrA1WgE6PAtCddC8U3s=;
	b=1mwgD24RPDMJPB9kaJOY7jJ4a2X3jUMq4h9DQ5Erhes2yeeihVmzOjgsXj5Pt8WbF/W5
	 bauTGVytefpVm3SrpCkkfXebcUArhEe1XCken3JFf3AzCK2kcNTP8oK5mVgGLGBpjI0P0
	 lBn/3hLJjJ01k0RtnmK83Nwe1s7ZsYBdEaXxxhe9Py/I8UzKgxvEUhuCysCDQjB+8BTi/
	 WPJBIRnBlkfEBpXBDpq7qddQjpOgI2rwzczPWjlYFdx8Tfyi6oMteCP+xalA9KKHJCB30
	 GUF4+NVlt2EcawppKrbwZEDb6wH0TYIrjmri7RNt6g7R7vgIALgnUmDosXWxMP1jsKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqOUjkqe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B725606A336;
	Fri, 20 Nov 2026 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqOUjkqe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795153087;
	b=d9H0REmzCALo9ZbpbxH9TcEL71gEGuZYErDG+R2YQwSV6gLW0BZy1VeuNrVauO4zk4IO
	 a6wTVXovS3B9i2USEYrTpb1pmaJulfN2OLRDXmPpp0IRMoYHwpMElV3KKJM//83NF8xDf
	 K2oa2Mla05DadrVwiYch9vGEiE/M87jh77sYjUD6bm5467HTfp3slouQi3h3cEGXzDtz0
	 57PdF4A+8PRLcxFJEk+Mzr0k25aHyzI7gaQ//YWYB/yIvI/njG7mbeX0dKCWOxxsl9CSO
	 fgSAIjFssudYpXYSl+Af/gaaIfFmdUpqUKICVmajWrliiBocO+mesByFRAyq18GEs/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795153087;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FQV27F+25SDT6+Die50FMSITrrA1WgE6PAtCddC8U3s=;
	b=H4XhbGh6RxMvn7ufDil5CdXvvY2FIXzWwSIz7E9gmiU9kyOHtThP2qly4kiqwXEnFoij
	 Uwn15tRYu7M7oXyxfmykv1LPRVQciCQmB8SrrS9lvAawqLf51QVagpWqkSob/noOFwuY3
	 ZPPbS47tT7h8Lt4Of0DH+8jxPxsu9WR39Ig98ZfrwC0Fn5lY3rF6Jva+gmxFJUwsICYNY
	 trjs1DHiCMqNH3E0zOgPKa1JgXVxSwfW5aGNT8ooCLGM5+e+IU0RtJ8w+gV4u0wcikB4A
	 1AVd1TNUzMfE38ZFb3AgFPstLa/QEJsOSqlT6PjtViD9CWNKXNMNYw0OcTvn1iHA8tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FF291F000CA;
	Fri, 20 Nov 2026 05:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795153087;
	bh=FQV27F+25SDT6+Die50FMSITrrA1WgE6PAtCddC8U3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gqOUjkqe9xazqq66jm79/hVbwJfGdFHSDs9yVjjf2xXzPofIFaVL68XlPGjSy7pWq
	 5aLC7vgOAjG7yk7QkXkjlRgj2e8VSc84L2cnQk1OWdN6mfuMuTcYbocA/gyvU+XZnq
	 lyYai9aCHI+J2Z2dpaux84wZFVnbupL8O3G2nnJL0N3dMmHhRD7dYQwbye0RhiJxgw
	 3PUb3me/qE+zwyx+eQJu7X6k221MdjWiHU+BY8GI4O/JdVLpPGxPdxEl0f3iZURmp+
	 lfWTDr+rnC1d8igGkucRDKmD59FvJDPKFRfDOTbKgAD9O1TLae5AnneLkPl+w8glrb
	 q7IHTDPKG+/iw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF2BF496EB;
	Fri, 20 Nov 2026 05:38:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 05:38:06 +0000
Subject: [PATCH 2/2] ALSA: fireworks: Rearm the transaction after a bus
 reset
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
Message-Id: <20261120-firewire-busreset-v1-2-8bb9079a2984@gmail.com>
References: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>
In-Reply-To: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>
To: clemens@ladisch.de, o-takashi@sakamocchi.jp, tiwai@suse.com
Cc: stefanr@s5r6.in-berlin.de, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795153085; l=1609;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=1Y5tLKaRBeTaHsrbFAyk3KOEWMVkXW1Qflif+BgawNU=;
 b=jfZH8RUBvwraViT8Is2/7Gi8yarnl9HNAqUbWPcQSzB3Bty7B0Xq67oE/zAQRKUHbPmIBsdIE
 9y9YKoNEzXYBaW4ox60Dpfw/3UCwnmwqwrGkQNv3hSpokJOeUSp4Zqr
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

snd_efw_transaction_run() has the same problem as fcp_avc_transaction():
after snd_efw_transaction_bus_reset() moves the transaction to
STATE_BUS_RESET, the loop sleeps and resends the command but leaves the
state as it is. The response handler only completes a transaction in
STATE_PENDING, and wait_event_timeout() returns at once on the stale
state, so the command is resent every ERROR_DELAY_MS without counting
tries and the caller never returns unless sending fails.

Set the state back to STATE_PENDING before resending.

Found with a static analysis tool and checked by hand.

Fixes: bde8a8f23bbe ("ALSA: fireworks: Add transaction and some commands")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 sound/firewire/fireworks/fireworks_transaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
index 5c859773fe06..57aef570ac2d 100644
--- a/sound/firewire/fireworks/fireworks_transaction.c
+++ b/sound/firewire/fireworks/fireworks_transaction.c
@@ -100,6 +100,8 @@ int snd_efw_transaction_run(struct fw_unit *unit,
 			break;
 		} else if (t.state == STATE_BUS_RESET) {
 			msleep(ERROR_DELAY_MS);
+			/* resend the command and wait for its response again */
+			t.state = STATE_PENDING;
 		} else if (++tries >= ERROR_RETRIES) {
 			dev_err(&t.unit->device, "EFW transaction timed out\n");
 			ret = -EIO;

-- 
2.34.1


