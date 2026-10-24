Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839509;
	b=L/UBlcaI/B6E6WqGy8fnF+P4DphrM06+wx5QfPoJ2GswFwM3d3gBx6MT9Prsg3e5X3m5
	 Hb5MgIvhaslAfEWsBOVGRc4G+UbN2twyMktQho+7/WV8C/6DEnBouepP1P/QriEX09AOe
	 BTepKHvvQiNbGScH02WZSMVFacV60Q8wvUH79pdG3uwhqhQIbO+QMk+cjl4haVNosX/P9
	 YfEfwR+jpFugru52otcg4COZsEip864cbQ/lllfOGmfZ4/iYuUVSgoNHzV1hxlhC+/mG7
	 FsdYAgRphJ6Mv0HJU9GLeoe7cqgoYb8ybw4eM3Pfo6Z0WB0XoipPdZ7lGWMvxTxl63w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
	b=i8WpQRC95+nUHh1O2RX2wcooxjY1BwMTqcgZdtOFma18IAr4ILXbuZvOscSa9WwLhELz
	 /QlXf+UhFbM3aYjnpWX9/xbE62PlmvwCo9OZupH+T8gMFwLECL+AM+jQVQ3Ir9CAYxhlb
	 DOoKZdDTCueJ9FA3rQ0BfXqedirsXCiALAC5G1YvrNTgRNofn5egipEzgziOPzF9dk6wE
	 C6ff1RE/W2cyopWhaAwI3k+XpiV8jMEr0+CmHN0onjHL6t+I7SX3eRt0ggJWPr5DLjk63
	 HyvYRBtVsnkbh/CF2Ei9xsNcUn45h1YKrKrUXdXenLsxQv7EyRpfctr8rCps4IBkcow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARIax1PH;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C35606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 10:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARIax1PH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2662723eec.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839508; x=1793444308; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
        b=ARIax1PHiwoCIAfJPY0brvUQYCM9K9tmvsOS6Lpx64OXKhsMhMEoZ2dKjKdzTqrzDQ
         ta3hp0vWxBdqRvknAidj1QtzKMOa3ujr4lyVbyXgc0+qfRFwTUo3/gYOqaiv7boqrU8b
         mdCxemuOCF/jIi8jB15H5KKMXsgMRhbomM6enOm41NmezAno+Y1l4swXjMZu4WSuj+fi
         5d/lOqnFXdjHLB6PN0mvFgrfJBxK1c7znQemDtfCGwCMW6/fmVwYyp+qyiGBD6GyAFr8
         xQgvU+6Y6Xz1tP7fG2q9iqV/PJyiUGXb5LcoxHuDDC2uo6HL863ewMkbrE5jGiMlRlgD
         erwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839508; x=1793444308;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
        b=wf0NUXqTPbPQxlM/c15u5z3khFPe3DzoAxxxbtXSebSew96P5IOAqLga82jOtebKRT
         V84tRbpbVk2URhDdCi/t9Ph2PzGCNlVFDl1Eowa2KYmGGkGCabtOYH1zIeGjfsU6YF9d
         otVbViEl89GN2DY0vAAo4VLAUChmVYnXWJqZchLHh8WzoPPt3z/2ehlpxlVRLnVi0gVx
         6PuN5HZkavQjN1I0z2fnSZ7g6c8z7dujCexRqaQoOvkdpg+Ghb1SCFF6BHGOWuBieFzU
         JLynD6LL8AeSq7evIn9XihjS+unuIm8sCz7rSdQdDV+wKLwtxF3hwvOhA1yCBiVhM8Pf
         nt4g==
X-Gm-Message-State: AFq9FYJUsMiqQElQqE3G8jwIknp+63G6Z9Df1wy914FVxG4ZyeJ8RaRl
	WCI/YUr332GyDuhUliSOsK5SvSrzzGfSyuf7eUq8kuza8nIMsGM846Jr
X-Gm-Gg: AYBFou2/4uJ9cEYl8nr2aAEN4/WnBNSc88QCFbGzYawKn2S2AnilZ3sbOAtq2pCNu2b
	tv1vX+JKaxscs66is/8B1Ffv9hFDXHox/OzjFUHz2hDjvZMatLvpLrxn8SZxR8B8qBiX+YYMoLZ
	3YdCTYRetMb97FG8/GOMx2h2M/dBUekvYwHLWUTXAoGLQyqx0hJmHCfHIQQyjOjdb1G6BU7ya85
	4Y0+wVtkhWzPteWXc+uDNodLHCNc61TCzVTc/6V4Y7MG1qAl9kQ3PLO+OJjXId0g8UNzTMryjGT
	YYALJP2/QJBAQrV80dN/uYZXHvAyi8QVjdrQcgAF/Sh35YkQUKYfMNb9GcPFkSNob8pEHJWC+EM
	0yKepSV9/pSVgxo/Ybn+ZkiKU4XsUFMGNwxG2gXM/5WCeJ/3uQLj7zS23MLXiA4sm19Tcbv9pRq
	c4xEYIn4DxVEk8TUYVbi2NoFbs4g1OkMxIhrI9EO/K5m2HSSCJcuzQD4paqZiQQYTmCalEEMG3K
	yVqbDVSxJ9QuLqGmP9rPPDi+AhAliPAoBPeEiqiXtbYO9T36JSgFC4bMMcVqms0Sc5OGuxn9xlc
	ZiF/rVSLodK4+Rd8xl9dcU6rUEgMv6MBviqbwkA1FZB5zzuRimyWcv1hCa0jJbe1RozXooTdfXK
	yCoab0dt2P5jHZjRqi8svOHvxgJch
X-Received: by 2002:a05:7022:2229:b0:149:1feb:6dae with SMTP id a92af1059eb24-19937abcc34mr3812247c88.39.1792839508391;
        Sat, 24 Oct 2026 03:58:28 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm5947281c88.5.2026.10.24.03.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:58:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 24 Oct 2026 20:58:15 +1000
Subject: [PATCH] ASoC: tas2770: Only treat negative return codes as errors
 set_tdm_idle
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ7NrAJxli/Ih6M3dYtxUpWRRD/3
 lWPMzCzg1BiEqizHRKtLPwbFWyeQT9045sMP5XBoSstusLMnbgQUPWXzIs3E9FiQf5hfahAsym
 R6mvZtDfLEj/Uz+cHjuMPgM70X3QAAAA=
X-Change-ID: 20261024-tas2770-idle-fix-b0104e591578
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=e/a/ezVcu2OnK+OjA/cnrkqCbVak9sPahUCnQku5REo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFl3+gNU41WnyMX9Wz+5bEIs08Su98KnkjcpyJj8Sb1eW
 KTm3FbTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr/nowMB/dGLKmZ6O6s//Hhfi2xCpU75Ws/sR05Fql4gv36+7N2dxj+Z6i2TBG
 Zc27Phzf7HomUPWbo5K3qmznL/WTrAb5HM8JOMAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

snd_soc_component_update_bits returns 1 on a successful update, and
we were returning from tas2770_set_dai_tdm_idle early on any nonzero
return code. Change this so that only negative return codes are
treated as errors.

Fixes: af176d0787d2 ("ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..6b9ec8f630fe 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -513,7 +513,7 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT,
 						    TAS2770_DIN_PD_SDOUT);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -521,12 +521,12 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -534,25 +534,25 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL,
 						    TAS2770_TDM_CFG_REG4_TX_FILL);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
 	case SND_SOC_DAI_TDM_IDLE_OFF:
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;

---
base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
change-id: 20261024-tas2770-idle-fix-b0104e591578

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

