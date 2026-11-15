Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785455;
	b=YVFKfhwW5dkZ9l9fo34E5ml2T8R9VGDo0yvw3AB1FbK36RyJ/NnkZ7G6FoFM/xilz4HC
	 6Tw1QnVP+1eTCeBotdquJ85S4IaAqoGS1LUeLnb0NN6eIMAmbgE70/GkuKb8AxmocLSHD
	 GH7vV4Jm1YnFmswDNFZpDGaHhtwaNGvfNxr7dB1iBvZ7HcBUtqodMpd3Du9/5LVRVaSDM
	 lEc6aG60egwfqfWeUAfy8kK6c5k57d09svFT9gKdwdKA5Fjr5lFOPesexGkdDmnp2BJ70
	 8VPxoU+G6C8Zpphmf1S0IvUfLKkJLKB6Itj2Gl9lSI3CrYIqA0G9zHGolUVFNl52pfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZSTZnzB+/goUmQY4uXfHNp+kvqr8HTYl/TLMJ0sOAss=;
	b=f6ZhUGm3TbhykMBQ8vwM1rmzLU2po+I4B1Pd9TIAY5iQJQpuyvlKZ12xKsZ4Yceev2wL
	 nEyiBBrAvwRvOA5cjUUb2THAcCANW1vUALIroC2wofHz14TmMxQ1AmayrF8xHPCWYxZa6
	 9VggLXvcDVlyNEGPY8tIDVUaLRq0WT09+TkJc9LvlzFK7u/Q7XRJRPqwHw9YTABz5OmUr
	 HYt/sjAW476AmzRVLQLdTvM6/GTkKGoIbaCGxptWXln9wvusJ76GaYLDxoudqyWV2vk2o
	 xbzRXZ0k6ZaQPXhluFHwcvQkAt+TqSf2UeULaG4fYje7Ags5jHhznCrucygAKw8Sa+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNVDzV2y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDF606A33D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDDF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNVDzV2y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso2563748f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 15:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785454; x=1795390254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSTZnzB+/goUmQY4uXfHNp+kvqr8HTYl/TLMJ0sOAss=;
        b=fNVDzV2yhbI5v+oAvz+8NTQSoWex0VwqDLorwGjYQuhEoceRB7X0SQpW60GNb+jDPw
         wnVmMISErQ0itZ9IhpAqKXbQ+r2mmOSzsEqEkcNAMkRpWqokgxPbqMXETN1MnOZpmBNf
         PtlupY5ZZtW8jDj+b7E6ufidhR+MltZknhrFT8tl7FKbbPiGBqJnCwPEApDQO3vaj4TN
         PgXOeCGhEuxDEM1y49UFqNFS18rXc3XmPqAdUBJd8ZNPmdhdtVJHPQzTMmYrvgEB3Pkv
         ktSl9mhdzy0/p6oJASOBrkXimL8OA1vQbGkhJa7nMVBqbugLvdbqafEKIVec2q3AtkE7
         Ky+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785454; x=1795390254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSTZnzB+/goUmQY4uXfHNp+kvqr8HTYl/TLMJ0sOAss=;
        b=YjWTxXJD4XEoonm0qqzRLnRbghojSYyzf3Wq2/qLtlfB4l9mghh3vvWK7IaBrro7PW
         T1IonGRImiD38gqGyrIgxR8jLM/6HrZcjvO0+K5YwlGIXbRSWfZOxF82dZICF0K+9fzg
         bRXXIid/7skRpvjSN4Y+AevsGu5GubuIfoP411RmzFm7WlqayqPz8DNlQA1UDaAE1B3/
         9JbDFOP1V0iUrM+OTSGwT6//xpl7Ky9lT1KpDzLuMqIUZZI9sfQxluGSL7xWw9PgwgnN
         art99A76/snOTUN4xHc154KZuIN89Lp5NVbo+/h0o6BzX+DZXDUXjcumHjsmTjTVPJBm
         walg==
X-Gm-Message-State: APuU4Z/qmz8M9KZPjGTqFv+ywdYR96lsrS1rt1G3pANkbxs0tUlWqoPo
	hW2DGRI+a7uu5zkMUX0fyYVSv6sGBfklVdGumMnzapE5CJFoO8pD6zotqvXfL19a1J0wRA==
X-Gm-Gg: AYBFou1RlUX5s7iYG8q6LvHqUS7tZV/fWYUqVSxinv9uJwa06a6Q+WjBqDOgsioFkEg
	f6Yh7WbUCamgPCLO0Ds3Y1UKbHWCl8KxNoWkBk2J2AYoVo0FVIeMTqNopYGqrUb2dpZORV5hXQG
	LSxcV2z7Pz1Jmqvjb6StfVOPmCmCKHRjf2QrlOrR8n8F4NeCc8+ONW9Tt92Cqmt1V4jVs7TmgJS
	sXedfGved0qNlDzNHznUVoyUNJTs9TR0ODjzSrjTzm/X7JIWdajQxw67xDcUXiBVucV4BGWN47h
	y1TWqBJ5+Vfphv0QUeGGYPDCO97rhJceDFbMinSZ+ySwyhESk9My/0rcU4vV58cgYkAQ2Qnc+62
	h7KsLE+MsN2jvdzX2WOxuYJYFQz2h61YJ6rLsesXwaQJepoZhoWWUqofOmo5wJxnyFtAFWVRHDG
	GG2lrNDq33BQwlhNbzs6J/kcDLPAEz36vzM1q1VGk6sXaROgBdyE+Xnv9qmZKQgUg94sqXRW7qm
	mtjLOBBPnfFAiELKg6PBXdpXKDWx1kWE8eNj3haDl7uUITYECpc7eJpn2pvAX2NqExJJ7WxxIAi
	zjsgNwrez8mad5VGSmKXTCzD7eC88cQP5A3GJtCS5qIadRTMpZBm+nEln8V0S8BdXJapUssWNid
	U
X-Received: by 2002:a05:6000:992:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-49c71e3db14mr17535675f8f.33.1794785453654;
        Sun, 15 Nov 2026 15:30:53 -0800 (PST)
Received: from DOLFIUS (46.85-87-100.dynamic.clientes.euskaltel.es. [85.87.100.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm16787373f8f.16.2026.11.15.15.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:30:53 -0800 (PST)
From: Adolfo Morales Tena <spidermanadolfo@gmail.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Vijendar.Mukunda@amd.com
Cc: venkataprasad.potturu@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Adolfo Morales Tena <spidermanadolfo@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ
Date: Mon, 16 Nov 2026 00:29:42 +0100
Message-ID: <20261115232942.5820-1-spidermanadolfo@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GIGABYTE EAGLE 9MJ has a digital microphone connected to the
ACP6x PDM controller, but it is not listed in the quirk table. As a
result the machine driver does not register the sound card and the
internal microphone is unusable.

Add a DMI entry to enable the DMIC. With it, the acp6x card is
registered and the internal microphone records correctly. The kernel
log shows:

  acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI

Signed-off-by: Adolfo Morales Tena <spidermanadolfo@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e14c73e7e..f636b5ba5 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -969,6 +969,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A16 FA607NUQ"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GIGABYTE EAGLE 9MJ"),
+		}
+	},
 	{}
 };
 
-- 
2.56.0

