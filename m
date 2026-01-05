Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B515431ED79;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582140; cv=none; b=kDquZQWVeF5SgO6PW/boal+2IFRMRRCCRakHJZNYc1RFx+ODdLbutt806ibKSzk1i1Iiby3oBb2b9jOZzqSCb1vC2ewjavibVagAKvYFfGv83Ou9T5SAyquH5iykRP1ZOEfn97zRaI9A0gob6UsBDu+dgwXM2oYdfIM4clFy/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582140; c=relaxed/simple;
	bh=BFEjwR2Arkbv0ipELyTdtC+knjx5XiRnABAIKHUy6C0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rrByu3BgUx4MdEJkGqWhejDaNpofuVM0/YxeXOxRcG6IHIiUxb2heB2Aa2bW8NNkxJIPylwWXiCJBsuH/RyXOC6Td9zoxDEptL038TwQAYAf+dW9a0Waw8lK8tA3jdeyge5C/jW0BkZuWP2soyJT20Xvv1u/DlO7XZ5jzFX6xhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9Uwtekg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9Uwtekg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5007FC19425;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767582140;
	bh=BFEjwR2Arkbv0ipELyTdtC+knjx5XiRnABAIKHUy6C0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Z9Uwtekg7+xzmXiW9V8ct+3NRRfrC66Jbt7pkV3bUaG8gwB9TCjyGfPQwn8y9y72w
	 YylqmOGMNRGPDBpC+beg3HDEaSJwnJTw0+Z6C8+8B0rqj8jcSnxqBE1GOV9pLdv+9i
	 xeAjkOgJn3lKk772VdhvFLPEVDtfBLc747WUYnzq961ialYPBqp2fqTOsAUOuxnJhd
	 IZQ1oAtJ9TnMRXuyCUwMN716zMDYcbEmT8AaSvm4f7OM3Na6tod+BAs98AcowZfHdn
	 i7z0rGap6jKNH8KrXX8u+cxPzh0f1GlhKWuORFVDpfd9RRiUitIm/p6223ObPrERrg
	 PSU52eyk8a6HQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2DBC2A06C;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Subject: [PATCH RESEND 0/4] sound: codecs: wm8962: Assorted fixes
Date: Mon, 05 Jan 2026 04:02:07 +0100
Message-Id: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=BFEjwR2Arkbv0ipELyTdtC+knjx5XiRnABAIKHUy6C0=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWym6n9xvHh0j2pjLJ01JWDxoOXRTciSmqvnki
 5QYtEEyRMGJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVspugAKCRDo8jXPO9vD
 /9OKEACWAiBMmbKqsQXmrIgmFV3OndDFb94kbTKo+0eXN3/n2Pq+VNRpgSmP9sH0/+oQf3leyAM
 s+iGF8g/m5n649kZB+f9czvF/Z9aJITpnhWC+RJVWspTmn+xyZM6EQF9QfxLa0AEaVtK/HTSBmv
 Jp1dp7QvSdM7KrtsOTxTjzf0hlh+ExxGTealX1Cf8XAiWXpdKqSPlOgNuSz9H9SN7FNGLTBV4ob
 nEHZsIA9jmqkVmnfbYmhZqIIaYmasbHrYlaujzdBove1I8yXkAdavmxKtPEkWdU0/D27pVRiatd
 oMiG4vmvgFcrCcLo64FWrSXPVoKLK3s0WFhTAuIECr8Jt0hmItNa5NXvp+QXEF/h8+C2JBolKor
 lnKKM2FYj1hffiE4CdC0FdKy32+Ay8A7znpuCRDr9yh3F2Xw0FYV7mjsnVfR1ZNTPG+e8gtt+oe
 WuU5jxBb/JA5CjBa1mj74P6wIFIaG3JxnCxL3x9iGxYv4NMpM4UCte8e0K7bUSvbHrHpMPyf5GY
 8cYyABvaAefvFG9w7EfH16XX+gktn78IyfCpztrrCuBYQF2eB7zTezUrPtJAYdMnvkI5vuG6j6Q
 NgffKhSgwbtXPYRomFulr1ZiHgndQKZvGnTDCtpPUsW7vHUu35EnOkxsMtBvc6JG7XMtWYaKSd4
 bzz2i77Ix1OnNrg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

Bunch of patches developed while working on Purism's Librem 5 phone.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (4):
      ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
      ASoC: wm8962: Don't disable SYSCLK if it's enabled via DAPM
      ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
      ASoC: wm8962: Don't mark WM8962_ADDITIONAL_CONTROL_4 as volatile

 sound/soc/codecs/wm8962.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-wm8962-l5-fixes-8cde049eb67d

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


