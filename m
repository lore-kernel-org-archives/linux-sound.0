Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C512153EF;
	Fri, 20 Dec 2024 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716143; cv=none; b=XJ0h8B9HlR1dhk+204/12JC1K0UCDL+Fbvs/M+AVBE+3VkhD5EsfMPOiiOAyqLTG6gzxeTX1Zg5xB/cuHT4F4r6QDEgO7fXsrdFpgzZxkVJF7ClQrXlN+gvIZf602QZ4ZfYHRns1uzIWZvK9YIJU9jiyrhRqucmIlluYnONhb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716143; c=relaxed/simple;
	bh=BzqGWroKZjDmhu6P1Hhdsz2LRc18bdKfJrUO20cbr/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhAq1AbKx6w/ZlU81TrYLnoWwN7J42vwRrZhhYb+KNjy38X1DdUcflfi/nLq2zRp+h5I73jB2Rw58FvvnD6XUk51FjRla78+BjmDz5YcgaSKT/On36eb+Zk+0Bevvn/Bv3Q8sr4OkbqRD8sI4LpwgVkd6hm967a+Ta6/xpT4jo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GmQKQdV8; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GmQKQdV8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6qF4I002908;
	Fri, 20 Dec 2024 11:35:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NKacIoYOjG/4X0rXHByPFb4MP/Q4BaorAIurYMYf09s=; b=
	GmQKQdV8b9gGckV2Itd0DEwlBx54TYTWbjuj1N1MBcWv3nyzpIk4LXQaC66pEwsr
	M5RIxYjnqEun5VHSpHXxJMBNahHoCHAkkd7ulWNhw2euN+Tk77MhmAUchVcgLSmj
	mD28Dz8ieuMF58jcZWYJI1DZ9YhNnw0knJg6PkzqhrkN69+1uNSUpQjSCPh2mZrf
	zYwbv8hsxRvE3PBLlamjvRfbrSFpGiKM7oJBRfLcMDZH6HphuG5JJYdto0OPmCDN
	YDpxlnF75J7AwkAOc/eAFc5h7y/huwmsLp42Pl8SZQJlvDiBdroITb30zP9LcxH+
	cYLRCIaJWj05TY2NWhnOnA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a286sg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:35:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 17:35:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 17:35:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2A77382024B;
	Fri, 20 Dec 2024 17:35:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 3/5] ASoC: SDCA: Add bounds check for function address
Date: Fri, 20 Dec 2024 17:35:14 +0000
Message-ID: <20241220173516.907406-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
References: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Fje3O2f7KKPAeI3Am_anEfY3xalqviKA
X-Proofpoint-GUID: Fje3O2f7KKPAeI3Am_anEfY3xalqviKA
X-Proofpoint-Spam-Reason: safe

SDCA only supports 3-bits for the function address, but the ACPI value
is 64-bits. Update the code that parses this to do a bounds check
and error out on invalid addresses. Currently, an invalid address
would truncate to the bottom 3-bits when used and thus use a likely
incorrect address. With the bounds check, it is also now safe to
shrink the size of the adr member of sdca_function_desc to a u8 and
rearrange the struct members to pack better with the new size of adr.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca.h            | 4 ++--
 sound/soc/sdca/sdca_functions.c | 9 ++-------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 3eea1dfec16c..973252d0adac 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -23,9 +23,9 @@ struct sdw_slave;
  * @name: human-readable string
  */
 struct sdca_function_desc {
-	u64 adr;
-	u32 type;
 	const char *name;
+	u32 type;
+	u8 adr;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 46aa874bb0aa..a69fdb9c8b15 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -108,17 +108,12 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 		return -EINVAL;
 	}
 
-	/*
-	 * The number of functions cannot exceed 8, we could use
-	 * acpi_get_local_address() but the value is stored as u64 so
-	 * we might as well avoid casts and intermediate levels
-	 */
 	ret = acpi_get_local_u64_address(adev->handle, &addr);
 	if (ret < 0)
 		return ret;
 
-	if (!addr) {
-		dev_err(dev, "no addr\n");
+	if (!addr || addr > 0x7) {
+		dev_err(dev, "invalid addr: 0x%llx\n", addr);
 		return -ENODEV;
 	}
 
-- 
2.39.5

