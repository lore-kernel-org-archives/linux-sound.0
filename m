Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075041;
	b=N+P4WJ9RGxM3KFxqnRgOrRkWVPHm+ut4Hl7zTxjo2rmSX075rz+OHfMV5CCbLhzjJOfM
	 hYJwDPV6XAFe+m0fb9PnLwkoOUQgeOyusjeYtwuV9Dkag9ofWP79UY3N4VYI5JjCtjUKv
	 XCNPEFitJ7h3fLyMDaa/TiCQJrW99ptNWWnzzyGvKoST0cf2GJQz8smAONfkfcU/lPSwO
	 3b+2ZH4YkimjU3tMQajUwYllvApUlQCk6IFzkQeKXeUr5v+Fm1X1P7jYg1QCv3tD6W+8I
	 OBTsIPoZ9UkKVbhuoJiQRRAzOPfiXVHV2Pr4OT0KEz4eEbO/DhRBSrkU2F8v4kcg3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075041;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hK6zvu0bdO+0ibY+7kdYs/GbG9wKYxwtHY1Cb2t5Sfw=;
	b=sxmSdY8toK0o5zHtTwrHiKWJBbQaspVb7ux7R4/zN2jYBC2QTTNwpkYuxZqvxMe2HAEp
	 F54XDuetMkWhfFNTqXix7PteqsidYPOkE9C1naUsKO/SXPyrbF3fx5mnq96iMEHuAobJG
	 6i1/BlTuxMG/55PK/QwyhawQvUS/cvoxC6zQm3qiG2zqYVw4CvwqJMrs4nC+Gm2J7vxgM
	 Pg+DA7kGRIx8RyhFRiGwV9BVqh/5D25BIqOFSuOheYwtDwDgFbbu25yMdQxbaxDd3oPEO
	 hUuTNJKVIbjAVlPwEN7Jk3rS3+GzEF6MxEU9k1gJE+Z0ctyxPtNl0gFZWQt3o8rqonA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=lGuCI7oX;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E5C606A320;
	Thu, 19 Nov 2026 07:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E5C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=lGuCI7oX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=lGuCI7oXJa5ZzkaIhuBN+Z5EjTzHbss1F9COZ684ya1GRC5CMFIDC/U7umtxLB7fLhNtF8DW/ldas
	 22v95xnsZwnwjDLs5L/nOHPOREG54WXhkbCO9nfo5WakMU3GusGWBWeN9+Etm7BcNP1zGOEuTL3S3K
	 U/F5JosA6CuQ7rWc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afeabdd3a3-bb8be;
	Thu, 19 Nov 2026 15:57:17 +0800 (CST)
X-RM-TRANSID:2ee46afeabdd3a3-bb8be
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afeabdbdf4-f5958;
	Thu, 19 Nov 2026 15:57:17 +0800 (CST)
X-RM-TRANSID:2ee46afeabdbdf4-f5958
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: ak4535: Fix AUX input DAPM routes
Date: Thu, 19 Nov 2026 15:57:16 +0800
Message-ID: <20261119075716.50110-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AUX input PGA is named "AUX In", but the route from the AUX pin
and the Aux Capture Switch route refer to "Aux In". DAPM matches
widget names case sensitively, so it cannot add either route.

Use the existing widget name in both routes to connect the AUX input
to the capture mixer and complete the path to the bypass mixer.

Fixes: 796d2ca84859 ("ALSA: ASoC: Add AK4535 driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/codecs/ak4535.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index 66ca753e7651..ce877d995690 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -237,12 +237,12 @@ static const struct snd_soc_dapm_route ak4535_audio_map[] = {
 	{"Mono 2 Enable", "Switch", "Stereo Mixer"},
 
 	/* Aux In */
-	{"Aux In", NULL, "AUX"},
+	{"AUX In", NULL, "AUX"},
 
 	/* ADC */
 	{"ADC", NULL, "Input Mixer"},
 	{"Input Mixer", "Mic Capture Switch", "Mic"},
-	{"Input Mixer", "Aux Capture Switch", "Aux In"},
+	{"Input Mixer", "Aux Capture Switch", "AUX In"},
 };
 
 static int ak4535_set_dai_sysclk(struct snd_soc_dai *codec_dai,


