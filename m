Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FAB330301
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058067; cv=none; b=Q5ej/MTQVkKE2bYeyKJZQtlZCvaBoOnmRhMa9mPWrBANtYAtGgwzX+STVBoueNjDjWu1459nbDauVLsJhPFdw3JXcMQwMjOKI+chkExi+z+Jv2iD2gTgrnTmAau3YEtPiAFl3oDrGh0u+v8rkCjDdonUOTifbvDJ9BUpSTCHY0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058067; c=relaxed/simple;
	bh=aeZjPmGhDWlaPCT1RRDfgeSEVWLZ95Hfqxv0L4cptwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CL8v7jVu1Swb1jSdy2GuhhFR7OAqLS8GWd8DIHZG5n1Ee1pCfzfFZKahZqeK/6uZzQ+L79lqdHtcIlH2Q9wQ8ok8VzRNOIxYGfKxhcI+EIQxDdkMTtRZyR2wVmoTsYXrql+9pOysGFCeAEw2bLcvqYKEsB9uxt0gdMxKv7Qm+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtUF2GqI; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtUF2GqI"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847aa193d98so146344b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058065; x=1783662865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=QtUF2GqI4IOMW9F/sVCU4f8IgIrysdHBtXOIZxb3wJtw6tkykXFNbb//lDIjoxXpym
         rVF+mnL5dVWsSQFNFt7uXzViTUWsTwnFuyTu6Cp8TIT7S8x6QdI8ptvX2kWatw/ro4JX
         NOapuu/6uskuKx/lO1upuTnq1FeB6gLaQflQUqpCQeB/jygj25GcLlV0GmA6WNjnO3/G
         jORNO4rOfZFmJAgaIYuTXeBwSH80hDsFAt3QOtN0gOMNT2mNoGQ+tsM73IhUPSd2Km50
         zFxVsgJ9f2Eal5dIKA6XO5t4i+0pXJixUax0W4bYtLElw6Med4lo1jRhnbcevlE0GAxK
         h1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058065; x=1783662865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=Pj4GZDPN8tAyVtWbQdA29inWUiNKJVGfIVsR1d7UgIIZKbLZVunHbX9coGlvCYzw8c
         70hA0p3chaJ/uJE3OfkTvA1kLJjvk9R8gJw6/5hEImYAREOka1kRCPQTE9kXRm5eDPns
         iPrMBHEUcQX5bhV0wX5DCjR3Hy/KyPZtknhb0oOmQuJU5LYpNtPXfYNc3QVYuXJhCUDr
         NCt0E03hZrKccXrHbGQIH83gAuuSsr207AWP5JYODnLXSBPS5kGOPFjOyjMpOONXVoEM
         mMlXqf9LKDbCwWTxYX5YGZs/MD89kSzyTwz5ExXP9YPBFEdaiW/WfKbCUIBcPCWaoe76
         IHCg==
X-Forwarded-Encrypted: i=1; AFNElJ9wOdPu6nw3cHf52gxaAKomCeczCVTPoJzGTv2NwdPiWxEcS+az+QAmcATMffA7SvOTi45v4BXtidGsgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIBQcEMwy2VLwiawU+xjl2pVN7/cOvoLut9O0gBchpoPIDwhM
	XEFXsiCDlKsqv+tUaNh44MuK/6rHIVXTrT5LSNhn9UQcgOo1z6dNailF
X-Gm-Gg: AfdE7cljkQePNFQchbiT96sYOSrO0o7yuBdjPQapaMac5ieoB4mKc1zJLaw5I+LDIRT
	KigqOFm0279OK4EHKUU97TtsC04zcOjyCaN2vGDqtemddoHeE8O02KaCUwI99B7iIKFAxN2FdRd
	UGvRwlNAlLBz9qIzbQHM2vO8OMXpxCCmWvF7s6nnGnGFKUAc+VpLS8cdtsC54qbfJXey+QivhWp
	CFrqpSLrAEZ6rahUKy+0Qj43URaE3YSs7RiNn8+wAhntTUrBH8CpAWAsOPP0Yw6Kz6x9oW/0+DQ
	Tz1oEFnzwaw3VugNT0vs8BRzdCN/Lcq19Bj/dv67o1xRywCCpMtk7OCxOeDuWvJZBo+NxATcjS5
	kne8LI5ff0F8q7seR6OBtTWCCdHhCQ1LugDJ8Yqof2EbNL7oC0TK6j/MpBU9ZOFU0zJqkYRq76C
	ji57K/5Lk6hBXV7mujOs5Xis+MLhBjahH7vNe6KIGrQW7AixU=
X-Received: by 2002:a05:6a00:992:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-847c0690f7dmr9119828b3a.11.1783058064965;
        Thu, 02 Jul 2026 22:54:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:32 +0700
Message-ID: <20260703055355.244898-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

