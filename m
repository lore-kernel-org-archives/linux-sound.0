Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D822A7F2;
	Thu, 16 Jan 2025 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037487; cv=none; b=rZrus4HEyBHN+tXJ8q+WY27IHbDhi5bI7z/HeW9WnV78OfFezYU7u4WZrq619dlJDJdfq820FO/fgM9YMqwLx7p0uX+7VPCRq51I1TYrlKXxZ/melYVFR2EvzR8Czt4roAA7Y+Z7wdPmH8B/gkslkPOcLHaQiaPAppsIavLtKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037487; c=relaxed/simple;
	bh=+kWu4LRQmI6khCILaYA1B/Q2QJoEWlcTFkVBKEaQVoU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jsejxHtZhtxdUZdBOLzmkoxUYG3gU1pKAZLW+/kY0Mz9XIHYUXBtviWL2dfO5eGoHGv7E07vIQqTE/D44M8cVLFH8fFrx+OEmwWOItnSTQlvvQsl1zfawNKQrtr/rsRnW8yTX2Oho8NgT4hZfTnZXdrdxxunPKE/tFltHu4xifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 16 Jan
 2025 17:24:42 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 16 Jan
 2025 17:24:41 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] ASoC: fsl_micfil: Enable default case in micfil_set_quality()
Date: Thu, 16 Jan 2025 06:24:36 -0800
Message-ID: <20250116142436.22389-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

If 'micfil->quality' received from micfil_quality_set() somehow ends
up with an unpredictable value, switch() operator will fail to
initialize local variable qsel before regmap_update_bits() tries
to utilize it.

While it is unlikely, play it safe and enable a default case that
returns -EINVAL error.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: bea1d61d5892 ("ASoC: fsl_micfil: rework quality setting")
Cc: stable@vger.kernel.org
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 sound/soc/fsl/fsl_micfil.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 8c15389c9a04..5585f4c8f455 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -157,6 +157,8 @@ static int micfil_set_quality(struct fsl_micfil *micfil)
 	case QUALITY_VLOW2:
 		qsel = MICFIL_QSEL_VLOW2_QUALITY;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	return regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
