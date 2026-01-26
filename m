Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07991A9F96;
	Mon, 26 Jan 2026 01:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769392214; cv=none; b=H3ff0z7UjIx+CVHJPIgs/mWL+cr2Q75OmYug4+BxIeJ4u5wQX2vD0Rm38MsRZMY+3W8IwiNOWU05iGFW2pO1GpBqfk5Wl/XWkhhvNrJa2+RJfPbHaimZnnfAWQp6IGIsCAUTQxOPqoFt955z4zhU9AbZyGlLds3RqB3qWXNan9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769392214; c=relaxed/simple;
	bh=hsNu7sJY7ZEHJuK+LYe276KKt4iCnTvehngwjYey40g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCOVOatS4gt6F3grcdy0y3sDgNkv+k5d5w5z8Xb0zevK/MTjAolfPx6IMyr4NO+Ygmf075MGXIy7AvLmDw1ptLHmiZ3fb25/+kBCwkdse12wFihCLkzd4ol5oieMpjdljIcly7W5h1DLUWcHSfBBYHldqZNYD5+FzaUkwSjKZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5239493afa5911f0b0f03b4cfa9209d1-20260126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:536a055b-92d4-4f09-b4e9-c140af8d5648,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:9e356913761394897ef904518f973d24,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5239493afa5911f0b0f03b4cfa9209d1-20260126
X-User: zhangheng@kylinos.cn
Received: from kylin-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1982474377; Mon, 26 Jan 2026 09:49:58 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alex.andries.aa@gmail.com,
	syed.sabakareem@amd.com,
	keenplify@gmail.com,
	santesegabriel@gmail.com,
	talhah.peerbhai@gmail.com,
	elantsew.andrew@gmail.com,
	queler@gmail.com,
	ravenblack@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO
Date: Mon, 26 Jan 2026 09:49:52 +0800
Message-ID: <20260126014952.3674450-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the Acer TravelMate P216-41-TCO fixing the
issue where the internal microphone was not detected.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220983
Cc: <stable@vger.kernel.org>
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index f801ce4741ff..c18da0915baa 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -682,6 +682,14 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "GOH-X"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_BOARD_NAME, "XyloD5_RBU"),
+		}
+	},
+
 	{}
 };
 
-- 
2.47.1

