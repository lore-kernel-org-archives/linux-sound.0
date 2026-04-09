Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B63AB294;
	Thu,  9 Apr 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742760; cv=none; b=lom152gPxwPNNw1E8VrsVuvtn9XWGY5frpp0u9m3SLe6SlKBvEuK4xvJ9+B8It+CWrL3kTYPos5JrRyODWAEEgiOxnBAV4qrJ3RNuig8mhgBqm1RNaCQA5ei6uuVtFj/PAdi4tPkb9U7s9r6V7FCf6IwMApBa1bVY9EYrUCQeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742760; c=relaxed/simple;
	bh=IW+L+AK1hiVnwzxfTRYWWANDieq9krU23OvmtNYGWsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GnyVDSoOQXdMBChjDc5rj0l65lnm52eAQS5VNTuw4rOPqGcfa7iIPxeURfj2I+P4jdKSjGSVVV892cGR74JrYYkx/3OTN5DEeOslqTm5D27PqqRWhZ0U1es5Zw8dbqJhssA0gHptI5WNS02+HZxNP8kzpAKs4jNqzJXDQpLLBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=kqJCAeEr; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="kqJCAeEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rj
	adzI/Zuc0HPYdHcqb7C3/H7Bb7GGT4QJOmWQm9lT4=; b=kqJCAeEr6y0KfbOwzs
	2Ufnt2eLZgBrLG9jYhZ8r/qwS4UNRaLDzFYpB+u1CTt9yT4FwJpO5NqBVdIz401e
	8X/nU5HoS4r3QnvAROxGzIYGN7ME9/7VdG3NwQ0+bcu5QqrI1kVI24tcobaU5uOf
	6swIm/tVtkSI1cP3nnka7pE4E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3V94Qr9dpt8U7BA--.13834S2;
	Thu, 09 Apr 2026 21:52:18 +0800 (CST)
From: Qinghua Zhao <zqh1630@126.com>
To: linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Qinghua Zhao <zqh1630@126.com>
Subject: [PATCH] sound/soc/tegra: Fix spelling error 'recieved' -> 'received'
Date: Thu,  9 Apr 2026 21:52:13 +0800
Message-Id: <20260409135213.16558-1-zqh1630@126.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3V94Qr9dpt8U7BA--.13834S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw45Gw4UWr1rAF13Xr4rGrg_yoWxAFcEkw
	48Ww48W34Fkr4avan8AwsFyrWjvw43ur48G3yYyFy7C34UWF1Sya48Ww4v9rsxWan7JFyF
	q34qgrWYyrW3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRu4EEPUUUUU==
X-CM-SenderInfo: p2tkilitq6ij2wof0z/xtbBrBJAtmnXrxJKagAA3r

Fix typo in comment where 'recieved' should be 'received'.

Signed-off-by: Qinghua Zhao <zqh1630@126.com>
---
 sound/soc/tegra/tegra20_spdif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index ff4b79e20..26ab8d5c7 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -171,7 +171,7 @@
 
 /*
  * RX channel block data receive status:
- * 0=entire block not recieved yet.
+ * 0=entire block not received yet.
  * 1=received entire block of channel status,
  */
 #define TEGRA20_SPDIF_STATUS_IS_C				(1 << 21)
-- 
2.40.1

