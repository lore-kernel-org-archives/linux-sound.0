Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A31EF0BC;
	Tue,  7 Jan 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264685; cv=none; b=Jos2FObRQBKwJPqy+GLqrNFpaMV0C4hOwm2v6IIm2vroHi0krndmuP2ZTd3O0aW+5b00tfvrC9/pk5x0dg+gelgbgniGCqtizE2qGmwmjctDVcMFz/Eh1nlYGIgqYT5Wveyk8LAiZo/gSrUGPgmMBRoySTfFBq5TlGyd3VVpRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264685; c=relaxed/simple;
	bh=CTVoTeo58WDrgcVLB81RtQpIUW+G5Gfg2tCURI5nAcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGoz4/nKyLUUkVCbY0QmfusO0gYiqBlAHUC17oUJAuHzM/hYBN5Msmgzoe8WfZweRn/4EY0cCScA9GztnJ8nu7sjfU1c//hjK0rHhANVkHMadTZBluUB62YkZIzvs6ZRh9YIabKgACLCjdhklM0aMCalENGRYrL1gxFvTjvB6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iuYKR+Sx; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iuYKR+Sx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5076siUv007030;
	Tue, 7 Jan 2025 09:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2Nf+juNO6cDgc6mXx+SSjoso8m4AcLvkwJlhWOhi0qk=; b=
	iuYKR+SxP/tIjz28JmZoWVrqxN88uMjZkB/lDUacZCZhI24Tfm5auHi53BsFW0wP
	Zuu1dZW+jQfZyNcSVnKWbHbmKfwnBihGQAzExAG2JAaduFQSxL2mg50WOOb7gkvj
	TjvWGUqMegDeM2JSP4FfvH3SGiYBfp6d77a821piZyuQ7MXbp2du5sWbTVzxwXdy
	PUiYsrmI7lA6DykrHnk3kU6SeBHDM11Ef2e8tyuHBsbpGexswFVEEy7RMmXynN1T
	KMJECyH+nlg7mBkvQ/hUGR7KIvkL6bb5AEJyQqMCo4W4fvGorIN0Hfyg4eRRgscB
	uOKbLtOuj6+6h6LLbatv8g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kbjar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:44:10 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 15:44:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 15:44:09 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E295482024B;
	Tue,  7 Jan 2025 15:44:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <oder_chiou@realtek.com>
CC: <jack.yu@realtek.com>, <shumingf@realtek.com>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 2/6] ASoC: SDCA: Update list of entity_0 controls
Date: Tue, 7 Jan 2025 15:44:04 +0000
Message-ID: <20250107154408.814455-3-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: CZ5-v43Q0FdTBSXLszlArI6YIKOfJlvP
X-Proofpoint-GUID: CZ5-v43Q0FdTBSXLszlArI6YIKOfJlvP
X-Proofpoint-Spam-Reason: safe

Update the list of entity_0 controls to better match version v1.0 of the
SDCA specification. Remove both INTSTAT_CLEAR and INT_ENABLE as these are
no longer used, and add some missing controls and bits into the enum. Also
rename the SDCA_CONTROL prefix to SDCA_CTL because this better matches the
macros in the sdw_registers.h header, and the names can get quite long so
saving a few characters is definitely a plus.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_function.h | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 89e42db6d5919..c051c17903e83 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -45,14 +45,31 @@ enum sdca_function_type {
 #define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME		"ImplementationDefined"
 
 enum sdca_entity0_controls {
-	SDCA_CONTROL_ENTITY_0_COMMIT_GROUP_MASK		= 0x01,
-	SDCA_CONTROL_ENTITY_0_INTSTAT_CLEAR		= 0x02,
-	SDCA_CONTROL_ENTITY_0_INT_ENABLE		= 0x03,
-	SDCA_CONTROL_ENTITY_0_FUNCTION_SDCA_VERSION	= 0x04,
-	SDCA_CONTROL_ENTITY_0_FUNCTION_TOPOLOGY		= 0x05,
-	SDCA_CONTROL_ENTITY_0_FUNCTION_MANUFACTURER_ID	= 0x06,
-	SDCA_CONTROL_ENTITY_0_FUNCTION_ID		= 0x07,
-	SDCA_CONTROL_ENTITY_0_FUNCTION_VERSION		= 0x08
+	SDCA_CTL_ENTITY_0_COMMIT_GROUP_MASK		= 0x01,
+	SDCA_CTL_ENTITY_0_FUNCTION_SDCA_VERSION		= 0x04,
+	SDCA_CTL_ENTITY_0_FUNCTION_TYPE			= 0x05,
+	SDCA_CTL_ENTITY_0_FUNCTION_MANUFACTURER_ID	= 0x06,
+	SDCA_CTL_ENTITY_0_FUNCTION_ID			= 0x07,
+	SDCA_CTL_ENTITY_0_FUNCTION_VERSION		= 0x08,
+	SDCA_CTL_ENTITY_0_FUNCTION_EXTENSION_ID		= 0x09,
+	SDCA_CTL_ENTITY_0_FUNCTION_EXTENSION_VERSION	= 0x0A,
+	SDCA_CTL_ENTITY_0_FUNCTION_STATUS		= 0x10,
+	SDCA_CTL_ENTITY_0_FUNCTION_ACTION		= 0x11,
+	SDCA_CTL_ENTITY_0_MATCHING_GUID			= 0x12,
+	SDCA_CTL_ENTITY_0_DEVICE_MANUFACTURER_ID	= 0x2C,
+	SDCA_CTL_ENTITY_0_DEVICE_PART_ID		= 0x2D,
+	SDCA_CTL_ENTITY_0_DEVICE_VERSION		= 0x2E,
+	SDCA_CTL_ENTITY_0_DEVICE_SDCA_VERSION		= 0x2F,
+
+	/* Function Status Bits */
+	SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED		= BIT(0),
+	SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY	= BIT(1),
+	SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY	= BIT(2),
+	SDCA_CTL_ENTITY_0_FUNCTION_FAULT		= BIT(3),
+	SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT		= BIT(4),
+	SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION	= BIT(5),
+	SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET	= BIT(6),
+	SDCA_CTL_ENTITY_0_FUNCTION_BUSY			= BIT(7),
 };
 
 #endif
-- 
2.39.5

