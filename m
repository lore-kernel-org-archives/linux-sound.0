Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1991346FB8
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764779118; cv=none; b=cbv6uv8pRi8IkRDr6gZx0qgJ0sKdVWVQZMnRpm0+g7AHcq3B/bGui2hGPdh/s6EGCziE1O3CEKcrqvylVoFfpPa7kq2N/PrH6jzBY6kTknXB8ND8GIKqu4vrc4EcRhErB/AXl7aa1j84sUN6nvT7pRGICSzcksMvTkch1+ednaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764779118; c=relaxed/simple;
	bh=2DdsCcnSizR/b2VYv53Or+2+0YruRp1/YIJ4C1DFzAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KL0KU40UTVojkOALPLl3ptq7xCJkCxaxtcF4Qj3EHdG4/u1PS+dp7HcZDCO4q9ewr5FyeUuF6G7rWe4l1vpemS2aKrBBmGVQLCCnBU8bcw8YAcb9LWf7lwLiQESgyTz6v7MSqVYOHMnpwMQxsIBPaXO7yFL2/HJ89nBudiJJ5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnDY49zG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnDY49zG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4f0013c54efso11551361cf.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764779114; x=1765383914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odA/XIGtQ8Aefzv2T8xnxO8nMXdmxqb0qbtjU51/Sdo=;
        b=SnDY49zGBr42SKJ4KflBwL6XFLF7IUhmFtxARgtJK/EqdEgBxQd7+xIWkCvZJhlreG
         RThs71cVRzYTauohuZFR5LELRzUJ4MR6vm3ggtfpjhUiiB3f9Emk9oQu3qELpOa3u+41
         a1wEoxLY+j3aQKJxaKPhiqJmKeVrXxlPRanVZw3ps1pJ+HirS1LdzKHaJMvbz7Ap+Bxd
         MKJxzmMEPCpi0lfbWZQHvprV4G8BRzJXwOVEzPOQN9nCm4n6+XqdzJl7T52o0C6xw0eq
         gcHlui8/u033SvGNNQ9etPRD+jDPCbfv8BF5E4x3mXpfzJoxqWSmPcm4/4gBeO2vD7aG
         pqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779114; x=1765383914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odA/XIGtQ8Aefzv2T8xnxO8nMXdmxqb0qbtjU51/Sdo=;
        b=GN0WBh7CAMy2IGPOBvlyqgFUUxUUx/6pG2cpSB4fRFpuOBVV+CmWy4UubMuOqqJ1B6
         da3XxAn4ZfbZu6Nk4/G4gRW5RApYzQUZmJ6wsYhVtlsM5OrEgoHDUcLEi/+8NUE6D6g3
         fxMWMGgv/KGB7uWBgrD9kPSqFMKX7R7xKpNvmRNKdTzpIdH5pnkhdBG34fAbeS0WZZow
         GrDY4o+lpCmdE3Oh2B40fY/1kK8fcwuvGovaB5ylWaf8/6pNAp9f0HjFCGTC3aGfIe1S
         41yzGQ7p9ziel9DMnkJqe/0LhiJIu714bWyv0QEcRdIYKgQTJnCyRFZlwmaqqzfkods4
         HMPg==
X-Gm-Message-State: AOJu0YwhBfxHHn5vunObxb31OjiDqrxTHVpaiUhsFFJ+TBLhmNw2GROY
	ZgzSYuDKcsxsW5Oe0H/F2YhKQ59RpSVx0fIpnmAEJiZollNqYFBMKuroiVASlEvM
X-Gm-Gg: ASbGncsQWPyvsT/qnZ/JECMnoeZ5BU+tsGWG41jfRWNP6hnTFoaWHLf2APaj41m1JYZ
	vDpe8sfP6jmP/XV6tH6QNAnu0W5J8T3lrx8q2VlLOZRx4CIB54okQ0I7VY0cDrwUlIz+dIRTRUX
	C44RvF4irmQWT+JxgArEUa59NVt//c3eXstYwQQVR7dQ0jgN0b0TKeAOl9Xji6tW2SyUHN3paUD
	vNCWDjvTU/UxfLHq1W5TQaAFcaK9km/xz0r1EqD+rfA57r2A5wgiE1pEIamDzd4WMC95GAtjqmY
	9lt0lMZc00C5Qo6ETibqpTQtbVNwjW21uA3J3ldcXXVwSAXT2gS2iRXkhjFP+7YefUQnQj/SJc4
	P71xZLZqpwfS6OX+wl6UNCsorpMuEaYP6Ts05Qjhzk0nPNYT94Dtq3CFeeTSDomuUL1oyjW2Ope
	BCU+SQvGZQdYLWKPsTh1pbtyVuIKsBiJDm7vH8RdiJyECeaVmeoa0+SFiDrN92M3KnkKgrv0zHq
	8F2TsAg6pcz8Xu9KNFH
X-Google-Smtp-Source: AGHT+IHzLTx09P/leFARnY6X5Rw+RTT4Z6ydiWIlqntcpCfQO5C9TvqgolhWSXC+nuZWkpXrCICBjw==
X-Received: by 2002:a05:622a:4d1:b0:4f0:441:96be with SMTP id d75a77b69052e-4f017652ebbmr37276351cf.51.1764779114397;
        Wed, 03 Dec 2025 08:25:14 -0800 (PST)
Received: from 30-134-MSI-RED (c-98-227-27-249.hsd1.il.comcast.net. [98.227.27.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd341f0ecsm115975311cf.16.2025.12.03.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:25:14 -0800 (PST)
From: Andres J Rosa <andyrosa@gmail.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	Andres J Rosa <andyrosa@gmail.com>
Subject: [PATCH] ALSA: uapi: Fix typo in asound.h comment
Date: Wed,  3 Dec 2025 10:25:01 -0600
Message-ID: <20251203162509.1822-1-andyrosa@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix 'level-shit' to 'level-shift' in struct snd_cea_861_aud_if comment.

Signed-off-by: Andres J Rosa <andyrosa@gmail.com>
---
 include/uapi/sound/asound.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 5a049eeae..d3ce75ba9 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -60,7 +60,7 @@ struct snd_cea_861_aud_if {
 	unsigned char db2_sf_ss; /* sample frequency and size */
 	unsigned char db3; /* not used, all zeros */
 	unsigned char db4_ca; /* channel allocation code */
-	unsigned char db5_dminh_lsv; /* downmix inhibit & level-shit values */
+	unsigned char db5_dminh_lsv; /* downmix inhibit & level-shift values */
 };
 
 /****************************************************************************
-- 
2.52.0.windows.1

