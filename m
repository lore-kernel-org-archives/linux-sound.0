Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B92119
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 00:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722989737; cv=none; b=bXvXtKaDPivzTulm8Sc+VtLcifxcqQvTtZo8MRTVgOaEtNAME3p0t05FfHu926A91YyTx4yb9LWkvJN9ge6d7TPNaPYfO2Si2sdxQN+Kg2cwjwkdtdZvNtq4TfcznO8BzSet6Z6rr7OweU/WAklr6u+coWuadAOKMjFh+uj4Uno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722989737; c=relaxed/simple;
	bh=mUQR+AwA43X3kP7iv1zrSlEeFpt4ZmMTLEGBHPrO6NU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jl4khEPPjAEZ7q33TBzEnNJQFjhwNvjSy0F5ath413iGFEHjTlxk+itvVotrwmY0JbtgrNIn+fE4CyRf2SHwzODPXMX0kvc5Nys0QUJhGFSB386TCnsZc5JC2Q/pr7PFt2sTkuxXJztbUrTy02EWif4grH0ZIuTjmAWB92Y/bIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V++Dcr7z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V++Dcr7z"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36bcc168cdaso790425f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722989734; x=1723594534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUC4PzLoUE4b8SJ26O9QZDfGVTqMJtzbZCw5bvlCCjs=;
        b=V++Dcr7z+V5dR9Coigom3MyJTbEOqwU1JdiRHjU5J8lABFGztOe+u9FQw2NDhZT0E8
         aAGoL4MKhWhnPi9uDutuzyU3HZEOWQ64rzgeISuHyDmsD6Z2r9pgC5t7oMIS3Y4WWdgo
         k9c4+Xmwlf+MMCE9JrVxtK7t5OQND0dr8LXades1fyBJ9xlTDHKHIUnScNqShsThx4iA
         68QWijXAhmNSpyEdYfu2z7Kee/jJgeoqh0LHeXd0dRR5w2P5CECijeL56Fk5psckJO48
         74tCpzmQD2CUF3RZ0NyUr+u8C8FOsuYXLt7vm2HsY/rQhxfyZbRtTbqY4jepGmfR9gsh
         Cxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722989734; x=1723594534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUC4PzLoUE4b8SJ26O9QZDfGVTqMJtzbZCw5bvlCCjs=;
        b=vKC6ibs8nE+8LyTZpZwoqcijqjk1HncfnLTuNhUrpqH3nrb2ByqAAf0RqTJML903j3
         bNYi8aQOOL8wqq2o36apziGme5TyvlrnXgGGOOWS/7uYmecok5NLXN5tw9yCF05xsj4F
         GVST4zjDNqT5lyyehKXrVyqwIppL2cBekGhz0lVc4S4426qLRmIgamZFUWkYSmGB0Ls1
         vivYSQNwFz4k7WzHyHvQnVYg9u+fmos9PRNjRtTdTIY2hErSX6gJ5GG6h+8ZL3R0wrLl
         10Ajs/wyClrw54603KXnKcOSa/8LWPCqyZ+RlXEUJ7vXzb53labDIksoSVf32F9DE/r7
         CzZA==
X-Forwarded-Encrypted: i=1; AJvYcCWaGtI5sTA5hBNxp1y+xa9AfoKB6IYdlVyLlUyjg+0ZnEUzpPzQ+kJQr06wxUAji8cnnHq3HMTfcKAgEXHIjZuMm3e/SB49toEBHdI=
X-Gm-Message-State: AOJu0YyNjT170r2anRMOx0B1qFKo+84gpvoMtjTf44r0usxf043y2QyW
	IOolaS5+mtBCL/LSFASD0ic7UguKhM6Fz7hk1DLuT25MR4QhEnRA
X-Google-Smtp-Source: AGHT+IE8Krp29WxeR/HJEY6p3UNXhuBBbOi5q9Nc6si6MMnPUeBYw923t870o22SaLu6CiKJMKqbXg==
X-Received: by 2002:a5d:5f56:0:b0:368:7e54:baaa with SMTP id ffacd0b85a97d-36bbc0e0f88mr16063924f8f.4.1722989734237;
        Tue, 06 Aug 2024 17:15:34 -0700 (PDT)
Received: from localhost.localdomain (83.11.145.155.ipv4.supernova.orange.pl. [83.11.145.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d43913sm582757266b.105.2024.08.06.17.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:15:33 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20St=C4=99pniak?= <kfs.szk@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20St=C4=99pniak?= <kfs.szk@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Support mic on Lenovo Thinkpad E14 Gen 6
Date: Wed,  7 Aug 2024 02:12:19 +0200
Message-Id: <20240807001219.1147-1-kfs.szk@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lenovo Thinkpad E14 Gen 6 (model type 21M3)
needs a quirk entry for internal mic to work.

Signed-off-by: Krzysztof Stępniak <kfs.szk@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1769e07e83dc..98e29d3af5fd 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -220,6 +220,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21M3"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.31.1.windows.1

