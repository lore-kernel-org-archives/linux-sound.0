Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29512D94BE
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545179; cv=none; b=IMMPzDrr4I0wmiBK0vwZo0gcD4WU3zW+Z0MS4yQEqnRcsNbs3MNM3XhVqqTinKn8TPBm2Eqxw9QNQRzNNtu5yvCVNzwfRuxNAs70X7jA4RnJA5OaVJqSrwhCa+RNSSOaJR0CmbklnYIMVsiVhXQPfl8WKuNOCchyUPg9g8RgLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545179; c=relaxed/simple;
	bh=NkM5OOy0ytkuYdLV31rIkddcp0KAU5XfIo38O7mQLp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JYb05t7DOUoI0SDd+Yxq0JfM6r43XILXspFuiz8QyVrZxCSC+UtvBGFUu3x7aHKDuTcB2qQ68YB2b6jcTrekeFxLw4z/0Y4+61yAkMeld+HD9FTOXkCJg7o3fZygR+eyRtIXI/Z6g7RVHheKZrt8AEfs+BsAIt9NX+iAIbDcJH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhN0Udah; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhN0Udah"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-292322d10feso35579045ad.0
        for <linux-sound@vger.kernel.org>; Sun, 26 Oct 2025 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761545177; x=1762149977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awSfWJCX4NOY9wrF+e8kbd/fw7N/jjAHRA0gUFKf03w=;
        b=UhN0UdahpzrrAPhmvLivbhqb5qh3PL+X//OdV8ST4M+LYgORcTORh3+5sbxuafLuR5
         hLx4HuMWwkC5AltIB1R4B/tIkBCeiqoIA6oNmPpmi1BO2z4BlXwLwH/iwMN6JysbSdcf
         RdopUzLcfdKRBh0YuZNxzTInMFK+eVq+vWwszZ9EmbsPK/lq6NlVe7EG1HS8CcQ9bj5y
         zSR6XfHRSX80+eq81WVhrHJCLiYIOLdsmlsPij69C0MLg7lPS1t+hF8ajmujC936JB1A
         hJfc9pU7ldtLzrFlX/poKU8JLTJTfzFP8eyAGkFSNsYltLOhHbML8alI3sJhxAbhTBrQ
         Ydew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761545177; x=1762149977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awSfWJCX4NOY9wrF+e8kbd/fw7N/jjAHRA0gUFKf03w=;
        b=jlEO4xJgW1Z0sWdmnO5IfydMtCcdDzSnVm0INzrOp4sFnr56bi3OorMyS8DhR27gSE
         ONPKW/zUJlDJBW/hA2iEsajMvIbabi1u7gb2DqN9d8mDI+YbzKk6idpxlyGxp1PuEnuR
         tA+ctOWuiFpZZgiIcXKONjuxIkt7rVf4ZZB8cmJNFdRd72s+huWJuZ8aMMJwfRy5eYjw
         BTomBs477AP79TsG2RsqEYhcVzeCfhKU8RWom8UVmYCd22nKp+ynKAr3a1zrDbw9WaEL
         6ljRGInt3q44jq6EkNx5WDieyV/Hnsjabo8aV4VoqeBsOSc2FUZZRWXJXKVjSg0ORTNB
         qa1A==
X-Forwarded-Encrypted: i=1; AJvYcCX4qqlcFrxdQDauN1jNkoFsttfKa9EZy4mePORXys+ncOYtDAb21ezhEzqg+NgPcTSU1jvJT7V8pTrJuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgtP6jYcChq9PuG96S4snMnhFpXGfPuMjbXqtHzMxN/TXWpGi3
	E9ltG38Axen8wsgUnEBXXgqVyYeDq3AesKsnN5YA3Tw6D1fdPqm4S9pS
X-Gm-Gg: ASbGncshOnTB0+/MlfF/oRTQliIKRn8SfArsj553qCDUueXZeH/wcWtVdbd+mgDZYmv
	tmiMUKsUj97pQanlAVSBqDB8kRoeibJdf4HRNInjONqfMDI2iENC9eITnDgsiAnLvwb3JXASagN
	KSfLX7XSXtoRc7DnQ6tfUty/UpM49Q7W0Ij4axG7dgFAIPZf7dbvMw1PVJiOSBv/o1Q5nkBwyf+
	HqYz6zGqu+Jt9HuJ8Fd/Kpb9ivLTBJOL7SkV0WpZrdnHuPquT1Z9PTY75nPHiOoIU1R+iTnsULj
	EzT1+TQKIc7KoNqw1U1TkTcD0K1OI9nqhe+fWGbrcOBZDKA8+41+aRmEzsOYCgEDyWo30KKxqwD
	4h9gUq1oCyob6ATBMt2htOGr/1/LBXef7XETnFSI3jqZhZgd7C8E0t7cUD+vZZpUjVpOly261Yk
	hrQxe4cuEqllA5HUDW657H5A==
X-Google-Smtp-Source: AGHT+IGGfNR3pDzrLXsRHQ0DtnR/zCDD6PytEF/eEQoukh39nKst0A1lb0nK6x8BAecxfbckIr0K+g==
X-Received: by 2002:a17:902:ce81:b0:294:8c99:f318 with SMTP id d9443c01a7336-2948c99f5d2mr159955775ad.3.1761545176998;
        Sun, 26 Oct 2025 23:06:16 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498e495e8sm67837735ad.110.2025.10.26.23.06.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Oct 2025 23:06:16 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
Date: Mon, 27 Oct 2025 14:06:01 +0800
Message-Id: <20251027060601.33228-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
internally uses device_find_child() to obtain a device reference.
According to the device_find_child() documentation,
the caller must drop the reference with put_device() after use.

Found via static analysis and this is similar to commit 4e65bda8273c
("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 4fb66986cc22..cd40ab839c54 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1241,6 +1241,7 @@ static void qcom_slim_ngd_notify_slaves(struct qcom_slim_ngd_ctrl *ctrl)
 
 		if (slim_get_logical_addr(sbdev))
 			dev_err(ctrl->dev, "Failed to get logical address\n");
+		put_device(&sbdev->dev);
 	}
 }
 
-- 
2.39.5 (Apple Git-154)

