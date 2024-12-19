Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA689226876;
	Thu, 19 Dec 2024 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734623850; cv=none; b=q6i5Qpb39e7Qw7/bCO2+uNB3qKR8XjZtwoCjabFchSjMNJva99W7wOwwGKf7JlHaUuAWDZYCKM5VNcBsLmjHfdxNPdQFGvexU/lLEy0p8TOQqkgQP2h04xnigBisyQtU70TElhjLY1fKW58yowPW6SrEV7dt/kLtp5gO63V1V7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734623850; c=relaxed/simple;
	bh=0u19G3Q+ZsbdsyCMDkRK5f1Lthiur0sR34uuX6KtrVo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rIk9ERb/goygRsOP8dfR4AW5NPDEFItY76OAklYzkdjvVZAjcrQr5fRFVog1rt3PkLkAYBWPGy3c+duLzf5456cwG1o7qoRKTKXfH5lC/zpjs02DsSftrX1SdtFUwEKwuWYsNR+Qd2eKMSpFYcpgFXmiLmk1GcfLawjgzvyzTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W83VlGSG; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W83VlGSG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ5KRun027660;
	Thu, 19 Dec 2024 09:57:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=8sYtVNazlERUrY6D
	GDO23IN66qaUbliUlpbJeW3t2IY=; b=W83VlGSGHSmcXI4jPx0/klTFetZk3zmY
	z1pmLhUxDurZWFnLlYA8WbHtW3QWdodzbNwlFKe9OfUv8s8iVsf+Q5uSmRqGXAeA
	49FYfGB5zdMKQDGKLsXDr6VAUXuDUqoVIgmgA4yzXEG3xs5/F2ttUcnTsFAi1cyx
	u/itxa3D07bRDUXM68rEOOEW74WWbAz/LcY0oyu/7msbp5Dh5BMwjIgyYx7mIUvP
	wcYiTaLUh2Mv/10MaMXp51FrnFrinJjMz3KKDyYx+QhJNxuEzuS6CE6jfTNZ/3j6
	p6Cw/yeubrGJ+tasBXHsPwW5DbxZzpFxqucfZUOWOiD6xubFeZyhyA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a26j39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 09:57:24 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 15:57:22 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 15:57:22 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BFC7C820247;
	Thu, 19 Dec 2024 15:57:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Dheeraj Reddy Jonnalagadda
	<dheeraj.linuxdev@gmail.com>
Subject: [PATCH] firmware: cs_dsp: Delete redundant assignments in cs_dsp_test_bin.c
Date: Thu, 19 Dec 2024 15:57:19 +0000
Message-ID: <20241219155719.84276-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tTRfFxp2Vmz6KflyiTuX8rpuea1BqCmH
X-Proofpoint-GUID: tTRfFxp2Vmz6KflyiTuX8rpuea1BqCmH
X-Proofpoint-Spam-Reason: safe

Delete two redundant assignments in cs_dsp_test_bin.c.

Unfortunately none of W=1 or the static analysis tools I ran
flagged these.

Fixes: dd0b6b1f29b9 ("firmware: cs_dsp: Add KUnit testing of bin file download")
Reported-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602511
Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602490
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index bbff6caee285..1e161bbc5b4a 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -500,9 +500,6 @@ static void bin_patch_one_word_multiple_algs(struct kunit *test)
 
 	/* Add one payload per algorithm */
 	for (i = 0; i < ARRAY_SIZE(bin_test_mock_algs); ++i) {
-		alg_base_words = cs_dsp_mock_xm_header_get_alg_base_in_words(priv,
-								bin_test_mock_algs[i].id,
-								param->mem_type);
 		reg_inc_per_word = cs_dsp_mock_reg_addr_inc_per_unpacked_word(priv);
 
 		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
@@ -566,9 +563,6 @@ static void bin_patch_one_word_multiple_algs_unordered(struct kunit *test)
 	/* Add one payload per algorithm */
 	for (i = 0; i < ARRAY_SIZE(bin_test_mock_algs); ++i) {
 		alg_idx = alg_order[i];
-		alg_base_words = cs_dsp_mock_xm_header_get_alg_base_in_words(priv,
-								bin_test_mock_algs[alg_idx].id,
-								param->mem_type);
 		reg_inc_per_word = cs_dsp_mock_reg_addr_inc_per_unpacked_word(priv);
 
 		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-- 
2.43.0

