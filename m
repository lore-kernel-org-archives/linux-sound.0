Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042519E806;
	Tue,  7 Jan 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264686; cv=none; b=jxsFq0QMCNZ8jEndXtHXB54UwqPOKB3KjYWe9bt1iFk7bYMw2BXrWwa3Nfyx05PdgSI1kRXpkcUYOVp/f1bWdEKoqGMN4Rve6e8VSrN/t0hA6Dd+GUYEb8quNNLwaf+fsGK8MkkJ7k53Xrz4bakg0juhL9i81U8/ABbfpmGQVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264686; c=relaxed/simple;
	bh=joDDpGxAYCREXvCwGvTZ3dLuwiyrqzl4A8+++/yltNs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIgBF/uS1rvLIHMeSUJwOSrokrLhOVifguOI+kmjA6lMvc0Daz3N308GravbUfnCMecGWskIm0OFX4eVay/p51J9qb8EtqPpeQVaWyDom/CalhxQYsvGRY+HbtmUfDsFpNxBk1iw2u9nmnq6d/wK1+6t5w+irmBfSXBmdyENrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eT8eu9qE; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eT8eu9qE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5076siUw007030;
	Tue, 7 Jan 2025 09:44:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Xv/5mcbZLpq/B9AmqtZM2knAOG13RcUSdileV1SAKYA=; b=
	eT8eu9qEV2OIiio+ndbqyPjuHjgywNDHo/mUaYJn28KU/sMIk7ihses3xk0Fe6Xm
	ZZBjcLWeVXmNu5ka4ifEIxFLYPTJoWsX4dZm+DpjioxXUOgb78rNLXEB6OqZ2mQq
	qUXEs2GIOD0IcMheCU1+wkDI0xXNfIAYpCxGetBDo2gfGgLHEiB0d2C5wu+GqARF
	CGgBHAGwvHWBpUAueA6kHufBnfHT05QxLOBsh5Lj8L7Eg9QcwPi25Pb36k/cd8vK
	iWhMH2D2cJ3BoXxAhAhHyTj987lCvqw8WGtTC1oIo3y9Shy35svXglXaKNc0WQUz
	zElUriuhilczbQ/vyw+Bqw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kbjaq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:44:11 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 15:44:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 15:44:09 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DD45F82024A;
	Tue,  7 Jan 2025 15:44:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <oder_chiou@realtek.com>
CC: <jack.yu@realtek.com>, <shumingf@realtek.com>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 1/6] soundwire: SDCA: Add additional SDCA address macros
Date: Tue, 7 Jan 2025 15:44:03 +0000
Message-ID: <20250107154408.814455-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ip11ncy5ovopTFyF_EH7En-cUjjXpVKm
X-Proofpoint-GUID: Ip11ncy5ovopTFyF_EH7En-cUjjXpVKm
X-Proofpoint-Spam-Reason: safe

Compliment the existing macro to construct an SDCA control address
with macros to extract the constituent parts, and validation of such
an address. Also update the masks for the original macro to use
GENMASK to make mental comparisons with the included comment on the
address format easier.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/linux/soundwire/sdw_registers.h | 30 ++++++++++++++++++-------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index 658b10fa5b20a..0a5939285583b 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -4,6 +4,9 @@
 #ifndef __SDW_REGISTERS_H
 #define __SDW_REGISTERS_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /*
  * SDW registers as defined by MIPI 1.2 Spec
  */
@@ -329,16 +332,27 @@
  *	2:0		Control Number[2:0]
  */
 
-#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |			\
-						 (((fun) & 0x7) << 22) |	\
-						 (((ent) & 0x40) << 15) |	\
-						 (((ent) & 0x3f) << 7) |	\
-						 (((ctl) & 0x30) << 15) |	\
-						 (((ctl) & 0x0f) << 3) |	\
-						 (((ch) & 0x38) << 12) |	\
-						 ((ch) & 0x07))
+#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |				\
+						 (((fun) & GENMASK(2, 0)) << 22) |	\
+						 (((ent) & BIT(6)) << 15) |		\
+						 (((ent) & GENMASK(5, 0)) << 7) |	\
+						 (((ctl) & GENMASK(5, 4)) << 15) |	\
+						 (((ctl) & GENMASK(3, 0)) << 3) |	\
+						 (((ch) & GENMASK(5, 3)) << 12) |	\
+						 ((ch) & GENMASK(2, 0)))
+
+#define SDW_SDCA_CTL_FUNC(reg) FIELD_GET(GENMASK(24, 22), (reg))
+#define SDW_SDCA_CTL_ENT(reg) ((FIELD_GET(BIT(21), (reg)) << 6) | \
+				FIELD_GET(GENMASK(12, 7), (reg)))
+#define SDW_SDCA_CTL_CSEL(reg) ((FIELD_GET(GENMASK(20, 19), (reg)) << 4) | \
+				 FIELD_GET(GENMASK(6, 3), (reg)))
+#define SDW_SDCA_CTL_CNUM(reg) ((FIELD_GET(GENMASK(17, 15), (reg)) << 3) | \
+				 FIELD_GET(GENMASK(2, 0), (reg)))
 
 #define SDW_SDCA_MBQ_CTL(reg)			((reg) | BIT(13))
 #define SDW_SDCA_NEXT_CTL(reg)			((reg) | BIT(14))
 
+/* Check the reserved and fixed bits in address */
+#define SDW_SDCA_VALID_CTL(reg) (((reg) & (GENMASK(31, 25) | BIT(18) | BIT(13))) == BIT(30))
+
 #endif /* __SDW_REGISTERS_H */
-- 
2.39.5

