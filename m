Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288C53AFB18;
	Thu, 30 Jul 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415175; cv=none; b=X7k3CF4UGtfNTm5RUz4Fu27p+f8PoMckWVtz22o4EJW8GYcT+g+3Q6DF0vng9YueUD6IS3GOOztnvU+jjj3dLwtBdYPmmSBgnxvjeU+0f8OpSedN6YyiYSPV9KkCmM8HDUcBKRpPz9rc2gU0P80OTN2EpeJ31pGRnuiX6Y1UdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415175; c=relaxed/simple;
	bh=aUaPtIN1r+dvdUnqn2gyRkHo+fAz0iq0Jq2UFl0uhlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=II5LxieZ4MlMlbdpD1/iCHt0Ojl5V9JCoVuYPkXyUwufp5tb+1HivLi4Ns81OqSor0gBX4lrwQg2pV4AoYUcvmJ2J3t7XnPAEu6A+B2yvJFt9m6lo2i71oqHMzFzHNDL8VFQ4tUI8qKtaFRwSncKxRJAKbsXZXBZszeKyPzH384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b23f51488c1311f1aa26b74ffac11d73-20260730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0705a898-5d99-4c31-b4e6-c60b0e6b40b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:2e45bc478e4099f4dffc578e46fa6839,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b23f51488c1311f1aa26b74ffac11d73-20260730
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 489119193; Thu, 30 Jul 2026 20:39:24 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: cuerdoslinux@proton.me,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2] ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
Date: Thu, 30 Jul 2026 20:39:20 +0800
Message-Id: <20260730123920.104525-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0a9f07ef-cae2-4344-98be-fd14108c9455@sirena.org.uk>
References: <0a9f07ef-cae2-4344-98be-fd14108c9455@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirk to enable ACP6x sound card for HP Victus by HP Laptop
16-e1xxx, which fixes microphone not working issue.

Without this quirk, the DMIC on acp6x device is not properly enabled,
causing the microphone to not work.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218926
Link: https://github.com/CuerdOS/linux-kernel-nhs/commit/b29ba27a0ed672664071b4b345e63b62a419d31d
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
Reported-by: CuerdOS Dev Team <cuerdoslinux@proton.me>
Signed-off-by: CuerdOS Dev Team <cuerdoslinux@proton.me>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 8b6119931a4d..1b03a17f4daa 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -724,6 +724,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
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
2.25.1

