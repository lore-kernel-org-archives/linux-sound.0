Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE2934EF02
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839554; cv=none; b=lbrFEmjTrr17JW61+MnqRfagzFCNZZZ1SRF6Mzip9hAWsQ8BnDstaONYIYxmX/nW6ZdAAQmvkk/b68uc2DtPalTd2DHkecB1zzJcRhZgEpQxbx7Lydv6I+DTV2CoB4TXg9/2cCwRzjgulSUqpsAYgcf5Qqf58p/sc59/SXtDBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839554; c=relaxed/simple;
	bh=22g9IHd8MbqNZ/zr12muTqPn97dN/XGlfHhk6i+rqUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FS1HbDUmBQqrdAr+1hf83N1lz+i9qzXHd1CEUZQrKj+7Hv/NRMJZGpWBQDmDAJ5mU6mbqFV0DOw8Rt5ElQUTNO3bWWv1wa7KcTxvkhuQsmYhag4gQFosnbzpepIZoGkLIm2MvSJ7t+ExjZnzM7eVV97MwWCdHS1mP2kmH2IFdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2sMFQtC; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2sMFQtC"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824af5e5c81so3914647b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 01:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771839552; x=1772444352; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYTgRFrukUXwZIV4VFCTpBL82Bk2TIngU/MKatYVmUM=;
        b=d2sMFQtCoQJBomprls4q04xi1xFu1N/o42WIuxHs/LDdjGb7ZtKugSxexogU/iXOK4
         al4l4R0c0S/IjfAqZR7JcpG8l6pFsuqQZbSSRji99eJqNWMvwKdG2XSqvj78I2Li53zU
         1svSpbphEQys+tCQFHQwHOkSgN+wz57pU/5CjYnfacZjRoiOxrbPnBv5cxMdMQfkxhfv
         GBHWVQ9+cttFV515A9ALpo6JxEidYzPuEK//QmyAg/ewuPRExCDerjYIpK0pzBkBjcgs
         /3ekycj52iIUE4Bbki3jRD4uop2XzJhs2QKqC54Eiu/DOpqwxN0gDU+mkFhOCaYT1cA9
         8e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839552; x=1772444352;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYTgRFrukUXwZIV4VFCTpBL82Bk2TIngU/MKatYVmUM=;
        b=CJoG22lBF/r7qsbnXESqoRGI4WxbuEZweBE9KYLIp4dghC+MUtVV0iaAvV1f78pZkP
         EX9uOGPSrM+tRCiVG5zJPJQhuA/C4SRD7KW2ZTJ3QQkbezgLFEHrpWveMTe5yj8oicQr
         tG8WX/5sOuihGfervZFjFWRpohYjjSS+qKkhisW/2d6s7Q7K8fsWPIk9/qDO8rWlaFkH
         7h4Lk58GXjONyjAeokg9lbziszKBItw6WnZgiKW+zzjLCgCgAYYS5NmMI4smJeQmoFjA
         uDlJVOg2e824uR4kFOeHi2zp+eOkCzVvUGd70sKELhzsE7Mbk5ZJPFQ80QDoTEQxq13v
         tU1A==
X-Gm-Message-State: AOJu0YwypTJrSUO4sZ0z7Ptwb4ZYRXA+y73DLlENcC7Y9ZwBGKoQTEpt
	c/MSRu2LXVJBIGdiO/OVW5gTMfRfS1ByP4/JwLFCUNESWeHSTyII/LbjXXXqRhcJ
X-Gm-Gg: AZuq6aLA4GQZJTc3N3iqDe66vN38WCCnBkTmG4Dgj3Q1aBDJAED6tvQdMcLof1C+UmH
	tZ90qq/DEz+dj+3wZqqE/LdQjxE+wwzYdXjb9DY1Tql8iGrKyuVyVSMfUdcwBLTZh+ThrRRl4SW
	hEp9OvY9eKbfFsySHkl4diqaD0bnzyAvt0Z6YYeBPzlVHCVqQv4LDu3WPO5Y8W2Pj9D5OEQ0ysj
	Xa4+s1hRmGZJVQ/q/h2fg93r0alSLcUaVTFDP2f9PbhFUOJpIBu9GdRZNyBdM1Osk1Hjhp/KZjD
	h6zUKdc940CNo5a/Z2aWJ8ahh3b4Uf2YhVQmd7xBPfNiPgfq+a5iN5A9mD8pz6wTEJeY+05HHcV
	fDXt2l3LYBH0GVcV7GKSoFcB7bUCgSd49nCCz8ifwHq438rAgeQeTHwUJ1BTqVb7ejoqjjW2OwE
	0RFM+MOqzN1kVUAFTwS1yhgH2ZO68gi28RCBTJh95nZxm8vfAb
X-Received: by 2002:a05:6a00:3a1d:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-826da709249mr7880573b3a.0.1771839552364;
        Mon, 23 Feb 2026 01:39:12 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:1cfe:ae34:fdd6:6b97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd694eecsm6778053b3a.25.2026.02.23.01.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:39:12 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Feb 2026 17:39:07 +0800
Subject: [PATCH] pinctrl: cirrus: cs42l43: Fix double-put in
 cs42l43_pin_probe()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-cs42-v1-1-431b01a6f537@gmail.com>
X-B4-Tracking: v=1; b=H4sIADognGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3eRiEyNdQyMTE1MTC1NDsyQDJaDSgqLUtMwKsDHRsbW1ANjgtD5
 WAAAA
X-Change-ID: 20260223-cs42-1244548516b0
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771839549; l=1078;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=22g9IHd8MbqNZ/zr12muTqPn97dN/XGlfHhk6i+rqUE=;
 b=8WHsXEzaVMTmDj2uMjMZGSI4dc9xqerMg6zQzkGPGVvtglNhuH4dsu+uj16RLJn/wMnd2QKZZ
 mR8ljkPzNppBC2sYLuDURUr7AgKoJoUoTAKSnd9lR0Aevtlb1EWhORr
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

devm_add_action_or_reset() already invokes the action on failure,
so the explicit put causes a double-put.

Fixes: 9b07cdf86a0b ("pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index a8f82104a384..227c37c360e1 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -574,10 +574,9 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 		if (child) {
 			ret = devm_add_action_or_reset(&pdev->dev,
 				cs42l43_fwnode_put, child);
-			if (ret) {
-				fwnode_handle_put(child);
+			if (ret)
 				return ret;
-			}
+
 			if (!child->dev)
 				child->dev = priv->dev;
 			fwnode = child;

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-cs42-1244548516b0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

