Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF82166F26
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262191; cv=none; b=QsNnUSHcABLj9KH6r/4mkfdZkJPdEeyhQQBf3YvseQmEjNDAcGTLk67Yw5krAAFeZdoC8uVaR6sSH6LAs1qnsNUN8YTLgErTRsT6uPrwgHNMxAzn36QJgc2moAgct3Gwp8aPEN56nsNLIceoP4GGOtXtaokUWV5iFgFdMTnWTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262191; c=relaxed/simple;
	bh=dKnEPzRPkPv1PInFU2ihqveciu/47m0rpEpf9TBOUAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q88gKsnD8ZTdQWhfrbXKixB7yfWSOjQ5iXdLKfQGZJ0VhRmTokjWbs6pTO4vqW866DF9wXIRpNrpHO9dC+S1Kupk6ZJkt7lLsBm9iDwyVVxBHyFJEb+0h/MtVLUVp93eFQrm+eE0bukbNd5UQeKx86VB0nGetHwcBmljFlN4HKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=RcEbZWSA; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="RcEbZWSA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	In-Reply-To:References; bh=uomuo3txwGoj0+Skmohlm6AH5YpzLoDvTrrIxWKveCw=; b=Rc
	EbZWSAM/SP9yasp5msoJ5GgqiADF+RQlLpJgjTFYW86ZfMldm1J4A0wvZbZGQdczr3hWn4rpiL5oW
	MVq6RhryTEn249RmBpamLS44ZsqGlUBBT34R5VoPW2899yQHeTHp33WIqB7aFO1ca2sY/UUyqJrkQ
	kNUwsHayl44eA09Yu98unmbxMHb1zeZuEWBr1tf9Mc4SvQENcbqlU5REWNKEWyZJeWE38nBP88xZi
	MQzcibN6xAyjxQpLniI4AeX/g3vtSta6t+F6jivw2N9OT5wNu9DGVNoXpeo+lDMfFxHd1WDkqUl3W
	c44PrDv48DpsBSRLfEl2LFGgAIB3+NRA==;
Received: from ukleinek by master.debian.org with local (Exim 4.94.2)
	(envelope-from <ukleinek@master.debian.org>)
	id 1tEOWa-007PvB-Qi; Fri, 22 Nov 2024 07:56:20 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: 1087673@bugs.debian.org,
	Tova <blueaddagio@laposte.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jiawei Wang <me@jwang.link>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add quirk for microphone on Lenovo Thinkpad T14s Gen 6 21M1CTO1WW
Date: Fri, 22 Nov 2024 08:56:05 +0100
Message-ID: <20241122075606.213132-2-ukleinek@debian.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=ukleinek@debian.org; h=from:subject; bh=dKnEPzRPkPv1PInFU2ihqveciu/47m0rpEpf9TBOUAc=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBnQDkWNy+FGfudXqwHoCwsRT9kPpsltOxxAmOtm 85s9CWd3T+JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0A5FgAKCRCPgPtYfRL+ TlbXB/jMGjZPE2kSbtoVis1pvDKnP8eOE1JJyr1EdT2eWm1qG+si9pPxXLah6mX43dI3Z0dgiNz rPFCGDRDzfbnZJl8IqW6wY8j/Iw8wle5KkD/7JbvGDVHYeaB59A1MiX6QH+TJgR+blDkXy0Zdlk 2auqKJMstzEWlgAcIoI1O2w38Oy63DrJHRxzOsa55mXzCv/Jh9AYEqC+WIcG1mIJp7ZbkCf95sq BHoRQ5bQtLjvMtKZgtj/rV4DjXCcOncsoz30AyFvfGkDHpE84DwS52X/XvCfC8OcqomL23FIBWy me00TL7q0gNJRdIMaF9wShZOxkpBqxgkfJZ+xOqlDRnwSzw=
X-Developer-Key: i=ukleinek@debian.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Add a quirk for Tova's Lenovo Thinkpad T14s with product name 21M1.

Suggested-by: Tova <blueaddagio@laposte.net>
Link: https://bugs.debian.org/1087673
Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1b9834ee5d46..6439c175552a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -220,6 +220,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21M1"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

base-commit: cfba9f07a1d6aeca38f47f1f472cfb0ba133d341
-- 
2.45.2

