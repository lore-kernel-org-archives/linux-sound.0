Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6821DB44D
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596284; cv=none; b=ZMbtxhKJdYMg2JOFM0IIQmXKdp8qq3dCZ1iXAOkrQlmhgPSXBf11frPbEwg0dZn/A+9KOL8f1je1HqgdSAXs4q9IHc7obkoFKKQq6YV7fZlhVQgxjbOCS16uSiTMh0ywCl/pZP+rTJJt9N7b5AF4gNWiAk1lv35w5Q8eDdF6ni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596284; c=relaxed/simple;
	bh=IU1B9NisSuDs/2r99K7OAhxgGUy47N4HH8NTZSgxPss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UEyuPe+zLPhToPgJIQZxpNYWcbQH1MDFrMwVAbSLywEsdIRr1ysABWd+pq5ifpadZ4T3wVTW25jNYjKzYqZrjSVzK5e9Plu9FiDQB8lEhjE76r5rUNM6hX60kJqAaURlbg06roocrhRj9PNDTWZpXiKHGuL6qbmjUIr9z3exy5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CJkFkNNF; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CJkFkNNF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726i5aq032551;
	Fri, 2 Aug 2024 05:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0pP4s/qOLlmD0T9S
	6QeHfx1pqMbSaDoFT65KPp2jRnY=; b=CJkFkNNF+VekutlRnFD/bCEXPTyD/wTM
	VufP2zoXxXBBpbON4Y5DsEHyiQTWb12DjZxb1F3HVl9dKzOmWnhr3AhsQP+g2/WP
	0luzo+ehSMR/Gb71JMTmjnzU8jQeXZsG9QDGsZuvLT0GMhcvWoFXY7jItHpgxcqs
	HygsC75LcGwa8X8DVVb2ZU5Gd9QBQS5cvpiBXYsmOLaOk34pUWh/SCqq+Spl+mC4
	KYgDcHxb7BBXN4i+5RjRVUtMNuFv1vkq3VCJgOHu/8jt4oIXAyuqJkoKqeRNQZWb
	fMjhyjGh9+BkisM2EFA2COb1Q55ZjrVQO1J3WOMGSQ7gy1g3xoIIdw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdxrj1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 05:57:36 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 11:57:34 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 11:57:34 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 36D6A820244;
	Fri,  2 Aug 2024 10:57:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v4 0/4] Fix IRQ mutex inversion on cs42l43
Date: Fri, 2 Aug 2024 11:57:30 +0100
Message-ID: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jNQRMNP8hyCen8Iz87cKY6pm0EMXZiBk
X-Proofpoint-ORIG-GUID: jNQRMNP8hyCen8Iz87cKY6pm0EMXZiBk
X-Proofpoint-Spam-Reason: safe

Fix a mutex inversion in the IRQ handling for the speaker shutters on
cs42l43. Do this by adding some new helper functions to get kcontrol
pointers and caching those in the driver rather than directly acquiring
them in the IRQ handler.

Changes in v4:
 - Add the missing helper that was causing problems the cs35l45 update.

Changes in v3:
 - Also initialise the control cache for the ASP DAI.

Changes in v2:
 - Rather than using a work queue for the IRQ handler, cache the control
   pointers.
 - Add some helpers to get kcontrol pointers.
 - Update cs35l45 to use the new helper functions.
 - Add a patch fixing a pointless semi-colon.

Thanks,
Charles

Charles Keepax (4):
  ASoC: cs42l43: Remove redundant semi-colon at end of function
  ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helpers
  ASoC: cs35l45: Use new snd_soc_component_get_kcontrol_locked() helper
  ASoC: cs42l43: Cache shutter IRQ control pointers

 include/sound/soc-component.h |  5 +++
 sound/soc/codecs/cs35l45.c    | 11 +----
 sound/soc/codecs/cs42l43.c    | 75 ++++++++++++++++++++++++++---------
 sound/soc/codecs/cs42l43.h    |  2 +
 sound/soc/soc-component.c     | 42 ++++++++++++++++----
 5 files changed, 100 insertions(+), 35 deletions(-)

-- 
2.39.2

