Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A740864
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261232; cv=none; b=U7OzHRugBcCJTRZv9ABvUv93Vu8TsbHqqxAzC0vCBbQ44L3w8kaXixwNb86AaD7sy7KsZMTUAc3QQwex+vdkLaBsPrZattZ5MTRybvSgUQQPI5dZJ4ftJd9f0GF1T+nyWjHGjsPovfsa3zeKMo7df3g+6zjmuM8HtQm4MJgwL8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261232; c=relaxed/simple;
	bh=3S+ml9Q6wYDAd17jCHPrCumLNoYX/YCTLP2FSb8YSPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p1Js80jfA1Lvdm2gfLNhkOnBpH9RXCC3af+KO0JhdctafVPqOWYcTVeyOQE9uW3ouq8hMAdfsz2WmPsSlG8kMNSBIqk8ES/ufcCqFLCya0n9mYUuOLNAra6vc/YMt9Dc57xGqvCrBf5qTfLkx+eKl2FBb9VkdLnwmRxWok/3uoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=eS56V47t; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="eS56V47t"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710261228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujRJgU6f66VX27X6ZaO6EbWjKporwX3PrXShnhBOR40=;
	b=eS56V47tozupArKmFWWnprd1R6r/u2ocKxobHf/WsdlUbgPc8o1OLXE+52HenQHCtslEok
	jIZHE95aEYfBoD9/oS323Jw6wIvlkdz0Qq4o3BWWAVxAKSwO8vo6dHeeDBWKRw8huict7L
	DeldbsP6x0S+FK3bYOc0xP7zfVhpAVKFp088Juj+uHmjkFlovhNY1Dr6EnfGwBVyfh70PZ
	/wI1OM1VaKb1tumJw7erzPzlVYrYvY+H5k9evxViQfP9IjendE6gfxWxB/DsvR/E6NGiOR
	r7bRl6MQ/Lflx24J6JgqKktVAvyKDd0vsC40IYjCwJ5OhasBDWAmQCkKCSw0GA==
From: Jiawei Wang <me@jwang.link>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	me@jwang.link,
	sashal@kernel.org,
	vijendar.mukunda@amd.com
Subject: [PATCH v2 2/2] ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"
Date: Wed, 13 Mar 2024 00:32:56 +0800
Message-Id: <20240312163256.886831-3-me@jwang.link>
In-Reply-To: <20240312163256.886831-1-me@jwang.link>
References: <a9a4f09f-f38a-48c0-81dc-2796c6126e3e@sirena.org.uk>
 <20240312163256.886831-1-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This reverts commit 316a784839b21b122e1761cdca54677bb19a47fa,
that enabled Yellow Carp (YC) driver for PCI revision id 0x63.

Mukunda Vijendar [1] points out that revision 0x63 is Pink
Sardine platform, not Yellow Carp. The YC driver should not
be enabled for this platform. This patch prevents the YC
driver from being incorrectly enabled.

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

