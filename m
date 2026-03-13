Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945B35DA50;
	Fri, 13 Mar 2026 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427397; cv=none; b=l3le7Cv18S9y6JlD6Pp4m9rE0p8J6qKQD797tZowtynZ4MyQtRRnlThPpm/dfhfi3wALQem9HbGxIecQ9r/LTQ/O7o1AD5GDRwPkSJw5iu4SXoXUEsLNL3VNscYQfB3ONHdfEy7f+X0R9n0SasGlFaMWy74KCNwcfDKH8Y7akRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427397; c=relaxed/simple;
	bh=n5O8kmjDXqJfQ0yqnK/0XI7wM6X8VHL3FnDeo/WMLfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MwTSnYfbwSYMI0weD/WiEfO7/7gqt2xRCeu6xC8GZJCD/dEn+1raWVFgxSXeqSl/nr7t+cAQECK+4TzmAQGJtFtkDsEXt3H+G4zFmHfIBzQnojokhe5XWnw42K4y1IyIPUkBbB/S7MJEglyhpEuTAwA3vFWmNmyCj+xEpRfl9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=X0rIWR6Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LMKPobux; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="X0rIWR6Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LMKPobux"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 25AE11D001CE;
	Fri, 13 Mar 2026 14:43:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 13 Mar 2026 14:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1773427393; x=
	1773513793; bh=XC6EVWrdTcXnfhaslU0vQnQnQfjR+CHD2QfenH6YYkI=; b=X
	0rIWR6YKILA9ZL9ERxmhCzCBSbSDZXkP/DfO8lSgCNBrvOairRqVipIm5yf/qYFn
	c62k7kgEVs4aFvIlQXvPe5hlpY1iRjNN0uHfS6jyDy8ft+lpbsxWmTJtun2chU9i
	Kqi4rCcUZvFQqNW+AOHrnzz1Z2SEu9ffJuSvpEkpSyQ5eLmUQWnmPIjGc+yAPR5O
	U8Yj5DqE8EHkvWc0LoxT66d9AbUJbV8STHfSRsNPGf0DZCeZgbfQbzngMh61N2mB
	JXk++pcMZkRwihMbrd1ELcoAJTWIxmW2mYc+CIXTKMZghRPFGDV08esMF4f/5fdI
	UrosJMDPfJ6zGtB9Nwr/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773427393; x=1773513793; bh=XC6EVWrdTcXnfhaslU0vQnQnQfjR
	+CHD2QfenH6YYkI=; b=LMKPobux6aCEvJCfz5ruVaXowOoPXPZ046WDX8+4ueEB
	y8uLC+c9BZIJTC4cjMxXfj1KGaUjZHC7adHf4Y+j4FsZdAX5KIKQSrtyQpVXHyaM
	O4iEJGDvzEAB+vCNxEW8znHp5NpUN2M8o5zil2N3dmcbsdyhar47Eo+YbsZcHzAa
	ZmHWIPJSGjJ0Pf0Y2X42qF+UbcUeRu/HhDxB3us/p5ws4FntAfMZxHtk88BDrcnO
	r6nKiodyoUlxHqPfbwCcB5wU32sblNqAkPWIHF/cVRL680kygr15MCB+69uQ25S4
	cIsfrUw2b467VUFQyj3UfuqBN1wLoCXRIG0qTsOHuA==
X-ME-Sender: <xms:wVq0abgt06cTVyA8LZHUgl5jSXJhAPxjCpcXbnLx4muNUSQgX6sWDQ>
    <xme:wVq0absID93j3DRBXlxpR1Hud35wUWoB1SA8qldvWCbhXAucN-VOGmhSSiO3v8lYv
    EFb8S0b20FIC051O0chURjhdZCV71vjdsUNCyUC2Lid_myV8AvWng>
X-ME-Received: <xmr:wVq0aU4UZiAtCPl_J7l7UDpytHYcKqqzwJjutCDsuD3eAtzZbB8c4xGOD3cv6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledtgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegt
    ohhnthgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpeefve
    ehieejleekkeffuedvjeelgeduudffgedvtefgkeeileetveeftdejledvueenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtse
    hstghhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvg
    hu
X-ME-Proxy: <xmx:wVq0afMoisGaieliBp-VlYV87FIfbX2TG6VBLRO3SQzkRHL0LOPqPQ>
    <xmx:wVq0aauQF2ksThNufX8ve5Z7xeboW90jMkYI401-qygK_d1pWAeOyQ>
    <xmx:wVq0aaZZ1iEEcfeiApGmZRyfXfNlElH97Qj92mPTFz_r4awEkctFUQ>
    <xmx:wVq0aUzG36O-2aT7FDCqTsXkAzrqCF_S1LomB25b_or1vb6fsBtroA>
    <xmx:wVq0aTJ-80f4E6F7pEzSil7CHD55rzGHEURd5VZCsBM5uA8NIY-FC1V3>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Mar 2026 14:43:12 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Fri, 13 Mar 2026 20:42:45 +0200
Subject: [PATCH] defconfig: Remove stale CONFIG_SND_SOC_ROCKCHIP
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-rockchip-snd-cleanup-v1-1-77d9a953fd1b@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAKRatGkC/x3MMQqAMAxA0atIZgONlQ5eRRw0jRqUWloUQby7x
 fEN/z+QJalk6KoHklya9QgFVFfA6xgWQfXF0JjGGUsW08EbrxoxB4+8yxjOiJNraTaOiYyHksY
 ks97/th/e9wPvrt4/ZgAAAA==
X-Change-ID: 20260313-rockchip-snd-cleanup-b641f06c110d
To: Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773427392; l=1564;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=n5O8kmjDXqJfQ0yqnK/0XI7wM6X8VHL3FnDeo/WMLfs=;
 b=ie/GopnkxP+azHiXC+21sVOvMdKEWvbY+tVDrR81JPPIbhG6XDqhrM2VAx2NVUZyXwr5MVBWt
 DKvy17gmSVkDob0mtf/emJZnAG/dWn5BmJTOK8nTfP0zHeN/sdJKiZ9
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Cleanup arm and arm64 defconfig files containing the recently removed
CONFIG_SND_SOC_ROCKCHIP option.

Fixes: cae3cc435db5 ("ASoC: rockchip: Standardize ASoC menu")
Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm64/configs/defconfig        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c88c8274d1f4c1315ff1dc9ba096d5..f16080e059871cd19911f4b91e47e932c43c5179 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -814,7 +814,6 @@ CONFIG_SND_MMP_SOC_SSPA=m
 CONFIG_SND_PXA910_SOC=m
 CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b03aab531bc1313a54103acd43b7a..7e0cb17fc92224892115f59f89a74a43a2f95407 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1097,7 +1097,6 @@ CONFIG_SND_SOC_SC8280XP=m
 CONFIG_SND_SOC_SC7180=m
 CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
 CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-rockchip-snd-cleanup-b641f06c110d

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>

