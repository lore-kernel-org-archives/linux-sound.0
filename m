Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795740608;
	b=KMgmoeosVE96HpBTjLudq0QHWr+nynp4qrpNbFxM4JvPjRQv+iRKDAL68DS+4GjRVX9u
	 CVjURua7WaTJ1yYs59zrB4clcZyCO+GWlzFqDRLkFX6l1lb22Bj2E3K0YF8jdxV/Q6Gz+
	 RCdlUlZfF/pnEB417Vtg/1ICbQ19+xfrH4KQztKMwFojbBDMAR1VhW9YyUwntNwNqRRd0
	 QFsbQ2STiCM9es1UJ7xE/X5eHjGBYC4kWXf+fjeuq0sf2CSf+SnvadnC89eJg+qf6BUwI
	 dECDcNUxvGlsUv2xA4xP1KL5MdmJpYOm1Q6BUM60+KT1v+1oonpFRlxs69v5Frmo6LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740608;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+XwHuAguT2sSdswu4ba9iVZNOZyswWEjpnXOHZUZLs8=;
	b=G8PTKkMYCgX5fAVzRsT5BwqZZa93NrGeb3v1ri247IjorAuPTzdFUfoEJcOBzLgAuOgC
	 vdrQs9d3CCFWaOJpgOL7Elo4G36MDRq6dGJxMs4J7BDbjMem8jwH14Pqe6EwptAS/nKur
	 DutbU785/f+zn9lG5t/XAt9D20b//+CXTKqdaI7y8ye2NSs5hUk5EIEq1gRmdlBxH6rh7
	 nPsuZ4T5RHYn+5bvvsFf4hu1I5EfcFk31JLIAl4jv9OyV3k0mT6Op28LxsVs1hJZo0w+8
	 1C3hMoBUXfKLRSbAvzMvwgOSDTWzISheP0gDuPHznj6vxc/7bwwu7zuY8Xj0DNHtsYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuM0gLM2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ECF606A31C;
	Fri, 27 Nov 2026 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuM0gLM2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795740608;
	b=RACpnMrTGdVI8Tlzqy8tUoWGK7SNWYWoK9lpN3uhz/rqBobHm+cCfaGy1WmvRXFBoy2F
	 Rs4rW644zfjgxlfoUVuAKx4AE5qyE7miQxITkG9ZJ3SgHADK0Cc+9FfSFzvM1Ws+ylz+D
	 owtQ2ptF9jKgPj66JIk4FEE9U2s4w4nGQwDsCXF9QUJiGNGR2tFf2CN+mn6OURegdeT95
	 Oq0Kj3KwzUZEokfewnI7o9dm5np/9AhWQkScDkCbtIpgY7+pymHigW4L3rAc9U/KFHTtL
	 IkPo3EhbhfUDvv6AEwwEU+2+Z+uZnGijZRB6joaBNQQa2lIAFAFMWbpv/Bfh1lH2JAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795740608;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+XwHuAguT2sSdswu4ba9iVZNOZyswWEjpnXOHZUZLs8=;
	b=WlmSZScItuvj1Sn86PuQlzfTFD5d2W9pWvca+p9bO/xP/9B0x7zoZPLRQsBV3+pJMoEB
	 NUli2a4+cAc0dkbXg/DqIc6gyjflJeb7KAA4o2QnFn88RbOEExhrdlsQS+qhrwBEJqWdr
	 tHqi2H0Gk/e7/Z+47hCSVppe3rNbDfOAd47pqqk++534kI6YXg4uaqOP0MDEyLq3McGWH
	 qI7yY/Mppcx+SNEYuxqcYmg8RgnT4qOp2IR+Rynd2mF7UjbKs6Ahrm8azroJDsBH/UCGy
	 CKi9HF2EJZnxV2bAN6F7aPWXKDWaD+elNovyF3SX50neOKkLGU9TYYQxt66sT/8m6Ug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F10A11F00897;
	Fri, 27 Nov 2026 00:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740608;
	bh=+XwHuAguT2sSdswu4ba9iVZNOZyswWEjpnXOHZUZLs8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=IuM0gLM28ty7O0WemRDfekvsH8BCcP0/WmQKRE9d5rr3KXMCYJBv4QbPqIbg1Ur8G
	 tEUTChjchmvfiEiK9oobr9ERYkqaN4WG8Z/m9Ccf7VFCX4fSbapS+cPzFb7a7hAzQu
	 b0OhDX45tysVgYmYD1FAv67fZxUukQll/egNpHd6N5bUeA9lat/NT9unHVFwMTsK+Z
	 1zys6BSDYxUGMxgldg7Q0EK0GsinVlsK9+JhEL92jACNQBJdvAxOyvmmWdQmlGtJmr
	 GLewHihxi7LF/+Cqdq9v/9Oic4szSDXp5t1Onq3Jeijh532dND9hooSZTdfXkDQnLP
	 As2l15+3MoNzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7189A4B4AB;
	Fri, 27 Nov 2026 00:50:05 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Fri, 27 Nov 2026 00:49:41 +0000
Subject: [PATCH] ASoC: qcom: sm8250: Add SM8350 sound card
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
Message-Id: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA2YiUbxKtKFJpM6glEybRHEu
 5u2y7f4/wShxCTQFyck+rDwFjN0WYCbx/gkxT4bsEKrNbZK1s40lZLo3Zi8CmhsG+rGdh4hR3u
 iwMdvODz+lve0kHt9L3BdN+9fkRdyAAAA
X-Change-ID: 20261127-sm8350-sndcard-f2367f4568d2
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795740603; l=989;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=l+setiCU0+OrwLSvwV20cOvWy7hUFpop6hCa7bB/D/A=;
 b=AltFMW1XNwO+2+LBNBGdAAQvrRf7cfvJfXrIswCfQtiQgL/YZ0H6E9aJSwSTdZOoa+67UvSpq
 lqLnz9F5XjyA3JVjG//wp7kpKozWHAUoW946+XasIn5A3RPg5118co1
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

Give the SM8350 sound card its own driver name, so UCM files can tell
it from SM8250.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
The qcom,sm8350-sndcard binding this matches is already in for-7.5
(a5b5d062b40c).
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d0015e5f5..ba0aaf428 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -231,6 +231,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8350-sndcard", .data = "sm8350" },
 	{}
 };
 

---
base-commit: 0fe506c81cc421509660163da72dac79adfb959a
change-id: 20261127-sm8350-sndcard-f2367f4568d2

Best regards,
--  
Demeter Barna <me@fromdisposition.org>


