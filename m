Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61F3D7D8E;
	Wed, 26 Aug 2026 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738520; cv=none; b=EnOsy+F2lx+2ZNY+8MgCw8ifZ5XZKfr8/ACFp6E9828MAy7CeeJoDOaROxOqNQNhHwINq3pWqqa3TEWNv9c5aiL3kalcTNeuS8iBQgnb6f0k4kaxpHhTk0jDJxyXN6dHACEURgKOO8+iA4SzVkuCCiMxSpbt/bwQWP6V3HHToLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738520; c=relaxed/simple;
	bh=c5VYaZdTmXX1DcxMFueJsGckf7QH1DNKPX8oY8uv/cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hEbARMvDoTVsR2O3OcsfxfU62A2xgUcitI0DF9Mkm3+LFxFZvHdjbWL7bSCCVXRgmxdjTAAtrCJwpgyxBi8bp1Y4+bODbb7mRhRJUiVwKLLHeoJMdbyUGlcWtwAB3m5t1Qkx2IYR+wGsPfKlP3DPykrZAJWypZZX39I7SLKApAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=T1o9bhEx; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=tPxmuusU; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="T1o9bhEx";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="tPxmuusU"
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id C8C1017589BD;
	Wed, 26 Aug 2026 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1787737360; bh=c5VYaZdTmXX1DcxMFueJsGckf7QH1DNKPX8oY8uv/cg=;
	h=From:To:Cc:Subject:Date:From;
	b=T1o9bhExm3lE6FPUvGLtiqtkCRRmaLmeY4n6jeJNNZzWQWUw37B9JXzn/emrQMMOB
	 yDTttIz9d8HnDINpC1fz72Z1dOpoz01rBYKsQOW90wji99FikaJ6ZbdjGdZQfaqMl7
	 Lh/SttYJXh5jOBA0RRnMmkxbtR7L7n3UJOZw72LKZ+pkNVL27yxWZWJLOuESt3yLwu
	 8jTXda6Y/E9oiQlOjT5hepG6HBozxY+j1cLbFmMLGe60n3VMyjaIBSzpH6D9lOQlUW
	 CJ8zQu3DaViUFXVYnRwsvDNIsSAoYEbbgOfymE/ruRG+lb5XaNBSMZZMeiwufyaDAP
	 VzDD2xdZoENsA==
X-Virus-Scanned: amavis at 4d2.org
Authentication-Results: bayard.4d2.org (amavis); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKEw9-ihNdCy; Wed, 26 Aug 2026 02:42:39 -0700 (PDT)
Received: from Headcrab-PC-Fedora (unknown [IPv6:2409:8a15:4eb2:2420:b4e6:d4bf:a398:ef06])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: wiagn@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 851E317581AF;
	Wed, 26 Aug 2026 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1787737359; bh=c5VYaZdTmXX1DcxMFueJsGckf7QH1DNKPX8oY8uv/cg=;
	h=From:To:Cc:Subject:Date:From;
	b=tPxmuusUB7xrhf2zVcE1sW2uf1+1kjACflZOwu6Yb9HaZoLxCpyvGjkO0yoW6RIU0
	 fsOlDS6bvSkEbjW892hFL9cm5cYFvsQCfboIVPJE8tiuVzN55zPHnJHsxCUjJgh1fj
	 lZRoJe7LLXD8Gvx1uoPBgTU6ovCS4UDhZQwc3gCZM0w5CCgzvRWOWNTFpSmANJo84W
	 RrUzTKCgmqNOrKYMNv2TmZOBVYkTVeQB6yXYH46fnWl3BeWApgGieJkANx6J2sUJyi
	 W/3+I6V19UJYu2+OiF4pmE7NT4QGHZxsOy2xl1csl9acBcuIeiyBc1VQNMKGSpW+2K
	 Dq+cYxBhCT8zw==
From: Shengyu Qu <wiagn@4d2.org>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Syed.SabaKareem@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: wiagn233@outlook.com,
	Shengyu Qu <wiagn@4d2.org>
Subject: [PATCH] ASoC: amd: acp-config: add quirk for more ASUS FA401EA variants
Date: Wed, 26 Aug 2026 17:42:09 +0800
Message-ID: <20260826094209.29299-1-wiagn@4d2.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing quirks doesn't cover all known exising FA401EA devices, so add
more quirk items to cover them.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221310#c49
Fixes: 27d090f3ccd4 ("ASoC: amd: acp: add ACP70 DMI override for new ASUS TUF platforms")
Signed-off-by: Shengyu Qu <wiagn@4d2.org>
---
 sound/soc/amd/acp-config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3021dc498c855..509f24a26ffe7 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -51,12 +51,24 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83V9"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA401EA"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A14 FA401EA"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TX Air FA401EA"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
-- 
2.55.0

