Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA5A3D8114;
	Mon, 20 Jul 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541095; cv=none; b=XhuqQCmBsZqpuRmabxODvmkLMk9ZflEI8HwFwy9D1a24t98tWA8TFN24vWyDNZfE1rSxokuUbz5TQLQ366s8qjTf1icJICy9euj1izzOjvzx8sjiZbRRA9koEgp+JskeyEEb48sAbQVxARYhHBQKwHBmWON3mC2GYq9g+zjzFaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541095; c=relaxed/simple;
	bh=KKFJaj8WI26XrMWRou/Sg8q3RIhBENU6w//RbXW12Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fD9rNuL9mgsHi3f2z9lc658TQUUfVT5UdbkqqojC0TrYdMtWmPotgWwcSH7AgNnVG3fHFrLr9iq423w9mKlOCUcUq4lwedTpCCrqX3vrRUtsPTj/56wwNpXWfxqfemUoXZanag6SC9MGABS6fkHLO9hL0AfCGoTlbSImPFmGMQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9261cbbc842011f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:46721167-32e9-42c3-8f0d-744d0d7b422f,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:8f2d6f6d1618ea5859536ac81256285a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9261cbbc842011f1aa26b74ffac11d73-20260720
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1532375908; Mon, 20 Jul 2026 17:51:25 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	CuerdOS Dev Team <cuerdoslinux@proton.me>,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
Date: Mon, 20 Jul 2026 17:51:20 +0800
Message-Id: <20260720095120.521112-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: CuerdOS Dev Team <cuerdoslinux@proton.me>

Add DMI quirk to enable ACP6x sound card for HP Victus by HP Laptop
16-e1xxx, which fixes microphone not working issue.

Without this quirk, the DMIC on acp6x device is not properly enabled,
causing the microphone to not work.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218926
Link: https://github.com/CuerdOS/linux-kernel-nhs/commit/b29ba27a0ed672664071b4b345e63b62a419d31d
Reviewed-by: Zhang Heng <zhangheng@kylinos.cn>
Reported-by: CuerdOS Dev Team <cuerdoslinux@proton.me>
Signed-off-by: CuerdOS Dev Team <cuerdoslinux@proton.me>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index f71f08c48253..7f42b88aabdd 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -710,6 +710,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8E35"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Victus by HP Laptop 16-e1xxx"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.45.1
