Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62F28A73E
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 03:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752549321; cv=none; b=bnqnfS67weNQCRp/pLzi5OuUKXPOKBlNjSczawuDTFTmTGNao6fPEOVD5hfd8oivLYnVlQw6DWSDlaU+lzLrvNX4/uCbSEiX7d/k48QJWFc5mNuJrCLJhNV53AXf5EoxlPHWaQljBuiZRu/Drpkzf6lz2w4jZPJkNdhH8toUgPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752549321; c=relaxed/simple;
	bh=2+kjE2oKV6b0ccf6sC1r8oE3I4G67M2chO4Zx2w4+tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fawlXJYLRc2Yuztc8v+1EoSLrlMcmScUplvdJ83pNtw8ivJWSJ0bxr+RoYi1FMhv/5qQaNJT7pKtgvTkKOp7nnu2xF5WCJ3wKMbaXxb6li6Iw2+ogoL8jQOcsRTWudwNb9LW26TJ9EoIAGqOPVuVfkNNKXDdTTRufjDejbNESB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCkcFz+2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCkcFz+2"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e29616cc4fso179694285a.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752549317; x=1753154117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgoE9J12jqC2U/BP7qx95wvpwAg4TYzcTRCB06cs8M8=;
        b=NCkcFz+2SY5/unNrVrUmHxuFZZOWZEik+3pgpcXZk+5RuaWiKikbwZz4P0Dt0UE2hE
         IBOkjb+vFowYw2q37wKMKm0X3OFul1iUbElh4+GfGJtU+OdVImSe+OqxW04gR26Tg+1E
         GyrtYQVPeq+USrvPI6EKze6rQsctgrhqkKBSfxSKC0HDR2UXDVhcRuPCvSUroh6uy7Rl
         LYYZrW9d5JovBwvQaZTqialsvw7Rj4XykHgzSC58Ez1YvzUxvkJE/RNfO9CgiZVE3fII
         0jdOPZBEngFNdB1gsTvKFcEFSkfmyOKmq2NOjJ++e/mDoq28dPeqf7UwRLrgozR1dCD3
         L76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752549317; x=1753154117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgoE9J12jqC2U/BP7qx95wvpwAg4TYzcTRCB06cs8M8=;
        b=wiSVijT2c21p9VwWpsmhLb8TNg38MzHshXrrvj5Ls1NgyikScCEU+GbE3eVROiRCKe
         Q3WJv/5n4M09/LutBr0a7HDxFo142MpIppZTr0VxMeIV+iMBds/rb0X13FNSwAKNTtfz
         vo1CXgnnu6pqVOC7qmzstmvee+jKHV12/ulVgPZ2RjT2dYGYx1t1ejCyCgxOiw8I0K75
         nX7/mR7papEH6vz0CLlPo67AW3Q77cMxkyOZe2x1W7ulliemeTEyVPrpcuD481B3a0+l
         ftJTAqAuwiyKtrQOkzWNOeqclx5RUmt2315RYRlC81B3/o2FRH3YZP6XgzVKcxPrsrDW
         GuLw==
X-Forwarded-Encrypted: i=1; AJvYcCVCth1yUX3RCMplO5NWXfaW/uiyYBMjsYC3nJYBq5IrLqWLddpqyTGLqKAkSRwgCX5DxxuD9yR8/DCZsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5XNQ9ieXyolpvvXLBcykDa/LttHJzHyC9o6kTal96LkTHF0h
	/w6gHWLRwcabLlIvO8zdyQDeOAfS9im6IEPZJAvrcXSWMB+j4n9UToz6
X-Gm-Gg: ASbGncv+lt9tcMkE+EWZE8aT/WNFFR+AdhJyrVZkfcD5s6xTEOTEbQHLeUcOwyHE4Ze
	sNvmjgJifnK/Z/bu27l/LlLPnNTXxt48I5JZeGwctpbIblbBLyFHWJvouDMezXI48qt7Onm4E52
	uIyc8eQPGsg58EZrkDI5IJCzMv1CKRFPbHLTImNxZY0d8jnPA7/OTHrMLDu80YCNDmZXM1iK+yU
	9yYiZV1+nkD7w7ady8X/ymYlaVYt9CB88/NsFJxy+PQbJzpXgczITFGKB03n3T7e5zgI2A8zVrM
	/spF9FACfX5RhzRjvx0xE6TLzKdjhVMziIsQOZuwJlgDoGBheengVO2BUflorgJmHUIS8ygil+a
	PMUHOCUsDfZ9rvHZo4W7PV7HBZNTgsiA9UO9rsAwPskS0sDc=
X-Google-Smtp-Source: AGHT+IGXkEIoufBM3mY5gtb7olwPU1NtPaqAtKZNMa3OZ9JN4Uly9pmpdfTH1rCSTGMzQWINxeUrRQ==
X-Received: by 2002:a05:620a:3185:b0:7e2:43d1:1cfb with SMTP id af79cd13be357-7e243d1207cmr1037387485a.47.1752549317138;
        Mon, 14 Jul 2025 20:15:17 -0700 (PDT)
Received: from qtMint.mynetworksettings.com ([2600:4040:2489:3200:9d7c:f4d3:2646:868d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704a7f23874sm40122326d6.8.2025.07.14.20.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 20:15:16 -0700 (PDT)
From: Adam Queler <queler@gmail.com>
X-Google-Original-From: Adam Queler <queler+k@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Adam Queler <queler+k@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI entries to support HP 15-fb1xxx
Date: Mon, 14 Jul 2025 23:14:24 -0400
Message-ID: <20250715031434.222062-1-queler+k@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This model requires an additional detection quirk to
enable the internal microphone.

Signed-off-by: Adam Queler <queler+k@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 61fcc30c33537..c572691378d56 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -542,6 +542,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Victus by HP Gaming Laptop 15-fb1xxx"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0

