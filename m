Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2C175A68
	for <linux-sound@vger.kernel.org>; Sun, 22 Mar 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774183623; cv=none; b=PrMC/MDJPUgwQCL+Bcn1m0zvamCI+gIEbTARMXNrkdMG+TXSXetrwxFmJt7wW41G4SZxBBOp5q5Lq1+Z6g+pLiv1zhOZoPyUG//OnfjzBhCz1IvRk0Ng14TRa41GHAImcwWDFDkNSwUyzKrOxxDWGmFtNjCxUGaQFhcjOrlr7IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774183623; c=relaxed/simple;
	bh=50JNzxwjge3SlQnhz2OGVSvAOejRPyUbNxE8hYK0AvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcBYotSMUlivikw0JvGM10H1GQw759EzCaniDDSseho9x5AHgbhLr4ASxmAHI+CB28J4izKYbOyiy6GNKwd3L4H1TDj2sU3clABc3ZS5KvPqVIYiB5AzJRIeTZ+le6t01LknoloNPkERyogPXZ6Z3u8OCUOJW3olxZehS/RjkUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fc/n6i9i; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fc/n6i9i"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b062069f80so13914085ad.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Mar 2026 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774183622; x=1774788422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhW0E6zJW/PvCvxzaxQdz9AUp9KNCHp/bbkiFagS0kE=;
        b=Fc/n6i9iSkCkIgoyEHhdQWM0KLaUz1L0ikwwv3hHYXjhMBxHBQuGvCNCVpITWRusi2
         j02UZzLmVtfxXblUbm0HBhkHHTu1Z7fR6DRkIfpIzvlWImBwG6CAsZ0Lv0g4KPRVJT3G
         O/EpeM2+1qI5ArDFkiHbbBrzKTDFWOV7sMpgXZ2YCyweZ5ua5ETTnW4LY6ymJWqmoHV+
         JLzXIo2yWVj30UibxiObCPX3SNWvIUSKcH+tTm1wpsSuLJ0MBls3qlz2nb67U+wKDzlF
         puj3YkaxA90ymRXj6Betw4XQYMQEq0c/C2XiqBzRv/HecOTlVvwn6aW6xu3d5wNZabHr
         rgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774183622; x=1774788422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhW0E6zJW/PvCvxzaxQdz9AUp9KNCHp/bbkiFagS0kE=;
        b=Nu1NU19/sr6LoZieUcM32BGlJq5GQ2a51YnT2MS1I9phLfqXndMtBaI/rhD0wYrxAr
         sKIiG07/rN/CSo/oxe/XIz7t4N2T3ynwmfFhReT8ntK5Tx8pTtDlpG3xsFua6h9q4YTk
         FvYm1k7b+bnPo7q/5vAo+ZSByEi6AguqLVXVa4Rukbh7RriZkeIIO7AVVZQRAmn2J9eY
         9JenjXg+gwtB1d+Zr4CPuHtqe11XKf1ezHV3xKfezYMkcS0LPq7V7gpkkFMWPnuzk88W
         Q+nm4OoBpWMGOl0eBzGH6kwtJZ2e4DTPmaWdUZ3WRW2FuiQmZ/IPcLc5HsiK4PV0087p
         x4CA==
X-Forwarded-Encrypted: i=1; AJvYcCX/h/R/krRTbOLPvIwKX0MLIn2bqCBu+ncDBKcJZDQDgKOeb5jAF0QnKw5CYbAsptsVmLEI2xOeWfZApw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+lNBVdWOMe0gknI7+GfLqbjJhvCLhq1b6Z8n0H79rR1m4Oa5g
	Rw4Yrn2o3TGPvS/ip4qlCc4FbAZcGRX0E1ivDGrZa41DA2V/ObIalZIW
X-Gm-Gg: ATEYQzw9nWX8c/s7STKstg04gNa9zIE7tjQiDaNBEVE85w78n8kpHwtC2HDm0iZ9/OG
	eSPePPCOaQLY9fv5VI+pDlyJacZiZ21ljfiR87TSuEUO3ZyUlrbRoUba6NtoteI6/xDuKEOoCsB
	HiaBOdxOnAhwEid1mL1ulxbRONZ5HMOnmshxHyivnwA8EY6bItm2VenEa2WxcwQ9rHsl1aRkVQI
	CTZcMFb7qbMtbtfgKvPI3O7H9/JX5Bm7eRTIJ13onoYWjazP5IVKsLGd5kLbVtkT75v3N5d2gOq
	mplJ448bmYzpO+gT5/O254K5nfBTm2J37Hcq1erOVERhWbINQ0WZT2/8zh4qZr8Ccqr6NZ5g7my
	VcVx2faQNjFd1UxTcpxkU1EuFFHEC95slJ8XWZXyB8A/KqWFz9thQEV6OcgkVAMCK+tPZ+E22Sq
	oPVLj+wgLNMSL6C/BbAKlNb27KPw==
X-Received: by 2002:a17:902:e811:b0:2ae:6d9e:ed57 with SMTP id d9443c01a7336-2b0827393efmr86776685ad.21.1774183621741;
        Sun, 22 Mar 2026 05:47:01 -0700 (PDT)
Received: from ubuntu.. ([152.58.129.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655474sm99107885ad.48.2026.03.22.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:47:01 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: srini@kernel.org
Cc: gregkh@linuxfoundation.org,
	vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] slimbus: qcom-ngd: fix NULL pointer dereference in qcom_slim_ngd_xfer_msg()
Date: Sun, 22 Mar 2026 12:46:47 +0000
Message-ID: <20260322124647.4246-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

txn->msg is dereferenced without a prior NULL check in
qcom_slim_ngd_xfer_msg(), which may lead to a NULL pointer
dereference.

Although current callers initialize txn->msg, add a defensive
check to prevent potential crashes if a NULL pointer is passed.

Fixes: 917809e2280bb ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..241f5e08b582 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -805,6 +805,9 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	if (txn->dt == SLIM_MSG_DEST_ENUMADDR)
 		return -EPROTONOSUPPORT;
 
+	if (!txn->msg)
+		return -EINVAL;
+
 	if (txn->msg->num_bytes > SLIM_MSGQ_BUF_LEN ||
 			txn->rl > SLIM_MSGQ_BUF_LEN) {
 		dev_err(ctrl->dev, "msg exceeds HW limit\n");
-- 
2.43.0

