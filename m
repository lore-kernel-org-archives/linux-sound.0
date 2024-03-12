Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9DA20E3
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 02:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710210840; cv=none; b=kfWZLSxjxI8cu6ZOOQ7j2yULFSnX7h4GKj0l2We7jFohfmavh1LD2QCNEXbWuF4EE/laL0+53nvIp9LmcrbTRYROkdIpHWhE2+dK3EiojVu42Ax7mv5ED5DNf/Zy+N+rG7pxerxSHpFP8Z+bi4Fr6pYTP1Xev1xv7qhZ3zz+kQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710210840; c=relaxed/simple;
	bh=9HfJZ1daIpI/qgLrY7OexiFHZFaY79TV2YQdm1yEh1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uzGrghOpcl1gyx19BOK02mkkrmEmSclEquEhLvSfmWYsPUCiTwmAfoocxrBAPXQnYI3UW16e2B3lsW50D4eARs9rgJUF5m9FIpVytP0hEEhRks5jCqKPLrlcjkcg+jfexfUMwpujeyfDZ9EjPHHc9cuU1Ksw7dAO7+OojPEeFT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=X/TGze0C; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="X/TGze0C"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710210836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baXpziilhDI+/LqGsygHqrlEoLt3IAOy2wsmkx3if08=;
	b=X/TGze0CNXL3oYmhvB3BVvMCaGjdBwg5Abn0yuj37eByddULxLWNyDwEBcow4ECs/ErpnX
	a6qCI0SKeNwS3outO7QlJjMCt6WoWQt6DUudJlpdKmBk2wyeiBHlDzGTXWi7LbOI2xfHpj
	sONiqWjNjkxB/6nNTgNDQ52uxlR841pNi2M198bgWuf9dvXtkBMc5gUJE3megal4XbvhDQ
	zTyayBg0hSdzgH3d1I3evnmCop5KxFfyp1BygBwYIKKw7jPH3xxgK2vZBrQOXAg292Vjvx
	z5o0BeI7fVjK1jFON96280ffN4RFuF6C0r6Lt1LZJSA5jsCCUZ+Xid0skw5ReQ==
From: Jiawei Wang <me@jwang.link>
To: Mark Brown <broonie@kernel.org>,
	Mukunda Vijendar <vijendar.mukunda@amd.com>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Jiawei Wang <me@jwang.link>
Subject: [PATCH 2/2] Revert "ASoC: amd: yc: add new YC platform variant (0x63) support"
Date: Tue, 12 Mar 2024 10:33:26 +0800
Message-Id: <20240312023326.224504-3-me@jwang.link>
In-Reply-To: <20240312023326.224504-1-me@jwang.link>
References: <20240312023326.224504-1-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This reverts commit 316a784839b21b122e1761cdca54677bb19a47fa.

PCI revision id 0x63 is the Pink Sardine (PS) platform, not Yellow
Carp (YC). Thanks to Mukunda Vijendar [1] for pointing out that.

Link: https://lore.kernel.org/linux-sound/023092e1-689c-4b00-b93f-4092c3724fb6@amd.com/ [1]

Signed-off-by: Jiawei Wang <me@jwang.link>
---
 sound/soc/amd/yc/pci-acp6x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 694b8e313902..7af6a349b1d4 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -162,7 +162,6 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	/* Yellow Carp device check */
 	switch (pci->revision) {
 	case 0x60:
-	case 0x63:
 	case 0x6f:
 		break;
 	default:
-- 
2.39.2

