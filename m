Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61461DED6F;
	Mon,  6 Jan 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178409; cv=none; b=dx0XerLMm/OvSd8XqFat/2zX/nEt7KK1JUUn0LQPoiUWrf9e+72OhGv42mhnHVwwDOZxK2I6QRPYCd93E/8OyjvrWABB122qOfxHDIyA1lS4aNNux1IIO2nIX7q3Tm7zhSgdD8W53Crk1TpDjHqXWdPdeNTALtft4TkMlyLA5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178409; c=relaxed/simple;
	bh=VEng4BEDH01CzPNbKF3AerpXbZ//PNTuAuU94i3BHV0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=daOJI6twMvU36FgYL7aKDsFp+Bbipxa3WLK1WXUd9oy/3iR5xK8gEFyJsj3K36Tj9cwbqoAowgjwtACkFR+HNUL4sich8uHEeIlGRP/NGhpdZwe+TVlbbhBpTDdn6Sa/1UX5+ErtoHDTQoEpuX1mrTMv9k7cI8YuSdaFKE0a5pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J6d86adG; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J6d86adG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5064rhpP021827;
	Mon, 6 Jan 2025 09:46:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=oi25WpckYAdnqcuS
	M6eUy8MIYx+Yjvp44yewj54Lsg4=; b=J6d86adGqLAfPN4JW7f0z9wbe/pWolDi
	D6sTn2YJL5as1j7PS1g57WfuXpBkP8J2JbRuZ+TqLlUpGoqfw/fx355C7fROiyvw
	d8n8cRMYwm65tx0cSFinmfMlZQrPOcEKenUhHbCPvC+MdVkt6v7ihKWH9e7Ibhw3
	yH9tK7osH54e5+85KTH/y46PEj7UsojKvCe4/6C4xrKqALAmoZHijyXo76UvaWBc
	Kq8cV2HxP+T3cpyGHxieenlyThxXVh4HrWl9MnT77Qp+5YITe1TPL7iJoodF8Wpx
	Bnwy0LinWQIq9CYyVxqulhTpBaaLtut1kCL7L9kRbZfypcN9AxKjLg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y3929wsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 09:46:41 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 6 Jan
 2025 15:46:39 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 6 Jan 2025 15:46:39 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7D2C3820248;
	Mon,  6 Jan 2025 15:46:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm8994: Add depends on MFD core
Date: Mon, 6 Jan 2025 15:46:39 +0000
Message-ID: <20250106154639.3999553-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yVbhKaWTwoPEsy0R3kcOrJw1FvxTm1JO
X-Proofpoint-ORIG-GUID: yVbhKaWTwoPEsy0R3kcOrJw1FvxTm1JO
X-Proofpoint-Spam-Reason: safe

The ASoC driver should not be used without the MFD component. This was
causing randconfig issues with regmap IRQ which is selected by the MFD
part of the wm8994 driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501061337.R0DlBUoD-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Slightly of two minds if this needs fixed since the WM8994 symbol is not
user selectable, so is only normally included by selection from the
machine driver, which should a) select MFD_WM8994 as well and b) the
select would ignore the depends anyway. But I guessed it was best to
squash the randconfig issue even if that is likely the only thing that
will ever hit the issue.

Thanks,
Charles

 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 0f2df7c91e186..0b9e87dc2b6cf 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2451,6 +2451,7 @@ config SND_SOC_WM8993
 
 config SND_SOC_WM8994
 	tristate
+	depends on MFD_WM8994
 
 config SND_SOC_WM8995
 	tristate
-- 
2.39.5

