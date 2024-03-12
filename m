Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9720E3
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 02:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710210837; cv=none; b=ms+AiNaQTUlG37Xusd0QCebZrGFLJDuO8yHRDHCimbXdYhqquv3dghmyCMRPq8cO5/QBc7HJLtKRdiPLaaV8C2yK0Stt405dBnFw9OXUodwmOei7jwhBvJZrjMb+WgXjbHUjlQP/NsUTlmq26NPmce++KHLN+BQH23KkX9HQCt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710210837; c=relaxed/simple;
	bh=J/JUmNwfN92wfs+dIAJeqn+xIhTmfQkvJz0bhIYjdVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W19qnsjfv4iOYdFKj91M6b6zEz/grRjBqb6KRFXBV8t0smFBJ4oJDZD0pxydKXjKW8ea3Ito6VMFF1OlXEWm3KblQu5vP4Yf6N7cW9Iknj2gxbNFbymSPkGaNBaUDvpMhqFxcXDz/NPdQddB00EU65zlc5kz+IP4CPgi+VGqFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=LXv3wYNV; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="LXv3wYNV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710210834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZkDq9raheeUSEAaw4u1wntV7oriTtNp5pYXmxxsRNs=;
	b=LXv3wYNVz+s00cRlwQsZ9I5+yA5GS5yWbvIgL3+0RxCqBzFkGxXwLQi+qP8HhjqfkCfjZN
	Z29lrnoQ5G0eAG/9P6hkuBKxaq7x1xOIjLJgINple64yC4ZhXbNaE4/ZnsRU+apWVYRR01
	50XWqi6A1WLD8TLUKyLKMkEQe4j6Azcltxi0tdJWeHIc2DAiNJTAH0zXmS1omtH6hFxcx9
	fF6hpKRN5ee0/XBo6T4rDOiRXG8jHDwZsldrN1+Q8j0mc+e/sxYNfPcXg7g17MCnYsvLG/
	aHu09q6QtLqawwDjZr94aWRqKviAODL8SO+hl3NgCrsz5OyLYaE35ZuhD9QsWw==
From: Jiawei Wang <me@jwang.link>
To: Mark Brown <broonie@kernel.org>,
	Mukunda Vijendar <vijendar.mukunda@amd.com>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Jiawei Wang <me@jwang.link>
Subject: [PATCH 1/2] Revert "ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2"
Date: Tue, 12 Mar 2024 10:33:25 +0800
Message-Id: <20240312023326.224504-2-me@jwang.link>
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

This reverts commit ed00a6945dc32462c2d3744a3518d2316da66fcc.

Lenovo 21J2 uses the Pink Sardine (PS) platform, not Yellow Carp
(YC). Thanks to Mukunda Vijendar [1] for pointing this out.

Lenovo 21J2 should not be in YC's quirk table.

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

