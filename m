Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566BC40D587
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779659; cv=none; b=ClaKRqqcGRnt8X1C5R4A8YviDIU7wpf4sqDAiqhqnJv5R2UeGPJX6Dw51su34WfDuZtyaOi+Xr7PIjdjFsldABI9dajDOiwyVu9dulTLVbbDds9Gd6eiWmDZqNhjqiDh8Xe+VFLBgAsfm+TmbhoAF0o4lfM5WbBOa2ygGeV6ALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779659; c=relaxed/simple;
	bh=EV7xC+brCLGphfeQYIDWLE8kcEQPnaqdwLrnyixwvas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QW7sKIVIvh3eOKjWJ0D6HYGaxTVu0+AAFfFbeyCj58UpWZtsw6dG8wI9zC03ClQc/LFlZUq1BO5PYic8p1BV5gUVYkgG70Ekptyp7ogg303nHhyEVtwVSnFL81Y/Tj71FdmoDD2/ZMDjCWTf0Z1HrmpBlFClO55ghJEWdJv+9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i//+m750; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i//+m750"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37df416c44bso2104825a91.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 17:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782779658; x=1783384458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkAz7Fw+OhuQ2RgOnnwrSLo3SJNJurxmJJ7+lfEcNOI=;
        b=i//+m7501c9iKrz+t4Jb4YzdsvvNlm9peuByLhiNJlKiRXFTplkVCp2VVOPkudIMXT
         4ZYxhuULSOTaYnEozm9mAF0xHGk0VDkBn709tR0jCykNR0Vjh8sSIyKzjwNtGfr+42bh
         eaKkn16mWZ86nwfJ1bhiDtHU23Sgao2PbzqKRKl4+0JAnTUvRL0DvaCBhdZ5Hdd0a/0Z
         ZMELvY5S/0MBnTd/3E3UiHUZoHJCrstWdBHajnliPcvs/SXuVo8vei0k79BRGM6l/Jpq
         2VY/A/0j9gxD7GK+7ja6RO0+mQmRsnKmn+YK6pbUteToRYhrVc5DP4KKVOXyksWCAEqv
         gDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779658; x=1783384458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkAz7Fw+OhuQ2RgOnnwrSLo3SJNJurxmJJ7+lfEcNOI=;
        b=RSTnMBkPa/Y2ZkQFXGZAk/lVr/CRiHsNCI8/tnEuffJOjhdQAti6Iqo4J5pjsTfdZI
         a0IyDloQiXY8JIhbMMgHyD5BBnY/57VoHawz/s5K+36Y3X+dwjqWXCjO8C1wOb+gNcJ7
         dsxLSmEoVS2LJ3VvWkea/SbkwxAq+X6X6TI2m/R9NCjnklojiOSOM0nwi5FmxHb1rDPg
         5TdyzJYFfbxSU7Psly1INmyzrcVo6RID3PNaLKEG0ZAL2N3ZvhMS0drOKiFW/U3aAwTW
         WCXO/BopEnv9eKB5OkaWd0c+9qDR5zU10ypyR1BvWmLWMZn3IWhHzb3TR80cdtzCrvev
         pCGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpllMIZZPGAInKohJxLk/Dplq5M1A1LQUVFrg1uhmlElzoOtQbdXPO4vCAGSBf2irJ81drRXG/cUnGd8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSkwcfO7ROKLD4hsqmVWH+YhhDeAbTZ7KV/uV6yhKc6n6Kf4pg
	Cld1dgGQrEi0dkax2RlTIbP9ZgezxoY680+8/SOoCdcOXOr910DzVBo1
X-Gm-Gg: AfdE7clS5Mcr8Mp/drh7dvR/Ik0FP/UuaQPZ2t7kPgAuTdTrxT/saJzxx17VFRvnddX
	MHsmiH/BYldgcnuI2QglJqNu/ugiUFsNbWEzWik46mQGVYZwoI2kE1jyJxKWwLU72fhflAc//xy
	ggSGc6s04SRouhWJ0fPufiYuoPv1i5GLaMEU44rFFuOIY/Di2me8UWdJxI3rbgEKKVxX+GhOlCZ
	ziCAGEA0Gb00hJBHHuQBccAsEdShX5VKTt6ejE7AjhGpYT6kC5TeJsCIJKsfF+bUm89ZQdRnusH
	i/+UrPj0LwYrNe3UL8oDEtIjgwzj4ca7ihU9yLfNLTeHUta7gW7r47PKpxErh5AMAFEe4T/Apv8
	/0SDs8IZ7iYcGXolR6JyK1VFIbiaRb69hL9AQ/e/A+IU6pJdQLeWALiK1t7kzskV96LA/S8w9wN
	FM9BPFC3CAYzosZp8kzBPJ1UD4lBDBMc0CMZI8NSXQOh7B2Q==
X-Received: by 2002:a17:90b:2fc7:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-380526a1e29mr1179631a91.14.1782779657403;
        Mon, 29 Jun 2026 17:34:17 -0700 (PDT)
Received: from alienware-m17 ([240d:f:d4c:3d00:da80:83ff:fea1:fcc7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380529ab9f4sm555174a91.7.2026.06.29.17.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 17:34:16 -0700 (PDT)
From: Jetha Chan <jethachan@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table
Date: Tue, 30 Jun 2026 09:33:28 +0900
Message-ID: <20260630003328.15675-1-jethachan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Alienware m15 R7 AMD exposes an ACP6x DMIC path, but its DMI
product name is not present in the Yellow Carp ACP quirk table. As a
result, the ACP machine driver does not enable the DMIC card on this
system.

Add the DMI product name for this machine. With this quirk applied, the
kernel reports:

  acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI

and ALSA exposes the ACP DMIC capture device:

  card 3: acp6x
  device 0: DMIC capture dmic-hifi-0

Tested on an Alienware m15 R7 AMD with product SKU 0B59.

Link: https://jethachan.net/dev/2026/03/21/fixing-internal-microphone-alienware-linux.html
Assisted-by: OpenAI-Codex:gpt-5.5
Signed-off-by: Jetha Chan <jethachan@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 000000000000..000000000000 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -504,6 +504,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m15 R7 AMD"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
 		}
 	},
-- 
2.50.0
