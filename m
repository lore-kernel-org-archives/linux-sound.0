Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869252EB5DF
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074867; cv=none; b=d9TyC4HnlEd8FOQ6eubFi8Mff9Y5IqaAEqsaBVou4bRzmK0Hd72U3ExPZhmZp8Fk+U+iEhsKugW3NaSqWOTgiyY+MTEV+prCcgJOyma5otWglgtCyd/NvKQs+uXOG/3hizJQxRFvl15MY7DLAqLzaYp4ZtYx3e9SJRnWGAUUIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074867; c=relaxed/simple;
	bh=ddclz8Y4tyEeomH+WWsEabbA3+O6bU2+U3UDS2VzqMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvLNBaDRh+hviWnTuKroBGvVujL9ksvGXsyubUbfnxzqsmoloPBcVkqjF8AcWq48R3WhP6BWLPp9nbABI4EXGEO6i37GprqQrbaIVHgugdkAxngv/QajdwX4D9D3DUWSmnG7oHpG85MqtvLYSYTKAuzyLj3mOUdPfZjPrReQq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUzBoQTd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUzBoQTd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e62619afso361884f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074864; x=1750679664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fktTiKLJcxcAabt7Z2x0w+wHenPcFx1mmVYaf7lNKSs=;
        b=EUzBoQTdIIPbdL1WA9EYfhppuxlQE0ALYUZgPyvyZOo4FCmckrnqgAtEGyXoGqd8ZI
         7x+YmMNDPD3jVakDpT4w/4Q8paPLVzsjn5RPhR4tiPiOcjxLI69BwzJ+pVYsOV/0bctO
         BmYMyWYfW4OCMY0LUaCakfTqjARLB+Ri2qnzIMlK5VCAsaUcaIYOaKGgR4wA4+VBEtqI
         CgHJQj6j6Y4mieU6M34hPLGxc8ImEy5b4w6W5cY4JI9Mt2SrY45yCqoBgAFBqlId+hBe
         pC1o9N159migCiGK60NMq36kUOvYRHLiYA+a+v7wxM+5/qYfXUelRt1el/IHzXMVKYVc
         PSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074864; x=1750679664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fktTiKLJcxcAabt7Z2x0w+wHenPcFx1mmVYaf7lNKSs=;
        b=K/9cBLdJ/lMzYXaYyeiMHq9sISEvaBnNWcYEEutCXHZ4mY/kCyuy5GTphmLeZh0z1s
         u/wrmWfHZhP70wailY9vAJwRBZXPl7VJQrEEAusBaWLhDrftKpdUrna5Fo5Fprtz9oxX
         Xwu3AhhA2o38WD+UTDozeqe3jnsP33AMvtCweH2YPmuzDZypIvTjZ8nBE0tGvMtkI22+
         eWDyOT9jv8fM7S8ZTK/8WTldI/2tynUZZN43pB+8BLXTp3tzxHIGgmHt3RJI683i8F69
         NMEL2/XL7qnFlC3/oA5+csswQ190eicMd1TpDrkf6mt4gQSw5j50S+heNsmvcZOLKKZz
         ibQg==
X-Gm-Message-State: AOJu0YxAABNDu06SD1q/N7dstpxoQhJqW4FFq24CFAJUam5KLogeSdix
	qN7xwaZwdP8FfI6mh/pS2PAEtNpND4ronEPffABxdv5hkH3PAl6O1yd20BYLWOR70pM=
X-Gm-Gg: ASbGncuYjrbSFBevYn8r0lJ2+uQJZ4v9Q/9czUEwsARnyZPyRajR8QjMTGjwqOvI+dn
	EVqjAgIslKRWqqbK3jKx2Zha8qNMkpG4vH66Mg9MTPi1/YuYLVCmfuMXXXPGd614WMrO6PgU3BK
	SxVvpOvHP7B44UnZgYJie/Ia3iDCVenl1JVbCzEXCwi4EDSMVidiSbQNXY9a4C5cvnP+G9L0H7w
	v9/zOOpAgbn2W4pZLwDqkoIjShUnpCIlGVI/P25URxqhTUWY9u/bZOYZXUQeyJJYc0dJf1gN8j0
	MHqG81f862XBbqg1q4qQuUHalclGcSxBIcvISETS1X9j4DpRNiDJv+syCDn/a4EeNCQmPnCMX4V
	4dgMsVsg=
X-Google-Smtp-Source: AGHT+IFu5UZoYZbMgPHu5hESmLw4B9k4Utb2s+bTUbe+a2wXFn7qit0ncmJKeYKcClMQRSCfizYTsA==
X-Received: by 2002:a05:6000:2207:b0:3a4:def8:1465 with SMTP id ffacd0b85a97d-3a5723ab6d3mr2358052f8f.9.1750074863756;
        Mon, 16 Jun 2025 04:54:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm73485315e9.35.2025.06.16.04.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:54:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 16 Jun 2025 13:54:11 +0200
Subject: [PATCH 4/4] ASoC: codecs: wcd939x: Add defines for major/minor
 version decoding
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-asoc-wcd93xx-enum-v1-4-a20a1b538509@linaro.org>
References: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
In-Reply-To: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ddclz8Y4tyEeomH+WWsEabbA3+O6bU2+U3UDS2VzqMw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUAXnVMtL7cm+NvV9zHJndqRa6XP/wwXYcWL4j
 CsswTFi+jOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFAF5wAKCRDBN2bmhouD
 1xQzD/9y1KbbWGk0FP235eMwYiaIgIv18PnU+8oI3TVbRkklt1utnwXfX8YgoKICdzJVtz+OmeA
 XX5oy22ITZobBBcE4A+FZ2a9L4L6IbyOQD09yCYB4zi3Qvg8qNNEkz/IqT9uA8Yh5rC+21sTBuq
 qPnRIvQXJZf5maGTk9Hw/tfBFHR/8SUYKGDawam6d4QNhoD8pVjP7tFKIN99vk/Qj9TvTEi2bag
 GzgDjVgXqrJphEkpG5PxOLk2+rzNfiQZnQ+ZOzJj864v2OO+QVv8Q0zNtPdA2iSC8J6hTicKJtj
 Mi0vhYIDvnpifIiXD7xa+5xH2bwCzbzh+QoNttcTA+lSVMN9EEQfliw99PrWd6axmMRDZkAm4NQ
 592KLRFI5DKrYk9J3Aef0WJFq+qOBuehcTY149VcQSnOAW5oLCCdnDyqpNG20yPIer65uP6kVmd
 ZB9p4lhx6CGkejVknx91rgUeZEV/tQ66mV7TnBZOvn+D3QVkYiq/SA4W9icvkOU37+P2fJ1UhjT
 ViN85yXoJmh3D2RnHA218ZrKepNsiHBlDPg6RZ8RuSkgGMkECDJb4O5DYZkW5SXcPfehLzDGfmK
 BZYa8C1ZzGPdLISCTxs8cuvD9911eWlH/JTUGdUUdLzGPus1vpXtLEV8xOp1ym4kWc+5tHEuy03
 gJStJwISFvzikPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace hard-coded register values with defines for checking major and
minor versions of device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 7ec751a6cd2610dd3c4eb2bb6556e8700b62427c..64f082e474c1d404699e304743ed1ada3481effb 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -39,6 +39,11 @@
 #define CHIPID_WCD9390			0x0
 #define CHIPID_WCD9395			0x5
 
+/* Version major: 1.x */
+#define CHIPID_WCD939X_VER_MAJOR_1	0x0
+/* Version minor: x.1 */
+#define CHIPID_WCD939X_VER_MINOR_1	0x3
+
 enum {
 	WCD939X_VERSION_1_0 = 0,
 	WCD939X_VERSION_1_1,
@@ -3449,8 +3454,8 @@ static int wcd939x_bind(struct device *dev)
 	regmap_read(wcd939x->regmap, WCD939X_DIGITAL_CHIP_ID1, &id1);
 	regmap_read(wcd939x->regmap, WCD939X_EAR_STATUS_REG_1, &status1);
 
-	if (id1 == 0)
-		version = ((status1 & 0x3) ? WCD939X_VERSION_1_1 : WCD939X_VERSION_1_0);
+	if (id1 == CHIPID_WCD939X_VER_MAJOR_1)
+		version = ((status1 & CHIPID_WCD939X_VER_MINOR_1) ? WCD939X_VERSION_1_1 : WCD939X_VERSION_1_0);
 	else
 		version = WCD939X_VERSION_2_0;
 

-- 
2.45.2

