Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D4E56B9D
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261225; cv=none; b=JnwKC9d1ZwcL1hYUwDBqEkGmUgEhIfPcat4E1n3Q1KsZR3ZaKOGiC9rCYmzvGEK+k6LQHXiHwGN5NwaOdh+VvJxNmT9mMzfhQ0Y5ju1i58hdiEtIgXcX63FTE3zXfsW3zSBvzgDl8dr4DaG02Na/1cefNkJeRvwCKFYTKjbvACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261225; c=relaxed/simple;
	bh=D6kGYNZysg0RaY8IyWyzufy+fBgeCVljliqOIQedNdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qocRsccamSHyWJfg3r9BkrNix8+MKOwdrcILeX4hya9wURJwBcCnELFIYvA0LucYuKHLxICrV7zUwi6ZYJ5U6ivxityzCrXCMitKg6e9YYASCHvaxkPrTJN5csr+80ZJe1LeKKS/kLEUQ/8CVG6WPYwk9KDIaaM5LQVZP6dSStc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=KANM05Uy; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="KANM05Uy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710261221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRmjCAX5qNLZq4ciY8DnY2RwjFk3guqV0AGvFBVvAyo=;
	b=KANM05UyQnDYxh0FXfymN4oVbBA7CimtNNghJ9OketmPZyi25KmLlM+UJjFirt044/13In
	GgNYpZl3lVd0t7am29C8yDwxZ8Qbq/iuwTIT7M0esrnw0qQYwb1SIAVPcBLiXi43JfLkIJ
	6P4IfvkB1L2eKJGe3BQYMKhw1ySx7TlCT0YFSEFz3xEBKSWMzjWctECqDBXUpX7vvpl9Rn
	kRWz1/cSpKZvAzbZTDE9QLvutZlz+lZRqdxjxLCy1QDkJgzw8cIlFLYdFsjGMEwU8V9F7w
	aVBBSIsNx/2+dw5E9UmXixQOf0nGRp3Focp03SqSECOJ+k0hB1Z1zaRur0x+qg==
From: Jiawei Wang <me@jwang.link>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	me@jwang.link,
	sashal@kernel.org,
	vijendar.mukunda@amd.com
Subject: [PATCH v2 1/2] ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
Date: Wed, 13 Mar 2024 00:32:55 +0800
Message-Id: <20240312163256.886831-2-me@jwang.link>
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

This reverts commit ed00a6945dc32462c2d3744a3518d2316da66fcc,
which added a quirk entry to enable the Yellow Carp (YC)
driver for the Lenovo 21J2 laptop.

Although the microphone functioned with the YC driver, it
resulted in incorrect driver usage. The Lenovo 21J2 is not a
Yellow Carp platform, but a Pink Sardine platform, which
already has an upstreamed driver.

The microphone on the Lenovo 21J2 operates correctly with the
CONFIG_SND_SOC_AMD_PS flag enabled and does not require the
quirk entry. So this patch removes the quirk entry.

Thanks to Mukunda Vijendar [1] for pointing this out.

Link: https://lore.kernel.org/linux-sound/023092e1-689c-4b00-b93f-4092c3724fb6@amd.com/ [1]

Signed-off-by: Jiawei Wang <me@jwang.link>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 90360f8b3e81..1d1452c29ed0 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -199,13 +199,6 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
 		}
 	},
-	{
-		.driver_data = &acp6x_card,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "21J2"),
-		}
-	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

