Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B9926E6E1
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448292; cv=none; b=s6VQ/0pIr3BYSAYvxYJAhWmSHsddugZ+H8VyMwRW++6h+F5rnZ5Uxf4u9XxX8LN8LACbPUVRtBURaDnIn0/mSsgSTZ50l/KB/Uhr+b23x0ss9a2j3qnBqot4UQgbsdcaW3KLsf1S7fT1hU4nfSiP6E7ZHBaW3JExSMFCrDJ2UsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448292; c=relaxed/simple;
	bh=zGbsuJR0MpNMo5oze1A82MxCMMbXYm6UPi7eGvB+LMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=npPTk9URTPb9q6To1VSdcvs1Y06kZXQj/TmWSQy1H0D0WJtEJFAVCHzcuZVYUr9P5wroZ5GuxcphdOtMyps+r38WkcwsPT3bF1cHYNzWX8MAhKKr4cECoIn3bFsd0yqXZaAs3irq0C1O4cZQXo/R914gPH+1SPpODTWq/MyweS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it5aBo1m; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it5aBo1m"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso1053068b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448291; x=1763053091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DS8sqqvkxvbCl5lep6vaK9Nc47322GAYDGuz/eRk6tQ=;
        b=it5aBo1m4hZZBmCnv/awhNNRrYn20kcwbPzD3S7a5mgZ7NMAflhBzT+AlUduioGA2x
         H/y5B02fzSp24NWcHI287Ca1xZJAqepJdJkgtKFEOOK1uxSB2rdQETITyqtZgze53IfL
         rh2L0dfGWUiX7bwCGZlCwnL2c/HDlM7rD41u9wejrjsoHUSENEMH35sdL+PkxFZwXKcY
         KetMFjYhbuPZlYu43nYGxscbtgLYfwtjvpvD3x8v7NyqqLVFDeCFIsF0djtmzkfWCqZA
         qcd8TwUZbU0u6uxkS0C/PAApzztbymzbmLJ5nCrOpzE1TAVXwri4N/GRwn04gvo3xPm2
         N5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448291; x=1763053091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DS8sqqvkxvbCl5lep6vaK9Nc47322GAYDGuz/eRk6tQ=;
        b=je6d44bGNLed5fL2IKIMakMd+c/WetS32YNUBmbHatdSTTHDEgnquSxVYcBvmB12I4
         DkaSdEfFAgYzEeYw2YKdWpLx+HfsRYXTZc+rDwFKZ8uTYp1Ti8nr1gtwoxzMNwOqMECl
         ywB/MhxeS3h3700ieeZ/LRtgmZQ2InMtnMAAdyyhIpdiZzZbBU9laJqkFVgwa/H2f7lY
         NQt0o0bN3ZDyofGN5FkRwlINP39dDV+NPAfB13Nd6aUV4xAFRa2Tq7ppRawnxeRY1Hnx
         svdbOsVU973H1lLqAtrBC/KEvMUXrCwC1C/wygEqqaKj6BmgF8WbMBmO7vF1wsOaE83E
         CHrw==
X-Gm-Message-State: AOJu0YyMMbfJRzzgJTVVPlanzEiInKu15e5/H2/6fRgOpH8i7PaZ6hY2
	VafiLj1U47VZKha6eag5tTOKdOIZeZSnmJMGtOkeg/OYQVCM+TV3QrIWDo1QVVCViCM=
X-Gm-Gg: ASbGncvhMBE/4Z/jNQ/p2FzDc0XJdjQ6ZePGGu2MX/8Akolgaj9OBXBzFXCO4vptoEm
	QJ13zcS3ZhxOFmvlzyDKR6n3FFPn1TJbBqCNFernAblvZg1/0NwENh2OZFx2nJnLjqdhq+La9jk
	KAPoDolil9GwBYEgJiwFxUZUYaHPYc4evozuLrH5rnZNYDsOip2Tx6KXYnQzrfuhhiM8deniIXE
	VgxvOrG3VV2HoecHad38aPcFYLFfRoBqcuUuSyTGlkuNKVFc62qR1PgxIGRyBzxg1mtXT17DTrU
	DrOGwWXyOX811i6RSIve9Mfqm8R1sandH+cBTB9jR1sF70Ega64PpSxm+kubjVi+S/wni+PIeQv
	/AaRHpFSFy0nsTh84HezIcNyBsK/3AidFgzm9C/3UQkcjVG9gt3RwCO7jg3tVY30gERgF4Ip7oO
	TjdufIb8/dfx4=
X-Google-Smtp-Source: AGHT+IHLEU7rRdg8EIc2XQEbCn/OuyoTmwX710BA5CZo2m9jEPRaW7mEDTTZiyzxlQ6euhLj7/p9Jw==
X-Received: by 2002:aa7:88c2:0:b0:7a7:2a:2ec9 with SMTP id d2e1a72fcca58-7b0bdb84cacmr275781b3a.23.1762448290853;
        Thu, 06 Nov 2025 08:58:10 -0800 (PST)
Received: from localhost.localdomain ([128.77.79.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff848bsm46779b3a.29.2025.11.06.08.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:58:10 -0800 (PST)
From: Yiwei Lin <s921975628@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yiwei Lin <s921975628@gmail.com>
Subject: [PATCH] ASoC: dapm-graph: Handle sourd card with space in name
Date: Fri,  7 Nov 2025 00:58:02 +0800
Message-Id: <20251106165802.3780-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the name of the sound card has a space between, the
script will fail to output the dot file. Consider the
case to generate it correctly.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
---
 tools/sound/dapm-graph | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/sound/dapm-graph b/tools/sound/dapm-graph
index b6196ee50..22993317d 100755
--- a/tools/sound/dapm-graph
+++ b/tools/sound/dapm-graph
@@ -174,7 +174,7 @@ process_dapm_component()
 
 	# Extract directory name into component name:
 	#   "./cs42l51.0-004a/dapm" -> "cs42l51.0-004a"
-	c_name="$(basename $(dirname "${c_dir}"))"
+	c_name="$(basename "$(dirname "${c_dir}")")"
     fi
 
     dbg_echo " * Component: ${c_name}"
@@ -201,7 +201,7 @@ process_dapm_component()
     >"${links_file}"
 
     # Iterate over widgets in the component dir
-    for w_file in ${c_dir}/*; do
+    for w_file in "${c_dir}"/*; do
 	process_dapm_widget "${tmp_dir}" "${c_name}" "${w_file}"
     done
 
-- 
2.34.1

