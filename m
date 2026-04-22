Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94E200C2;
	Wed, 22 Apr 2026 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820911; cv=none; b=cJH6TsIj3k5cCSZ1TZTgWw2+S2k0P2qB15IEpIgtNMR82QsRyaFEHf81hjLyOYORjQDiey2mXt89uR8pZu8ttS5PhKbN3aAeDq6Fr6odpma2p7Pw/uwdI4xgYntOIFhytUai3lu+lpc0Mesr28V3kf5tT6iqUZFXfyzTiv//HOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820911; c=relaxed/simple;
	bh=qy+Vk90TlEiEr6f91phfAIf7kh5KlbQH5M0MZUOzCwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rZz1/0wF+36oyNRMBcn0FenAY8bDTlXwd0xz4iKZQXOBe+2yFj/2YA0hMLbVary5yqT+UlyDXCrs/XXlU8ALtOSrk0qRRoEEv7iiE45Awf4F1OHYxfbjTMJF+EwvpFoN5KhGpdRJyKGTaGsAFNL3+JaPUTcos0HVtq6turX4sPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9def6cf03de911f1aa26b74ffac11d73-20260422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c8c7983b-a250-490d-91ad-cdc3fbb29f1d,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:92c024f716ea08f1f00cd4a3a3da5175,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:1
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9def6cf03de911f1aa26b74ffac11d73-20260422
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1459532252; Wed, 22 Apr 2026 09:21:41 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	gannovera <gannovera@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VE
Date: Wed, 22 Apr 2026 09:21:36 +0800
Message-Id: <20260422012136.87542-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

The laptop requires a quirk ID to enable its internal microphone. Add
it to the DMI quirk table.

Reported-by: gannovera <gannovera@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218402
Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index c5cf45881416..dde1a144e4d4 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -479,6 +479,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 B7ED"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 C7VE"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.25.1

