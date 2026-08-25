Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F1C3E63B2
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649955; cv=none; b=TnzHNuzWkW6PTvblJIHQ/FlgpiOPkDKmXrp6E5utVc3UtxwD0GPhm8SpLf14eXivnRGifd+QZ7RyxDgONOXhslN2zlHXnc3BuuZH4nWMkdl7mUJKpn/5/khy+1dwjkBdhguVTZgEWMegPVB9yS3V9tlM8WBj3l6EOjAytBb0d2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649955; c=relaxed/simple;
	bh=mdLe2jdU7iF9wEXXM4DLQU9Jsp86sIZvEwYDiJHQRwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LqrOg6ex5/1GyILyfeT9qGlr7PJFj8AWKGRj/CQDf4nxRL2yB+98p8R7gy7xd2WshGpcuhwOgcGKr+n9q5J0SbRxCoRuLR1G/IB3X5KpkdisO9mpsTWYKec8/MHtnTDLjki3SbjrZLR2X53Sf/oZcPMzsakObn/xs9IzxIehO6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/LjwSb/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/LjwSb/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c197e7e4e94so792922466b.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649952; x=1788254752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH1adXLK8OjQwhMU8E4xsgq5SkN36VOn3JYnRejdIaU=;
        b=G/LjwSb/dcLpL7Ej5U4YvlH9emh7BW4OoIYsEveHsWvWasqFcDCi5eRbhfYTz8lNG/
         hDn1VaN2LDHppE60JqGlY3Ds/QCIdBimZfPEvoQ3HAA2j0+TciyYlUjYW5BRMiciaUjR
         UsMh5MpOygJcPLCmhWfDR4P6MbePn/xVhhZ//8kwzWDw2KxUEuCNqXe5mEm45y+rKsIO
         fkULE3FK8/5Aq/mPHraa0n31CvX8nFdAOMAj3xa+OqKSG3ONAUc62Z4YDD/e2PbyGUp4
         hE3C2bxaIKdpV9TObT121VuvT63kWMnIBOQ9IjKEoO070J0iQMoUDVXmPyqu3HH5zcTJ
         GRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649952; x=1788254752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH1adXLK8OjQwhMU8E4xsgq5SkN36VOn3JYnRejdIaU=;
        b=cjCyjxP++4CFuquwiDul+4hkCWdrq8nIQeMeYeIsmsb5h84swpjPO8de4HGBWCDEBN
         aar98OKgx7VwDJhpCE2CYyyg4kL50NxCqjzMNoHodp1+ULFwPIhb2YPSdKYDWDb9h15k
         U31rTn80woEQ52nYYEwauDBe5wiiQs4WTk6ySe/lJWDttWzTntdn8hmdXESj0tkbi9L0
         FQOfdklgNOX/cu/tBzsy2JZo6FQ3b7r7aBLeJS078loKAY+JWa/7O5upMuZV7lwcw0GK
         BEw9lyAsU/i78yqmJwNkGqugnb9HYVuWCqLE653ewdOEwEIiT5heCWioMzu1D/vn7VlP
         MbdQ==
X-Gm-Message-State: AFuF++mu2U8xXM4l/6gEvtzLzihYtXXa80Ht/5cl1Hv370p/9sHQaihW
	EtAdha/ptdFAYa8ITTW5v4fE4UYW6vyDFUVwGwX2ZzWATIpdgWCHTIeD
X-Gm-Gg: AR+sD12iJ8R2ecYy3f1ethpZ8YqqUedeKblUOoHiWwFFCilLDG9IoaDvm/8Mcf4beMo
	P/KRSX0kCrfhVPzmorbD0i5VUStR9ssURUPtgaIvQycrBmR/jj1IAjJPki04or2M2YjwC2UJ74V
	ieWkMb7BQ3fw23aeHC1lZQ41hhBG7qjP6HXXq5HMcBXSckO0e2D+h6m4SQW5Y9CRPkOij59NKdm
	thdJKc4Y1/korfWSOHnsmUHzdP/YymuD2tasGCJ4M4+54mrlq8NAUfLPLABerWuddvyfuznGpNI
	UrSRIaFE7YdhNTO7VSgEspurgOcNVxCeKEyIoL/p7FW0QVSqr3xnFJs9U68tW0T2j1rSbytKphk
	cXspS/1mk3I1sRbfZisI+U5BV2bO2pLqYDnk9Fs8kkD6r661fpPmaMzrSV9YY8LVdns1kgXOn51
	zOSB/gT7wyTYJXnS45Sng7ReiHIxk8zhSmkYJ7PMoZiQVkU3BC2TmiwhuzRUnkFJgQSjkB7OE4H
	14BLeFS
X-Received: by 2002:a17:906:f59b:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c24924b7508mr2666783566b.8.1787649951946;
        Tue, 25 Aug 2026 02:25:51 -0700 (PDT)
Received: from fedora.hgw.local ([78.166.112.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm1510277666b.57.2026.08.25.02.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:50 -0700 (PDT)
From: Mehmet Aysel <mehmet4ysel@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Aysel <mehmet4ysel@gmail.com>
Subject: [PATCH 1/2] ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI quirk
Date: Tue, 25 Aug 2026 12:24:31 +0300
Message-ID: <20260825092432.56292-1-mehmet4ysel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI match table entry for HUAWEI HVY-WXX9 board, product version
M1060, a MateBook D16 2021 (Ryzen 5 4600H) revision not covered by the
existing M1010/M1020/M1040 entries. This board uses the same
FLAG_AMD_LEGACY / ACP_PCI_DEV_ID configuration as the other HVY-WXX9
variants.

Signed-off-by: Mehmet Aysel <mehmet4ysel@gmail.com>
---
 sound/soc/amd/acp-config.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 365209e..653e8ce 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -159,6 +159,20 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_LEGACY,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HVY-WXX9"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1060"),
+				},
+			},
+			{}
+		},
+	},
 };
 
 static int snd_amd_acp_acpi_find_config(struct pci_dev *pci)
-- 
2.55.0

